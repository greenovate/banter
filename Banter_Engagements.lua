-- Banter_Engagements.lua
-- Engagement threads: directed, name-targeted, multi-line banter between two players.
-- Each thread is a 2-3 line conversation: opener, response, optional followUp.
-- {name} is replaced with the target player's character name.
--
-- Thread types:
--   MISMATCH - fires when a player's persona != their actual class  (comedy gold)
--   GENERAL  - persona→persona, regardless of actual class
--
-- Loaded AFTER persona files, BEFORE Triggers.
local _, ns = ...

ns.engagements = {}

---------------------------------------------------------------------------
-- Internal storage & index
---------------------------------------------------------------------------
local threads = {}   -- all threads, keyed by unique string (E/M keys)
local byPair  = {}   -- byPair[source][target] = { threadKey1, threadKey2, ... }
local mismatchThreads = {}  -- byMismatch[source][targetPersona] = { threadKey, ... }

-- NEW: Topic-based pools with multi-choice arrays
local topics       = {}   -- topics[key] = { target, openers={}, responses={}, followUps={} }
local byTarget     = {}   -- byTarget[targetPersona] = { topicKey1, topicKey2, ... }
local universals   = {}   -- universal topic keys (any persona → any persona)

-- NEW: Zone-specific topic pools (exact zone name → topic pool)
local zoneTopics      = {}   -- zoneTopics[zoneLower] = { [key] = topicData, ... }
local allZoneTopics   = {}   -- flat lookup: key → topicData (for GetThread)
local zoneKeyCount    = 0

-- Recently-used tracking — prevents repeats with cross-session persistence
local usedKeys     = {}   -- usedKeys[key] = timestamp (Unix epoch)
local EXPIRY_SECONDS = 6 * 3600   -- 6 hours: keys older than this are treated as fresh

local threadCount  = 0
local topicCount   = 0

--- Check if a key was recently used (within expiry window)
local function IsRecentlyUsed(key)
    local t = usedKeys[key]
    if not t then return false end
    if (time() - t) > EXPIRY_SECONDS then
        usedKeys[key] = nil   -- expired, clean up
        return false
    end
    return true
end

--- Mark a key as used and persist to SavedVariables
local function MarkUsed(key)
    usedKeys[key] = time()
    -- Persist to per-character SavedVariables
    if BanterCharDB then
        BanterCharDB.usedEngagements = BanterCharDB.usedEngagements or {}
        BanterCharDB.usedEngagements[key] = usedKeys[key]
    end
end

--- Wipe used keys (both local and persisted)
local function WipeUsedKeys()
    wipe(usedKeys)
    if BanterCharDB and BanterCharDB.usedEngagements then
        wipe(BanterCharDB.usedEngagements)
    end
end

--- Register a general engagement thread (legacy pair-specific)
local function E(source, target, opener, response, followUp)
    threadCount = threadCount + 1
    local key = "E" .. threadCount
    threads[key] = {
        source   = source,
        target   = target,
        opener   = opener,
        response = response,
        followUp = followUp,
        mismatch = false,
    }
    if not byPair[source] then byPair[source] = {} end
    if not byPair[source][target] then byPair[source][target] = {} end
    table.insert(byPair[source][target], key)
end

--- Register a class-mismatch engagement thread
--- Fires when targetPersona differs from target's actualClass
local function M(source, targetPersona, opener, response, followUp)
    threadCount = threadCount + 1
    local key = "M" .. threadCount
    threads[key] = {
        source        = source,
        targetPersona = targetPersona,
        opener        = opener,
        response      = response,
        followUp      = followUp,
        mismatch      = true,
    }
    if not mismatchThreads[source] then mismatchThreads[source] = {} end
    if not mismatchThreads[source][targetPersona] then mismatchThreads[source][targetPersona] = {} end
    table.insert(mismatchThreads[source][targetPersona], key)
end

---------------------------------------------------------------------------
-- NEW: Topic registration — target-specific and universal pools
---------------------------------------------------------------------------

--- Register a target-specific topic (anyone → TARGET persona)
--- openers, responses, followUps are arrays of strings for multi-choice
--- context is an optional tag: "dungeon", "world", "city", "desert", etc.
---   nil or "any" = fires anywhere. Compound: "dungeon|underground"
function ns.engagements.T(target, openers, responses, followUps, context)
    topicCount = topicCount + 1
    local key = "T" .. topicCount
    topics[key] = {
        target    = target,
        openers   = openers,
        responses = responses,
        followUps = followUps or {},
        context   = context,   -- nil = any
    }
    if not byTarget[target] then byTarget[target] = {} end
    table.insert(byTarget[target], key)
end

--- Register a universal topic (any persona → any persona)
--- openers, responses, followUps are arrays of strings for multi-choice
--- context is an optional tag: "dungeon", "world", "city", etc.
function ns.engagements.U(openers, responses, followUps, context)
    topicCount = topicCount + 1
    local key = "U" .. topicCount
    topics[key] = {
        target    = "ANY",
        openers   = openers,
        responses = responses,
        followUps = followUps or {},
        context   = context,   -- nil = any
    }
    table.insert(universals, key)
end

-- Shortcuts for the content file
local T = ns.engagements.T
local U = ns.engagements.U

---------------------------------------------------------------------------
-- Zone-specific topic registration — exact zone targeting
---------------------------------------------------------------------------

--- Register a zone-specific universal topic.
--- Only fires when the group is in the exact named zone.
--- @param zone string  Exact zone name (e.g. "Duskwood", "The Deadmines")
function ns.engagements.Z(zone, openers, responses, followUps)
    local zl = zone:lower()
    if not zoneTopics[zl] then zoneTopics[zl] = {} end
    zoneKeyCount = zoneKeyCount + 1
    local key = "Z" .. zoneKeyCount
    local topic = {
        target    = "ANY",
        openers   = openers,
        responses = responses,
        followUps = followUps or {},
    }
    zoneTopics[zl][key] = topic
    allZoneTopics[key]  = topic   -- flat lookup for GetThread
end

--- Register a zone-specific class-targeted topic.
--- Fires when the group is in the exact named zone AND a matching class is present.
function ns.engagements.ZT(zone, target, openers, responses, followUps)
    local zl = zone:lower()
    if not zoneTopics[zl] then zoneTopics[zl] = {} end
    zoneKeyCount = zoneKeyCount + 1
    local key = "ZT" .. zoneKeyCount
    local topic = {
        target    = target:upper(),
        openers   = openers,
        responses = responses,
        followUps = followUps or {},
    }
    zoneTopics[zl][key] = topic
    allZoneTopics[key]  = topic   -- flat lookup for GetThread
end

---------------------------------------------------------------------------
-- Public API
---------------------------------------------------------------------------

--- Retrieve a thread/topic by key.
--- For topics (T/U/Z/ZT), randomly picks from the arrays each call.
--- Returns a normalized { opener, response, followUp } shape.
function ns.engagements.GetThread(key)
    -- Legacy E/M threads — return as-is (fixed strings)
    if threads[key] then return threads[key] end

    -- Topic-based T/U threads
    local topic = topics[key]
    -- Zone-specific Z/ZT threads
    if not topic then topic = allZoneTopics[key] end
    if not topic then return nil end

    local opener   = topic.openers[math.random(#topic.openers)]
    local response = topic.responses[math.random(#topic.responses)]
    local followUp = nil
    if topic.followUps and #topic.followUps > 0 then
        followUp = topic.followUps[math.random(#topic.followUps)]
    end

    return {
        opener   = opener,
        response = response,
        followUp = followUp,
        source   = "ANY",
        target   = topic.target,
        mismatch = false,
    }
end

--- Pick a random engagement for this player to initiate.
--- Returns: threadKey, targetPlayerName  (or nil if nothing qualifies)
--- Uses recently-used tracking and context filtering to avoid repeats.
function ns.engagements.PickEngagement()
    local myPersona = ns.ResolvePersona()
    local peers = ns.comm.peers
    if not peers then return nil, nil end

    -- Context filter helper
    local function ContextOK(key)
        local topic = topics[key]
        if not topic then return true end           -- legacy thread, no context
        if not topic.context then return true end   -- nil = any
        if not ns.context then return true end      -- module not loaded yet
        return ns.context.Matches(topic.context)
    end

    -- Build candidate list: { key, targetName }
    local candidates = {}
    local allKeys    = {}   -- track all valid keys for dedup reset logic

    ---------------------------------------------------------------------------
    -- PHASE 0: Zone-specific topics (Z / ZT)
    -- These are highest priority — if we're in a mapped zone, 60% chance to
    -- pick a zone-specific topic before falling through to generic pools.
    ---------------------------------------------------------------------------
    local currentZone = ns.context and ns.context.GetZone() or ""
    local zoneBag = zoneTopics[currentZone:lower()]
    if zoneBag and next(zoneBag) and math.random() < 0.60 then
        local zoneCandidates = {}
        for key, topic in pairs(zoneBag) do
            if not IsRecentlyUsed(key) then
                if topic.target == "ANY" then
                    -- Universal zone topic: pick a random peer
                    for peerName in pairs(peers) do
                        table.insert(zoneCandidates, { key = key, target = peerName })
                        break
                    end
                else
                    -- Class-targeted zone topic: find a matching peer
                    for peerName, peerData in pairs(peers) do
                        if (peerData.persona or "UNKNOWN") == topic.target then
                            table.insert(zoneCandidates, { key = key, target = peerName })
                            table.insert(zoneCandidates, { key = key, target = peerName })  -- double weight
                            break
                        end
                    end
                end
            end
        end
        if #zoneCandidates > 0 then
            local pick = zoneCandidates[math.random(#zoneCandidates)]
            MarkUsed(pick.key)
            return pick.key, pick.target
        end
    end

    ---------------------------------------------------------------------------
    -- PHASE 1-4: Context-filtered T/U/E/M pools (existing logic)
    ---------------------------------------------------------------------------

    for peerName, peerData in pairs(peers) do
        local theirPersona = peerData.persona    or "UNKNOWN"
        local theirClass   = peerData.actualClass or "UNKNOWN"

        -- 1) Mismatch threads (legacy M)
        if theirPersona ~= theirClass and theirPersona ~= "UNKNOWN" then
            local pool = mismatchThreads[myPersona] and mismatchThreads[myPersona][theirPersona]
            if pool then
                for _, key in ipairs(pool) do
                    table.insert(allKeys, key)
                    if not IsRecentlyUsed(key) and ContextOK(key) then
                        table.insert(candidates, { key = key, target = peerName })
                    end
                end
            end
        end

        -- 2) Legacy pair-specific threads (E)
        local pool = byPair[myPersona] and byPair[myPersona][theirPersona]
        if pool then
            for _, key in ipairs(pool) do
                table.insert(allKeys, key)
                if not IsRecentlyUsed(key) and ContextOK(key) then
                    table.insert(candidates, { key = key, target = peerName })
                end
            end
        end

        -- 3) Target-specific topics (T) — anyone → their persona
        if theirPersona ~= "UNKNOWN" then
            local tPool = byTarget[theirPersona]
            if tPool then
                for _, key in ipairs(tPool) do
                    table.insert(allKeys, key)
                    if not IsRecentlyUsed(key) and ContextOK(key) then
                        table.insert(candidates, { key = key, target = peerName })
                    end
                end
            end
        end

        -- 4) Universal topics (U) — anyone → anyone
        for _, key in ipairs(universals) do
            table.insert(allKeys, key)
            if not IsRecentlyUsed(key) and ContextOK(key) then
                table.insert(candidates, { key = key, target = peerName })
            end
        end
    end

    -- If all keys used, reset the cycle and rebuild candidates
    if #candidates == 0 and #allKeys > 0 then
        ns.Debug("Engagements: full cycle complete — resetting used pool")
        WipeUsedKeys()
        -- Rebuild candidates from allKeys (all are now available)
        local seen = {}
        for _, key in ipairs(allKeys) do
            if not seen[key] then
                seen[key] = true
                -- Re-match to a peer
                for peerName, peerData in pairs(peers) do
                    local theirPersona = peerData.persona or "UNKNOWN"
                    local topic = topics[key]
                    local thread = threads[key]
                    if topic then
                        if topic.target == "ANY" or topic.target == theirPersona then
                            table.insert(candidates, { key = key, target = peerName })
                            break
                        end
                    elseif thread then
                        table.insert(candidates, { key = key, target = peerName })
                        break
                    end
                end
            end
        end
    end

    if #candidates == 0 then return nil, nil end

    local pick = candidates[math.random(#candidates)]
    MarkUsed(pick.key)
    return pick.key, pick.target
end

--- Get total topic/thread counts for debug
function ns.engagements.GetCounts()
    local tCount, uCount, zCount = 0, 0, 0
    for _ in pairs(byTarget) do end
    for k in pairs(topics) do
        if k:sub(1,1) == "T" then tCount = tCount + 1
        elseif k:sub(1,1) == "U" then uCount = uCount + 1 end
    end
    for _ in pairs(allZoneTopics) do zCount = zCount + 1 end
    return threadCount, tCount, uCount, zCount
end

---------------------------------------------------------------------------
-- Solo Zone Line Picker
-- Returns a random zone-specific opener for the current zone.
-- Only uses Z() topics (target == "ANY") — excludes class-targeted ZT().
-- Has its own dedup buffer so solo doesn't repeat zone lines quickly.
---------------------------------------------------------------------------
local soloZoneRecent = {}
local SOLO_ZONE_CAP  = 15

--- Pick a random zone opener for solo emote use.
--- @param zone string  The zone name (from GetRealZoneText)
--- @return string|nil  A zone-flavoured line, or nil if no data for this zone
function ns.engagements.PickSoloZoneLine(zone)
    if not zone or zone == "" then return nil end
    local bag = zoneTopics[zone:lower()]
    if not bag then return nil end

    -- Collect all "ANY" openers from all Z() topics in this zone
    local pool = {}
    for key, topic in pairs(bag) do
        if topic.target == "ANY" then
            for _, line in ipairs(topic.openers) do
                -- Dedup check
                local dominated = false
                for _, recent in ipairs(soloZoneRecent) do
                    if recent == line then dominated = true; break end
                end
                if not dominated then
                    table.insert(pool, line)
                end
            end
        end
    end

    -- All lines recently used → reset and pick from full pool
    if #pool == 0 then
        pool = {}
        for _, topic in pairs(bag) do
            if topic.target == "ANY" then
                for _, line in ipairs(topic.openers) do
                    table.insert(pool, line)
                end
            end
        end
    end

    if #pool == 0 then return nil end

    local pick = pool[math.random(#pool)]
    table.insert(soloZoneRecent, pick)
    if #soloZoneRecent > SOLO_ZONE_CAP then table.remove(soloZoneRecent, 1) end
    return pick
end

---------------------------------------------------------------------------
-- Init: load persisted used-keys from SavedVariables
---------------------------------------------------------------------------
function ns.engagements.Init()
    BanterCharDB = BanterCharDB or {}
    local saved = BanterCharDB.usedEngagements
    if saved then
        local now = time()
        local loaded, expired = 0, 0
        for key, t in pairs(saved) do
            if (now - t) <= EXPIRY_SECONDS then
                usedKeys[key] = t
                loaded = loaded + 1
            else
                saved[key] = nil   -- clean up expired entries
                expired = expired + 1
            end
        end
        ns.Debug(string.format("Engagements: loaded %d recently-used keys (%d expired)", loaded, expired))
    end
    local eCount, tCount, uCount = ns.engagements.GetCounts()
    ns.Debug(string.format("Engagements ready: %d E/M threads, %d T topics, %d U universals", eCount, tCount, uCount))
end

--=========================================================================
--  CLASS MISMATCH THREADS
--  Comedy goldmine: someone's persona doesn't match their actual class.
--  Every class can call out every other persona mismatch.
--=========================================================================

-- ======== Any source → target claiming MAGE (but isn't) ========
M("WARRIOR", "MAGE",
    "Hey {name}, gonna be honest... you don't really give off 'mage' vibes.",
    "I identify as a Mage, thank you. My pronouns are Blinky and Stinky.",
    "Blink away from THIS conversation then.")

M("WARLOCK", "MAGE",
    "Hey {name}, you call yourself a mage? Where's the conjured food? I'm hungry.",
    "I'm more of a... spiritual mage. The food is metaphorical.",
    "My demon is LITERALLY more qualified to be a mage than you.")

M("PRIEST", "MAGE",
    "{name}, the Light tells me you're NOT actually a mage. It whispers things.",
    "Your Light is gossiping about me? That's very un-priestly.",
    "The Light gossips about EVERYONE. You should hear what it says about paladins.")

M("ROGUE", "MAGE",
    "Hey {name}, 'mage' right? Go ahead. Cast something. I'll wait.",
    "I'm... working up to it. Mana takes time to... regenerate.",
    "Your mana bar is a lie and we both know it.")

M("HUNTER", "MAGE",
    "{name}, my PET could be a better mage than you. At least it breathes fire.",
    "Fire breathing is NOT the same as fire magic. There's theory involved.",
    "Theory? You hit things with a SWORD fifteen seconds ago.")

M("PALADIN", "MAGE",
    "{name}, the Light reveals truth. And the truth is you're no mage.",
    "The Light can mind its own business. I'm a mage of the PEOPLE.",
    "Mage of the people? You can't even conjure bread.")

M("DRUID", "MAGE",
    "Hey {name}, nature can sense your aura. It says... not a mage.",
    "Nature is being judgmental. I thought druids were about acceptance?",
    "We accept TREES. Not identity fraud.")

M("SHAMAN", "MAGE",
    "{name}, the elements whisper to me. They say you're no mage, friend.",
    "Tell the elements I'm a mage who's... between spells right now.",
    "Between spells? You've been 'between spells' since we met.")

M("MAGE", "MAGE",
    "{name}, I'm an actual mage. I can FEEL that you're not. It's like a sixth sense. A MAGIC one.",
    "How dare you. I passed all my mage exams. ...internally.",
    "Conjure a table. Right now. One table. ...that's what I thought.")

-- ======== Any source → target claiming WARRIOR (but isn't) ========
M("MAGE", "WARRIOR",
    "{name}, you SAY you're a warrior but I haven't seen you charge once.",
    "I charge... strategically. When the time is right. Which is... later.",
    "Later? Warriors don't KNOW the word 'later.' They only know 'CHARGE.'")

M("WARRIOR", "WARRIOR",
    "Hey {name}, you're calling yourself a warrior? Where's the rage? I see ZERO rage.",
    "My rage is... internal. Very deep. Very controlled.",
    "That's called being calm. That's the OPPOSITE of warrior.")

M("ROGUE", "WARRIOR",
    "{name}, real warriors don't sneak. You SNEAK. I've seen you. Sneaking.",
    "I walk loudly! Very loudly! STOMP STOMP STOMP!",
    "You just whispered 'stomp stomp stomp.' That's not... that's not what warriors do.")

M("PRIEST", "WARRIOR",
    "{name}, I've seen warriors. You are not that. You flinch at loud noises.",
    "I strategically recoil! It's a WARRIOR thing! You wouldn't understand!",
    "Warriors don't 'strategically recoil.' They strategically HIT THINGS.")

M("PALADIN", "WARRIOR",
    "{name}, warriors wear their plate with pride. You wear it like a costume.",
    "This IS my plate! I feel very warrior-y in it!",
    "You put it on backwards. The CHESTPLATE, {name}. It's backwards.")

-- ======== Any source → target claiming WARLOCK (but isn't) ========
M("MAGE", "WARLOCK",
    "{name}, real warlocks radiate dark energy. You radiate... confusion.",
    "I'm a subtle warlock. Stealth darkness. It's a new school.",
    "You made that up. That's not a school. NOT EVERYTHING IS A SCHOOL.")

M("WARRIOR", "WARLOCK",
    "Hey {name}, where's your demon? Warlocks have demons. I don't see a demon.",
    "My demon is on... vacation. In the Nether. They needed a personal day.",
    "Demons don't GET personal days! Even I know that!")

M("PRIEST", "WARLOCK",
    "{name}, I sense no dark magic from you. Just... vibes. Confused vibes.",
    "Dark magic is QUIET. You're thinking of loud dark magic. This is the quiet kind.",
    "There is no quiet kind. Life Tap. Right now. DO IT. ...you can't, can you.")

M("HUNTER", "WARLOCK",
    "{name}, my pet is staring at you. It can smell that you're NOT a warlock.",
    "Your pet needs to stay out of my business! I summon demons in PRIVATE!",
    "Name one. Name ONE demon you've summoned. ...that's your CAT, {name}.")

-- ======== Any source → target claiming PRIEST (but isn't) ========
M("WARRIOR", "PRIEST",
    "Hey {name}, if you're a priest, heal me. Right now. I scraped my elbow.",
    "The Light heals those who help themselves. Apply a bandage.",
    "REAL priests don't say 'apply a bandage.' They say 'stand still.'")

M("MAGE", "PRIEST",
    "{name}, I have Arcane Intellect. I can TELL you're not a priest. Scientifically.",
    "My priesthood is a matter of FAITH, not your arcane science.",
    "Faith doesn't give you a mana bar. And YOU don't have a mana bar.")

M("WARLOCK", "PRIEST",
    "{name}, I've met priests. They radiate Light. You radiate... what IS that?",
    "Determination! I radiate pure determination! And the Light, sometimes!",
    "That's not Light. That's your torch. You're holding a TORCH.")

M("ROGUE", "PRIEST",
    "Hey {name}, priests heal. You've healed nobody. Zero people. I've been counting.",
    "I'm a SHADOW priest! We do damage! It's a whole spec!",
    "Name one shadow spell. ...Backstab isn't a shadow spell, {name}.")

-- ======== Any source → target claiming ROGUE (but isn't) ========
M("WARRIOR", "ROGUE",
    "Hey {name}, rogues are QUIET. You're the loudest person in this dungeon.",
    "I'm... loud stealth. It's an intimidation technique!",
    "That's called 'not being a rogue.' Pretty sure that's what that's called.")

M("MAGE", "ROGUE",
    "{name}, rogues vanish. I've never seen you vanish. You just... stand there. Visible.",
    "I vanish on the INSIDE. Emotional stealth. Very advanced.",
    "Emotional stealth is called 'being quiet.' You're also not doing THAT.")

M("PRIEST", "ROGUE",
    "{name}, the Light sees all. Including you. Standing right there. Very un-stealthy.",
    "Maybe your Light is TOO bright! Ever think about dimming it?!",
    "Rogues don't ask people to dim their Light. Rogues AVOID the Light. You're standing IN it.")

M("HUNTER", "ROGUE",
    "{name}, my Track Humanoids shows you. Right there. Not stealthed. Very visible.",
    "I'm in... phase 1 of stealth! The visible phase! Phase 2 is the invisible part!",
    "There IS no phase 1! You just go invisible! ...which you CAN'T DO!")

-- ======== Any source → target claiming HUNTER (but isn't) ========
M("WARRIOR", "HUNTER",
    "{name}, hunters have pets. Where's your pet? I see no pet.",
    "My pet is... independent. Very free-range. They'll be back.",
    "Your 'pet' was a squirrel that ran away. I watched it happen.")

M("MAGE", "HUNTER",
    "{name}, hunters use bows. You don't have a bow. You have... what is that?",
    "It's a ranged weapon! It shoots things! In a direction!",
    "That's a stick, {name}. You're holding a stick and calling it a bow.")

M("ROGUE", "HUNTER",
    "Hey {name}, I notice no pet. No bow. No traps. What part of 'hunter' are you doing?",
    "The ATTITUDE part. I hunt with my EYES.",
    "Hunting with your eyes is called LOOKING. Everyone does that.")

-- ======== Any source → target claiming PALADIN (but isn't) ========
M("WARRIOR", "PALADIN",
    "{name}, I've never seen you bubble. Not once. Paladins bubble CONSTANTLY.",
    "I'm saving it! For the RIGHT moment! It'll be SPECTACULAR!",
    "You've been 'saving it' for four dungeons. You don't HAVE a bubble.")

M("MAGE", "PALADIN",
    "{name}, paladins channel the Light. I sense no Light from you. Just ambition.",
    "The Light works in mysterious ways! Maybe it's working... silently!",
    "The Light is never silent. Ask any REAL paladin. They won't shut up about it.")

M("WARLOCK", "PALADIN",
    "{name}, the Light? Really? I can see your soul. It's not that bright.",
    "My soul is VERY bright! On the inside! Where you can't see!",
    "I see SOULS for a living. Yours is mid at best. Sorry.")

M("PRIEST", "PALADIN",
    "{name}, I use the Light professionally. I can tell you're... freelancing.",
    "I'm a paladin of the people! Grassroots holiness!",
    "Grassroots holiness? Bubble. Right now. Show me one bubble. ...thought so.")

-- ======== Any source → target claiming DRUID (but isn't) ========
M("WARRIOR", "DRUID",
    "Hey {name}, druids shapeshift. Go ahead. Turn into something. Anything.",
    "I'm in... human form. This IS a form. It's my MAIN form.",
    "That's not a form! That's just BEING A PERSON!")

M("MAGE", "DRUID",
    "{name}, druids commune with nature. That bush you poked? It didn't respond.",
    "Nature speaks in SUBTLE ways! The bush... nodded. Internally.",
    "Bushes don't have internal dialogue! You're not a druid! You poked a bush!")

M("ROGUE", "DRUID",
    "{name}, druids have cat form. You should TRY being stealthy. Oh wait. You can't. Because you're not a druid.",
    "I have... metaphorical cat form. I'm feline on the inside!",
    "Feline on the inside? That explains the hairballs but NOT the druid claim.")

-- ======== Any source → target claiming SHAMAN (but isn't) ========
M("WARRIOR", "SHAMAN",
    "Hey {name}, shamans drop totems. I've seen zero totems. Where are the sticks?",
    "My totems are INVISIBLE. Very advanced shamanism. You wouldn't understand.",
    "Totems are literally STICKS IN THE GROUND. The opposite of invisible!")

M("MAGE", "SHAMAN",
    "{name}, shamans talk to elements. The elements talk to ME about you. They're confused.",
    "Tell the elements to mind their business! I'll talk to them when I'M ready!",
    "That's... not how shamanism works. The elements come to YOU. And they're NOT coming.")

M("PRIEST", "SHAMAN",
    "{name}, I sense your spiritual connection to the elements. It's... nonexistent.",
    "Elements work on a different FREQUENCY. Maybe your Light is interfering!",
    "The Light doesn't interfere with elements. You're just not a shaman, babe.")

-- ======== Any source → target claiming PIRATE ========
M("WARRIOR", "PIRATE",
    "{name}, 'pirate?' That's not even a CLASS. That's a career choice.",
    "YARR, it be more than a career! It be a LIFESTYLE!",
    "It's a lifestyle that involves scurvy. Get a real class.")

M("MAGE", "PIRATE",
    "{name}, pirate isn't in ANY academic text. I've checked. Twice.",
    "The best things in life aren't in BOOKS, mage! They're on BOATS!",
    "Name one reputable boat. One. ...that's a rowboat. That doesn't count.")

M("PRIEST", "PIRATE",
    "{name}, the Light has many followers. Pirates are not traditionally among them.",
    "The Light shines on the OCEAN too! That makes all pirates Light-followers!",
    "That's... sunlight. You're describing sunlight. Those are different things.")

M("ROGUE", "PIRATE",
    "{name}, at least I have a REAL class. 'Pirate' is just rogue with a hat.",
    "It's a GREAT hat! And we have BOATS! Do rogues have BOATS?!",
    "We have Vanish. You have... scurvy. I think I win there.")


--=========================================================================
--  GENERAL PERSONA-TO-PERSONA ENGAGEMENT THREADS
--  Fire regardless of actual class. Pure persona banter.
--=========================================================================

-- ======== WARRIOR engagements ========
E("WARRIOR", "MAGE",
    "Hey {name}, question. If you're so smart, why do you die in one hit?",
    "Intelligence and durability are DIFFERENT stats. I chose to invest wisely.",
    "Wisely? Your 'wise investment' left you with the HP of a startled rabbit.")

E("WARRIOR", "MAGE",
    "{name}, I've been meaning to ask... do you even LIFT?",
    "I lift KNOWLEDGE. With my MIND. It's heavier than your sword.",
    "If knowledge was that heavy you'd have more stamina. You have none.")

E("WARRIOR", "PRIEST",
    "{name}, honest question. Do you actually ENJOY healing?",
    "Enjoy? ENJOY?! I heal so YOU don't die! The GRATITUDE would be nice!",
    "Hey I said honest question, not attack. ...but yeah you should heal more.")

E("WARRIOR", "ROGUE",
    "{name}, I have a question. Where DO you go when you Vanish?",
    "Classified. If I told you, I'd have to... you know what, just don't ask.",
    "You go nowhere don't you. You just stand there invisible. AWKWARDLY.")

E("WARRIOR", "WARLOCK",
    "Hey {name}, does your demon ever just... talk to you? At night?",
    "Define 'talk.' Define 'at night.' Define 'to you.' ...yes.",
    "I'm... gonna stand a bit further away from you from now on.")

E("WARRIOR", "PALADIN",
    "{name}, we both wear plate. Why can YOU become invincible and I can't?",
    "The Light favors the righteous. Perhaps if you prayed more and raged less...",
    "I'll PRAY when the Light gives me a bubble. Until then, RAGE.")

E("WARRIOR", "HUNTER",
    "{name}, your pet bit me. Again. Third time this dungeon.",
    "My pet only bites people it doesn't respect. So... that tracks.",
    "I will PUNT that cat into the next zone. I have the Strength stat for it.")

E("WARRIOR", "DRUID",
    "{name}, serious question. When you're in bear form, can you still... think?",
    "Of COURSE I can think! Bear form is just a physical change! ...mostly.",
    "Mostly. Cool. Next time you go bear and forget the plan, I'll remind you. LOUDLY.")

E("WARRIOR", "SHAMAN",
    "Hey {name}, do the totems ever talk to you? The little sticks?",
    "They don't talk. They channel elemental power. It's very—",
    "So no. The sticks don't talk. Got it. Cool sticks though.")

-- ======== MAGE engagements ========
E("MAGE", "WARRIOR",
    "{name}, genuinely curious. What goes through your mind when you Charge?",
    "AAAAAHHHHH! That's it. That's the whole thought.",
    "Fascinating. The entire frontal lobe, dedicated to one syllable. Remarkable.")

E("MAGE", "WARRIOR",
    "Hey {name}, I calculated your expected lifespan per fight. Want to hear it?",
    "No. Actually yes. ...no. Is it bad?",
    "4.7 seconds. On average. The standard deviation is... also 4.7 seconds.")

E("MAGE", "WARLOCK",
    "{name}, I've been studying your spell patterns. They're... concerning.",
    "Concerned about the POWER? The EFFICIENCY? The raw arcane mastery?",
    "No. The part where you voluntarily set yourself on fire for mana. That part.")

E("MAGE", "WARLOCK",
    "{name}, out of academic curiosity, where exactly do Healthstones come from?",
    "You don't want to know. Trust me on this one.",
    "I DO want to know. That's the problem. That's ALWAYS the problem. Tell me.")

E("MAGE", "PRIEST",
    "Hey {name}, quick survey. How much of your healing is skill vs. panic?",
    "Seventy percent panic. Twenty percent muscle memory. Ten percent prayer.",
    "And zero percent mana management, apparently. You're OOM EVERY fight.")

E("MAGE", "ROGUE",
    "{name}, I can see you in stealth. You know that, right?",
    "No you CAN'T. ...can you? HOW? I'm INVISIBLE.",
    "Arcane sight. I see everything. Including you picking your nose just now.")

E("MAGE", "HUNTER",
    "{name}, your pet ate 3 stacks of my conjured food. I'm sending you a bill.",
    "Pets eat! It's natural! They need nutrition!",
    "Forty muffins is not 'nutrition.' Forty muffins is a CRY FOR HELP.")

E("MAGE", "DRUID",
    "{name}, academically speaking, which form is the REAL you?",
    "They're ALL the real me! That's the beauty of druidism!",
    "So none of them. The answer is 'I don't know who I am.' Got it. Noted.")

E("MAGE", "PALADIN",
    "{name}, I've been counting. You've auto-attacked 47 times. Cast 3 spells. In five minutes.",
    "Quality over QUANTITY. Each Judgement is MEANINGFUL.",
    "Three spells in five minutes is not 'quality.' It's retirement.")

E("MAGE", "SHAMAN",
    "Hey {name}, I manipulate the same elements you do. But with MATH. How do you do it?",
    "I ask nicely. The elements respond to RESPECT. Not equations.",
    "You... ASK? Nicely? The fire just... agrees? That's not how thermodynamics WORKS.")

-- ======== WARLOCK engagements ========
E("WARLOCK", "MAGE",
    "{name}, I've tasted real power. Have you? Or just... textbook power?",
    "Textbook power WORKS. My fireballs don't come with a demonic EULA.",
    "Your fireballs also don't come back if you die. My imps do. Think about it.")

E("WARLOCK", "WARRIOR",
    "{name}, you seem tense. Want a Healthstone? It'll fix the rage. ...temporarily.",
    "What's IN the Healthstone exactly? It glows wrong.",
    "Compressed suffering. Don't worry about it. Eat the rock, feel better. Details are overrated.")

E("WARLOCK", "PRIEST",
    "{name}, we should compare notes. I use Shadow. You use Shadow. Difference?",
    "I use Shadow in SERVICE of the Light! It's complicated! And holy!",
    "Right. Holy shadow. That's not a contradiction AT ALL. *demon laughs*")

E("WARLOCK", "HUNTER",
    "{name}, your pet and my demon have been staring at each other for 5 minutes.",
    "My pet is establishing dominance. Very natural behavior.",
    "My demon is establishing dimensional superiority. Very UNnatural behavior. It's winning.")

E("WARLOCK", "ROGUE",
    "Hey {name}, lurking in shadows doesn't make you dark. It makes you sneaky. I'M dark.",
    "I can kill someone before they see me. That's pretty dark.",
    "I can kill someone with their OWN FEAR. And then DRAIN their corpse. We're not the same.")

E("WARLOCK", "PALADIN",
    "{name}, does the Light forgive demon summoners? Asking for a me.",
    "The Light forgives ALL who seek redemption. ...do you seek redemption?",
    "Not even slightly. Just wanted to see the look on your face. Worth it.")

E("WARLOCK", "DRUID",
    "{name}, you shapeshift using nature. I reshape reality using the Nether. Similar?",
    "VERY different. Mine is natural harmony. Yours is... an abomination.",
    "Harsh. But my abomination does more DPS than your harmony. So.")

E("WARLOCK", "SHAMAN",
    "{name}, your elements and my demons. Do they ever talk? Behind our backs?",
    "The elements are PURE. They would never consort with your dark entities.",
    "My imp says otherwise. He says your fire elemental owes him money.")

-- ======== PRIEST engagements ========
E("PRIEST", "WARRIOR",
    "{name}, every time you Charge, my stress level triples. Just so you know.",
    "Charge is EFFECTIVE. It sets the tone. It establishes dominance.",
    "It establishes that I need to burn all my mana in the first 5 seconds. GREAT tone.")

E("PRIEST", "MAGE",
    "Hey {name}, thanks for the water. Genuinely. You're the only reason I have mana.",
    "Happy to help! Anything for the healer!",
    "Now please stop pulling aggro with Pyroblast crits. The water isn't THAT unlimited.")

E("PRIEST", "WARLOCK",
    "{name}, I need you to stop Life Tapping for FIVE seconds. Can you do that?",
    "I NEED the mana. The mana is my LIFE. ...which I then convert into mana. Cycle of life.",
    "Cycle of MY mana. Because I keep healing your self-inflicted damage. STOP.")

E("PRIEST", "ROGUE",
    "Hey {name}, if you could stand, like, 5 yards closer? Just 5? For heal range?",
    "Closer is DANGEROUS. Closer is where the cleaves happen. Closer is where rogues DIE.",
    "Closer is where the HEALS happen! You know what's more dangerous? NO HEALS!")

E("PRIEST", "HUNTER",
    "{name}, I'm begging you. BEGGING. Control the pet. For my mana. For my SANITY.",
    "The pet is controlled! It's just... enthusiastic! It loves combat!",
    "It pulled two packs! My mana is GONE! The pet's enthusiasm is costing me YEARS of my LIFE!")

E("PRIEST", "PALADIN",
    "{name}, you have Lay on Hands. A FULL heal. One button. I cast for 3 seconds to heal HALF as much.",
    "Lay on Hands has a one-hour cooldown! It's not the same!",
    "ONE button. FULL heal. INSTANT. I don't care about the cooldown. I am jealous and I am NOT hiding it.")

E("PRIEST", "DRUID",
    "{name}, I would like your Innervate. Please. I am BEGGING formally.",
    "I'm saving it for... a critical moment. A very important—",
    "We're in combat. I'm OOM. People are dying. What MOMENT are you SAVING it for?!")

E("PRIEST", "SHAMAN",
    "Hey {name}, Mana Tide Totem is my favorite thing about you. When is it coming out?",
    "Mana Tide is on cooldown. Five minutes. Be patient.",
    "FIVE MINUTES?! I'll be dead in THIRTY SECONDS! Drop. The. Stick.")

-- ======== ROGUE engagements ========
E("ROGUE", "WARRIOR",
    "Hey {name}, I pick locks. Like PROFESSIONALLY. You ever need anything opened?",
    "I open things with my SWORD. Everything opens if you hit it hard enough.",
    "That's... not lockpicking. That's vandalism. There IS a difference.")

E("ROGUE", "MAGE",
    "{name}, you Blink. I Vanish. Who has the better escape plan?",
    "Blink is repositioning! It's TACTICAL! Vanish is just HIDING!",
    "Hiding SUCCESSFULLY. Key word. You Blink INTO walls. I've seen it.")

E("ROGUE", "PRIEST",
    "Hey {name}, if I Vanish, can you still heal me? Serious question.",
    "I can't TARGET you in Vanish. So... no. You're on your own.",
    "So Vanish makes me immortal AND unhealable. Great. Love it. ...wait, that's BAD.")

E("ROGUE", "HUNTER",
    "{name}, your pet keeps FINDING me in stealth. Tell it to stop.",
    "I... can't stop nature. The pet senses things. It's instinct!",
    "Train your instinct to leave me ALONE. I was perfectly hidden until Fido showed up.")

E("ROGUE", "PALADIN",
    "Hey {name}, you're glowing. AGAIN. Can you NOT glow? Some of us work in the dark.",
    "The Light shines from within! I can't turn it off!",
    "Then stand further away. You're a SPOTLIGHT. I'm STEALTH. We don't MIX.")

E("ROGUE", "WARLOCK",
    "{name}, your imp needs to stop shooting things I Sap. EVERY TIME.",
    "The imp has a mind of its own! It's a free-thinking demonic entity!",
    "Free-thinking? It shot my Sap target 6 times in a ROW. That's not thinking, that's SPITE.")

-- ======== HUNTER engagements ========
E("HUNTER", "WARRIOR",
    "{name}, my pet asked about you. Wanna know what it said?",
    "Pets don't TALK. Your pet didn't—",
    "It said 'growl.' Which is basically 'I could tank better.' Just passing it along.")

E("HUNTER", "MAGE",
    "Hey {name}, can you conjure food for my pet? It's hungry. It's ALWAYS hungry.",
    "I already gave your pet 40 fish. FORTY.",
    "That was breakfast. It's lunchtime now. Forty more please. And some for me too.")

E("HUNTER", "PRIEST",
    "{name}, quick question. Can you heal my pet? It took a hit.",
    "I heal PEOPLE, {name}. PEOPLE. Your pet is a BEAST.",
    "My pet is a valued member of this team! More than some PEOPLE I could name!")

E("HUNTER", "ROGUE",
    "Hey {name}, I can Track Humanoids. I know where you are. In stealth. Right now.",
    "That's... invasive. That's a violation of my personal stealth space.",
    "You're behind the third pillar. Four yards to the left. Picking your nose AGAIN.")

E("HUNTER", "WARLOCK",
    "{name}, your demon and my pet have formed an alliance. Should we be worried?",
    "My demon doesn't form alliances. It forms... tactical arrangements.",
    "They're sharing food. MY conjured food. The alliance is REAL and it's EXPENSIVE.")

E("HUNTER", "DRUID",
    "{name}, when you're in cat form, does my pet think you're another pet?",
    "I am NOT a pet! I'm a druid in animal form! There's a HUGE difference!",
    "My pet just tried to play with you. It thinks you're a cat. Be honest. Are you a cat?")

-- ======== DRUID engagements ========
E("DRUID", "WARRIOR",
    "Hey {name}, I can be a bear too. Want to compare? Bear-off?",
    "You're a FAKE bear. I'm a REAL warrior. Your bear form has less armor than my SHIELD.",
    "My bear form can also HEAL. Can your shield heal? Didn't think so.")

E("DRUID", "MAGE",
    "{name}, I also use nature magic. It's like arcane but with more leaves.",
    "Leaves? LEAVES? Arcane magic shaped REALITY. Your magic grows FERNS.",
    "My ferns have won more fights than your Frostbolts. Don't disrespect the foliage.")

E("DRUID", "ROGUE",
    "Hey {name}, I can stealth too. In cat form. We should sneak together sometime.",
    "Your stealth is TOURIST stealth. You're loud. Your paws SQUISH.",
    "At least I can shift out and heal if I'm caught. You just... die. Stealthily.")

E("DRUID", "PRIEST",
    "{name}, I can heal too. Want me to help? I have HoTs. Many HoTs.",
    "Help? Oh NOW you want to heal? What happened to CAT FORM?! You were CAT for 3 pulls!",
    "Those were... cat healing pulls. The strategy was DPS. The heals were... implied.")

E("DRUID", "PALADIN",
    "Hey {name}, we're both hybrids. Tank, heal, DPS. Want to compare notes?",
    "Compare NOTES? I have Divine Shield. What's your equivalent?",
    "I have four animal forms and a battle rez. What's YOUR equivalent? ...exactly.")

E("DRUID", "HUNTER",
    "{name}, your pet and my cat form locked eyes again. It's getting weird.",
    "My pet is confused. Are you a druid or a cat? Commit.",
    "I'm BOTH. Simultaneously. Your pet needs to accept the duality of nature.")

-- ======== PALADIN engagements ========
E("PALADIN", "WARRIOR",
    "Hey {name}, blessing preference? Might? Kings? Or would you prefer a bubble?",
    "I don't NEED a bubble! I have my OWN defenses! Shield block! Shield wall!",
    "Cute. Those have cooldowns. My bubble is on a... well, also a cooldown. But GOLDEN.")

E("PALADIN", "MAGE",
    "{name}, I wear plate AND cast spells. Why did you stop at just spells?",
    "Because I chose to SPECIALIZE. To be the BEST at one thing. Unlike certain hybrid classes.",
    "Bold words from someone who dies to a stiff breeze. Here, have a Blessing.")

E("PALADIN", "WARLOCK",
    "{name}, I worry about your soul. Genuinely. As a Light-user. I worry.",
    "My soul is... fine. It's FINE. My demon says it's fine. It's probably fine.",
    "Your demon said your soul is fine? That's the LEAST reassuring thing I've ever heard.")

E("PALADIN", "PRIEST",
    "{name}, fellow Light-user. But can YOUR Light make you invincible?",
    "I have Power Word: Shield! That's BASICALLY a bubble!",
    "For 200 damage. MINE absorbs EVERYTHING. For TWELVE seconds. We are not the same.")

E("PALADIN", "ROGUE",
    "Hey {name}, have you accepted the Light? It offers protection. From everything.",
    "I don't NEED protection. I have Vanish. And Evasion. And Sprint.",
    "So your protection is... running away. Very brave. The Light is ALWAYS here. Unlike you.")

E("PALADIN", "SHAMAN",
    "{name}, blessings or totems? Which provides better buffs? Be honest.",
    "Totems! Windfury alone is worth more than ALL your blessings combined!",
    "Windfury is ONE buff. I have Might, Kings, Wisdom, Salvation, Light, AND Sanctuary. SIX.")

-- ======== SHAMAN engagements ========
E("SHAMAN", "WARRIOR",
    "{name}, want Windfury? Say please. The elements respond to POLITENESS.",
    "PLEASE GIVE ME WINDFURY. ...was that polite enough?",
    "The elements say you're too angry but they'll do it anyway. You're welcome.")

E("SHAMAN", "MAGE",
    "Hey {name}, I control lightning. Naturally. You study it in books. Who's the real caster?",
    "Books contain CENTURIES of knowledge! Lightning is just... voltage!",
    "I threw lightning at a dragon last week. How far are you in your BOOK, {name}?")

E("SHAMAN", "PRIEST",
    "{name}, Mana Spring or Mana Tide? Quick. Before the next pull.",
    "Both? Can I have BOTH? I need ALL the mana. Every drop. Every splash.",
    "Both it is. But you OWE me a heal. A BIG one. Totem-sized heal. ...that's medium.")

E("SHAMAN", "HUNTER",
    "{name}, your pet knocked over my totem. AGAIN. Do you know how long those take to place?",
    "One second? Isn't it an instant cast? It's like... barely a thing.",
    "It's the PRINCIPLE, {name}! The totem had FEELINGS! ...elemental feelings!")

E("SHAMAN", "PALADIN",
    "{name}, totems vs. auras. Ground game vs. glow game. Who wins?",
    "Auras are PASSIVE. Always on. Your totems can be DESTROYED.",
    "My totems have PERSONALITY. Your aura is background radiation. BORING radiation.")

E("SHAMAN", "DRUID",
    "Hey {name}, fellow nature class! Trees or totems? Which is more useful?",
    "Trees provide oxygen, shade, and spiritual harmony. Totems provide...",
    "WINDFURY. The answer is always Windfury. Nobody hugs trees for DPS, {name}.")

-- ======== PIRATE engagements ========
E("PIRATE", "WARRIOR",
    "Hey {name}! Ever been on a BOAT? Real combat happens at SEA!",
    "I fight on solid ground. Where my feet are PLANTED. Like a WARRIOR.",
    "Solid ground is for people who can't handle WAVES! Cowards have dry boots!")

E("PIRATE", "MAGE",
    "{name}! Can ye conjure RUM? Water's fine but RUM is better!",
    "I conjure water. PURE water. For mana. Not for... intoxication.",
    "If ye can't conjure rum, what GOOD is magic?! Useless sparkly fingers!")

E("PIRATE", "PRIEST",
    "Hey {name}! Can the Light cure SCURVY? Asking for a... me.",
    "The Light heals wounds, not nutritional deficiencies. Eat a fruit.",
    "Fruits are for PARROTS! Real pirates survive on RUM and STUBBORNNESS!")

E("PIRATE", "ROGUE",
    "{name}! Join me crew! Rogues make EXCELLENT pirates! Same skills, better HATS!",
    "Your 'crew' is just you. Alone. Talking about boats.",
    "A crew of ONE is still a CREW! And me hat is MAGNIFICENT! Say something about the hat!")

E("PIRATE", "HUNTER",
    "Hey {name}! Yer pet! Can it be trained as a SHIP'S CAT?!",
    "My pet is a COMBAT companion, not a... nautical mascot.",
    "EVERY ship needs a cat! Yer beast would be PERFECT! I'll pay in DOUBLOONS!")

E("PIRATE", "PALADIN",
    "{name}! Does the Light work UNDERWATER? Important pirate question!",
    "The Light works EVERYWHERE. Land, sea, sky. It's universal.",
    "PERFECT! Yer hired! Ship chaplain! The pay is terrible but the rum is FREE!")

E("PIRATE", "WARLOCK",
    "Hey {name}! Can yer demon SWIM? Asking for maritime tactical reasons!",
    "My demon transcends physical constraints like water. It just... exists.",
    "So it CAN'T swim. Good to know. I'll keep it away from the edge.")

E("PIRATE", "DRUID",
    "{name}! Turn into a FISH! Guard the hull! Swim around the ship lookin' THREATENING!",
    "I'm not going to swim around your imaginary ship looking threatening.",
    "It's NOT imaginary! It's docked! ...somewhere! Just turn into a fish! A SCARY fish!")

E("PIRATE", "SHAMAN",
    "Hey {name}! Ye control the WIND right?! Can ye fill me SAILS?!",
    "I commune with the wind. I don't take REQUESTS.",
    "COME ON! One good GUST! Northward! I'll split the treasure 70/30! ...80/20!")

--=========================================================================
--  E X P A N D E D   G E N E R A L   E N G A G E M E N T S  (Part 1)
--  Multiple threads per persona pair — combat, lifestyle, insults, bonding
--=========================================================================

-- ===================== WARRIOR additional =====================

E("WARRIOR", "MAGE",
    "{name}, ever thought about wearing armor? Like, real armor? Even leather?",
    "Armor restricts arcane flow. My robes are OPTIMIZED for casting efficiency.",
    "Your 'optimized casting efficiency' has you face-down in the dirt every other fight.")

E("WARRIOR", "MAGE",
    "Hey {name}, bet you can't do a single push-up.",
    "I don't NEED push-ups. I have Arcane Power. It's the same thing but with MAGIC.",
    "It is NOT the same thing. Drop and give me one. ONE. ...that's what I thought.")

E("WARRIOR", "MAGE",
    "{name}, genuine question. Are your arms just for decoration?",
    "My arms channel arcane energy into devastating spells that you WISH you could—",
    "So yes. Decoration. Got it.")

E("WARRIOR", "MAGE",
    "Hey {name}, I arm-wrestled a bear once. What's your best physical achievement?",
    "I once maintained a Blizzard channel for 8 full seconds under enemy fire.",
    "That's a CASTING achievement. I said PHYSICAL. You people have no concept of—")

E("WARRIOR", "WARLOCK",
    "{name}, how do you sleep at night? With the demons and the darkness?",
    "Quite well actually. The Voidwalker makes an excellent night light.",
    "That's THE most disturbing thing anyone has ever said to me. And I've been in wars.")

E("WARRIOR", "WARLOCK",
    "Hey {name}, level with me. Is the demon in charge, or are you?",
    "I am ABSOLUTELY in charge. The demon serves ME.",
    "Then why is it looking at you like that? The look is hostile, {name}. HOSTILE.")

E("WARRIOR", "WARLOCK",
    "{name}, what happens when you sneeze mid-spell? Does a demon pop out?",
    "That is NOT how summoning works! There's ritual! Incantation! Focus!",
    "So you HAVE accidentally sneezed out a demon. I KNEW it.")

E("WARRIOR", "PRIEST",
    "Hey {name}, do healers ever heal THEMSELVES first? Like out of reflex?",
    "Every healer says no. Every healer is lying. ...I heal myself first sometimes.",
    "KNEW IT. I'm at 10% and you're at full. The MATH doesn't lie, {name}.")

E("WARRIOR", "PRIEST",
    "{name}, how many people have you let die this week? Ball park.",
    "I don't 'let' people die! I triage! Some deaths are... MEDICALLY UNAVOIDABLE!",
    "Medically unavoidable. That's a fancy way of saying 'I let them die.' Noted.")

E("WARRIOR", "PRIEST",
    "Hey {name}, what's the worst thing someone said to you after they died?",
    "'Where were the heals?' ALWAYS 'where were the heals.' Like I wasn't healing the WHOLE TIME.",
    "To be fair, I've said that. Multiple times. To you specifically. Today.")

E("WARRIOR", "ROGUE",
    "{name}, do rogues have a code of honor? Or is it just 'stab first, ask never'?",
    "We have a code. Rule one: don't get caught. Rule two: see rule one.",
    "That's not a code of HONOR. That's a code of COWARDICE with extra steps.")

E("WARRIOR", "ROGUE",
    "Hey {name}, I challenge you to a fair fight. No stealth. No poisons. No tricks.",
    "So you want me to fight WITHOUT everything that makes me good? That's not fair, that's CHARITY.",
    "If you can't fight without tricks, you can't FIGHT. End of discussion.")

E("WARRIOR", "ROGUE",
    "{name}, honest question, do you shower? Stealth doesn't hide the smell.",
    "I smell like NOTHING. That's the POINT. Scent discipline is DAY ONE rogue training.",
    "You smell like old leather and desperation. That's not 'nothing.'")

E("WARRIOR", "HUNTER",
    "Hey {name}, if your pet died, could YOU fight? Like personally? With your hands?",
    "Of course! I'm a skilled combatant! The pet is just... supplementary!",
    "You tripped over your own trap last pull. Your HANDS aren't the problem. Your BRAIN is.")

E("WARRIOR", "HUNTER",
    "{name}, why are you ALWAYS at max range? Come closer. Join the FIGHT.",
    "Max range IS the fight! I'm doing damage from here! SAFER damage!",
    "'Safer' damage. You mean COWARD damage. Hit something with your HANDS, {name}.")

E("WARRIOR", "HUNTER",
    "Hey {name}, who names their pet? Like SERIOUSLY names it?",
    "My pet has a name because it's a COMPANION. We have a BOND.",
    "It's a CAT. You found it in a FIELD. The bond is the TREAT BAG, {name}.")

E("WARRIOR", "DRUID",
    "{name}, if you had to pick ONE form forever, which one?",
    "That's like asking which CHILD is my favorite! They're all—",
    "Bear. You'd pick bear. Because bear is just discount warrior. Which is CORRECT.")

E("WARRIOR", "DRUID",
    "Hey {name}, when you shapeshift, do your clothes just... disappear?",
    "They merge with the form! It's nature magic! Perfectly natural transformation!",
    "So you're NAKED inside the bear. Cool. Didn't need that image. Thanks.")

E("WARRIOR", "PALADIN",
    "{name}, how does it feel knowing you can literally never lose?",
    "I CAN lose! Bubble has a cooldown! There are windows of vulnerability!",
    "Windows of vulnerability. 12 seconds. Every 5 minutes. You poor thing.")

E("WARRIOR", "PALADIN",
    "Hey {name}, if the Light is so great, why do you also carry a SWORD?",
    "The sword is a... TOOL of the Light! A conduit for righteous justice!",
    "It's a sharp piece of metal you hit people with. We're the SAME. Just admit it.")

E("WARRIOR", "PALADIN",
    "{name}, real talk. You ever bubble just because you stubbed your toe?",
    "I... the bubble is for EMERGENCIES. Life-threatening— okay ONCE. I bubbled for a bee sting.",
    "A BEE STING. You used DIVINE INTERVENTION for a BEE. I can't breathe.")

E("WARRIOR", "SHAMAN",
    "Hey {name}, do the elements ever say no? Like, 'nah, don't feel like it today'?",
    "The elements always answer! ...eventually. Sometimes I have to ask twice. Or seven times.",
    "So they DO say no. Your whole class is just asking rocks for permission. Amazing.")

E("WARRIOR", "SHAMAN",
    "{name}, Windfury is great and all, but have you tried just HITTING HARDER?",
    "Windfury IS hitting harder! With the WIND! It's elemental force multiplied by—",
    "Hitting harder means hitting harder. Not asking the WIND to help you cheat.")

E("WARRIOR", "PIRATE",
    "{name}, how many ships do you actually OWN?",
    "Own is a strong word! I CAPTAIN... a perception of a ship! The idea of a ship!",
    "So zero. You own zero ships. You're a pirate without a boat. Impressive failure.")

-- ===================== MAGE additional =====================

E("MAGE", "WARRIOR",
    "{name}, I calculated the exact damage you'd take if you stopped moving for 1 second. Want to know?",
    "No. I don't want to know. I NEVER want to know.",
    "3,847. That's a LOT. Maybe consider... dodging? Is that in your vocabulary?")

E("MAGE", "WARRIOR",
    "Hey {name}, what year did you graduate? ...from anything?",
    "Warriors don't GRADUATE. We EARN our place. In COMBAT.",
    "Right. No diploma. Just a sword and a dream. How... rustic.")

E("MAGE", "WARRIOR",
    "{name}, have you ever read a book? Any book?",
    "I read a field manual once! 'How To Sharpen A Sword.' Very informative!",
    "ONE book. About SHARPENING. One day you'll discover there are books WITHOUT pictures.")

E("MAGE", "WARLOCK",
    "Hey {name}, if I'm being honest, your demon smells like sulfur and bad decisions.",
    "That's the SMELL OF POWER. You wouldn't understand. Your magic smells like... libraries.",
    "Libraries smell like KNOWLEDGE. Your demon smells like it sleeps in a volcano. On PURPOSE.")

E("MAGE", "WARLOCK",
    "{name}, purely hypothetical. If your demon rebelled, whose side would the party take?",
    "MY side obviously! I'm a valued team member! ...right? Everyone? ...hello?",
    "The silence is very telling, {name}. Very telling indeed.")

E("MAGE", "WARLOCK",
    "Hey {name}, we both use spellpower. But mine doesn't require selling my SOUL.",
    "I didn't sell my soul! I... rented it out. Temporarily. The terms are fine.",
    "'The terms are fine.' That's what everyone says before the demon lawyers show up.")

E("MAGE", "PRIEST",
    "{name}, I timed your last heal. 2.5 seconds. In that time, I could have cast TWO Frostbolts.",
    "Healing is HARDER than nuking! You point and shoot! I keep everyone ALIVE!",
    "I keep everyone alive too. By killing things BEFORE they hurt people. Proactive healthcare.")

E("MAGE", "PRIEST",
    "Hey {name}, ever consider going Shadow? More damage. Less stress. Think about it.",
    "Shadow is the DARK SIDE of priesthood! I would never— ...how much more damage?",
    "Double. At least. And you'd stop complaining about mana. Just a thought.")

E("MAGE", "ROGUE",
    "{name}, I timed your stealth approach. 14 seconds of sneaking to do what my Fireball does instantly.",
    "My approach is SURGICAL. Your Fireball is a SLEDGEHAMMER.",
    "A sledgehammer that kills from 30 yards. Without crawling. Your 'surgery' is just slow murder.")

E("MAGE", "ROGUE",
    "Hey {name}, question. Can you read? In the dark? Where you always are?",
    "Rogues don't READ. We observe. We calculate. We— yes. I can read in the dark. It's a skill.",
    "Reading in the dark. The ONE academic achievement of the rogue class. I'm almost proud.")

E("MAGE", "HUNTER",
    "{name}, your pet just knocked my staff over. Control your beast or I will. With POLYMORPH.",
    "You wouldn't DARE Polymorph my pet! That's a war crime! An ANIMAL war crime!",
    "It's a sheep. For 20 seconds. They'll be fine. Woolly, but fine.")

E("MAGE", "HUNTER",
    "Hey {name}, serious question. What's the pet's DPS? I need to know if it's pulling its weight.",
    "My pet's DPS is... look, the pet provides UTILITY. Growl! Off-tanking! Moral support!",
    "Moral support isn't a DPS stat, {name}. I checked. It's not in any formula.")

E("MAGE", "DRUID",
    "{name}, you claim to be a caster. But you spend half the fight as a CAT.",
    "I'm a VERSATILE caster! Cats do melee! It's part of the kit!",
    "It's part of the 'can't commit to a role' kit. Pick a lane. Any lane. Please.")

E("MAGE", "PALADIN",
    "Hey {name}, I noticed your spellbook has, what, 6 spells? Mine has 40.",
    "Quality over QUANTITY. Each Judgement carries the weight of the LIGHT.",
    "Six spells. Six. I have more spells on my ACTION BAR than you have in your CAREER.")

E("MAGE", "PALADIN",
    "{name}, I respect the bubble. Intellectually. But do you know what it LOOKS like from outside?",
    "It looks like DIVINE PROTECTION. Majestic. Holy.",
    "It looks like a hamster ball. A golden hamster ball. And you're the hamster.")

E("MAGE", "SHAMAN",
    "{name}, I manipulate fire through arcane equations. You... ask it nicely? That can't be right.",
    "The elements RESPECT shamans! We have a RELATIONSHIP! Fire wants to help me!",
    "Fire is a chemical reaction. It doesn't WANT anything. You're in a relationship with a REACTION.")

E("MAGE", "SHAMAN",
    "Hey {name}, totems or equations — who produces more fire?",
    "Totems! One totem can burn for HOURS! Sustained, natural flame!",
    "My Fireball does 2,000 damage. Your totem does... 30? Per tick? Math wins. Math ALWAYS wins.")

E("MAGE", "PIRATE",
    "{name}, I can teleport to any major city. You... sail? For days?",
    "SAILING is the JOURNEY! Ye don't teleport through a SUNSET!",
    "I'll take instant travel over sunsets. Time is mana, and mana is everything.")

-- ===================== WARLOCK additional =====================

E("WARLOCK", "MAGE",
    "{name}, I drain health, drain mana, drain soul. What do YOU drain?",
    "I drain... the enemy's health bar. With damage. ARCANE damage.",
    "So just damage. How one-dimensional. I drain their ESSENCE. On MULTIPLE levels.")

E("WARLOCK", "MAGE",
    "Hey {name}, my imp says your magic tastes like vanilla. Is... is that normal?",
    "Your imp can TASTE magic?! That's— wait, what does VANILLA mean? Is that bad?",
    "It means you're basic. My imp's words, not mine. ...okay also mine.")

E("WARLOCK", "WARRIOR",
    "{name}, you charge into battle. I send my demon. Which is more strategic?",
    "Charging is VERY strategic! It establishes a—",
    "You run at things screaming. My demon runs at things ON FIRE. We are not the same.")

E("WARLOCK", "WARRIOR",
    "Hey {name}, want to know what REAL power feels like? I can show you. Side effects apply.",
    "What kind of side effects are we talking about?",
    "Mostly demonic whispers, occasional shadow damage, and an urge to Life Tap. Normal stuff.")

E("WARLOCK", "PRIEST",
    "Hey {name}, be honest. You've used Shadow Word: Pain and liked it. Haven't you?",
    "Shadow Word: Pain is a TOOL. I don't ENJOY it. It's strictly professional.",
    "The way you cast it says otherwise. You smiled, {name}. I SAW the smile.")

E("WARLOCK", "PRIEST",
    "{name}, we both use Shadow. I just do it without the guilt. Less stressful.",
    "I feel no GUILT! Shadow is a valid— okay I feel a LITTLE guilt. The Light judges.",
    "The Light judges? My demons APPLAUD. Choose your audience wisely.")

E("WARLOCK", "ROGUE",
    "{name}, you think you're dark? You hide in shadows. I COMMAND them.",
    "Commanding shadows and hiding in them are EQUALLY valid dark approaches.",
    "One of us summons things from the void. The other hides behind a box. 'Equally valid.'")

E("WARLOCK", "ROGUE",
    "Hey {name}, I have Fear. You have Vanish. Both make enemies lose track of you. Mine's more fun.",
    "YOUR Fear sends them running into other packs! Every time! EVERY TIME!",
    "...that's a feature, not a bug. More enemies means more suffering to drain.")

E("WARLOCK", "HUNTER",
    "Hey {name}, my demon is from the Twisting Nether. Your pet is from... a forest?",
    "My pet is a SKILLED hunter companion! Trained! Loyal! Dependable!",
    "Mine is an INTERDIMENSIONAL ENTITY OF DARKNESS. But sure, your cat is nice too.")

E("WARLOCK", "HUNTER",
    "{name}, does your pet love you? Like actually? My demon fears me. It's efficient.",
    "Love and loyalty are the FOUNDATION of the hunter-pet bond!",
    "Fear and contracts are the foundation of mine. I get more consistent results. Just saying.")

E("WARLOCK", "DRUID",
    "Hey {name}, you turn into animals. I summon things from the void. Whose shapechange is cooler?",
    "Mine is NATURAL! Yours is literally interdimensional body horror!",
    "Body horror with GREAT DPS. The Nether has good designers.")

E("WARLOCK", "PALADIN",
    "Hey {name}, I notice you keep glaring at my demon. Something you want to say?",
    "Your demon is an AFFRONT to the Light! Every fiber of my being wants to—",
    "To what? Smite it? Go ahead. I'll summon another. I have SPARES.")

E("WARLOCK", "PALADIN",
    "{name}, your Light and my Darkness. Ever wonder what would happen if they touched?",
    "Nothing good. The answer is nothing good. Don't test it.",
    "Too late. My imp poked your aura. It screamed. ...the aura screamed. That's new.")

E("WARLOCK", "SHAMAN",
    "Hey {name}, totems are cute. My demon is less cute but more EFFECTIVE.",
    "Totems provide SUSTAINED area buffs! Your demon provides... anxiety!",
    "My demon provides 200 DPS and existential dread. That's VALUE.")

E("WARLOCK", "PIRATE",
    "{name}, I've communed with things from the deep. The ACTUAL deep. Not the ocean deep.",
    "The ocean deep is PLENTY deep! Krakens! Sea monsters! Giant squid!",
    "My 'deep' has entities that eat krakens for BREAKFAST. Your deep is adorable.")

-- ===================== PRIEST additional =====================

E("PRIEST", "WARRIOR",
    "{name}, I healed you 47 times that last fight. FORTY SEVEN. A thank-you would be nice.",
    "I said thanks! At the beginning!",
    "That was 47 HEALS AGO. I need ongoing gratitude. Per heal. Minimum.")

E("PRIEST", "WARRIOR",
    "Hey {name}, when you Charge into 5 mobs at once, what do you think happens to MY stress level?",
    "I think about victory. The glory of battle. The—",
    "MY stress level, {name}. MY blood pressure. MY rapidly depleting mana bar. Think about ME occasionally.")

E("PRIEST", "WARRIOR",
    "{name}, here's a thought. What if you took LESS damage? As a lifestyle choice?",
    "Taking damage is my JOB. I'm the TANK. That's the ROLE.",
    "Take LESS of it. Not ZERO. Less. Duck OCCASIONALLY. I'm begging.")

E("PRIEST", "MAGE",
    "Hey {name}, you Blinked out of my heal range. AGAIN. Third time. I'm keeping count.",
    "Blink is repositioning! I had to dodge the— it was TACTICAL!",
    "My Greater Heal hit the FLOOR where you WERE. 3 second cast. On the FLOOR. I healed the GROUND.")

E("PRIEST", "MAGE",
    "{name}, you're the squishiest person here. Why do you keep pulling aggro?",
    "Because my DAMAGE is incredible! Top of the meter! Pyroblast CRITS for—",
    "Pyroblast crits for ME having a panic attack. Please stop.")

E("PRIEST", "WARLOCK",
    "Hey {name}, riddle me this. You Life Tap, I heal you, you Life Tap again. Who benefits?",
    "I get mana! Which I use for DPS! Which kills things! Which benefits EVERYONE!",
    "And I lose mana. Healing YOUR self-harm. So you can do MORE self-harm. This is a CYCLE, {name}.")

E("PRIEST", "WARLOCK",
    "{name}, my healing you costs MY mana. Your Life Tapping costs YOUR health. One of us is double-paying.",
    "Think of it as an investment! My DPS scales with mana! More mana, more—",
    "More WORK for me. The investment is ME losing my mind. Every. Single. Pull.")

E("PRIEST", "ROGUE",
    "Hey {name}, I literally cannot see you half the time. Health bar? Gone. Stealth makes you INVISIBLE to heals.",
    "That's the POINT. I don't need heals. I dodge. I parry. I—",
    "You're at 30% right now. Right NOW. I can see THAT. Come closer so I can FIX it.")

E("PRIEST", "ROGUE",
    "{name}, you know what scares me more than any boss? You unstealthing at 20% HP.",
    "I was FINE! I had Evasion! And a health potion!",
    "You were NOT fine. My panic heal was the ONLY thing between you and a corpse run.")

E("PRIEST", "HUNTER",
    "Hey {name}, your pet took a Cleave. I panic-healed IT instead of the TANK. Your pet almost wiped us.",
    "My pet is an important member of this—",
    "Your pet is NOT on my heal priority list! The TANK. Then DPS. Then ME. Then the PET. IF there's mana!")

E("PRIEST", "HUNTER",
    "{name}, stop Feigning Death at 90% health. I panic every time. EVERY time.",
    "It drops aggro! It's preventative! It's PROACTIVE survival!",
    "My HEART stops for a half second every time your bar goes grey. That's not proactive. That's HARASSMENT.")

E("PRIEST", "DRUID",
    "Hey {name}, you HAVE heal spells. I've seen them. In your spellbook. USE them.",
    "I was about to shift! I was GOING to heal! Just... let me finish this combo—",
    "Combo? You're in CAT FORM while the tank is at 15%. COMBO?! SHIFT AND HEAL!")

E("PRIEST", "DRUID",
    "{name}, Innervate me and I will literally never complain about you going cat form again.",
    "That's... a tempting offer. Never complain? Like NEVER never?",
    "NEVER. Cross my heart. One Innervate = eternal silence about your form choices. DEAL?")

E("PRIEST", "PALADIN",
    "Hey {name}, you used Lay on Hands on YOURSELF. When the TANK was dying. YOURSELF.",
    "I panicked! It was a REFLEX! The Light moved through me and—",
    "The Light moved through you and chose YOU? Over the dying tank? Your Light is SELFISH, {name}.")

E("PRIEST", "PALADIN",
    "{name}, you have bubble, BoP, Lay on Hands, AND heals. Why do YOU never die and I always do?",
    "The Light protects those who—",
    "If you say 'protects those who serve' ONE more time while I'm dead on the floor, I WILL spec Shadow.")

E("PRIEST", "SHAMAN",
    "Hey {name}, Chain Heal bounces to 3 targets. My Prayer of Healing heals 5. Discuss.",
    "Chain Heal is SMART! It finds the lowest HP! Your Prayer heals by GROUP slots!",
    "My Prayer heals EVERYONE in the group. Yours bounces and MISSES sometimes. SMART, you say?")

E("PRIEST", "SHAMAN",
    "{name}, if you could drop one permanent totem that healed forever, would you?",
    "That would be... incredible. A totem that never runs out? Healing EVERYTHING?",
    "That's what I am. I AM the permanent healing totem. Standing here. Casting. Forever. OOM.")

E("PRIEST", "PIRATE",
    "Hey {name}, when you drink rum mid-combat, do you KNOW how hard that makes healing?",
    "Rum HELPS! Steadies the nerves! Better aim! ...at what, I'm not sure!",
    "Better aim at DYING. You're at 40% because of the rum. I'm healing your LIFESTYLE CHOICES.")

-- ===================== ROGUE additional =====================

E("ROGUE", "WARRIOR",
    "Hey {name}, I could kill you before you even turned around. Just so you know.",
    "Try it. I DARE you. My plate armor would— ...where did you go?",
    "*whispers from behind* Right here. The whole time. Think about that tonight.")

E("ROGUE", "WARRIOR",
    "{name}, how much do your repairs cost? Ballpark?",
    "A lot. Plate is expensive. Why?",
    "I pay like 20 silver. Leather. Light. Cheap. Different FINANCIAL philosophies.")

E("ROGUE", "MAGE",
    "Hey {name}, Frost Nova roots me in place. IN PLACE. I'm a MELEE class. Think about that.",
    "Frost Nova is area control! I can't help where YOU'RE standing!",
    "I was standing NEXT to the boss! Where I'm SUPPOSED to be! You froze MY FEET to the FLOOR!")

E("ROGUE", "MAGE",
    "{name}, I Sapped that mob. Perfectly. Cleanly. Then your Arcane Explosion broke it.",
    "I didn't see the Sap! There was no warning! It looked like a regular mob!",
    "It was SITTING DOWN. Cross-legged. SLEEPING. How is that not OBVIOUSLY sapped?!")

E("ROGUE", "PRIEST",
    "Hey {name}, if I die in stealth, do you even notice?",
    "I... honestly? Probably not immediately. Your bar just... disappears.",
    "So I'm fighting for my life behind the boss and nobody knows. GREAT. This is FINE.")

E("ROGUE", "HUNTER",
    "{name}, your trap almost hit my Sap target. ALMOST. My heart stopped.",
    "I was setting a backup trap! PRO-ACTIVELY! It was strategic—",
    "It was TERRIFYING. A Freezing Trap two yards from my Sapped mob. I aged a YEAR.")

E("ROGUE", "WARLOCK",
    "Hey {name}, your imp broke my SAP. AGAIN. I am going to PUNT that imp.",
    "The imp fires autonomously! I'm working on a macro to— it's COMPLICATED!",
    "Complicated? Put it on PASSIVE! ONE BUTTON! PASSIVE! I'm BEGGING you!")

E("ROGUE", "WARLOCK",
    "{name}, Fear is useful. But when you Fear something INTO my Sap target? We have a problem.",
    "Fear paths are UNPREDICTABLE! It could go ANYWHERE!",
    "It went to my SAP. Twice. In a ROW. The universe hates me and your Fear is its WEAPON.")

E("ROGUE", "DRUID",
    "Hey {name}, your cat form prowl is cute. But it's not REAL stealth.",
    "It IS real stealth! I'm invisible! Enemies can't see me! It's—",
    "Level 1 mobs detected you. LEVEL ONE. My stealth works on BOSSES. There's a TIER system.")

E("ROGUE", "PALADIN",
    "{name}, you are literally the WORST person to stealth near. You GLOW.",
    "I can't turn off the Light! It's INTERNAL! It's my CALLING!",
    "Your calling is ruining MY stealth. Tell the Light to take the night off occasionally.")

E("ROGUE", "PALADIN",
    "Hey {name}, your Consecration just broke my crowd control. AGAIN.",
    "Consecration is AoE! It goes EVERYWHERE! I can't control the holy—",
    "Stop using AoE when I have things CONTROLLED! The ground is ON FIRE near my SAP TARGET!")

E("ROGUE", "SHAMAN",
    "{name}, your totems have more battlefield presence than I do. I'm... upset about it.",
    "Totems are planted STRATEGICALLY! They cover key zones!",
    "They're STICKS. Sticks have more visibility than me. I've been out-stealthed by STICKS.")

E("ROGUE", "PIRATE",
    "Hey {name}, we're both thieves. But I have CLASS. You have... a hat.",
    "The hat IS the class! A good hat makes the pirate! Style MATTERS!",
    "Style matters? You smell like fish and rum. That's not style. That's a WARNING SIGN.")

-- ===================== HUNTER additional =====================

E("HUNTER", "WARRIOR",
    "{name}, I have a pet that tanks AND does damage. You just take hits. Ever feel redundant?",
    "Your PET is not a tank! It's a glorified speed bump with fur!",
    "My 'speed bump' has aggro right now. And you don't. So... who's tanking?")

E("HUNTER", "WARRIOR",
    "Hey {name}, I once kited a boss for 40 yards. Can plate armor DO that?",
    "Kiting isn't fighting! It's RUNNING. Backwards. While shooting. That's—",
    "Strategic repositioning with sustained DPS. While you were dead. On the floor.")

E("HUNTER", "MAGE",
    "{name}, I outrange your spells. Did you know that? My max range EXCEEDS yours.",
    "By FIVE yards! It's negligible! It doesn't—",
    "Five yards of 'not getting hit.' Five SAFE yards. I'll take five yards of ALIVE, thanks.")

E("HUNTER", "MAGE",
    "Hey {name}, my pet does more consistent damage than your crits. Discuss.",
    "My CRITS are EXPLOSIVE! One Pyroblast crit does more than your pet's entire—",
    "And then you pull aggro and die. My pet's 80 DPS is STEADY. And ALIVE.")

E("HUNTER", "PRIEST",
    "{name}, can you heal me AND my pet? Simultaneously? Two targets? Is that possible?",
    "I can heal ONE of you. At a time. And the HUMAN takes priority.",
    "That's speciesism. My pet is a valued— fine. Heal me first. But THEN the pet.")

E("HUNTER", "WARLOCK",
    "Hey {name}, pet fight. My cat versus your imp. Right now. Let's go.",
    "My imp would INCINERATE your cat! It shoots FIRE! From its HANDS!",
    "My cat ate a fireball last week and DIDN'T EVEN FLINCH. Pet fight. Name the time.")

E("HUNTER", "WARLOCK",
    "{name}, I trained my pet with love and treats. How did YOU get your demon?",
    "Ritual. Blood sacrifice. Dark incantation under a void moon.",
    "...I used a BISCUIT. A biscuit and patience. We are VERY different people.")

E("HUNTER", "DRUID",
    "Hey {name}, you're in cat form but you're not MY cat. Stop confusing my pet.",
    "I'm a DRUID! In an animal FORM! Not an actual—",
    "My pet is trying to GROOM you. Sit STILL. You brought this on yourself.")

E("HUNTER", "DRUID",
    "{name}, bear question. When you're in bear form, do you THINK like a bear?",
    "No! I think like a DRUID in bear form! The intelligence remains!",
    "Then why did you try to eat a fish off the ground last pull? You PICKED IT UP. With your MOUTH.")

E("HUNTER", "PALADIN",
    "Hey {name}, you outlived me. Again. Even my PET died before you. How.",
    "Divine Shield. Optimal timing. Faith in the—",
    "Faith in the button that makes you INVINCIBLE. I have faith in that button too.")

E("HUNTER", "ROGUE",
    "{name}, I put a Hunter's Mark on you during stealth. On ACCIDENT. Sorry.",
    "You MARKED me?! Everyone can SEE me now! The arrow is pointing AT MY HEAD!",
    "It was an accident! ...a funny accident. The big glowing arrow was... it was pretty funny actually.")

E("HUNTER", "SHAMAN",
    "Hey {name}, Windfury on my pet. Did you see that? FOUR HITS. The pet did FOUR HITS.",
    "That's what Windfury DOES! It's not special just because a PET—",
    "My pet just out-DPSed half the group with one proc. PUT WINDFURY BACK. KEEP IT THERE.")

E("HUNTER", "PIRATE",
    "{name}, my pet doesn't need a ship. My pet SWIMS. Free maritime travel.",
    "Swimming isn't SAILING! There's no GLORY in dog-paddling!",
    "My pet dog-paddled past your imaginary ship. Lapped it twice. Free of charge.")

-- ===================== DRUID additional =====================

E("DRUID", "WARRIOR",
    "{name}, I can tank, heal, AND DPS. What do YOU do besides get hit?",
    "I get hit PROFESSIONALLY. It's called TANKING. It's a SPECIALTY.",
    "A specialty I can do. In bear form. While ALSO being able to heal afterward. Hybrid supremacy.")

E("DRUID", "WARRIOR",
    "Hey {name}, when I go bear, I have more armor than you. That's concerning, right?",
    "Bear armor is FAKE armor! It's FUR! Mine is PLATE! FORGED BY—",
    "My 'fake armor' mitigated more damage than your plate last pull. Check the logs.")

E("DRUID", "MAGE",
    "Hey {name}, I can Entangling Roots things too. Like your Frost Nova but with PLANTS.",
    "Frost Nova is INSTANT. Your roots are a CAST TIME. In what world—",
    "In the world where my roots last 30 seconds and yours last 8. PATIENCE defeats speed.")

E("DRUID", "PRIEST",
    "{name}, I have Rejuvenation AND Regrowth. TWO HoTs. You have Renew. ONE HoT. Math.",
    "I have Prayer of Healing! Shield! Flash Heal! The toolkit is BROADER!",
    "Broader but no Innervate. I have Innervate. The ULTIMATE healer tool. And I'm NOT sharing.")

E("DRUID", "ROGUE",
    "{name}, I have a battle rez. If you die in stealth, I can BRING YOU BACK.",
    "If I die in stealth, something went VERY wrong. But... good to know.",
    "It went wrong LAST PULL. When you died. In stealth. And I rezzed you. You're WELCOME.")

E("DRUID", "WARLOCK",
    "Hey {name}, your demon and my cat form had a moment. Should I be worried?",
    "My demon doesn't have 'moments.' It has tactical assessments. ...what kind of moment?",
    "It purred at me. Your DEMON. PURRED. While I was in cat form. I need an ADULT.")

E("DRUID", "HUNTER",
    "{name}, serious offer. Want me to go cat form and pretend to be your second pet?",
    "That's... tempting. Can you Growl? Like on command?",
    "I was KIDDING. I'm a DRUID. With feelings. Not a— actually, how much extra loot do I get?")

E("DRUID", "PALADIN",
    "Hey {name}, hybrid-to-hybrid. Who's the better hybrid? No Light bias.",
    "Me. Obviously. Plate armor, immunity, AND heals.",
    "I have FOUR FORMS. Four! You have one form with a glow filter. Versatility WINS.")

E("DRUID", "SHAMAN",
    "{name}, nature class solidarity. We should form a union. Against the arcane users.",
    "A nature union? With totems AND shapeshifting? We'd be unstoppable!",
    "We'd have the best meetings. In a forest. With totems. And possibly a bear. I'll bring berries.")

E("DRUID", "PIRATE",
    "Hey {name}, I can turn into a sea lion. That makes me a BETTER pirate than you.",
    "BLASPHEMY! A sea lion is NOT a pirate! It doesn't have a HAT!",
    "I'll wear a hat. In sea lion form. A tiny hat. Then I'm a pirate. With SWIMMING.")

-- ===================== PALADIN additional =====================

E("PALADIN", "WARRIOR",
    "{name}, you rage. I pray. Both get results. Mine come with less yelling.",
    "Yelling IS the result! The rage fuels the—",
    "The rage fuels your repair bill. Prayer fuels my invulnerability. Different investments.")

E("PALADIN", "WARRIOR",
    "Hey {name}, ever tried NOT getting angry? As a strategy?",
    "NOT getting angry? That's— MY CLASS IS BASED ON ANGER! RAGE IS MY RESOURCE!",
    "And there it is. You can't even DISCUSS calm without getting angry. I rest my case.")

E("PALADIN", "MAGE",
    "{name}, I wear plate, cast spells, AND heal. You just cast spells. Must feel... limiting.",
    "LIMITING?! I am a MASTER of arcane arts! The pinnacle of—",
    "A pinnacle that dies in one hit. I'm a pinnacle that bubbles. Different pinnacles.")

E("PALADIN", "WARLOCK",
    "Hey {name}, I prayed for your soul last night. The Light showed me... things.",
    "What THINGS? Good things? Bad things? What did you SEE?",
    "...I'm not at liberty to say. The Light asked me to keep it confidential. It's... it's a lot.")

E("PALADIN", "WARLOCK",
    "{name}, I can cleanse curses AND diseases. Your magic IS a curse. Should I fix you?",
    "I'm not CURSED! This is POWER! Channeled from—",
    "Cleanse! *casts* Feel anything? No? ...the corruption goes DEEPER than I thought.")

E("PALADIN", "PRIEST",
    "Hey {name}, we both serve the Light. But I serve it in PLATE. With a SHIELD.",
    "The Light doesn't measure devotion by ARMOR, {name}.",
    "The Light also doesn't measure devotion by being DEAD ON THE FLOOR. Which you ARE. Again.")

E("PALADIN", "ROGUE",
    "{name}, I glow with divine radiance. You... lurk. Has the Light ever called to you?",
    "The Light called once. I let it go to voicemail. Not my vibe.",
    "You DECLINED the Light?! That's— ...that's the most rogue response possible. I grudgingly respect it.")

E("PALADIN", "HUNTER",
    "Hey {name}, I blessed your pet with Might. It hit 20% harder. You should thank the Light.",
    "My pet was FINE without your blessing! It didn't need—",
    "It's critting now. The Light's Might on your pet is CRITTING. You were SAYING?")

E("PALADIN", "DRUID",
    "{name}, fellow hybrid. But let's be real. Only ONE of us can bubble.",
    "And only one of us can turn into a BIRD. And FLY AWAY.",
    "...okay that's a good point. But can your bird become INVINCIBLE? No. Point: paladin.")

E("PALADIN", "SHAMAN",
    "Hey {name}, my aura versus your totems. Permanent glow versus floor sticks. Thoughts?",
    "Floor sticks with ELEMENTAL POWER! Wind, fire, earth, water!",
    "My ONE aura provides more than your FOUR sticks. Quality over quantity. THE LIGHT WINS.")

E("PALADIN", "PIRATE",
    "{name}, the Light judges no one. But it's LOOKING at you with concern.",
    "Tell the Light I'm FINE! Me liver is fine! Me morals are... flexible but FINE!",
    "Flexible morals. The Light is writing that down. It has a LIST, {name}.")

-- ===================== SHAMAN additional =====================

E("SHAMAN", "WARRIOR",
    "{name}, without Windfury you'd hit like a wet noodle. Just acknowledge that.",
    "I hit hard WITHOUT Windfury! Windfury is just... a bonus! A very large bonus!",
    "Your 'bonus' doubled your damage. DOUBLED. You're WELCOME, by the way.")

E("SHAMAN", "WARRIOR",
    "Hey {name}, Strength of Earth Totem is on. You're welcome. Again. As always.",
    "I didn't ask for— okay I noticed the strength buff. It's... helpful.",
    "HELPFUL? It's carrying your stat sheet. Say 'thank you, totems.' Out loud. Do it.")

E("SHAMAN", "MAGE",
    "{name}, you study fire in BOOKS. I sit with fire. We TALK. Different relationships.",
    "You TALK to fire?! Fire is a CHEMICAL REACTION! It doesn't—",
    "My fire says your fire is lonely. Because you treat it like a FORMULA instead of a FRIEND.")

E("SHAMAN", "MAGE",
    "Hey {name}, I threw a Lightning Bolt. You threw a Frostbolt. Let's compare notes.",
    "Frostbolt slows! It has utility AND damage! Lightning Bolt just—",
    "Mine was instant because of a proc. Yours took 2.5 seconds. I was done. Before you STARTED.")

E("SHAMAN", "PRIEST",
    "{name}, I dropped Mana Spring Totem. You're welcome. That's free mana. FROM A STICK.",
    "I appreciate the totem! Really! It helps!",
    "It helps because you'd be OOM without my stick. Remember that. The stick. Is carrying you.")

E("SHAMAN", "WARLOCK",
    "Hey {name}, my totems are like your demons but less terrifying. And less argumentative.",
    "My demons don't ARGUE! They— okay the Voidwalker grumbles. Sometimes. A lot actually.",
    "My totem of fire doesn't grumble. It just burns. Quietly. Reliably. BETTER employee.")

E("SHAMAN", "ROGUE",
    "{name}, you keep running out of totem range! The wind doesn't CHASE you! Stay NEAR the sticks!",
    "I go where the BACKSTAB goes! The boss turned! I had to reposition!",
    "Reposition NEAR THE TOTEMS! I placed them specifically! My totem placement is ART and you're IGNORING it!")

E("SHAMAN", "HUNTER",
    "Hey {name}, your pet stood on my totem. It BROKE. I had to recast. You owe me a GCD.",
    "Pets walk! They have LEGS! I can't control every PAW placement!",
    "One GCD. Every time the pet breaks a totem. That's OUR agreement now. Starting NOW.")

E("SHAMAN", "DRUID",
    "{name}, you talk to trees. I talk to rocks. Which is weirder?",
    "Neither! Both are NATURE! Both are valid spiritual—",
    "Talking to ROCKS is weirder. I know. I do it daily. The rocks judge me. But they still help.")

E("SHAMAN", "PALADIN",
    "Hey {name}, I have Reincarnation. You have Bubble. Both cheat death. Which is more impressive?",
    "Bubble PREVENTS death! I don't even EXPERIENCE it! Much more elegant!",
    "I DIE and COME BACK. That's metal. You hide in a ball. That's... hamster behavior.")

E("SHAMAN", "PIRATE",
    "{name}, I control the ocean. The LITERAL ocean. How does that make you feel as a sailor?",
    "Makes me feel like you should BE ON ME CREW! Chief water officer! FIRST MATE!",
    "I'm nobody's first mate. But I'll calm the seas. For a price. Three gold and a fish. DEAL.")

-- ===================== PIRATE additional =====================

E("PIRATE", "WARRIOR",
    "{name}! Arm wrestle me! Now! Loser buys the rum!",
    "You're ON. I've never lost an arm wrestle in my— OW. That's... that's a strong grip.",
    "PIRATES GRIP ROPE all day! Ye never stood a CHANCE! Now buy me RUM!")

E("PIRATE", "WARRIOR",
    "Hey {name}! Yer sword is nice but have ye tried a CUTLASS? Curved! ELEGANT!",
    "A cutlass is a ROGUE weapon. I use a REAL sword. Two-handed. SERIOUS.",
    "Serious is BORING! A cutlass has FLAIR! Ye can't swashbuckle with a broadsword!")

E("PIRATE", "MAGE",
    "{name}! Can ye magic the barnacles off me boots? PRACTICAL magic! Not fireworks!",
    "I am an arcane scholar, not a BOOT CLEANER. Use a knife like everyone else.",
    "SCHOLARS! Always too FANCY to help with BARNACLES! What good IS magic then?!")

E("PIRATE", "PRIEST",
    "Hey {name}! I confess me sins! I stole THREE things today! Possibly FOUR if ye count the ham!",
    "I'm not that kind of priest! I don't DO confessions! I HEAL WOUNDS!",
    "Healin' wounds IS confession! Every scar tells a STORY! Listen to the SCARS, {name}!")

E("PIRATE", "ROGUE",
    "{name}! Race! First one to pickpocket that mob wins! Pirate versus rogue! CLASSIC matchup!",
    "That's not a race, that's a CRIME. And I'd win WITHOUT racing.",
    "HA! Admit it! Ye WANT to compete! The pirate spirit is IN ye! EMBRACE IT!")

E("PIRATE", "WARLOCK",
    "Hey {name}! If yer demon could swim, I'd hire it as a deck hand! CAN it swim?",
    "My demon doesn't do MANUAL LABOR. It does DARK MAGIC.",
    "Dark magic won't swab the POOP DECK! I need WORKERS not WIZARDS!")

E("PIRATE", "HUNTER",
    "{name}! Yer beast! On a SHIP it'd be the ship's MASCOT! Every ship needs a MASCOT!",
    "My pet is a combat companion, not a MASCOT.",
    "MASCOTS FIGHT TOO! Ship's cat caught a rat TWICE its size once! COMBAT MASCOT! Same thing!")

E("PIRATE", "PALADIN",
    "Hey {name}! If the Light could power a SHIP, I'd be the most DEVOUT pirate alive!",
    "The Light doesn't power ships. It powers SOULS. It's SPIRITUAL.",
    "SPIRITUAL don't move CARGO! If yer Light can't fill sails, it's USELESS on the open sea!")

E("PIRATE", "DRUID",
    "{name}! Bear form on a SHIP! Ye could be me SIEGE WEAPON! Catapult launches a BEAR!",
    "I am NOT being launched from a catapult. In any form.",
    "THINK ABOUT IT! A BEAR! Flying through the AIR! Landing on the enemy SHIP! TERRIFYING!")

E("PIRATE", "SHAMAN",
    "Hey {name}! Calm the seas! Summon wind! Make it RAIN! Ye're a WEATHER PIRATE!",
    "I'm not a 'weather pirate.' I'm a shaman. The elements aren't parlor tricks.",
    "WEATHER. PIRATE. Best job on any crew! I'll pay ye in DOUBLOONS! Real ones! ...copper ones!")

E("PIRATE", "PIRATE",
    "{name}! A fellow PIRATE?! What ship are ye from?! What's yer flag?!",
    "The same imaginary ship as YE, probably! We're in a DUNGEON!",
    "A dungeon is just a LANDLOCKED SHIP! The walls are the HULL! The boss is the KRAKEN! YARR!")

--=========================================================================
--  E X P A N D E D   M I S M A T C H   T H R E A D S
--  More class-mismatch callouts — multiple per matchup
--=========================================================================

-- Additional MAGE mismatches
M("WARRIOR", "MAGE",
    "{name}, if you're a mage, conjure bread. Right now. I'm hungry and I'll prove a point.",
    "I'm... gluten-free. Mage-free bread. It's a new—",
    "You CAN'T conjure because you're NOT A MAGE. Eat this vendor bread and accept yourself.")

M("ROGUE", "MAGE",
    "Hey {name}, 'mage.' Quick. What school is Fireball? Arcane? Fire? Frost? TICK TOCK.",
    "It's... OBVIOUSLY... the fire school. Because fire. BALL. Fire. Ball.",
    "Lucky guess. Now what's the coefficient of spell power scaling on rank 12? ...silence. Thought so.")

M("HUNTER", "MAGE",
    "{name}, even my PET knows you're not a mage. It's growling at your 'arcane aura.'",
    "Your pet doesn't understand MAGIC! It's an ANIMAL!",
    "An animal that can detect LIES. It's growling because you're FAKING. Good boy, pet.")

M("DRUID", "MAGE",
    "Hey {name}, I'm in tune with nature. Nature tells me you're NOT magical. At all.",
    "Nature doesn't know EVERYTHING! Arcane energy exists OUTSIDE nature!",
    "Yeah, and so does your mage credential. Outside reality. Where your mage-ness lives. NOWHERE.")

-- Additional WARRIOR mismatches
M("WARLOCK", "WARRIOR",
    "{name}, real warriors have rage. You have... what? Mild irritation?",
    "I have TREMENDOUS rage! Just... internally! Very subtle rage!",
    "Subtle rage isn't rage. That's just being grumpy. Warriors are NEVER subtle.")

M("HUNTER", "WARRIOR",
    "Hey {name}, warriors charge into melee. You're standing behind me. At RANGE. Warrior?",
    "I'm a RANGED warrior! It's a new spec! Very modern!",
    "There is no ranged warrior spec. You're a hunter who lost their bow. And their pet. And their dignity.")

M("DRUID", "WARRIOR",
    "{name}, I can BE a warrior. In bear. You can't even BE what you CLAIM to be. Think about that.",
    "I didn't CLAIM anything! I just... selected the option! In the menu!",
    "The menu gives you OPTIONS. It doesn't give you PLATE ARMOR. Or MUSCLES. Or a SHIELD.")

M("SHAMAN", "WARRIOR",
    "Hey {name}, the earth element says your muscles are fake. I'm just the messenger.",
    "My muscles are REAL! I train! I lift!",
    "You lifted a CONJURED MUFFIN earlier. The earth saw. The earth judges.")

-- Additional WARLOCK mismatches
M("WARRIOR", "WARLOCK",
    "Hey {name}, warlocks are supposed to be CREEPY. You're about as creepy as a muffin.",
    "I'm VERY creepy! I have dark energy! I commune with—",
    "You communed with a CAMPFIRE last night and called it 'summoning practice.' MUFFIN.")

M("ROGUE", "WARLOCK",
    "{name}, real warlocks have dark auras. You have a regular aura. A boring aura. BEIGE.",
    "My aura is VERY dark! You just can't see it because—",
    "Because it's not there. You're a non-warlock with a beige aura claiming to talk to demons. Nice try.")

M("SHAMAN", "WARLOCK",
    "Hey {name}, the fire element says you're not channeling dark magic. It would KNOW.",
    "Your fire element is WRONG! I channel the darkest—",
    "Fire knows fire. Shadow knows shadow. And YOU know neither. The elements have SPOKEN.")

-- Additional PRIEST mismatches
M("WARLOCK", "PRIEST",
    "{name}, I've been around dark magic. Your 'Light' has the energy of a night light. Dim.",
    "My Light is RADIANT! It's just... energy-efficient right now!",
    "Energy-efficient Light. That's the most non-priest thing I've ever heard. Just admit it.")

M("HUNTER", "PRIEST",
    "Hey {name}, my pet got hurt. Heal it. YOU claim to be a priest. PROVE IT.",
    "I... the connection to the Light takes... concentration and—",
    "You can't heal a scratch on a cat. The Light is confused. The Light doesn't know you, {name}.")

M("PALADIN", "PRIEST",
    "{name}, I channel the Light professionally. Whatever you're doing... isn't that. Not even close.",
    "I'm channeling the Light in my OWN way! Alternative Light healing!",
    "Alternative Light? That's called a LANTERN, {name}. You're holding a LANTERN.")

M("SHAMAN", "PRIEST",
    "Hey {name}, the water element heals. I know what healing energy feels like. You don't have it.",
    "Healing energy comes in many FORMS! Mine is just... quieter!",
    "Quiet healing isn't a thing. Healing is LOUD. Green numbers. EVERYWHERE. You have ZERO green numbers.")

-- Additional ROGUE mismatches  
M("WARLOCK", "ROGUE",
    "{name}, real rogues have dagger energy. You have... spoon energy. Soft spoon energy.",
    "I am SHARP and DANGEROUS! I lurk! I SKULK! I do ROGUE things!",
    "You walked into a door earlier. While 'skulking.' The door was OPEN. Master of shadows indeed.")

M("PALADIN", "ROGUE",
    "Hey {name}, the Light shows me all truths. The truth is: you're no rogue. You're LOUD.",
    "LOUD?! I am WHISPER-QUIET! My footsteps are SILENT!",
    "You just YELLED 'I am whisper-quiet.' That is the opposite of what a rogue would do.")

M("SHAMAN", "ROGUE",
    "{name}, the wind carries sound. It heard you 'sneaking.' It was NOT impressed.",
    "I was sneaking PERFECTLY! The wind is just NOSY!",
    "The wind said you stepped on three twigs, kicked a rock, and WHISTLED. While 'sneaking.'")

-- Additional HUNTER mismatches
M("WARRIOR", "HUNTER",
    "{name}, where's your bow? Hunters have BOWS. You have... empty hands. And sad eyes.",
    "I'm a... hand-to-hand hunter! Melee beast master!",
    "That's called being UNARMED. In a dungeon. Making choices. BAD choices.")

M("WARLOCK", "HUNTER",
    "Hey {name}, hunters tame beasts. Where's yours? I'll wait. My demon is STARING.",
    "My beast is... out there. Roaming. FREE RANGE. Very independent—",
    "So you have no pet. You're a petless hunter. That's just a person. With a hat. Standing there.")

M("PRIEST", "HUNTER",
    "{name}, the Light reveals you have NO nature bond. Zero. You're as much a hunter as I am.",
    "I have a DEEP bond with nature! I... I like trees! And birds! I watch birds!",
    "Watching birds is called being a person. Controlling them is a hunter thing. You. Are. WATCHING.")

-- Additional PALADIN mismatches
M("ROGUE", "PALADIN",
    "Hey {name}, paladins glow. You don't glow. Not even a LITTLE shimmer. I checked.",
    "My glow is INTERNAL! Deep inside! The Light is—",
    "The Light is embarrassed, is what it is. A paladin with no glow. The Light GHOSTED you.")

M("DRUID", "PALADIN",
    "{name}, nature can sense the Light. There is NO Light coming from you. Sorry, friend.",
    "The Light is shy! It manifests differently in—",
    "Lay on Hands. Right now. On me. Full heal. Go. ...nothing happened. I'm shocked. SHOCKED.")

M("HUNTER", "PALADIN",
    "Hey {name}, even my pet respects REAL paladins. It's growling at you. That's... telling.",
    "The pet doesn't understand the Light! Animals can't sense—",
    "Animals sense EVERYTHING. And right now, my beast senses FRAUD. Good instincts.")

-- Additional DRUID mismatches
M("WARRIOR", "DRUID",
    "{name}, druids SHAPESHIFT. It's the whole deal. Shift into something. Right now. Anything.",
    "I'm shifting INSIDE. Internal shifting. You just can't SEE it. Very subtle—",
    "You're standing there. As a person. Not shifted. This is the WORST druid cosplay I've ever seen.")

M("WARLOCK", "DRUID",
    "Hey {name}, my demon sensed your 'nature energy.' It laughed. It LAUGHED, {name}.",
    "Nature energy is REAL! It flows through all living—",
    "The demon says your nature energy is roughly equivalent to a houseplant. A SMALL houseplant.")

M("PALADIN", "DRUID",
    "{name}, druids commune with nature. I commune with the Light. I sense... nothing natural about you.",
    "I'm very natural! I recycle! I eat organic berries!",
    "Eating berries doesn't make you a DRUID. It makes you a PERSON. Who eats BERRIES.")

-- Additional SHAMAN mismatches
M("WARRIOR", "SHAMAN",
    "{name}, drop a totem. Any totem. Prove you're a shaman. I'll wait right here.",
    "Totems need... proper elemental alignment! The conditions aren't RIGHT!",
    "The conditions. In a DUNGEON. Aren't right. For sticks. On the ground. Sure.")

M("MAGE", "SHAMAN",
    "Hey {name}, shamans use Lightning Bolt. It's electric. Very dramatic. Show me one.",
    "Lightning takes... preparation! You can't just DEMAND lightning!",
    "Actually, you can. If you're a shaman. Which you're not. Because there's no lightning.")

M("WARLOCK", "SHAMAN",
    "{name}, my demon doesn't sense any elemental bond from you. Zero. Empty. Void of elements.",
    "The elements bond on THEIR schedule! Not your demon's!",
    "The elements aren't on ANY schedule with you. They ghosted you harder than the paladin's Light.")

M("ROGUE", "SHAMAN",
    "Hey {name}, shamans put sticks on the ground. I've been watching. NO sticks. Zero sticks.",
    "My totems are SPIRITUAL! They exist on a plane you can't—",
    "A plane I can't see? That's called IMAGINARY. Real totems are physical. WOOD. On the GROUND. Make one.")

-- Additional PIRATE mismatches
M("HUNTER", "PIRATE",
    "{name}, pirate? Where's your ship? Your parrot? Your... anything nautical?",
    "The SPIRIT of piracy lives in me HEART! Ye don't NEED props!",
    "Every pirate needs SOMETHING. You have a class you didn't pick and zero boats. Maritime failure.")

M("WARLOCK", "PIRATE",
    "Hey {name}, I've been to the Twisting Nether. It's scarier than any ocean. 'Pirate' is cute.",
    "The OCEAN is plenty scary! Ye ever seen a STORM at sea?! WAVES the size of—",
    "I've seen BEINGS that eat storms. Your ocean is a PUDDLE. Your pirate identity is ADORABLE.")

M("DRUID", "PIRATE",
    "{name}, 'pirate.' Nature doesn't acknowledge that as a... anything.",
    "NATURE loves pirates! The SEA is nature! Wind! Waves! Dolphins!",
    "Dolphins are druids who made better choices. You're a person with a hat PRETENDING.")

M("PALADIN", "PIRATE",
    "Hey {name}, the Light has many callings. 'Pirate' is not one of them. Not even remotely.",
    "The Light shines on ALL! Even pirates! ESPECIALLY pirates! We need it MOST!",
    "You DEFINITELY need it most. The Light is sending a search party for your moral compass, {name}.")

--=========================================================================
--  B O N U S   R O U N D — Topic-based universal threads
--  Food, gear, loot, who-would-win, philosophy, lifestyle
--=========================================================================

-- FOOD & DRINK DEBATES
E("WARRIOR", "MAGE",
    "Hey {name}, conjure food is free but tastes like cardboard. Change my mind.",
    "It's MAGICALLY conjured sustenance! It's nutritionally PERFECT!",
    "Nutritionally perfect cardboard. I'll take the expensive cheese from the vendor, thanks.")

E("MAGE", "WARLOCK",
    "{name}, I brought conjured water. You brought... a Healthstone. We eating rocks in this group?",
    "A Healthstone is CONCENTRATED lifeforce! It heals INSTANTLY!",
    "It's a green ROCK. You made us eat a green ROCK. My water at least LOOKS like water.")

E("HUNTER", "ROGUE",
    "Hey {name}, you ate my pet's food. MY PET'S food. Do you know what's IN pet food?",
    "I was HUNGRY! It smelled fine! ...what's in it?",
    "Boar intestines and fish eyes. You ate fish eyes. On PURPOSE. How do you feel?")

E("DRUID", "WARRIOR",
    "{name}, I forage for berries. Sustainable. Organic. What do you eat?",
    "Meat. Whatever I can cook over a fire. Sometimes raw if I'm in a hurry.",
    "RAW meat. During a dungeon. You're chewing raw boar flank right now. I can HEAR it.")

E("PALADIN", "ROGUE",
    "Hey {name}, I brought blessed bread. Light-infused. Heals body AND soul.",
    "Your bread GLOWS. Food shouldn't GLOW. That's a RED FLAG.",
    "It glows with HOLINESS. Your rations smell like they've been in your pocket for a WEEK.")

E("PRIEST", "SHAMAN",
    "{name}, you put fish in the campfire WHOLE. With the head. Looking at me. WHY.",
    "That's how you cook fish! The eyes add FLAVOR! Ancestral recipe!",
    "The eyes are NOT adding flavor. They're adding TRAUMA. I'm having nightmares about fish eyes.")

E("PIRATE", "MAGE",
    "Hey {name}! Yer conjured food! Can ye make RUM?! Magic RUM?! Infinite supply?!",
    "I can conjure water. Not rum. Rum requires FERMENTATION, not magic.",
    "USELESS! What's the POINT of magic if ye can't make rum?! RETHINK YER PRIORITIES!")

E("WARLOCK", "PALADIN",
    "{name}, my demon ate your blessed bread. It's... it's not doing well.",
    "Blessed bread PURIFIES! The demon is being CLEANSED!",
    "It's not being cleansed. It's making a noise I've never heard before. I'm concerned.")

E("SHAMAN", "HUNTER",
    "Hey {name}, your pet just ate the fish I was going to sacrifice to the water spirit.",
    "Pets eat fish! That's what they DO! I can't train it to avoid SPECIFIC fish!",
    "That was a BLESSED fish. The water spirit is ANGRY. At your pet. At ME. At EVERYONE now.")

E("ROGUE", "DRUID",
    "{name}, you keep eating berries off random bushes. How are you alive?",
    "I can identify edible plants! DRUIDS know which berries are safe!",
    "You ate a RED berry and turned green for 10 minutes. That wasn't 'safe.' That was POISON.")

-- LOOT & GEAR ARGUMENTS
E("WARRIOR", "PALADIN",
    "Hey {name}, we BOTH need that plate drop. But I need it MORE. My gear is terrible.",
    "Your gear being terrible is a YOU problem. The Light says ROLL FAIR.",
    "The Light says roll fair?! THE LIGHT HAS NEVER HAD TO WEAR GREEN SHOULDERS AT LEVEL 60!")

E("ROGUE", "HUNTER",
    "{name}, you rolled Need on a DAGGER. A DAGGER. You're a HUNTER.",
    "Hunters use melee weapons! It's a stat stick! For our ranged—",
    "It has +agility and +hit. For STABBING. That I do. As a ROGUE. Give it BACK.")

E("MAGE", "WARLOCK",
    "Hey {name}, that cloth drop has +intellect. I'm a caster. You're a... life-tapping self-harmer.",
    "Intellect gives me MORE health to Life Tap! It's the same stat! For DIFFERENT reasons!",
    "You want intellect so you can hurt yourself MORE efficiently. I want it to do my JOB. DIFFERENT.")

E("DRUID", "PRIEST",
    "{name}, I rolled on healing gear. Yes, I'm in cat form. YES, I can still heal. Don't LOOK at me like that.",
    "You're literally covered in BLOOD from clawing things. You want the healing RING?",
    "I can do BOTH! That's the whole POINT of being a druid! The ring looks great on a PAW!")

E("HUNTER", "WARRIOR",
    "Hey {name}, that bow dropped. It's MINE. Don't even LOOK at it.",
    "I wasn't looking at—",
    "YOU LOOKED! I saw your eyes! That's a hunter bow! MINE! Roll and I'll have my pet SIT on you!")

E("SHAMAN", "PALADIN",
    "{name}, both healers. One drop. ROCK PAPER SCISSORS. Right now.",
    "The Light doesn't approve of gambling! I'll just... roll Need. Fairly.",
    "Rock paper scissors ISN'T gambling! It's ELEMENTAL COMBAT! Rock! Earth! MINE!")

E("PIRATE", "ROGUE",
    "Hey {name}! That ring has pirate energy! GOLD ring! PIRATE ring!",
    "Rings don't have 'pirate energy.' They have STATS. And I need the agility.",
    "Ye can't put AGILITY on a PIRATE FINGER! The ring belongs on a SWASHBUCKLING hand! MINE!")

-- WHO WOULD WIN
E("WARRIOR", "ROGUE",
    "Hey {name}, one-on-one. Open field. No stealth. I win every time.",
    "WITHOUT stealth? That's like asking a fish to fight without water.",
    "So you ADMIT you can't fight face-to-face. NOTED. The warrior WINS. By default. RECORD BOOKS.")

E("MAGE", "PRIEST",
    "{name}, PvP. You versus me. Who wins?",
    "I'd heal through your damage. Eventually you'd go OOM. I'd outlast you.",
    "I'd Polymorph you, have LUNCH, come back, and Pyroblast you. 'Outlast' requires being AWAKE.")

E("WARLOCK", "HUNTER",
    "Hey {name}, my Felhunter versus your cat. Level playing field. Who wins?",
    "My cat has LOYALTY. And TEETH. And the heart of a—",
    "My Felhunter eats MAGIC and excretes NIGHTMARES. Your cat eats biscuits. Calculate those odds.")

E("PALADIN", "SHAMAN",
    "{name}, one-on-one duel. No drinking. No totems. Pure skill.",
    "Without TOTEMS?! That's my entire— fine! I have Lightning Bolt!",
    "And I have BUBBLE. I literally cannot die for 12 seconds. Your Lightning is CUTE during those 12 seconds.")

E("DRUID", "MAGE",
    "Hey {name}, I can heal, root, DOT, AND shapeshift mid-fight. What can YOU do about a bear charging you?",
    "Polymorph. The answer is always Polymorph. Enjoy being a sheep.",
    "Druids can shift OUT of Poly! Sheep for 0.1 seconds! Then BEAR! Then you're FLAT!")

E("ROGUE", "WARLOCK",
    "{name}, if I Ambush you from stealth, fight's over. Literally. One global.",
    "IF you can get close. Through my Voidwalker. Past my Curse of Agony. Over my Fear.",
    "I'll be BEHIND you. Your Fear doesn't work on people you can't SEE. I'm ALREADY there.")

E("HUNTER", "PALADIN",
    "Hey {name}, Viper Sting. All your mana. Gone. You're a warrior without rage. What now?",
    "I have MELEE. And PLATE. I walk at you. And AUTO-ATTACK. That's always an option.",
    "An option that does 30 DPS while I kite you across the continent. Fun for ME.")

E("SHAMAN", "DRUID",
    "{name}, Purge removes your HoTs. ALL of them. One button. All your healing. Gone.",
    "I'll just recast them! I have Swiftmend! And Nature's Swiftness!",
    "And I'll Purge those too. I have INFINITE Purges. You have FINITE mana. Math says I WIN.")

-- PHILOSOPHICAL DEBATES
E("PRIEST", "WARLOCK",
    "Hey {name}, where does the power go when you die? Back to the demon? Into the void?",
    "Bold of you to assume I'll die. The power goes wherever I TELL it to go.",
    "Deep deflection. Classic warlock. The void is calling, {name}. Eventually you'll have to pick up.")

E("PALADIN", "DRUID",
    "{name}, is the Light part of nature? Or is nature part of the Light? Think carefully.",
    "Nature existed BEFORE the Light! Trees! Animals! The WORLD!",
    "The Light existed before EVERYTHING. Before worlds. Before trees. Before your precious BERRIES.")

E("MAGE", "SHAMAN",
    "Hey {name}, if magic and elements come from the same source, are we the same class?",
    "ABSOLUTELY NOT! Elements are ALIVE! Your arcane is MATHEMATICAL!",
    "So you're saying the difference between us is that I'm smarter and your source material TALKS BACK?")

E("WARRIOR", "PRIEST",
    "{name}, what happens when you heal? Like, WHERE does the health come from?",
    "The Light mends torn tissue, restores vital essence, rejuvenates—",
    "But WHERE does it come from? Is there a health SUPPLY? Can it run OUT? Should I be WORRIED?")

E("ROGUE", "MAGE",
    "Hey {name}, do you dream in spells? Like, Fireballs in your sleep?",
    "That's... actually happened. Once. I woke up and my pillow was singed.",
    "You SET YOUR BED ON FIRE. With a DREAM. How do you even have INSURANCE?")

E("DRUID", "WARLOCK",
    "{name}, serious question. If your demon has free will, isn't it just... slavery? With extra steps?",
    "It's a BINDING. A CONTRACT. A mutually— ...okay when you put it that way it sounds bad.",
    "Nature binds NOTHING. Everything participates willingly. Think about that. Voluntarily.")

E("SHAMAN", "WARRIOR",
    "Hey {name}, do you ever wonder if the sword WANTS to be swung? If it has feelings?",
    "It's a SWORD. It's METAL. Swords don't have—",
    "The earth element says all metal remembers the mountain it came from. Your sword misses HOME, {name}.")

E("HUNTER", "PRIEST",
    "{name}, my pet senses your stress. It's nudging you. That means you need to relax.",
    "I am FINE! I'm not stressed! The mana bar is— okay the pet nudge is actually nice.",
    "Pets know. They always know. Just accept the nudge. Breathe. The next pull can wait 5 seconds.")

-- DARE & CHALLENGE THREADS
E("WARRIOR", "DRUID",
    "Hey {name}, dare you to tank the next pull. In bear. Right now. Switch.",
    "I'm not SPECCED to tank! My gear is— okay I have some dodge gear somewhere—",
    "TOO LATE. Already pulled. Bear. NOW. GO GO GO!")

E("ROGUE", "HUNTER",
    "{name}, bet you can't land a ranged shot with your eyes closed. I can Backstab blind.",
    "With my eyes CLOSED?! That's irresponsible! There are PARTY MEMBERS in front of me!",
    "I said BET. Not DO IT. ...but you COULD if you wanted to. Right? ...RIGHT?")

E("MAGE", "WARLOCK",
    "Hey {name}, dare you to Life Tap from 5% health. Full courage. Total commitment.",
    "That's SUICIDE! I'd be at 1%! One sneeze from a mob—",
    "Exactly. TOTAL commitment. Unless you're scared of your OWN spell? ...are you?")

E("PALADIN", "WARRIOR",
    "{name}, dare you to fight the next boss without Berserker Rage. Pure calm.",
    "WITHOUT Berserker— I NEED that! Fear immunity! The boss FEARS! I can't—",
    "So you're DEPENDENT on rage. I rest my case. Calm warrior = dead warrior. Bubble > rage.")

E("SHAMAN", "PRIEST",
    "Hey {name}, dare you to heal the next pull without any HoTs. Direct heals only. Pure reaction.",
    "Without Renew?! That's like fighting with one hand tied— okay fine. I'll do it.",
    "This is going to be EDUCATIONAL. For both of us. ...mostly for the tank. I'm sorry, tank.")

E("DRUID", "PALADIN",
    "{name}, dare you to fight the next pull without bubble. Pretend it doesn't exist.",
    "WITHOUT BUBBLE?! I... I literally forgot what that's like. It's been YEARS.",
    "Welcome to how the REST of us live. Scared. MORTAL. It builds CHARACTER.")

E("PIRATE", "WARRIOR",
    "Hey {name}! DARE ye to fight the next boss DUAL-WIELDING! Two swords! PIRATE STYLE!",
    "Dual-wielding reduces my hit chance! It's suboptimal! My rotation—",
    "ROTATION?! PIRATES don't have ROTATIONS! We have ENTHUSIASM! Two swords! HIT THINGS!")

E("HUNTER", "DRUID",
    "{name}, dare you to stay in cat form for the entire next pull. No shifting. No healing. CAT.",
    "Full cat? No emergency heals? What if the tank dips to—",
    "CAT. COMMITMENT. If the tank dies, we blame the priest. DEAL. Meow and agree.")

E("WARLOCK", "SHAMAN",
    "Hey {name}, dare you to put down ALL FOUR totems simultaneously. Maximum totem energy.",
    "ALL four? I only need two for this fight! Four is WASTEFUL!",
    "WASTEFUL?! It's MAGNIFICENT! Four sticks! Four elements! DO IT! Totem FOREST!")

-- PARTY ROLE ARGUMENTS
E("PRIEST", "PALADIN",
    "Hey {name}, I'm the healer here. You're the... what exactly? Off-healer? DPS?",
    "I'm EVERYTHING! I heal! I buff! I judge! I'm the SWISS ARMY KNIFE of the party!",
    "A Swiss army knife that mainly auto-attacks while I do all the actual healing. Fun tool though.")

E("WARRIOR", "DRUID",
    "{name}, I'm tanking. MAIN tanking. Don't go bear. Don't even THINK about bear.",
    "I wasn't going to— okay I was THINKING about it. Bear sounds fun. Bear is—",
    "BEAR IS NOT FUN WHEN I'M TANKING! One tank per party! That's the RULE! Stay in cat! CAT!")

E("ROGUE", "MAGE",
    "Hey {name}, I'm interrupt duty. I KICK. Don't counterspell and waste my cooldown.",
    "But Counterspell has RANGE! I don't need to be in melee! It's MORE efficient!",
    "It's MY JOB. I don't take YOUR job. You don't take MINE. Let me KICK in peace.")

E("SHAMAN", "DRUID",
    "{name}, who's healing? Me or you? If we both heal we have zero DPS. If neither heals we're dead.",
    "I'll heal the first pull, you heal the second? Alternating?",
    "ALTERNATING?! That's not a strategy! That's a COIN FLIP! One of us commits! WHICH ONE?!")

E("WARLOCK", "HUNTER",
    "Hey {name}, our pets are fighting each other. SEPARATE THEM. Your pet started it.",
    "MY pet started it?! Your demon HISSED at my cat! In a THREATENING manner!",
    "My demon hisses at EVERYTHING. That's its FACE. Control your beast or I'll Fear it. ACCIDENTALLY.")

E("PALADIN", "PRIEST",
    "{name}, blessing or prayer? I'll buff first, then you buff. COORDINATION.",
    "Why do YOU go first? I've been casting BEFORE you even joined the group!",
    "Fine! Cast SIMULTANEOUSLY! On three! One! Two— you already cast. You just WENT. Communication, {name}!")

-- WEATHER & ENVIRONMENT
E("SHAMAN", "MAGE",
    "Hey {name}, it's raining. I could stop it. Should I? Or is this your Ice Barrier dripping?",
    "My Ice Barrier does NOT drip! It's a crystalline matrix of frozen—",
    "It's dripping. On my totem. My fire totem is going out. MAKE YOUR BARRIER STOP LEAKING.")

E("DRUID", "HUNTER",
    "{name}, the trees are uneasy. Something's coming. I can feel the roots shifting.",
    "So can my pet. It's been growling at that corner for 5 minutes. I trust the pet.",
    "We just agreed with each other using a TREE and a CAT. This is why nature classes are SUPERIOR.")

E("PIRATE", "SHAMAN",
    "Hey {name}! The WIND! Can ye feel it?! That's a NOR'EASTER! We need to TACK STARBOARD!",
    "We're UNDERGROUND. In a cave. There IS no wind. You're feeling the VENTILATION.",
    "VENTILATION IS WIND! Cave wind! STILL dangerous! I'll man the helm! Where's the HELM?!")

E("WARRIOR", "HUNTER",
    "{name}, your pet tracked mud through the entire dungeon. I keep SLIPPING.",
    "Pets have muddy paws! It's NATURE! You can't blame—",
    "I slipped into the boss room. SOLO. Because of PET MUD. I almost DIED TO FOOTPRINTS.")

-- SLEEP & DOWNTIME
E("ROGUE", "WARRIOR",
    "Hey {name}, when you sleep, do you snore? Real question. The noise last camp was INHUMAN.",
    "I don't SNORE. I breathe... powerfully. With warrior LUNGS.",
    "Warrior lungs made my TENT shake. I was in a tent 30 YARDS AWAY. Control your BREATHING.")

E("PRIEST", "WARLOCK",
    "{name}, I tried to sleep near your demon. It WATCHES you sleep. With INTEREST. That's not normal.",
    "The Voidwalker is on GUARD DUTY. Monitoring for threats while—",
    "It's not monitoring. It's STARING. At you. For HOURS. With a look I can only describe as HUNGRY.")

E("MAGE", "DRUID",
    "Hey {name}, you slept in cat form last night. You purred. IN YOUR SLEEP.",
    "Druids process nature dreams! The purring is SPIRITUAL ALIGNMENT!",
    "Spiritual alignment that kept me awake until 3 AM. Purring. Loud, rumbling spiritual purring.")

E("PALADIN", "PIRATE",
    "{name}, you snore AND talk in your sleep. About treasure. Specific coordinates. Should I write them down?",
    "Those coordinates are TOP SECRET! How dare ye listen to me SLEEP PIRACY!",
    "You said '40 paces north of the whale skull.' OUT LOUD. While DROOLING. Not very SECRET.")

--=========================================================================
--  B O N U S   R O U N D  2 — Situational comedy, class envy, rivalries
--=========================================================================

-- CLASS ENVY
E("WARRIOR", "PALADIN",
    "Hey {name}, trade classes. Right now. I want bubble. You can have rage. DEAL?",
    "You want to give up RAGE for BUBBLE? Rage is supposed to be your IDENTITY!",
    "My identity gets me KILLED. Your identity makes you IMMORTAL. I'm not stupid.")

E("PRIEST", "MAGE",
    "{name}, trade Blink for Flash Heal. I want to teleport. You get to keep people alive.",
    "Keep people ALIVE?! That sounds TERRIBLE! I'd rather Blink into traffic!",
    "That's what you DO. You Blink INTO traffic. At least with Flash Heal you could SURVIVE it.")

E("ROGUE", "DRUID",
    "Hey {name}, trade Vanish for Innervate. I vanish FROM problems. You vanish MANA problems.",
    "You want Innervate? But you don't even USE mana!",
    "I'd sell it. To the priest. For GOLD. It's called BUSINESS, {name}. Think BIGGER.")

E("HUNTER", "WARLOCK",
    "{name}, trade pets. Just for a day. I want to see what a Felguard does with a treat.",
    "A TREAT?! You'd offer my Felguard a BISCUIT?! It's a demonic—",
    "I bet it'd love it. Big scary demon. Little treat. WATCH it wag. ...do they wag?")

E("SHAMAN", "WARRIOR",
    "Hey {name}, trade Windfury for Mortal Strike. I want to hit things ONCE and they STAY hit.",
    "Mortal Strike isn't MAGIC! It's just... hitting things. Hard. With expertise.",
    "Exactly. No elemental permission slip. Just SWING. I'm TIRED of asking the wind NICELY.")

E("WARLOCK", "PRIEST",
    "{name}, trade Fear for Psychic Scream. Same spell. Different flavor. Shadow solidarity.",
    "Psychic Scream is HOLY fear! ...no wait. It IS shadow. Why do I have a shadow—",
    "Because you're one bad day from being ME. The conversion is inevitable. Welcome.")

E("DRUID", "SHAMAN",
    "Hey {name}, trade cat form for Ghost Wolf. I want to run fast WITHOUT fur everywhere.",
    "Ghost Wolf doesn't shed! It's SPECTRAL! Best travel form!",
    "My cat form leaves hair on EVERYTHING. The mage found a whisker in his spellbook. MORTIFYING.")

E("PALADIN", "HUNTER",
    "{name}, trade Divine Shield for Feign Death. I want to fake my own death. For FUN.",
    "Feign Death is TACTICAL! Not for FUN! You'd abuse it!",
    "I'd Feign at the start of every fight. Take a nap. Wake up for loot. EFFICIENT.")

E("MAGE", "ROGUE",
    "Hey {name}, trade Blink for Sprint. Yours is more... reliable. Mine teleports me into walls.",
    "INTO walls? You Blink INTO WALLS? How often? Is this a DESIGN flaw?",
    "Twice. Today. I'm embedded in this dungeon's architecture. Sprint sounds NICE and PREDICTABLE.")

E("PIRATE", "PALADIN",
    "{name}! Trade the Light for a SHIP! Ships go PLACES! The Light just... GLOWS!",
    "Ships SINK. The Light is ETERNAL. Worst trade in history.",
    "ETERNAL and BORING! A ship is FREEDOM! Ye can't sail the Light! ...CAN ye?")

-- ABILITY JEALOUSY
E("WARRIOR", "MAGE",
    "Hey {name}, Blink. You literally teleport. I have CHARGE. I run. At things. UPHILL.",
    "Blink has a 15 second cooldown! It's not SPAMMABLE!",
    "15 seconds between TELEPORTS. My legs have a ZERO second cooldown but they only do RUNNING.")

E("ROGUE", "PALADIN",
    "{name}, Blessing of Protection. You can make ANYONE immune to physical damage. That's BROKEN.",
    "BoP prevents attacking too! It's a TRADE-OFF! There are LIMITATIONS!",
    "Yeah, the limitation is that you didn't cast it on ME when I was getting CRUSHED last pull.")

E("HUNTER", "MAGE",
    "Hey {name}, Polymorph. You turn things into SHEEP. I trap them in ICE. Mine is cooler. Literally.",
    "Poly lasts INDEFINITELY! Your trap has a TIMER!",
    "My trap doesn't break from a stiff BREEZE. Your sheep breaks from a SNEEZE. FRAGILE sheep.")

E("WARLOCK", "DRUID",
    "{name}, Innervate restores MANA. For FREE. My Life Tap costs HEALTH. How is that FAIR?",
    "Life Tap is on-demand! Innervate has a 6 minute cooldown!",
    "6 minutes of cooldown versus CONSTANT self-harm. I BLEED for my mana. You get it as a GIFT.")

E("PRIEST", "ROGUE",
    "Hey {name}, Vanish. You DISAPPEAR. Mid-combat. All threat gone. I want that so badly.",
    "You have Fade! It drops aggro! Same thing!",
    "Fade drops aggro for 10 seconds. If I breathe on a mob it comes RIGHT BACK. Vanish is PERMANENT.")

E("SHAMAN", "PALADIN",
    "{name}, Lay on Hands. Full health. ONE BUTTON. My highest heal takes 2.5 seconds for HALF that.",
    "Lay on Hands is once every HOUR. You have CHAIN HEAL! Every few seconds!",
    "I'd rather have one PERFECT heal than a hundred OKAY ones. Your one button outclasses my CAREER.")

E("DRUID", "MAGE",
    "Hey {name}, Conjure Food. You create food from NOTHING. I eat berries off the GROUND.",
    "Ground berries are sustainable! My conjured food disappears after logout!",
    "It disappears because it was MAGIC FOOD. Mine disappears because I ATE DIRT by accident.")

E("PALADIN", "WARLOCK",
    "{name}, Soulstone. You resurrect yourself. AUTOMATICALLY. While dead. That's CHEATING.",
    "It's preparation! Planning! Strategic magical contingency—",
    "It's a get-out-of-death-free card. I bubble to AVOID death. You DIE and come back. That's just BETTER.")

-- MOUNT & TRAVEL
E("PALADIN", "WARLOCK",
    "Hey {name}, we both get free mounts. But MINE glows. And doesn't smell like sulfur.",
    "My Felsteed is FEARSOME! It breathes SHADOW FIRE! It's INTIMIDATING!",
    "My horse is blessed by the LIGHT. Children wave. Your horse makes children CRY.")

E("MAGE", "WARRIOR",
    "{name}, I can TELEPORT to Ironforge. You have to RIDE. For twenty minutes. On a road. Slowly.",
    "The ride is MEDITATIVE! I think about battle strategies! Plan my—",
    "You fall asleep on the mount. I've SEEN it. You fell off near Loch Modan. TWICE.")

E("DRUID", "ROGUE",
    "Hey {name}, travel form. I run 40% faster as a CHEETAH. You have... boots.",
    "I have Sprint! 70% speed! For 15 seconds! MUCH faster!",
    "For 15 seconds. Then you're SLOW again. I'm a cheetah FOREVER. Sustainable cardio.")

E("HUNTER", "MAGE",
    "{name}, Aspect of the Cheetah. 30% speed. All the time. No cooldown. No mana.",
    "One hit and you're DAZED. DAZED! My Blink has no daze penalty!",
    "One hit? What's hitting me at MAX RANGE? Nothing. Because I'm GOOD at my class.")

E("PIRATE", "DRUID",
    "Hey {name}! Sea lion form! That's yer SHIP! Just swim! Ye don't need BOATS!",
    "Sea lion form is for WATER travel. Not open-ocean piracy.",
    "PIRACY IS WATER TRAVEL! With more STABBING! Put on a tiny sea lion HAT and commit!")

E("SHAMAN", "DRUID",
    "{name}, Ghost Wolf versus Travel Form. Both run. Both have four legs. Who's FASTER?",
    "We're the SAME speed. 40% bonus. It's identical!",
    "But Ghost Wolf is SPECTRAL. I run through TALL GRASS. You run OVER it. Stealth advantage: SHAMAN.")

-- MORNING ROUTINE
E("WARRIOR", "MAGE",
    "Hey {name}, what's your morning routine? Mine is push-ups, sword drills, and breakfast.",
    "I meditate on the arcane, study three chapters, and conjure a balanced meal.",
    "So you sit quietly, read, and magic your breakfast. That's not a routine. That's a RETIREMENT.")

E("ROGUE", "PRIEST",
    "{name}, what time do you wake up? I need to know for... scheduling purposes.",
    "Scheduling? Why would a ROGUE need my schedule? That's suspicious.",
    "Not suspicious! I'm planning... a surprise. A good surprise. Stop asking questions.")

E("WARLOCK", "DRUID",
    "Hey {name}, every morning I renew my demon pact. Dark ritual. Blood circle. 20 minutes. You?",
    "I... step outside. And breathe. And maybe hug a tree.",
    "You HUG a TREE. That's your power source. My power source involves SCREAMING. We're different.")

E("PIRATE", "WARRIOR",
    "{name}! My mornin' routine! Wake up! Rum! Sword practice ON the mast! Rum again! Breakfast rum!",
    "That's THREE rums before breakfast. How are you functional?",
    "FUNCTIONAL?! I'm OPTIMAL! Rum is HYDRATION for pirates! It's basically WATER! Pirate water!")

E("PALADIN", "ROGUE",
    "Hey {name}, I pray at dawn. Every day. One hour minimum. Do rogues have morning rituals?",
    "Rogues wake up whenever they want. Check their daggers. Done. 30 seconds.",
    "30 SECONDS. No prayer? No reflection? No spiritual— I'm praying for you EXTRA hard tomorrow.")

E("HUNTER", "SHAMAN",
    "{name}, every morning I feed my pet, clean its fur, and do tracking drills. What do shamans do?",
    "Commune with the elements. Water for clarity. Earth for strength. Wind for—",
    "So you sit on records and listen to wind. My cat and I TRAINED. Physically. With our BODIES.")

-- CAMPFIRE STORIES
E("WARLOCK", "WARRIOR",
    "Hey {name}, want to hear about the time I accidentally opened a portal to the Twisting Nether?",
    "...no. ABSOLUTELY no. I don't want to hear about accidental portals to anywhere.",
    "The imp that came through was only SMALL. And it only set fire to TWO tents. Barely an incident.")

E("PRIEST", "HUNTER",
    "{name}, tell us a hunting story. Something exciting. Dangerous. Make me forget about mana problems.",
    "Once, my pet and I tracked a rare beast for THREE DAYS across Feralas—",
    "Never mind. I remembered mana exists. The story made me anxious about resource management. Continue later.")

E("MAGE", "PALADIN",
    "Hey {name}, in Dalaran we tell stories through illusions. Want me to show the Battle of—",
    "PLEASE no illusions. Last time a mage showed me an 'illusion,' it was a SPIDER. Full size.",
    "That spider was EDUCATIONAL. You screamed for 40 seconds. I counted. Paladins fear NOTHING... except spiders.")

E("DRUID", "ROGUE",
    "{name}, in the Moonglade, we share stories under the stars. What do rogues do for fun?",
    "We... count our gold? Sharpen things? Practice lock-picking on each other's—",
    "That's the saddest answer I've ever heard. Next campfire, you're coming to Moonglade. MANDATORY fun.")

E("SHAMAN", "PIRATE",
    "Hey {name}, the fire spirit says tell YOUR best story. Go.",
    "ONCE! I found a treasure chest! On an island! With a MAP! It had GOLD! Real GOLD!",
    "That story had no conflict, no lesson, and no spiritual growth. The fire spirit rates it... 10 out of 10 actually.")

E("PIRATE", "PRIEST",
    "{name}! Gather 'round! I'll tell ye about the time I outran a KRAKEN! Seven leagues!",
    "KRAKENs aren't real!",
    "NOT REAL?! I'll show ye the SCAR! ...which is on me OTHER body. Me PREVIOUS body. But it was REAL!")

-- FINAL ROUND — Rapid-fire mixed banter

E("WARRIOR", "SHAMAN",
    "Hey {name}, I just noticed your totem is crooked. Does that... affect anything?",
    "CROOKED?! That throws off the ENTIRE elemental resonance! The field is—",
    "I was kidding. But you just sprinted over there to check. THAT was worth it.")

E("MAGE", "DRUID",
    "{name}, Innervate the mage. Innervate the MAGE. Please. I'm at 2% mana. PLEASE.",
    "I already used it on MYSELF. For cat form damage. It's more efficient—",
    "You used INNERVATE for CAT FORM?! A healer class, using Innervate, to CLAW things?!")

E("WARLOCK", "ROGUE",
    "Hey {name}, my Curse of Tongues slows casting. Your poison slows attacks. Team slow?",
    "Team slow? That's... actually brilliant. Slow EVERYTHING. Nothing can move.",
    "We're the crowd control DREAM TEAM. If the enemy can't move OR cast, we just... win. By DEFAULT.")

E("PRIEST", "DRUID",
    "{name}, I'm OOM. You have mana. INNERVATE. This isn't a request. It's TRIAGE.",
    "The tank is fine! The DPS is fine! Why do you need—",
    "Because I'm about to WAND the boss to death! WAND! Is that what you WANT?! INNERVATE!")

E("ROGUE", "SHAMAN",
    "Hey {name}, I Sapped the target. Now drop your totems BEHIND it. BEHIND. Not ON it.",
    "I have to be in RANGE! Totem range is SHORT! I need to get CLOSE—",
    "CLOSE does not mean ON TOP OF IT. You EARTH SHOCKED my SAP target. With a TOTEM. How is that POSSIBLE?!")

E("HUNTER", "PALADIN",
    "{name}, my pet likes you. It keeps sitting at your feet. I think it wants a blessing.",
    "Pets can't receive blessings! The Light doesn't— actually, wait. Does it like Might or Wisdom?",
    "Give it Might. More bite damage. My pet is now BLESSED. I'm going to tell EVERYONE.")

E("DRUID", "WARRIOR",
    "Hey {name}, when I'm in bear form and you're tanking, do the mobs get CONFUSED?",
    "They hit whichever bear-shaped thing is closer. Which is USUALLY me. Because you're BEHIND me.",
    "I'm behind you for... strategic reasons. Support bear. Moral support. From behind. Way behind.")

E("PALADIN", "MAGE",
    "{name}, I have Concentration Aura. You cast 20% faster near me. STAY NEAR ME.",
    "But I need to be at RANGE! I Blink to safety! I reposition—",
    "SAFETY is near the PALADIN. The aura doesn't REACH you at max range. I'm a BUFF, not a DECORATION.")

E("SHAMAN", "WARLOCK",
    "Hey {name}, I put Windfury on your demon. BY ACCIDENT. It's... it's hitting very fast now.",
    "My Felguard with WINDFURY?! Is that even— it just crit FOUR TIMES!",
    "I take it back. I take the Windfury BACK. Your demon is scaring me. It was scary BEFORE but now—")

E("PIRATE", "ROGUE",
    "{name}! The treasure's behind that door! PICK THE LOCK! Now! HURRY! Before the others—",
    "There IS no treasure. It's a SUPPLY CLOSET. With BROOMS in it.",
    "Brooms are WORTH MONEY! Maritime cleaning supplies! PREMIUM goods! Open the DOOR!")

E("WARRIOR", "WARLOCK",
    "Hey {name}, serious question. If you die, does the demon go free? Should we be WORRIED?",
    "The binding holds beyond death! ...probably! In theory! The contract SHOULD—",
    "SHOULD?! The contract SHOULD hold?! So there's a CHANCE a loose demon just— great. Wonderful.")

E("MAGE", "HUNTER",
    "{name}, I calculated your pet's aggro radius. It's pulling things 40 yards away. That's YOUR fault.",
    "Pets have a natural curiosity! They EXPLORE! It's INSTINCT!",
    "Instinct is pulling packs we weren't ready for. LEASH YOUR INSTINCT, {name}.")

E("PRIEST", "PALADIN",
    "Hey {name}, we need to coordinate buffs. I'll do Fortitude, you do Kings. SIMPLE.",
    "I was going to do Wisdom! Then Salvation! Then Might on the—",
    "KINGS. One buff. On everyone. We have 4 other groups to buff. EFFICIENCY, {name}. KINGS!")

M("MAGE", "PIRATE",
    "{name}, 'pirate.' Mages study for YEARS. What's your training? Drinking and stealing?",
    "Pirate trainin' is RIGOROUS! Knot-tying! Navigation! Rum tolerance!",
    "Rum tolerance is not a SKILL. It's a medical concern. You're a class-pretender with liver damage.")

M("PRIEST", "PIRATE",
    "Hey {name}, the Light has shown me many walks of faith. 'Pirate' is just walking sideways.",
    "Sideways is how ye DODGE! On a SHIP! In a STORM! It's BALANCED walking!",
    "You're not on a ship. You're in a dungeon. Walking sideways into a WALL. That I have to HEAL.")

M("ROGUE", "PIRATE",
    "{name}, real pirates I've met have SHIPS. And CREWS. You have... enthusiasm.",
    "ENTHUSIASM IS THE MOST IMPORTANT PART! Ye can't pirate without SPIRIT!",
    "You can't pirate without a BOAT either. Spirit doesn't float, {name}. Neither do you.")

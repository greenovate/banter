-- Banter_Core.lua
-- Scene orchestration: starting scenes, emitting statements & responses.
local _, ns = ...

local core = ns.core

---------------------------------------------------------------------------
-- Class → resource name mapping  (for {resource} token)
---------------------------------------------------------------------------
local CLASS_RESOURCE = {
    WARRIOR = "rage",
    MAGE    = "mana",
    WARLOCK = "mana",
    PRIEST  = "mana",
    ROGUE   = "energy",
    HUNTER  = "mana",
    DRUID   = "mana",
    PALADIN = "mana",
    SHAMAN  = "mana",
}

---------------------------------------------------------------------------
-- Group mode / channel helpers
---------------------------------------------------------------------------
function core.GetGroupMode()
    if IsInRaid()  then return "RAID"  end
    if IsInGroup() then return "PARTY" end
    return "SOLO"
end

--- Returns true inside a battleground or arena (PvP instance).
function core.IsInPvPInstance()
    local _, iType = IsInInstance()
    return iType == "pvp" or iType == "arena"
end

function core.GetOutputChannel()
    local mode = core.GetGroupMode()

    -- Solo is always EMOTE — no configuration
    if mode == "SOLO" then return "EMOTE" end

    -- Read channel from the mode's sub-table
    local modeDB  = (mode == "RAID") and ns.db.raid or ns.db.group
    local channel = modeDB and modeDB.channel or "AUTO"

    if channel == "AUTO" then
        if mode == "RAID"  then return "RAID"  end
        if mode == "PARTY" then return "PARTY" end
        return "SAY"
    end
    return channel
end

---------------------------------------------------------------------------
-- Safe chat output — SAY/YELL require a hardware event when outdoors.
-- PARTY / RAID / GUILD / EMOTE are unrestricted.
-- When the channel is restricted (solo + SAY), display locally instead.
---------------------------------------------------------------------------
function core.SafeSend(text, channel)
    -- Suppress all banter output in BGs/arenas (PvP not yet supported)
    if core.IsInPvPInstance() then
        ns.Debug("SafeSend: blocked (inside PvP instance)")
        return
    end

    -- WoW enforces a 255-character limit on chat messages
    if #text > 255 then
        ns.Debug("SafeSend: blocked (message " .. #text .. " chars, limit 255)")
        return
    end

    if channel == "PARTY" or channel == "RAID" or channel == "GUILD"
       or channel == "RAID_WARNING" or channel == "INSTANCE_CHAT" then
        SendChatMessage(text, channel)
    elseif channel == "EMOTE" then
        SendChatMessage(text, "EMOTE")
    elseif IsInInstance() then
        -- SAY / YELL are allowed inside instances
        SendChatMessage(text, channel)
    else
        -- Outdoors + SAY/YELL = hardware event required; skip silently
        ns.Debug("SafeSend: blocked (SAY/YELL outdoors, no hardware event)")
        return
    end
end

---------------------------------------------------------------------------
-- Context token replacement
-- Base: {dead} {looter} {target} {source} {zone} {class} {spell} {myclass} {resource}
-- Stats: {top_dps} {worst_dps} {top_healer} {most_deaths} {death_count}
--        {puller} {cc_breaker} {fire_king} {interrupter}
---------------------------------------------------------------------------
function core.ReplaceTokens(line, ctx)
    if not ctx then return line end
    local r = line
    local myName = UnitName("player")

    -- Self-aware substitution: if a name token is the player, use "I" instead
    -- ONLY for social banter — utility callouts use actual names for clarity
    local isCallout = ctx._isCallout
    local function selfAware(value, fallback)
        if not value then return fallback or "someone" end
        if isCallout then return value end  -- callouts keep real names
        if value == myName then return "I" end
        return value
    end

    -- Basic context tokens
    r = r:gsub("{dead}",   selfAware(ctx.dead))
    r = r:gsub("{looter}", selfAware(ctx.looter))
    r = r:gsub("{target}", selfAware(ctx.target))
    r = r:gsub("{source}", selfAware(ctx.source))
    r = r:gsub("{zone}",   ctx.zone   or GetRealZoneText() or "here")
    r = r:gsub("{spell}",  ctx.spell  or "something")

    -- CC Callout tokens
    r = r:gsub("{victim}",    selfAware(ctx.victim or ctx.target))
    r = r:gsub("{duration}",  ctx.duration  or "a few seconds")
    r = r:gsub("{dispeller}", selfAware(ctx.dispeller))
    r = r:gsub("{interrupted}", ctx.interrupted or "a spell")

    -- PVP kill tokens
    r = r:gsub("{killed}", selfAware(ctx.killed))
    if ctx.killed_class then
        r = r:gsub("{killed_class}", ctx.killed_class)
    else
        r = r:gsub("%s*{killed_class}%s*", " ")
        r = r:gsub("{killed_class}", "")
    end
    if ctx.killed_level then
        r = r:gsub("{killed_level}", ctx.killed_level)
    else
        r = r:gsub("%s*{killed_level}%s*", " ")
        r = r:gsub("{killed_level}", "")
    end

    -- Player class tokens
    r = r:gsub("{myclass}", ns.playerClass or "adventurer")
    r = r:gsub("{resource}", CLASS_RESOURCE[ns.playerClassKey or "WARRIOR"] or "mana")

    -- Target's class
    if ctx.target then
        local _, cls = UnitClass(ctx.target)
        r = r:gsub("{class}", cls and cls:sub(1,1) .. cls:sub(2):lower() or "adventurer")
    else
        r = r:gsub("{class}", "adventurer")
    end

    -- Stat tokens  (roastMode OR narrative style)
    local useStats = ns.db and (ns.db.roastMode or ns.db.banterStyle == "NARRATIVE")
    if useStats and ns.stats and ns.stats.GetTokens then
        local st = ns.stats.GetTokens()
        for token, value in pairs(st) do
            r = r:gsub("{" .. token .. "}", value)
        end
    else
        -- Strip stat tokens that couldn't be resolved
        r = r:gsub("{top_dps}",     "someone")
        r = r:gsub("{worst_dps}",   "someone")
        r = r:gsub("{top_healer}",  "someone")
        r = r:gsub("{most_deaths}", "someone")
        r = r:gsub("{death_count}", "0")
        r = r:gsub("{puller}",      "someone")
        r = r:gsub("{cc_breaker}",  "someone")
        r = r:gsub("{fire_king}",   "someone")
        r = r:gsub("{interrupter}", "someone")
    end

    -- Grammar fixup when "I" replaced a name (third-person → first-person)
    if r:find("I ") or r:find("I%.") or r:find("I,") then
        -- Object pronoun: "by I" → "by me", "than I" → "than me", etc.
        r = r:gsub(" by I([%s%p])",    " by me%1")
        r = r:gsub(" by I$",          " by me")
        r = r:gsub(" than I([%s%p])",  " than me%1")
        r = r:gsub(" than I$",        " than me")
        r = r:gsub(" from I([%s%p])", " from me%1")
        r = r:gsub(" from I$",       " from me")
        r = r:gsub(" with I([%s%p])", " with me%1")
        r = r:gsub(" with I$",       " with me")
        r = r:gsub(" on I([%s%p])",   " on me%1")
        r = r:gsub(" on I$",         " on me")
        r = r:gsub(" for I([%s%p])",  " for me%1")
        r = r:gsub(" for I$",        " for me")
        r = r:gsub(" to I([%s%p])",   " to me%1")
        r = r:gsub(" to I$",         " to me")
        r = r:gsub(" at I([%s%p])",   " at me%1")
        r = r:gsub(" at I$",         " at me")
        -- Subject-verb agreement
        r = r:gsub("I is ",    "I am ")
        r = r:gsub("I has ",   "I have ")
        r = r:gsub("I was ",   "I was ")   -- already correct
        r = r:gsub("I keeps ", "I keep ")
        r = r:gsub("I dies",   "I die")
        r = r:gsub("I does",   "I do")
        r = r:gsub("I leads",  "I lead")
        r = r:gsub("I takes",  "I take")
        r = r:gsub("I stands", "I stand")
        r = r:gsub("I eats",   "I eat")
        r = r:gsub("I gets",   "I get")
        r = r:gsub("I needs",  "I need")
        r = r:gsub("I goes",   "I go")
    end

    return r
end

---------------------------------------------------------------------------
-- Serialize context → comm-safe string  ("key=val,key2=val2")
---------------------------------------------------------------------------
function core.SerializeContext(ctx)
    if not ctx then return "" end
    local parts = {}
    for k, v in pairs(ctx) do table.insert(parts, k .. "=" .. tostring(v)) end
    return table.concat(parts, ",")
end

---------------------------------------------------------------------------
-- Chattiness modifier — scales trigger chances + frequency
-- Returns a multiplier (0.5 at chattiness=1, 1.0 at 5, 2.0 at 10)
---------------------------------------------------------------------------
function core.GetChattinessMultiplier()
    local ms = ns.settings and ns.settings.GetModeSettings and ns.settings.GetModeSettings() or {}
    local c = ms.chattiness or 5
    -- Linear interpolation: 1→0.5, 5→1.0, 10→2.0
    if c <= 5 then
        return 0.5 + (c - 1) * (0.5 / 4)
    else
        return 1.0 + (c - 5) * (1.0 / 5)
    end
end

---------------------------------------------------------------------------
-- Init  (called from Banter_Triggers ADDON_LOADED)
---------------------------------------------------------------------------
function core.Init()
    -- Cache player class
    local localised, classKey = UnitClass("player")
    ns.playerClass    = localised
    ns.playerClassKey = classKey
    ns.Debug("Player class: " .. (classKey or "?"))

    -- Initialise submodules
    ns.state.Init()
    ns.stats.Init()
    ns.comm.Init()
    ns.promo.Init()

    -- WoW seeds math.random internally; math.randomseed is removed from the sandbox
    ns.settings.CreateOptionsPanel()
    ns.chatFilter.Init()
    ns.button.Init()
    ns.Debug("Core initialised (v" .. ns.version .. ").")
end

---------------------------------------------------------------------------
-- Solo Emote Mode — /me inner monologue when not in a group
-- Zone-aware: picks from zone data when available, persona content otherwise.
-- Dedicated SOLO_AMBIENT trigger for unique solo inner-monologue content.
-- Non-AMBIENT triggers (FLIGHT_PATH, COMBAT_START, etc.) still use persona
-- lines since those are already situation-specific and solo-appropriate.
---------------------------------------------------------------------------

local SOLO_PREFIXES = {
    WARRIOR  = { "mutters:",   "grumbles:",  "grunts:" },
    MAGE     = { "muses:",     "ponders:",   "mutters:" },
    PRIEST   = { "murmurs:",   "sighs:",     "reflects:" },
    ROGUE    = { "thinks:",    "observes:",  "notes:" },
    HUNTER   = { "mutters to their pet:", "glances around:", "sighs:" },
    PALADIN  = { "reflects:",  "murmurs:",   "contemplates:" },
    WARLOCK  = { "mutters darkly:", "hisses:", "chuckles:" },
    SHAMAN   = { "murmurs:",   "senses:",    "communes:" },
    DRUID    = { "muses:",     "sniffs the air:", "reflects:" },
    PIRATE   = { "mutters:",   "growls:",    "grumbles:" },
    NEUTRAL  = { "mutters:",   "thinks:",    "muses:" },
}

--- Solo ambient: try zone-specific content first, then SOLO_AMBIENT persona
--- content. Returns formatted emote line or nil.
local function PickSoloAmbientLine(persona)
    -- Phase 1: Zone-aware line (60% chance when zone data exists)
    local zone = ns.context and ns.context.GetZone() or ""
    if zone ~= "" and math.random() < 0.60 then
        local zoneLine = ns.engagements.PickSoloZoneLine(zone)
        if zoneLine then
            ns.Debug("Solo: zone line for " .. zone)
            return zoneLine, "ZONE"
        end
    end

    -- Phase 2: Dedicated SOLO_AMBIENT persona content
    local soloStatement = ns.scenes.PickStatement(persona, "SOLO_AMBIENT")
    if soloStatement then
        ns.Debug("Solo: SOLO_AMBIENT for " .. persona)
        return soloStatement.line, "SOLO_AMBIENT/" .. soloStatement.rarity
    end

    -- Phase 3: Fallback — AMBIENT persona content (filtered for solo safety)
    local fallback = ns.scenes.PickStatement(persona, "AMBIENT")
    if fallback then
        local line = fallback.line
        -- Quick filter for obviously group-directed language
        local l = " " .. line:lower() .. " "
        local groupWords = { " we ", " we'", " us ", " us.", "pull", "anyone", " group", " crew ", " party " }
        for _, pat in ipairs(groupWords) do
            if l:find(pat, 1, true) then
                ns.Debug("Solo: skipped group-dependent fallback line")
                return nil, nil
            end
        end
        return line, "AMBIENT/" .. fallback.rarity
    end

    return nil, nil
end

---------------------------------------------------------------------------
-- Start a new scene  (called by trigger handlers)
---------------------------------------------------------------------------
function core.StartScene(trigger, ctx)
    ctx = ctx or {}

    local isUtilityCallout = (trigger == "CC_CALLOUT" or trigger == "CC_CALLOUT_NODISPEL" or trigger == "INTERRUPT" or trigger == "INTERRUPT_SELF" or trigger == "PLAYER_KILL")

    -- CALLOUTS style: suppress everything except utility callouts (manual button bypasses)
    if ns.db.banterStyle == "CALLOUTS" and not isUtilityCallout and not (ctx and ctx.manualTrigger) then
        ns.Debug("Scene suppressed — CALLOUTS style (utility only)")
        return
    end

    -- PvP instance suppression (BGs / arenas — not yet supported)
    -- Utility callouts (CC / interrupts) are allowed everywhere
    if not isUtilityCallout and core.IsInPvPInstance() then
        ns.Debug("Scene suppressed — inside PvP instance")
        return
    end

    -- Raid-disable check  (utility callouts bypass this)
    if not isUtilityCallout and ns.db.raid and not ns.db.raid.enabled and core.GetGroupMode() == "RAID" then
        ns.Debug("Scene suppressed — banter disabled in raids")
        return
    end

    -- Manual Mode gate — suppress auto-triggers, allow manual button clicks
    -- Utility callouts always fire regardless of manual mode
    if not isUtilityCallout and ns.db.manualMode and not (ctx and ctx.manualTrigger) then
        ns.Debug("Scene suppressed — Manual Mode (use Banter Button)")
        return
    end

    -- Utility callouts: per-trigger cooldown only, no RNG, no global scene gate
    -- Regular banter: full RNG + cooldown check (skip for manual button presses)
    if isUtilityCallout then
        local cd   = ns.triggers.GetTriggerCooldown(trigger)
        local last = ns.triggers.GetLastTriggerTime(trigger)
        if (GetTime() - last) < cd then return end
        ns.triggers.MarkTriggerFired(trigger)
    elseif not (ctx and ctx.manualTrigger) and not ns.triggers.CheckTrigger(trigger) then
        return
    end

    local persona = ns.ResolvePersona()
    local mode    = core.GetGroupMode()

    ---------------------------------------------------------------------------
    -- SOLO PATH — zone-aware ambient, dedicated solo content
    ---------------------------------------------------------------------------
    if mode == "SOLO" and ns.db.soloMode then
        local line, source

        if trigger == "AMBIENT" or trigger == "ZONE_CHANGED" then
            -- Zone-aware + SOLO_AMBIENT + filtered fallback
            line, source = PickSoloAmbientLine(persona)
            if not line then
                ns.Debug("Solo: no suitable ambient line, skipping")
                return
            end
        else
            -- Non-ambient triggers (FLIGHT_PATH, COMBAT_START, MOB_KILL, etc.)
            -- These persona lines are situation-specific and already solo-appropriate
            local statement = ns.scenes.PickStatement(persona, trigger)
            if not statement then
                ns.Debug("Solo: no statement for " .. trigger)
                return
            end
            line   = core.ReplaceTokens(statement.line, ctx)
            source = trigger .. "/" .. statement.rarity
        end

        -- Mark gates
        ns.triggers.MarkSceneStarted()
        ns.triggers.MarkTriggerFired(trigger)

        -- Format as emote with persona prefix
        local prefixes = SOLO_PREFIXES[persona] or SOLO_PREFIXES.WARRIOR
        local prefix   = prefixes[math.random(#prefixes)]
        line = prefix .. ' "' .. line .. '"'

        core.SafeSend(line, "EMOTE")
        ns.Debug("SOLO [" .. (source or trigger) .. "]: " .. line)
        return
    end

    ---------------------------------------------------------------------------
    -- GROUP / RAID PATH — existing scene orchestration
    ---------------------------------------------------------------------------

    -- Narrative mode: swap AMBIENT for COMBAT_RECAP (stat-based commentary)
    if trigger == "AMBIENT" and ns.db.banterStyle == "NARRATIVE" then
        trigger = "COMBAT_RECAP"
    end

    local statement = ns.scenes.PickStatement(persona, trigger)
    if not statement then
        ns.Debug("No statement for " .. trigger .. " (persona: " .. persona .. ")")
        return
    end

    -- Mark gates (utility callouts skip the global scene gate — they use per-trigger only)
    if not isUtilityCallout then
        ns.triggers.MarkSceneStarted()
    end
    ns.triggers.MarkTriggerFired(trigger)

    -- Build & send the line
    local line    = core.ReplaceTokens(statement.line, ctx)
    local channel = core.GetOutputChannel()

    core.SafeSend(line, channel)
    ns.Debug("STMT [" .. trigger .. "/" .. statement.rarity .. "]: " .. line)

    -- Group coordination
    if ns.comm.GetPeerCount() > 0 then
        local ctxStr = core.SerializeContext(ctx)
        ns.comm.SendSceneStart(statement.id, trigger, persona, ctxStr)

        -- Set up scene tracking (we're the initiator)
        ns.comm.activeScene = {
            sceneId       = statement.id,
            trigger       = trigger,
            initiator     = UnitName("player"),
            sourcePersona = persona,
            context       = ctx,
            claims        = {},
            locked        = false,
            responders    = {},
            startTime     = GetTime(),
        }

        -- Auto-lock fallback
        C_Timer.After(3, function()
            if ns.comm.activeScene and not ns.comm.activeScene.locked then
                ns.comm.LockScene()
            end
        end)
    end
end

---------------------------------------------------------------------------
-- Emit a response  (called when approved by SCENE_LOCK)
---------------------------------------------------------------------------
function core.EmitResponse(trigger, ctx, sourcePersona)
    ctx = ctx or {}

    -- CALLOUTS style: only respond to utility callout triggers
    local isUtility = (trigger == "CC_CALLOUT" or trigger == "CC_CALLOUT_NODISPEL" or trigger == "INTERRUPT" or trigger == "PLAYER_KILL")
    if ns.db and ns.db.banterStyle == "CALLOUTS" and not isUtility then return end

    local persona = ns.ResolvePersona()
    local line    = ns.scenes.PickResponse(persona, trigger, sourcePersona)
    if not line then
        ns.Debug("No response for " .. trigger)
        return
    end

    line = core.ReplaceTokens(line, ctx)
    ns.triggers.MarkResponded()

    local channel = core.GetOutputChannel()
    core.SafeSend(line, channel)
    ns.Debug("RESP [" .. trigger .. "]: " .. line)
end

---------------------------------------------------------------------------
-- Engagement system — persona-to-persona directed banter threads
---------------------------------------------------------------------------
local lastEngagement     = 0
local ENGAGE_COOLDOWN_LO = 120   -- min seconds between engagements
local ENGAGE_COOLDOWN_HI = 300   -- max seconds between engagements
local nextEngagementAt   = 0

function core.TryEngagement()
    if not ns.db or not ns.db.enabled then return end
    if not ns.engagements or not ns.engagements.PickEngagement then return end

    -- Engagements are social chatter — suppress in CALLOUTS and NARRATIVE
    if ns.db.banterStyle == "CALLOUTS" or ns.db.banterStyle == "NARRATIVE" then return end

    -- Only the leader initiates engagements to prevent duplicates
    if not ns.comm.AmLeader() then return end

    -- Not during an active scene or engagement
    if ns.comm.activeScene and (GetTime() - (ns.comm.activeScene.startTime or 0)) < 20 then return end
    if ns.comm.activeEngagement and (GetTime() - (ns.comm.activeEngagement.startTime or 0)) < 20 then return end

    -- Cooldown check with chattiness scaling
    local now = GetTime()
    if now < nextEngagementAt then return end

    -- PvP instance suppression
    if core.IsInPvPInstance() then return end

    -- Raid-disable check
    if ns.db.raid and not ns.db.raid.enabled and core.GetGroupMode() == "RAID" then return end

    -- Need at least one peer
    if ns.comm.GetPeerCount() < 1 then return end

    -- Roll the dice — engagement is rarer than normal banter
    local mult = core.GetChattinessMultiplier()
    if math.random() > (0.25 * mult) then
        nextEngagementAt = now + ns.RandBetween(30, 60)
        return
    end

    -- Pick an engagement thread
    local threadKey, targetName = ns.engagements.PickEngagement()
    if not threadKey or not targetName then
        nextEngagementAt = now + ns.RandBetween(30, 60)
        return
    end

    -- Snapshot the thread NOW (for topics, GetThread picks random from arrays)
    local thread = ns.engagements.GetThread(threadKey)
    if not thread or not thread.opener then return end

    -- Send the opener line
    local opener = thread.opener:gsub("{name}", targetName)
    local channel = core.GetOutputChannel()
    core.SafeSend(opener, channel)
    ns.Debug("ENGAGE OPENER [" .. threadKey .. " -> " .. targetName .. "]: " .. opener)

    -- Track the engagement
    ns.comm.activeEngagement = {
        threadKey = threadKey,
        target    = targetName,
        initiator = UnitName("player"),
        startTime = GetTime(),
    }

    -- Notify the target to reply
    ns.comm.SendEngageStart(threadKey, targetName)

    -- Set cooldown for next engagement
    local lo = ENGAGE_COOLDOWN_LO / mult
    local hi = ENGAGE_COOLDOWN_HI / mult
    nextEngagementAt = now + ns.RandBetween(lo, hi)
    lastEngagement   = now
end

---------------------------------------------------------------------------
-- Engagement ticker — piggyback on an OnUpdate frame
---------------------------------------------------------------------------
local engageFrame = CreateFrame("Frame")
local engageElapsed = 0
engageFrame:SetScript("OnUpdate", function(_, dt)
    engageElapsed = engageElapsed + dt
    if engageElapsed < 15 then return end   -- check every 15 seconds
    engageElapsed = 0

    if not ns.initialized then return end
    if not IsInGroup() then return end

    core.TryEngagement()
end)

---------------------------------------------------------------------------
-- Style Ribbing — SOCIAL persona teases CALLOUTS peer about being quiet
-- Fires ~every 5 minutes when a SOCIAL user detects a CALLOUTS peer.
-- The CALLOUTS user gets a special bypass to fire back a comeback.
---------------------------------------------------------------------------

local STYLE_RIB_COOLDOWN = 300   -- 5 minutes between ribbing attempts
local lastStyleRib       = 0

-- Lines the SOCIAL user says about the quiet CALLOUTS peer
local QUIET_TEASE = {
    WARRIOR = {
        "Hey {name}, you still alive? Say somethin'! I need to know who's covering my flanks!",
        "{name} hasn't yelled in five minutes. That's suspicious. VERY suspicious.",
        "I've fought training dummies more talkative than {name} today.",
        "{name}! ONE word. Just ONE. I need confirmation you're not AFK.",
        "You know what bothers me more than dying? {name} not reacting to ANYTHING.",
        "{name}, I can't tell if you're focused or frozen. Wiggle something.",
        "I'm starting to think {name} is just an elaborate scarecrow.",
        "Every second {name} is quiet I get MORE nervous. Not less. MORE.",
        "There are brick walls with more personality than {name} right now.",
        "{name}! I swear if you're alt-tabbed reading auction house prices I will FIND you.",
        "I've been hit in the head seventeen times and I'm STILL more responsive than {name}.",
        "{name}'s silence makes me want to start a fight just to hear SOMETHING.",
    },
    MAGE = {
        "Interesting. {name} hasn't spoken in quite some time. Running low on intelligence, perhaps?",
        "The silence from {name} is statistically anomalous. Either focused or unconscious.",
        "{name}, a word? Any word? I'll even accept a grunt. Standards are flexible today.",
        "I've had more stimulating conversations with my own Mirror Images than {name} today.",
        "Data point: {name} has been silent for an extended period. Hypothesis: they forgot how talking works.",
        "I once polymorphed someone who was more talkative than {name}. The SHEEP was more talkative.",
        "{name}'s silence is approaching academic-paper-worthy duration. I'm taking notes.",
        "Perhaps {name} is conducting a social experiment. The results are making everyone uncomfortable.",
        "I could conjure food, water, or a personality for {name}. Two of those are within my power.",
        "Fun fact: sound travels at 340 meters per second. {name}'s words travel at zero.",
        "{name} is giving strong 'I selected the wrong talent spec and I'm too proud to admit it' energy.",
        "I've read longer eulogies than {name}'s total conversational output today.",
    },
    WARLOCK = {
        "{name} is being suspiciously quiet. The quiet ones are always the most dangerous. Or the most boring.",
        "My demons talk more than {name}. And they're contractually obligated to be silent.",
        "{name}. Still there? The void stares back but at least it RESPONDS.",
        "I was going to sacrifice {name}'s will to chat but they clearly don't have one.",
        "Even my Voidwalker checks in occasionally. {name}, are you less social than a VOID entity?",
        "{name}'s soul burns dimmer every minute they don't speak. Just an observation.",
        "The silence from {name} is concerning. Not morally. Operationally.",
        "I've summoned demons with more warmth and personality than {name} today.",
        "{name} could be replaced with a Soulstone and nobody would notice the difference.",
        "I asked my Imp about {name}'s silence. He said 'even I respond when you talk to me.' He's right.",
        "My Succubus has broken more silences than {name} has today. Through screaming, but still.",
        "I can see {name}'s soul. It's quiet too. The whole operation is silent over there.",
    },
    PRIEST = {
        "{name}, you OK? You haven't needed a heal OR complained in five minutes. I'm concerned.",
        "The Light reaches out to {name} but {name} has their do-not-disturb on, apparently.",
        "{name} is so quiet I almost forgot to NOT heal them. Almost.",
        "I've seen corpses more chatty than {name} today. And I KNOW corpses.",
        "Prayer works both ways, {name}. You have to actually SEND one occasionally.",
        "{name}'s silence is giving me anxiety, which costs mana, which costs YOUR health bar.",
        "I have a Resurrection spell but I can't resurrect a conversation {name} never started.",
        "The Light sees all. Right now it sees {name} doing absolutely nothing social.",
        "{name}, blink twice if you can hear me. Actually, say ANYTHING. I'm running diagnostics.",
        "I once healed {name} through a boss fight. You'd think that buys a 'thanks.' Or a word. Any word.",
        "Confession is good for the soul, {name}. And yours is OVERDUE.",
        "My Power Word: Shield protects from damage. I wish I had Power Word: Make {name} Talk.",
    },
    ROGUE = {
        "{name}. Radio silence for five minutes. Either masterful discipline or you fell asleep.",
        "I respect the quiet. But {name} is taking it to operational extremes.",
        "{name}, status report? One word. Even 'alive' would suffice.",
        "I've had louder stakeouts than {name}'s conversational output today.",
        "Operational silence is doctrine. {name} has turned it into a religion.",
        "{name} is so off-grid I'm checking if they're on my faction.",
        "I can stalk targets for hours without speaking. {name} is making ME look chatty.",
        "Even dead drops leave more communication than {name} manages.",
        "If {name}'s keyboard broke they should send a signal. Literally any signal.",
        "{name} makes Vanish look loud. That's... concerning.",
        "I've intercepted more communication from ENEMY operatives than I've gotten from {name}.",
        "Debriefing {name} is going to be three seconds of silence and a shrug.",
    },
    HUNTER = {
        "Hey {name}, my pet has said more than you today. And he doesn't TALK.",
        "{name} is quieter than a cat in stealth. My pet noticed. He's worried.",
        "Even my pet looks at {name} funny when it's this quiet. Just saying.",
        "{name}, you there? My pet wants to know. He gets anxious about silent people.",
        "I once tracked a rabbit more expressive than {name}. The rabbit at least TWITCHED.",
        "My pet keeps looking at {name} and then back at me. I think he's asking if they're OK.",
        "{name}'s silence is spooking my pet. He thinks it's a predator thing. VERY stressful.",
        "I Feign Death more often than {name} speaks. And Feign Death is MY thing.",
        "Even my pet's pet has opinions. {name}, do YOU have opinions?",
        "I taught my pet to sit, stay, and speak. {name}, you're worse at all three.",
        "{name} is quieter than the tracking dummy I use for target practice. The dummy CREAKS.",
        "My pet just whimpered at {name}. Either concern or pity. Both are valid.",
    },
    DRUID = {
        "{name}, you OK? Even the TREES have whispered more than you today.",
        "Nature speaks in many forms. {name} has chosen... none of them?",
        "I shifted through three forms waiting for {name} to say something. Anything.",
        "{name}'s silence is... unnatural. And I know unnatural. I turn into a bear.",
        "I went Cat Form, Bear Form, and Moonkin Form. None of them got {name} to react.",
        "The wind in the branches says more than {name}. Literally. It says 'sshhh.' That's MORE.",
        "Even my Tree of Life form communicates through healing. {name} communicates through... existing?",
        "{name} is photosynthesizing, not participating. Big difference.",
        "I asked the forest about {name}'s silence. The forest said 'even WE rustle.'",
        "Mushrooms react more to stimuli than {name}. I've studied mushrooms. This is accurate.",
        "{name}, Nature demands balance. You've been quiet for so long the TREES are overcompensating.",
        "I've had more engaging conversations with Thorns damage than with {name} today.",
    },
    PALADIN = {
        "{name}, the Light compels you to... say something? Anything? It's getting weird.",
        "Even my Divine Shield can't protect me from this awkward silence from {name}.",
        "The Light illuminates all but {name}'s conversation skills remain... dim.",
        "{name}, I'm not judging the silence. Actually, Judgement is what I DO. Speak up.",
        "I have Blessing of Wisdom, Blessing of Kings, and Blessing of Patience — for {name}, I need all three.",
        "My Hammer of Justice stuns for 6 seconds. {name} has been stunned for 300.",
        "The scripture says 'speak and ye shall be heard.' {name} has not. Read. The scripture.",
        "I Consecrated the ground. Still more exciting than anything {name} has contributed.",
        "{name}'s silence weighs heavier than my plate armor. AND I'M WEARING FULL PLATE.",
        "Even the Spirit Healer talks more than {name}. 'Do you wish to return?' See? ENGAGEMENT.",
        "I used Lay on Hands once for a moment less dire than {name}'s silence.",
        "{name}'s commitment to silence is the most devout thing I've witnessed. And I worship the LIGHT.",
    },
    SHAMAN = {
        "All four elements are wondering why {name} is so quiet. Even Earth, and Earth never asks questions.",
        "{name}, Wind wants to carry your words. But Wind needs words FIRST.",
        "My totems hum louder than {name} speaks. And my totems are wooden sticks.",
        "{name}? The spirits say hello. They also say you're being 'concerningly mute.'",
        "I dropped a Tremor Totem. For me. Because {name}'s silence is THAT unsettling.",
        "Fire is loud. Water is loud. Wind is loud. Even Earth rumbles. {name}? Nothing.",
        "The elements are debating an intervention for {name}. Fire wants to scorch them. For their own good.",
        "My Searing Totem has burned through more conversation starters than {name} today.",
        "Lightning Bolt makes a sound on impact. {name} makes no sound on anything.",
        "{name}'s silence is disrupting the elemental balance. That is NOT an exaggeration. Probably.",
        "I could Bloodlust the group and {name} would STILL not say anything. I guarantee it.",
        "Wind asked me to apologize on {name}'s behalf for the silence. Wind is EMBARRASSED.",
    },
    PIRATE = {
        "Oi, {name}! Ye be quieter than a ghost ship in fog! SPEAK UP!",
        "{name} hasn't said a word since port. Even me parrot's concerned!",
        "I've sailed with quieter crews but they were all DEAD. {name}, prove ye ain't!",
        "Arr, {name}! A pirate crew COMMUNICATES! Even if it's just swearing!",
        "{name}! In me old crew, silence meant ye were plottin' mutiny. ARE ye plottin' mutiny?!",
        "I once sailed solo for three weeks and STILL talked more than {name} has today!",
        "Even barnacles make more noise than {name}. They scrape! It's somethin'!",
        "{name}'s lips be sealed tighter than me rum barrels. And I take me rum SERIOUSLY.",
        "Ye know what we do with quiet sailors on me ship? NOTHING! Because they're BORING!",
        "I've heard more from Davy Jones's LOCKER than from {name} this whole run!",
        "Me wooden leg creaks more than {name} speaks. At least me leg is TRYING!",
        "{name}, if ye're dead just SAY so! Wait... well, SIGNAL something!",
    },
}

-- Lines the CALLOUTS user responds with when teased about being quiet
local LOUD_COMEBACK = {
    WARRIOR = {
        "SOME OF US ARE BUSY FIGHTING. Talk less, hit more.",
        "Every word outta my mouth is a swing I didn't take. YOU'RE WELCOME.",
        "You want a speech or you want things DEAD? Pick one.",
        "I communicate through VIOLENCE. It's more efficient.",
        "Silence means I'm too busy KILLING things to narrate it for you.",
        "My sword talks plenty. Ask the mobs.",
        "If I wanted to chat I'd join a book club. I joined a FIGHT.",
        "You talk. I swing. One of us is useful.",
        "Words don't generate rage. HITTING generates rage. Focus.",
        "I'll talk when there's nothing left to hit. So... never.",
        "Talking burns zero rage. That's a design flaw I refuse to participate in.",
        "The last person who wanted me to chat more got an Execute. Just saying.",
    },
    MAGE = {
        "Silence is the sound of competent play. You should try it sometime.",
        "I'm focusing. Complex arcane calculations. You wouldn't understand. Or survive.",
        "Some of us express ourselves through not dying. Revolutionary concept.",
        "I speak when I have something intelligent to say. Hence the silence around YOU.",
        "Every syllable I waste on you is mana I could have turned into a Pyroblast.",
        "I could explain but you'd need three semesters of Arcane Theory. We don't have time.",
        "My silence IS my contribution. You're welcome for the efficiency.",
        "When the Arcane speaks through me, you'll hear it. Until then, patience.",
        "I'm not quiet. I'm CALCULATING. There's a difference you'll never understand.",
        "Would you interrupt a surgeon mid-operation? No? Then stop interrupting a MAGE.",
        "Talk is free. Arcane Intellect costs mana. I know where my resources go.",
        "I've said everything worth saying. The rest would just lower the group's collective IQ.",
    },
    WARLOCK = {
        "I'm communing with the void. The void doesn't appreciate interruptions. Neither do I.",
        "Every word you speak feeds something dark. I'd recommend silence. For your sake.",
        "I talk when souls need harvesting. Yours is safe. For now.",
        "The quiet is me being professional. You should be concerned when I START talking.",
        "My last conversation partner is now a Soulstone. I'm doing you a favor.",
        "I'm listening to frequencies you can't hear. Demon frequencies. They're unanimous: shut up.",
        "I'd explain but the explanation involves tentacles and existential dread.",
        "Silence keeps the demons calm. You're WELCOME.",
        "The void is speaking. It says you talk too much. I agree with the void.",
        "I could talk, or I could maintain the seventeen contracts keeping my demons leashed. Your call.",
        "When I talk, things die. The silence is MERCY.",
        "My Voidwalker doesn't chat and he's my most reliable ally. Coincidence?",
    },
    PRIEST = {
        "I'm HEALING. Talking costs mana I could spend keeping YOU alive. Priorities.",
        "You want conversation or hit points? Because I can't do both and you're at 60%.",
        "Some of us are focused on the fifteen health bars dropping. You know. HEALING.",
        "I speak plenty. I just do it INTERNALLY. Mostly complaints about you.",
        "Every GCD I waste responding to you is a heal someone didn't get. Feel guilty yet?",
        "I'm one bad pull away from going Shadow. Don't push me.",
        "Triage rule: heal first, talk never. I didn't make the rules. Actually I did. Leave me alone.",
        "My mana bar says I talk when the group stops standing in fire. So: never.",
        "Renew. Shield. Flash Heal. Prayer. Notice how NONE of those are 'Chat.'",
        "I could explain my silence but explaining costs 2 seconds, which is one dead DPS.",
        "The Light doesn't require commentary. It requires THROUGHPUT.",
        "You want a chatty healer or a healer who keeps you ALIVE? I've made my choice.",
    },
    ROGUE = {
        "Stealth is a lifestyle. Shut it.",
        "The mission doesn't require commentary. It requires results.",
        "I speak when there's intel worth sharing. There hasn't been.",
        "Noise is a liability. You're the biggest liability here.",
        "My mouth doesn't generate combo points. Not useful.",
        "There's nothing to report. That's a GOOD thing. Learn the difference.",
        "The less I say, the less they can use against me in the debriefing.",
        "Operational silence exists for a reason. Several reasons. All classified.",
        "If talking dealt damage I'd consider it. It doesn't. Case closed.",
        "I only break silence for critical intel. 'Hello' isn't critical intel.",
        "Silence is my second weapon. My first one is sharper but this one's quieter.",
        "When I talk, people die. When I'm quiet, the RIGHT people die. You want quiet.",
    },
    HUNTER = {
        "My pet and I communicate with LOOKS. We don't need words. He gets it.",
        "I'm watching the field. Someone has to. My pet agrees. He nodded.",
        "Talking distracts from tracking targets. And my pet's emotional needs.",
        "My pet says I'm quiet because I'm FOCUSED. He also says you're loud.",
        "Talking scares prey. You're scaring EVERYTHING. Including my pet.",
        "I said plenty to my pet five minutes ago. He's a better listener than you.",
        "Just because my pet can't talk back doesn't mean our bond lacks communication.",
        "I Feigned Death socially. And it WORKED until you started talking.",
        "My Aspect of the Quiet. You wouldn't understand. It's a hunter thing.",
        "I'm tracking. When I track, I listen. When I listen, I don't TALK.",
        "My pet said if I shut up he'd love me more. I trust my pet.",
        "Talking mid-combat is how you miss the marked target. I don't miss.",
    },
    DRUID = {
        "Nature is loudest when it's silent. I'm... being nature.",
        "I was in the wrong form for talking. Now I'm in the wrong form for caring.",
        "The trees don't talk every five minutes and THEY'RE doing fine.",
        "I'm quiet because every form I shift into has better things to do.",
        "Bear Form doesn't talk. Cat Form doesn't talk. Moonkin Form... also no.",
        "I have four forms. None of them are 'chatty socialite form.' Working as intended.",
        "Nature's wisdom is silence. Or growling. Depends on the form.",
        "I'm LISTENING to the forest. It's saying you talk too much. Big agree.",
        "If talking healed the group I'd talk. It doesn't. Rejuvenation does.",
        "I shifted into Tree of Life form just to stand here quietly. On purpose.",
        "The owl says 'who.' Not 'let me tell you about my day.' Wisdom.",
        "I'm conserving energy across four forms. Talking is a fifth form I can't afford.",
    },
    PALADIN = {
        "The Light told me to focus. I'm FOCUSING. The Light also says you're too loud.",
        "I could talk or I could keep my Bubble cooldown ready. Guess which saves YOUR life.",
        "My silence is RIGHTEOUS patience. Not that you'd recognize righteousness.",
        "Talk is cheap. Divine Shield has a 5-minute cooldown. I know what matters.",
        "The scriptures speak of silent devotion. I'm being DEVOUT. You're being noisy.",
        "If talking generated Holy Power I'd never shut up. It doesn't. So here we are.",
        "Every second I spend responding is a Judgement I'm not casting. You want MORE Judgements.",
        "My Blessing of Might doesn't come with a Blessing of Chatting.",
        "Paladins are the strong, silent type. Emphasis on BOTH.",
        "The Light asks little but gives much. I'm modeling that. You're modeling the opposite.",
        "I don't need to talk when Consecration does the talking. On the ground. In fire.",
        "Bubbled in silence. It's called self-care.",
    },
    SHAMAN = {
        "The elements told me to be quiet. I listen to the elements. Unlike you.",
        "Wind carries words. When my words are worth carrying, I'll speak.",
        "I'm in communion. Four elements, one shaman, zero interruptions. You're ruining it.",
        "Earth is patient. Water is patient. I am patient. You are loud.",
        "Fire didn't ask me to explain its plan. Fire just BURNS. I respect that.",
        "I was listening to the elements and they said, direct quote, 'tell them to zip it.'",
        "My Tremor Totem handles the shaking. My silence handles the peace.",
        "Totems don't explain themselves and they're the most useful thing I deploy.",
        "Four elements. Zero of them are 'the element of small talk.'",
        "Ankh means I get a second chance at life. I'm not wasting it on chatter.",
        "Wind Shear interrupts spells. I wish it interrupted questions too.",
        "The elements speak when needed. I speak when needed. Today hasn't needed much.",
    },
    PIRATE = {
        "Arr, even a pirate knows when to be quiet and watch the horizon.",
        "I'm on lookout. Lookouts don't CHAT, they LOOK. Clue's in the name.",
        "Quiet seas before the storm, mate. I'M the storm.",
        "Ye talk more than a drunk sailor. And I've BEEN a drunk sailor.",
        "Me mouth's too busy drinkin' rum to waste on words.",
        "A wise captain speaks with his sword. I ain't a captain. But I got a sword.",
        "Ye ever see a shark announce it's coming? No. EXACTLY.",
        "Silence is how ye find treasure, mate. Loud ones find NOTHING.",
        "I save me words for me shanty. And me shanty's not for another three pulls.",
        "Arr, I'm conservin' me vocal cords for the victory scream. Priorities.",
        "Loose lips sink ships. I ain't sinkin' THIS ship.",
        "The ocean don't explain itself and it's the most powerful thing there is.",
    },
}

-- Lines the CALLOUTS user says about the chatty SOCIAL peer
local LOUD_TEASE = {
    WARRIOR = {
        "Does {name} EVER stop talking? I'm trying to FIGHT here.",
        "{name} has said more words today than I've thrown swings. And I swing a LOT.",
        "I swear {name}'s mouth does more damage than their weapon.",
        "{name}, you gonna fight or commentate? Pick ONE.",
        "Every time {name} talks I lose focus. And rage. MOSTLY RAGE.",
        "{name} talks like there's a boss mechanic for it. There ISN'T.",
        "I'm counting {name}'s words per minute. It's higher than my DPS.",
        "{name} could solo content with their mouth. It never stops.",
        "{name}'s running a podcast over here. I didn't subscribe.",
        "If {name} put as much effort into DPS as talking we'd be done by now.",
        "Five minutes. {name} hasn't shut up for FIVE MINUTES.",
        "{name} just talked through an entire pull. I'm impressed and furious.",
    },
    MAGE = {
        "{name} is generating more hot air than a Fire mage. Impressive, actually.",
        "I've calculated {name}'s words-per-minute. It exceeds safe thresholds.",
        "{name}, quantity is not quality. Your output proves this.",
        "If {name}'s chatter scaled with intellect we'd all be geniuses by proximity.",
        "{name} has talked through three pulls. My Counterspell doesn't work on allies.",
        "I could Polymorph {name} for eight seconds of peace. Considering it.",
        "{name}'s vocal output is consuming more resources than my Arcane Missiles.",
        "The ambient noise from {name} is interfering with my calculations.",
        "I've written shorter dissertations than {name}'s last monologue.",
        "{name}, brevity is the soul of wit. Your soul appears... expansive.",
        "If silence were mana, {name} would be OOM permanently.",
        "{name} talks more than my Mirror Images. And there's THREE of them.",
    },
    WARLOCK = {
        "{name}'s mouth runs on pure chaos energy. Infinite resource, zero benefit.",
        "My demons are quieter than {name}. And they're always complaining.",
        "{name}, even the void has quiet moments. You should try it.",
        "I could Banish {name}'s voice for ten seconds. The temptation is real.",
        "{name} hasn't stopped. Even Fear has a duration. This doesn't.",
        "My Imp says {name} is louder than him. My Imp is OFFENDED.",
        "If I could drain {name}'s talking like I drain mana, I'd have infinite resources.",
        "{name} is what happens when there's no cooldown on speaking.",
        "The void whispers. {name} screams. Both are unsettling.",
        "{name}'s chatter is a DoT on my patience. No dispel available.",
        "Even my Succubus couldn't silence {name}. And she tries.",
        "{name} has said more than my demon's entire contract stipulates.",
    },
    PRIEST = {
        "{name}'s talking is doing more damage to my sanity than the boss.",
        "I'm healing fifteen people AND listening to {name}. One of these is optional.",
        "{name}, I have Power Word: Shield. I need Power Word: Silence for you.",
        "Every word {name} says costs me concentration, which costs mana, which costs YOUR health.",
        "I'd pray for {name}'s silence but the Light has limits.",
        "{name} is louder than my Psychic Scream. Which is literally a SCREAM.",
        "Could {name} channel their energy into DPS instead of dialogue?",
        "I've been healing through {name}'s monologue for three pulls. My mana bar weeps.",
        "{name}'s voice should proc a debuff. 'Distracted Healer' — reduces healing by 50%.",
        "If {name} were a spell I'd interrupt them. Oh wait. That's not how this works.",
        "{name} talks more than my inner monologue. My inner monologue is CONSTANT.",
        "Shadow Word: Pain lasts 18 seconds. {name}'s talking lasts forever.",
    },
    ROGUE = {
        "{name} is a security risk. Too much noise. Too much intel leaked.",
        "Silence is operational. {name} is the opposite of operational.",
        "{name}'s mouth is the loudest thing in this dungeon. Including the bosses.",
        "I could Sap {name} but they'd talk through it somehow.",
        "{name}, operational silence means EVERYONE. Including you. ESPECIALLY you.",
        "My Stealth breaks at 10 yards. {name}'s voice carries for 40.",
        "{name} is broadcasting our position to every mob in the instance.",
        "In my line of work, {name} would have been reassigned. To a desk.",
        "{name} is generating more noise than a failed Stealth check.",
        "If talking were combo points, {name} would have a six-point Eviscerate ready.",
        "{name}'s operational output: 90% chatter, 10% results.",
        "I've been on quieter operations in COMBAT than in this group with {name}.",
    },
    HUNTER = {
        "{name} is so loud my pet can't hear my commands. He's confused.",
        "My pet looks at {name} every time they talk. It's a lot of looking.",
        "{name} talks more than my pet eats. And my pet eats CONSTANTLY.",
        "Even my pet knows when to be quiet. {name} does not.",
        "{name}'s voice is scaring the mobs before we pull. Not helpful.",
        "My pet just put his paws over his ears. Didn't know he could do that.",
        "If {name} were a beast I'd use Scatter Shot. For the quiet.",
        "{name} has out-talked my pet, me, AND the mobs. Combined.",
        "I Feign Death to avoid conversations with {name}. It's working.",
        "My pet whispered to me. He said 'make {name} stop.' Pets don't whisper.",
        "{name}'s talking is a constant threat on my pet's anxiety levels.",
        "If {name} were a mob I'd kite them. For distance. And peace.",
    },
    DRUID = {
        "{name} is disrupting the natural order. The natural order is QUIET.",
        "Even in Bear Form I can't growl louder than {name} talks.",
        "I shifted to Cat Form for stealth. {name} won't let stealth happen.",
        "Nature doesn't narrate itself. {name} should take notes.",
        "{name} is louder than a Moonfire crit. And less useful.",
        "The forest is patient. I am patient. {name} is testing BOTH.",
        "I shifted forms three times trying to find one that blocks sound. None do.",
        "Mushrooms communicate through spores. Silently. {name}, consider mushrooms.",
        "If {name} were a druid they'd be stuck in Loudmouth Form. Permanently.",
        "{name}'s chatter is anti-nature. I'm filing a complaint with the Cenarion Circle.",
        "Even Thorns damage is quieter than {name}.",
        "I could Entangling Roots {name}'s feet but it won't root their mouth.",
    },
    PALADIN = {
        "The Light teaches patience. {name} is the final exam.",
        "{name} is louder than Consecration. Consecration is HOLY FIRE.",
        "I'd Hammer of Justice {name} but friendly fire is against the code.",
        "The scripture says 'blessed are the peacemakers.' {name} is making NO peace.",
        "{name}'s volume exceeds my Devotion Aura. That shouldn't be possible.",
        "If {name} were a cooldown I'd have them on a 5-minute timer. At least.",
        "I used Blessing of Wisdom on {name}. Still talking. Wisdom failed.",
        "My bubble protects from all damage. Not from {name}'s dialogue.",
        "{name} has talked more than every sermon I've sat through. Combined.",
        "The Light judges all. Today it judges {name}'s volume control.",
        "I tried Lay on Hands. {name} didn't stop talking. That costs a 60-minute cooldown.",
        "Even my shield can't block {name}'s conversational DPS.",
    },
    SHAMAN = {
        "{name} is louder than all four elements. That's hard to do.",
        "Wind carries sound. {name} is giving Wind overtime.",
        "My totems vibrate when {name} talks. That's not how totems work.",
        "Earth says {name} needs grounding. I have a Grounding Totem. Different thing.",
        "Fire is loud. Water is loud. {name} is louder. The elements are offended.",
        "I dropped Tremor Totem. Not for fear. For {name}.",
        "{name} could out-talk a thunderstorm. Lightning agrees.",
        "All four elements filed a noise complaint against {name}.",
        "My Healing Stream Totem doesn't cure {name}'s talking. Tested.",
        "If {name}'s voice were an element it'd be the fifth one. The annoying one.",
        "I asked Wind to carry {name}'s words away. Wind said 'too many.'",
        "{name} has disrupted more communion sessions than enemy casters.",
    },
    PIRATE = {
        "ARR, does {name} EVER shut their gob?!",
        "{name} talks more than a drunk first mate. And I've HAD drunk first mates!",
        "Me ears be bleedin' from {name}'s yammerin'! GIVE IT A REST!",
        "{name} could sink a ship with jaw power alone!",
        "If {name} were a cannon they'd never stop firin'. EVER.",
        "I've sailed through hurricanes quieter than {name}!",
        "Me parrot said he wants off the ship because of {name}. ME PARROT!",
        "{name}'s mouth be runnin' like a loose sail in a storm!",
        "Arr, even Davy Jones would tell {name} to shut up!",
        "I've met SIRENS less chatty than {name}! At least sirens SOUND nice!",
        "{name} be the reason pirates drink. Specifically ME.",
        "If {name} put as much wind in the sails as in their words we'd be there by now!",
    },
}

-- Lines the SOCIAL user fires back when teased about being loud
local QUIET_COMEBACK = {
    WARRIOR = {
        "I talk because SOMEONE has to keep morale up. You're welcome, stone face.",
        "Silent warrior is just AFK with extra steps.",
        "I've never met a problem that couldn't be improved with yelling.",
        "The group needs energy. I AM the energy.",
    },
    MAGE = {
        "I'm not talking too much. You're listening too little.",
        "My commentary is more valuable than your silence. Statistically proven.",
        "Knowledge shared is knowledge multiplied. You're welcome for the multiplication.",
        "At least when I talk, it's INTERESTING.",
    },
    WARLOCK = {
        "My words fill the void. Literally. The void asked for content.",
        "You're confusing 'too much talking' with 'adequate evil monologuing.'",
        "Every word I say makes my demons more powerful. That's not true but it SOUNDS true.",
        "The quiet ones are always the first to die. I'm surviving through VOLUME.",
    },
    PRIEST = {
        "I talk so you know I'm still healing. You WANT me talking. Trust me.",
        "My commentary is free. My heals are not. Be grateful for both.",
        "Last healer who went quiet was AFK. You WANT me loud.",
        "I narrate so you know someone's paying attention to your health bar.",
    },
    ROGUE = {
        "Stealth doesn't mean mute. I'm a rogue, not a monk.",
        "I talk between kills. There's a lot of between.",
        "My commentary is tactical. You just don't understand the strategy.",
        "Even assassins need to decompress. This is my decompression.",
    },
    HUNTER = {
        "My pet likes the sound of my voice. And his opinion matters more.",
        "Talking keeps my pet calm. You want a calm pet. Trust the process.",
        "I'm not loud. My pet is just a good listener and you're not.",
        "Someone has to narrate what the pet's thinking. He can't talk.",
    },
    DRUID = {
        "Nature speaks through me. You want nature to be quiet? That's deforestation.",
        "Four forms, four opinions. I'm just giving them all a voice.",
        "The trees told me to be chatty today. I listen to the trees.",
        "I'm loudest in Moonkin form. You're getting the quiet version.",
    },
    PALADIN = {
        "The Light commands me to share. I'm SHARING. It's holy.",
        "My words are righteous. Your silence is suspicious.",
        "I talk because the alternative is judging you silently. You prefer this.",
        "Even the scripture has thousands of pages. Brevity isn't divine.",
    },
    SHAMAN = {
        "The elements speak through me. Blame them, not me.",
        "Wind carries my words. I didn't choose to be a vessel. I'm honored though.",
        "Four elements, all chatty. I'm the translator. You need me.",
        "If the elements wanted me quiet they'd stop giving me things to say.",
    },
    PIRATE = {
        "A quiet pirate is a DEAD pirate! Ye want me dead?!",
        "I'll talk when I want, where I want, HOW LOUD I want! That's the PIRATE CODE!",
        "Arr, me mouth is me second best weapon! First is the SWORD!",
        "Ye don't like the talkin'? Wait'll I start SINGIN'!",
    },
}

function core.TryStyleRibbing()
    if not ns.db or not ns.db.enabled then return end
    local myStyle = ns.db.banterStyle
    -- Only SOCIAL and NARRATIVE users initiate ribbing — CALLOUTS only RESPONDS
    if myStyle ~= "SOCIAL" and myStyle ~= "NARRATIVE" then return end
    -- Cooldown
    if (GetTime() - lastStyleRib) < STYLE_RIB_COOLDOWN then return end
    -- PvP suppression
    if core.IsInPvPInstance() then return end
    -- Need peers
    if ns.comm.GetPeerCount() < 1 then return end
    -- Don't overlap with active scenes/engagements
    if ns.comm.activeScene and (GetTime() - (ns.comm.activeScene.startTime or 0)) < 20 then return end
    if ns.comm.activeEngagement and (GetTime() - (ns.comm.activeEngagement.startTime or 0)) < 20 then return end

    -- Find a CALLOUTS peer to tease (must be enabled)
    local targetPeer = nil
    for name, data in pairs(ns.comm.peers) do
        if data.style == "CALLOUTS" and data.enabled ~= false then
            targetPeer = name
            break
        end
    end
    if not targetPeer then return end

    -- Pick a tease line for our persona
    local persona = ns.ResolvePersona()
    local pool = QUIET_TEASE[persona]
    if not pool or #pool == 0 then return end
    local line = pool[math.random(#pool)]:gsub("{name}", targetPeer)

    -- Send tease to chat
    local channel = core.GetOutputChannel()
    core.SafeSend(line, channel)
    ns.Debug("STYLE_RIB TEASE [" .. persona .. "/" .. myStyle .. " -> " .. targetPeer .. "]: " .. line)

    -- Notify the peer to fire back
    ns.comm.SendStyleRib()

    lastStyleRib = GetTime()
end

function core.PickStyleComeback()
    local persona = ns.ResolvePersona()
    -- CALLOUTS user got teased by a SOCIAL/NARRATIVE user — fire a "shut up" comeback
    local pool = LOUD_COMEBACK[persona]
    if not pool or #pool == 0 then return nil end
    return pool[math.random(#pool)]
end

---------------------------------------------------------------------------
-- Style Ribbing ticker — check every 30 seconds
---------------------------------------------------------------------------
local ribFrame   = CreateFrame("Frame")
local ribElapsed = 0
ribFrame:SetScript("OnUpdate", function(_, dt)
    ribElapsed = ribElapsed + dt
    if ribElapsed < 30 then return end
    ribElapsed = 0

    if not ns.initialized then return end
    if not IsInGroup() then return end

    core.TryStyleRibbing()
end)

-- Banter_ChatFilter.lua
-- Optional: transform the player's outgoing party/raid messages into persona style.
local _, ns = ...

local chatFilter = ns.chatFilter

---------------------------------------------------------------------------
-- Persona-specific transforms  (AGGRESSIVE — lots of swaps)
---------------------------------------------------------------------------
local TRANSFORMS = {
    PIRATE = {
        prefixes = { "Arrr, ", "Yarr, ", "Aye, ", "Avast, ", "By Davy Jones, ",
                     "Shiver me timbers, ", "Blimey, ", "Ahoy, ", "Yo ho, ",
                     "Batten down, " },
        suffixes = { ", ye scallywag!", ", ye bilge rat!", ", matey!", ", arrr!",
                     ", savvy?", ", or I'll keelhaul ye!", ", ye sea dog!",
                     ", ye landlubber!", ", by thunder!", ", an' that be final!" },
        swaps = {
            -- pronouns / basics
            ["my"]       = "me",
            ["mine"]     = "me own",
            ["i"]        = "I",
            ["you"]      = "ye",
            ["your"]     = "yer",
            ["yours"]    = "yers",
            ["we"]       = "we scallywags",
            ["our"]      = "our crew's",
            ["is"]       = "be",
            ["are"]      = "be",
            ["am"]       = "be",
            ["was"]      = "were",
            ["isn't"]    = "ain't",
            ["it's"]     = "'tis",
            ["the"]      = "th'",
            ["this"]     = "this 'ere",
            ["that"]     = "that there",
            ["them"]     = "'em",
            ["their"]    = "their scurvy",
            -- greetings / affirmatives
            ["hello"]    = "ahoy",
            ["hi"]       = "ahoy",
            ["hey"]      = "oi",
            ["yeah"]     = "aye",
            ["yes"]      = "aye",
            ["no"]       = "nay",
            ["nope"]     = "nay",
            ["ok"]       = "aye aye",
            ["okay"]     = "aye aye",
            ["sure"]     = "aye",
            ["thanks"]   = "much obliged, matey",
            ["thank"]    = "give thanks t'",
            ["please"]   = "if ye please",
            ["sorry"]    = "beggin' yer pardon",
            ["bye"]      = "fair winds",
            ["goodbye"]  = "fair winds t' ye",
            -- common verbs
            ["go"]       = "sail",
            ["going"]    = "sailin'",
            ["went"]     = "sailed",
            ["come"]     = "sail over",
            ["coming"]   = "comin'",
            ["run"]      = "flee like a coward",
            ["running"]  = "runnin'",
            ["walk"]     = "swagger",
            ["walking"]  = "swaggerin'",
            ["stop"]     = "belay",
            ["wait"]     = "hold fast",
            ["waiting"]  = "holdin' fast",
            ["look"]     = "spy with me eye",
            ["looking"]  = "keepin' a weather eye",
            ["see"]      = "spy",
            ["saw"]      = "spied",
            ["get"]      = "plunder",
            ["getting"]  = "plunderin'",
            ["got"]      = "plundered",
            ["take"]     = "seize",
            ["taking"]   = "seizin'",
            ["give"]     = "hand over",
            ["fight"]    = "duel",
            ["fighting"] = "battlin'",
            ["kill"]     = "send t' Davy Jones",
            ["killed"]   = "sent t' Davy Jones",
            ["die"]      = "meet Davy Jones",
            ["died"]     = "met Davy Jones",
            ["eat"]      = "feast",
            ["eating"]   = "feastin'",
            ["drink"]    = "swig",
            ["drinking"] = "swiggin'",
            ["think"]    = "reckon",
            ["know"]     = "savvy",
            ["want"]     = "be wantin'",
            ["need"]     = "be needin'",
            ["have"]     = "got meself",
            ["has"]      = "got",
            ["had"]      = "got",
            ["find"]     = "hunt down",
            ["found"]    = "unearthed",
            ["try"]      = "give 'er a go",
            ["help"]     = "lend a hand",
            ["leave"]    = "shove off",
            ["left"]     = "shoved off",
            ["stay"]     = "drop anchor",
            ["bring"]    = "haul in",
            ["talk"]     = "parley",
            ["talking"]  = "parleyin'",
            ["tell"]     = "speak up t'",
            ["said"]     = "bellowed",
            ["say"]      = "bellow",
            ["hit"]      = "broadside",
            -- nouns
            ["friend"]   = "matey",
            ["friends"]  = "mateys",
            ["man"]      = "lad",
            ["men"]      = "lads",
            ["woman"]    = "lass",
            ["women"]    = "lasses",
            ["guy"]      = "scurvy dog",
            ["guys"]     = "ye dogs",
            ["dude"]     = "barnacle-brain",
            ["people"]   = "landlubbers",
            ["everyone"] = "all hands",
            ["person"]   = "soul",
            ["enemy"]    = "scurvy knave",
            ["enemies"]  = "scurvy knaves",
            ["boss"]     = "cap'n",
            ["leader"]   = "cap'n",
            ["group"]    = "crew",
            ["team"]     = "crew",
            ["party"]    = "crew",
            ["house"]    = "port",
            ["home"]     = "port",
            ["place"]    = "harbor",
            ["world"]    = "seven seas",
            ["money"]    = "booty",
            ["gold"]     = "doubloons",
            ["treasure"] = "buried booty",
            ["item"]     = "plunder",
            ["items"]    = "plunder",
            ["loot"]     = "booty",
            ["stuff"]    = "plunder",
            ["sword"]    = "cutlass",
            ["weapon"]   = "cutlass",
            ["food"]     = "grub",
            ["water"]    = "grog",
            ["beer"]     = "rum",
            ["chest"]    = "treasure chest",
            ["bag"]      = "sack o' loot",
            ["map"]      = "treasure map",
            ["ship"]     = "vessel",
            ["boat"]     = "vessel",
            ["bed"]      = "hammock",
            ["jail"]     = "brig",
            ["prison"]   = "brig",
            ["bathroom"] = "th' head",
            -- adjectives / adverbs
            ["good"]     = "fine",
            ["great"]    = "grand",
            ["nice"]     = "right proper",
            ["cool"]     = "shipshape",
            ["awesome"]  = "legendary",
            ["amazing"]  = "mighty fine",
            ["bad"]      = "foul",
            ["terrible"] = "blasted",
            ["stupid"]   = "addled",
            ["dumb"]     = "barnacle-brained",
            ["crazy"]    = "mad as a sea witch",
            ["fast"]     = "swift as th' wind",
            ["slow"]     = "sluggish as a barnacle",
            ["big"]      = "hulkin'",
            ["small"]    = "wee",
            ["little"]   = "wee",
            ["old"]      = "weathered",
            ["new"]      = "fresh from th' shipyard",
            ["happy"]    = "jolly",
            ["sad"]      = "glum",
            ["angry"]    = "furious as a kraken",
            ["hard"]     = "rough seas",
            ["easy"]     = "smooth sailin'",
            ["very"]     = "mighty",
            ["really"]   = "right",
            ["never"]    = "ne'er",
            ["always"]   = "forevermore",
            ["over"]     = "o'er",
            ["here"]     = "'ere",
            ["there"]    = "o'er yonder",
            ["where"]    = "where in th' seas",
            ["nothing"]  = "naught",
            ["something"]= "somethin'",
            ["everything"]= "th' whole lot",
        },
        chance = 0.85,   -- prefix/suffix on 85% of messages
    },
    WARRIOR = {
        prefixes = { "Hah! ", "By steel, ", "Listen well. ", "On my honor, ",
                     "Stand firm. ", "Forward! ", "Hear me! ", "Blood and iron! ",
                     "To arms! ", "Steel yourself. " },
        suffixes = { ". For glory!", ". Steel holds.", ". Lok'tar!",
                     ". Victory or death!", ". Stand your ground!",
                     ". The line holds!", ". No retreat!", ". Honor demands it." },
        swaps = {
            -- verbs
            ["go"]       = "march",
            ["going"]    = "advancing",
            ["went"]     = "marched",
            ["come"]     = "rally",
            ["run"]      = "charge",
            ["running"]  = "charging",
            ["walk"]     = "patrol",
            ["stop"]     = "hold position",
            ["wait"]     = "hold the line",
            ["waiting"]  = "holding position",
            ["look"]     = "scout",
            ["looking"]  = "scouting",
            ["see"]      = "spot",
            ["get"]      = "secure",
            ["take"]     = "seize",
            ["give"]     = "supply",
            ["fight"]    = "engage",
            ["fighting"] = "engaging",
            ["kill"]     = "cut down",
            ["killed"]   = "felled",
            ["die"]      = "fall in battle",
            ["died"]     = "fell in battle",
            ["hit"]      = "strike",
            ["help"]     = "rally to",
            ["leave"]    = "retreat",
            ["stay"]     = "hold position",
            ["find"]     = "locate",
            ["found"]    = "located",
            ["try"]      = "attempt",
            ["want"]     = "require",
            ["need"]     = "demand",
            ["think"]    = "assess",
            ["know"]     = "confirm",
            ["talk"]     = "report",
            ["tell"]     = "brief",
            ["said"]     = "commanded",
            ["say"]      = "declare",
            ["bring"]    = "requisition",
            ["eat"]      = "refuel",
            ["drink"]    = "hydrate",
            -- nouns
            ["friend"]   = "battle-brother",
            ["friends"]  = "war-band",
            ["man"]      = "soldier",
            ["men"]      = "soldiers",
            ["woman"]    = "shield-maiden",
            ["guy"]      = "combatant",
            ["guys"]     = "troops",
            ["dude"]     = "grunt",
            ["people"]   = "civilians",
            ["everyone"] = "all units",
            ["person"]   = "individual",
            ["enemy"]    = "hostile",
            ["enemies"]  = "hostiles",
            ["boss"]     = "commander",
            ["leader"]   = "general",
            ["group"]    = "squad",
            ["team"]     = "fireteam",
            ["party"]    = "platoon",
            ["place"]    = "sector",
            ["house"]    = "fortification",
            ["home"]     = "base camp",
            ["world"]    = "battlefield",
            ["money"]    = "war funds",
            ["gold"]     = "resources",
            ["loot"]     = "spoils of war",
            ["item"]     = "equipment",
            ["items"]    = "gear",
            ["stuff"]    = "materiel",
            ["sword"]    = "blade",
            ["weapon"]   = "armament",
            ["food"]     = "rations",
            ["water"]    = "provisions",
            ["beer"]     = "mead",
            ["map"]      = "tactical map",
            -- adjectives
            ["good"]     = "worthy",
            ["great"]    = "glorious",
            ["nice"]     = "commendable",
            ["cool"]     = "impressive",
            ["awesome"]  = "legendary",
            ["bad"]      = "dishonorable",
            ["terrible"] = "catastrophic",
            ["stupid"]   = "tactically unsound",
            ["dumb"]     = "foolish",
            ["crazy"]    = "reckless",
            ["scared"]   = "undaunted",
            ["afraid"]   = "unbroken",
            ["fast"]     = "double-time",
            ["slow"]     = "sluggish",
            ["big"]      = "massive",
            ["small"]    = "minor",
            ["hard"]     = "grueling",
            ["easy"]     = "routine",
            ["dead"]     = "fallen",
            ["happy"]    = "victorious",
            ["sad"]      = "demoralized",
            ["angry"]    = "battle-ready",
            -- misc
            ["yes"]      = "affirmative",
            ["yeah"]     = "affirmative",
            ["no"]       = "negative",
            ["nope"]     = "negative",
            ["ok"]       = "acknowledged",
            ["okay"]     = "acknowledged",
            ["sure"]     = "copy that",
            ["hello"]    = "hail",
            ["hi"]       = "hail",
            ["hey"]      = "attention",
            ["thanks"]   = "much appreciated, soldier",
            ["sorry"]    = "my error",
            ["bye"]      = "dismissed",
            ["really"]   = "damn well",
            ["very"]     = "extremely",
            ["here"]     = "at this position",
            ["there"]    = "at that position",
        },
        chance = 0.80,
    },
    NINJA = {
        prefixes = { "... ", "Hm. ", "Silence. ", "From the shadows: ",
                     "Tch. ", "*emerges* ", "Listen closely. ",
                     "The shadows speak. ", "Patience. ", "One must " },
        suffixes = { ".", " ...vanishes.", " *fades into shadow*",
                     " ...steel whispers.", " ...the shadow knows.",
                     " *disappears*", " ...silence.", " *smoke bomb*" },
        swaps = {
            -- verbs
            ["go"]       = "slip away",
            ["going"]    = "moving unseen",
            ["went"]     = "vanished to",
            ["come"]     = "appear",
            ["run"]      = "fade",
            ["running"]  = "ghosting",
            ["walk"]     = "stalk",
            ["stop"]     = "freeze",
            ["wait"]     = "be still",
            ["waiting"]  = "observing",
            ["look"]     = "watch",
            ["looking"]  = "surveilling",
            ["see"]      = "observe",
            ["saw"]      = "detected",
            ["get"]      = "acquire",
            ["take"]     = "claim",
            ["give"]     = "offer",
            ["fight"]    = "strike",
            ["fighting"] = "engaging",
            ["kill"]     = "eliminate",
            ["killed"]   = "dispatched",
            ["die"]      = "become one with shadow",
            ["died"]     = "was silenced",
            ["hit"]      = "strike",
            ["help"]     = "assist from the shadows",
            ["leave"]    = "withdraw",
            ["stay"]     = "remain hidden",
            ["find"]     = "track",
            ["found"]    = "uncovered",
            ["try"]      = "attempt",
            ["want"]     = "desire",
            ["need"]     = "require",
            ["think"]    = "contemplate",
            ["know"]     = "am aware",
            ["talk"]     = "whisper",
            ["talking"]  = "whispering",
            ["tell"]     = "inform",
            ["said"]     = "whispered",
            ["say"]      = "murmur",
            ["bring"]    = "deliver silently",
            ["eat"]      = "sustain oneself",
            ["drink"]    = "sip",
            -- nouns
            ["friend"]   = "ally",
            ["friends"]  = "contacts",
            ["man"]      = "target",
            ["men"]      = "targets",
            ["woman"]    = "operative",
            ["guy"]      = "mark",
            ["guys"]     = "marks",
            ["dude"]     = "fool",
            ["people"]   = "the unaware",
            ["everyone"] = "all present",
            ["person"]   = "individual",
            ["enemy"]    = "mark",
            ["enemies"]  = "marks",
            ["boss"]     = "primary target",
            ["leader"]   = "mastermind",
            ["group"]    = "cell",
            ["team"]     = "unit",
            ["party"]    = "cell",
            ["place"]    = "location",
            ["house"]    = "safehouse",
            ["home"]     = "sanctuary",
            ["world"]    = "realm of shadows",
            ["money"]    = "payment",
            ["gold"]     = "coin",
            ["loot"]     = "acquisition",
            ["item"]     = "asset",
            ["items"]    = "assets",
            ["stuff"]    = "tools",
            ["sword"]    = "blade",
            ["weapon"]   = "tool of the trade",
            ["food"]     = "sustenance",
            ["water"]    = "nothing",
            ["map"]      = "intel",
            -- adjectives
            ["good"]     = "acceptable",
            ["great"]    = "most effective",
            ["nice"]     = "adequate",
            ["cool"]     = "composed",
            ["awesome"]  = "flawless",
            ["bad"]      = "compromised",
            ["terrible"] = "catastrophic",
            ["stupid"]   = "careless",
            ["dumb"]     = "unwise",
            ["crazy"]    = "unpredictable",
            ["scared"]   = "cautious",
            ["afraid"]   = "wary",
            ["fast"]     = "swift",
            ["slow"]     = "measured",
            ["big"]      = "imposing",
            ["small"]    = "subtle",
            ["loud"]     = "unsubtle",
            ["hard"]     = "demanding",
            ["easy"]     = "trivial",
            ["dead"]     = "silenced",
            ["happy"]    = "content",
            ["sad"]      = "troubled",
            ["angry"]    = "focused",
            -- misc
            ["yes"]      = "so it is",
            ["yeah"]     = "indeed",
            ["no"]       = "...no",
            ["nope"]     = "negative",
            ["ok"]       = "understood",
            ["okay"]     = "understood",
            ["sure"]     = "as you wish",
            ["hello"]    = "...",
            ["hi"]       = "...",
            ["hey"]      = "...",
            ["thanks"]   = "your aid is noted",
            ["sorry"]    = "an error was made",
            ["bye"]      = "*vanishes*",
            ["really"]   = "truly",
            ["very"]     = "most",
            ["nothing"]  = "the void",
            ["something"]= "a presence",
        },
        chance = 0.75,
    },
    NEUTRAL = {
        prefixes = { "Well, ", "Hmm, ", "I mean, ", "Look, ", "So, ",
                     "Honestly, ", "Not gonna lie, ", "Bro, ", "Dude, ",
                     "Real talk, " },
        suffixes = { ".", ", I suppose.", ", honestly.", ", but what do I know?",
                     ", no cap.", "... anyway.", ", just sayin'.",
                     ", or whatever." },
        swaps = {
            ["yes"]      = "yep",
            ["yeah"]     = "yep",
            ["no"]       = "nah",
            ["nope"]     = "hard nah",
            ["ok"]       = "sure whatever",
            ["okay"]     = "sure whatever",
            ["hello"]    = "sup",
            ["hi"]       = "yo",
            ["hey"]      = "yo",
            ["thanks"]   = "appreciate it",
            ["sorry"]    = "my bad",
            ["bye"]      = "later",
            ["goodbye"]  = "peace",
            ["good"]     = "solid",
            ["great"]    = "fire",
            ["nice"]     = "clean",
            ["cool"]     = "sick",
            ["awesome"]  = "absolutely goated",
            ["bad"]      = "rough",
            ["terrible"] = "actual garbage",
            ["stupid"]   = "smooth-brain",
            ["dumb"]     = "smooth-brain",
            ["crazy"]    = "unhinged",
            ["scared"]   = "sweating",
            ["angry"]    = "tilted",
            ["happy"]    = "vibing",
            ["sad"]      = "down bad",
            ["fight"]    = "throw hands",
            ["kill"]     = "delete",
            ["killed"]   = "got deleted",
            ["die"]      = "get clapped",
            ["died"]     = "got clapped",
            ["dead"]     = "flatlined",
            ["run"]      = "dip",
            ["running"]  = "booking it",
            ["help"]     = "bail me out",
            ["friend"]   = "homie",
            ["friends"]  = "the boys",
            ["guy"]      = "bro",
            ["guys"]     = "y'all",
            ["dude"]     = "my guy",
            ["enemy"]    = "this clown",
            ["enemies"]  = "these clowns",
            ["boss"]     = "big boy",
            ["group"]    = "the squad",
            ["money"]    = "bread",
            ["gold"]     = "bread",
            ["loot"]     = "goodies",
            ["really"]   = "fr",
            ["very"]     = "hella",
        },
        chance = 0.70,
    },
}

---------------------------------------------------------------------------
-- Transform a message using the persona ruleset
---------------------------------------------------------------------------

-- Case-aware replacement: if original word was Capitalized, capitalize result
local function CaseAwareReplace(original, replacement)
    if original:sub(1,1):match("%u") then
        return replacement:sub(1,1):upper() .. replacement:sub(2)
    end
    return replacement
end

local function TransformMessage(msg, persona)
    local t = TRANSFORMS[persona]
    if not t then return msg end

    local result = msg

    -- Whole-word swaps (case insensitive, preserves leading case)
    for orig, repl in pairs(t.swaps) do
        -- Build a case-insensitive pattern for the word
        local pattern = "(%f[%w])" .. orig:gsub("%a", function(c)
            return "[" .. c:upper() .. c:lower() .. "]"
        end) .. "(%f[%W])"

        result = result:gsub(pattern, function(pre, post)
            -- Grab the matched word from original to check case
            return pre .. CaseAwareReplace(
                msg:match("(%f[%w])" .. orig:gsub("%a", function(c)
                    return "[" .. c:upper() .. c:lower() .. "]"
                end)) or orig, repl
            ) .. post
        end)
    end

    -- Always apply prefix OR suffix (based on chance), sometimes BOTH
    local roll = math.random()
    if roll < t.chance then
        -- Apply prefix
        if #t.prefixes > 0 then
            result = t.prefixes[math.random(#t.prefixes)]
                     .. result:sub(1, 1):lower() .. result:sub(2)
        end
        -- Also apply suffix on a second roll
        if math.random() < 0.5 and #t.suffixes > 0 then
            result = result:gsub("[%.!?]+$", "")
            result = result .. t.suffixes[math.random(#t.suffixes)]
        end
    elseif roll < (t.chance + 0.10) then
        -- Suffix only
        if #t.suffixes > 0 then
            result = result:gsub("[%.!?]+$", "")
            result = result .. t.suffixes[math.random(#t.suffixes)]
        end
    end
    -- Small chance neither is applied, but word swaps still happened

    return result
end

---------------------------------------------------------------------------
-- Hook chat editboxes — modify text BEFORE the secure handler sends it.
-- OnKeyDown fires before OnEnterPressed, so we can SetText() safely.
-- This does NOT taint SendChatMessage.
---------------------------------------------------------------------------
function chatFilter.Init()
    local function HookEditBox(editBox)
        editBox:HookScript("OnKeyDown", function(self, key)
            if key ~= "ENTER" and key ~= "NUMPADENTER" then return end
            if not ns.db or not ns.db.enableChatFilter then return end

            local text = self:GetText()
            if not text or text == "" then return end

            -- Determine chat type from the editbox header
            local chatType = (self.chatType or "SAY"):upper()
            local allowed  = ns.db.chatFilterChannels or {}
            if not allowed[chatType] then return end

            -- Bypass checks
            if text:sub(1, 1) == "!" then
                self:SetText(text:sub(2))  -- strip bypass prefix, send unfiltered
                return
            end
            if IsShiftKeyDown() then return end
            if text:match("|H") then return end  -- hyperlink

            local transformed = TransformMessage(text, ns.db.persona)
            if transformed ~= text then
                self:SetText(transformed)
                ns.Debug("ChatFilter: '" .. text .. "' -> '" .. transformed .. "'")
            end
        end)
    end

    for i = 1, NUM_CHAT_WINDOWS or 10 do
        local eb = _G["ChatFrame" .. i .. "EditBox"]
        if eb then HookEditBox(eb) end
    end
end

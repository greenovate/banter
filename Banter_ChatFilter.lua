-- Banter_ChatFilter.lua
-- Optional: transform the player's outgoing party/raid messages into persona style.
local _, ns = ...

local chatFilter = ns.chatFilter

---------------------------------------------------------------------------
-- Persona-specific transforms
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
            ["my"]="me", ["mine"]="me own", ["you"]="ye", ["your"]="yer",
            ["yours"]="yers", ["we"]="we scallywags", ["our"]="our crew's",
            ["is"]="be", ["are"]="be", ["am"]="be", ["was"]="were",
            ["isn't"]="ain't", ["it's"]="'tis", ["the"]="th'",
            ["this"]="this 'ere", ["that"]="that there", ["them"]="'em",
            ["hello"]="ahoy", ["hi"]="ahoy", ["hey"]="oi",
            ["yeah"]="aye", ["yes"]="aye", ["no"]="nay", ["nope"]="nay",
            ["ok"]="aye aye", ["okay"]="aye aye", ["sure"]="aye",
            ["thanks"]="much obliged, matey", ["please"]="if ye please",
            ["sorry"]="beggin' yer pardon", ["bye"]="fair winds",
            ["go"]="sail", ["going"]="sailin'", ["run"]="flee",
            ["walk"]="swagger", ["stop"]="belay", ["wait"]="hold fast",
            ["look"]="spy with me eye", ["see"]="spy", ["get"]="plunder",
            ["take"]="seize", ["give"]="hand over", ["fight"]="duel",
            ["kill"]="send t' Davy Jones", ["die"]="meet Davy Jones",
            ["eat"]="feast", ["drink"]="swig", ["think"]="reckon",
            ["know"]="savvy", ["want"]="be wantin'", ["need"]="be needin'",
            ["find"]="hunt down", ["help"]="lend a hand", ["leave"]="shove off",
            ["talk"]="parley", ["say"]="bellow", ["hit"]="broadside",
            ["friend"]="matey", ["friends"]="mateys", ["man"]="lad",
            ["men"]="lads", ["woman"]="lass", ["guy"]="scurvy dog",
            ["guys"]="ye dogs", ["dude"]="barnacle-brain",
            ["people"]="landlubbers", ["everyone"]="all hands",
            ["enemy"]="scurvy knave", ["boss"]="cap'n", ["group"]="crew",
            ["team"]="crew", ["party"]="crew", ["money"]="booty",
            ["gold"]="doubloons", ["loot"]="booty", ["food"]="grub",
            ["water"]="grog", ["beer"]="rum", ["sword"]="cutlass",
            ["weapon"]="cutlass", ["good"]="fine", ["great"]="grand",
            ["nice"]="right proper", ["cool"]="shipshape",
            ["awesome"]="legendary", ["bad"]="foul", ["terrible"]="blasted",
            ["stupid"]="addled", ["dumb"]="barnacle-brained",
            ["crazy"]="mad as a sea witch", ["fast"]="swift as th' wind",
            ["big"]="hulkin'", ["small"]="wee", ["happy"]="jolly",
            ["angry"]="furious as a kraken", ["very"]="mighty",
            ["really"]="right", ["never"]="ne'er", ["nothing"]="naught",
        },
        chance = 0.85,
    },

    WARRIOR = {
        prefixes = { "Hah! ", "By steel, ", "Listen well. ", "On my honor, ",
                     "Stand firm. ", "Forward! ", "Hear me! ", "Blood and iron! ",
                     "To arms! ", "Steel yourself. " },
        suffixes = { ". For glory!", ". Steel holds.", ". Lok'tar!",
                     ". Victory or death!", ". Stand your ground!",
                     ". The line holds!", ". No retreat!", ". Honor demands it." },
        swaps = {
            ["go"]="march", ["run"]="charge", ["walk"]="patrol",
            ["stop"]="hold position", ["wait"]="hold the line",
            ["look"]="scout", ["get"]="secure", ["take"]="seize",
            ["fight"]="engage", ["kill"]="cut down", ["die"]="fall in battle",
            ["hit"]="strike", ["help"]="rally to", ["leave"]="retreat",
            ["find"]="locate", ["want"]="require", ["need"]="demand",
            ["think"]="assess", ["know"]="confirm", ["talk"]="report",
            ["say"]="declare", ["eat"]="refuel", ["drink"]="hydrate",
            ["friend"]="battle-brother", ["friends"]="war-band",
            ["man"]="soldier", ["guy"]="combatant", ["guys"]="troops",
            ["dude"]="grunt", ["people"]="civilians", ["everyone"]="all units",
            ["enemy"]="hostile", ["enemies"]="hostiles", ["boss"]="commander",
            ["group"]="squad", ["team"]="fireteam", ["party"]="platoon",
            ["place"]="sector", ["home"]="base camp", ["world"]="battlefield",
            ["gold"]="resources", ["loot"]="spoils of war",
            ["food"]="rations", ["weapon"]="armament", ["beer"]="mead",
            ["good"]="worthy", ["great"]="glorious", ["nice"]="commendable",
            ["awesome"]="legendary", ["bad"]="dishonorable",
            ["terrible"]="catastrophic", ["stupid"]="tactically unsound",
            ["crazy"]="reckless", ["dead"]="fallen",
            ["yes"]="affirmative", ["yeah"]="affirmative",
            ["no"]="negative", ["nope"]="negative",
            ["ok"]="acknowledged", ["okay"]="acknowledged",
            ["hello"]="hail", ["hi"]="hail", ["thanks"]="appreciated, soldier",
            ["sorry"]="my error", ["bye"]="dismissed",
            ["really"]="damn well", ["very"]="extremely",
        },
        chance = 0.80,
    },

    MAGE = {
        prefixes = { "Clearly, ", "Observe: ", "As I predicted, ", "Fascinating. ",
                     "Obviously, ", "Intellectually speaking, ", "Ahem. ",
                     "If I may, ", "As any scholar knows, ", "Permit me: " },
        suffixes = { ". Textbook.", ". As expected.", ". Elementary.",
                     ". I could explain further but you wouldn't follow.",
                     ". Consult the Kirin Tor archives.", ". Simple arcana.",
                     ". *adjusts robes*", ". The math checks out." },
        swaps = {
            ["go"]="teleport", ["run"]="Blink away", ["walk"]="stride",
            ["stop"]="cease", ["wait"]="patience", ["look"]="examine",
            ["get"]="acquire", ["take"]="requisition", ["fight"]="engage",
            ["kill"]="incinerate", ["die"]="perish", ["hit"]="blast",
            ["help"]="assist", ["think"]="theorize", ["know"]="am certain",
            ["want"]="require", ["need"]="necessitate", ["find"]="deduce",
            ["eat"]="conjure sustenance", ["drink"]="hydrate with conjured water",
            ["friend"]="colleague", ["friends"]="associates",
            ["guy"]="individual", ["dude"]="simpleton",
            ["people"]="the uninitiated", ["everyone"]="all present",
            ["enemy"]="specimen", ["boss"]="subject of study",
            ["group"]="research team", ["party"]="expedition",
            ["loot"]="scholarly findings", ["gold"]="research funding",
            ["food"]="conjured provisions", ["weapon"]="implement",
            ["good"]="adequate", ["great"]="exemplary", ["nice"]="satisfactory",
            ["awesome"]="intellectually stimulating", ["bad"]="suboptimal",
            ["terrible"]="abysmal", ["stupid"]="intellectually challenged",
            ["crazy"]="theoretically unsound", ["dead"]="deceased",
            ["yes"]="correct", ["yeah"]="indeed", ["no"]="incorrect",
            ["ok"]="acceptable", ["hello"]="greetings",
            ["hi"]="greetings", ["thanks"]="my gratitude",
            ["sorry"]="I miscalculated", ["bye"]="I must study",
            ["really"]="demonstrably", ["very"]="exceedingly",
        },
        chance = 0.75,
    },

    WARLOCK = {
        prefixes = { "Heh. ", "How delightful. ", "Oh, this? ", "Don't worry. ",
                     "My demons agree: ", "Speaking of souls, ",
                     "Between summons, ", "The void whispers: ",
                     "Not to alarm anyone, but ", "Casually, " },
        suffixes = { ". Nothing sinister about that.", ". Totally normal.",
                     ". The demon concurs.", ". *pets demon*",
                     ". Standard soul transaction.", ". For a price.",
                     ". Dark magic aside.", ". My imp says hi." },
        swaps = {
            ["go"]="descend", ["run"]="flee in terror", ["stop"]="halt",
            ["wait"]="linger", ["look"]="peer into", ["get"]="claim",
            ["take"]="siphon", ["fight"]="torment", ["kill"]="drain",
            ["die"]="expire", ["hit"]="curse", ["help"]="sacrifice for",
            ["think"]="commune with darkness", ["know"]="sense",
            ["want"]="covet", ["need"]="hunger for", ["find"]="summon",
            ["eat"]="consume", ["drink"]="drain",
            ["friend"]="minion", ["friends"]="thralls",
            ["guy"]="mortal", ["dude"]="vessel",
            ["people"]="the living", ["everyone"]="all mortals",
            ["enemy"]="offering", ["boss"]="worthy sacrifice",
            ["group"]="coven", ["party"]="cult meeting",
            ["gold"]="soul shards", ["loot"]="tribute",
            ["food"]="life essence", ["weapon"]="conduit",
            ["good"]="useful", ["great"]="exquisite", ["nice"]="adequate",
            ["awesome"]="delicious", ["bad"]="unfortunate",
            ["terrible"]="catastrophic", ["stupid"]="foolish mortal",
            ["crazy"]="unhinged", ["dead"]="soulless",
            ["yes"]="so it shall be", ["yeah"]="naturally",
            ["no"]="the void says no", ["ok"]="acceptable terms",
            ["hello"]="greetings, mortal", ["hi"]="ah, you",
            ["thanks"]="your debt is noted", ["sorry"]="mistakes were made",
            ["bye"]="until next summoning", ["really"]="truly",
            ["very"]="most", ["happy"]="pleased", ["angry"]="wrathful",
        },
        chance = 0.75,
    },

    PRIEST = {
        prefixes = { "Blessed be, ", "The Light provides: ", "With grace, ",
                     "I'm not saying, but ", "As your healer, ",
                     "In the Light's name, ", "No pressure, but ",
                     "I'll pray about it. ", "Not to guilt anyone, but ",
                     "Healing through this: " },
        suffixes = { ". The Light is watching.", ". I'll pray on it.",
                     ". You're welcome, by the way.", ". I noticed. I always notice.",
                     ". Not that I'm keeping track.", ". Bless.",
                     ". My mana remembers.", ". *sighs in healer*" },
        swaps = {
            ["go"]="proceed", ["run"]="hasten", ["stop"]="pause",
            ["wait"]="be patient", ["look"]="observe", ["get"]="receive",
            ["take"]="accept", ["fight"]="smite", ["kill"]="vanquish",
            ["die"]="return to the Light", ["hit"]="smite",
            ["help"]="minister to", ["think"]="reflect",
            ["know"]="have faith", ["want"]="humbly request",
            ["need"]="desperately require", ["find"]="seek",
            ["eat"]="partake", ["drink"]="sip carefully",
            ["friend"]="child of the Light", ["friends"]="congregation",
            ["guy"]="soul", ["dude"]="lost lamb",
            ["people"]="the flock", ["everyone"]="all ye faithful",
            ["enemy"]="sinner", ["boss"]="the unrepentant",
            ["group"]="parish", ["party"]="flock",
            ["gold"]="tithings", ["loot"]="offerings",
            ["food"]="communion", ["weapon"]="instrument of faith",
            ["good"]="blessed", ["great"]="divine", ["nice"]="gracious",
            ["awesome"]="miraculous", ["bad"]="sinful",
            ["terrible"]="an abomination", ["stupid"]="misguided",
            ["crazy"]="touched by shadow", ["dead"]="at peace",
            ["yes"]="the Light says yes", ["yeah"]="indeed",
            ["no"]="the Light declines", ["ok"]="very well",
            ["hello"]="blessings", ["hi"]="peace be with you",
            ["thanks"]="the Light thanks you", ["sorry"]="I repent",
            ["bye"]="go with the Light", ["really"]="truly",
            ["very"]="most", ["angry"]="displeased",
        },
        chance = 0.75,
    },

    ROGUE = {
        prefixes = { "... ", "Look, ", "Between us, ", "Don't tell anyone, but ",
                     "Hypothetically, ", "Off the record: ", "Quick note: ",
                     "Nobody saw this, but ", "Just so we're clear, ",
                     "*checks exits* " },
        suffixes = { ". Not that you heard it from me.", ". Shh.",
                     ". ...what? I was here the whole time.",
                     ". Don't look at me like that.", ". Allegedly.",
                     ". You didn't see anything.", ". I have an alibi.",
                     ". *vanishes*" },
        swaps = {
            ["go"]="slip out", ["run"]="bolt", ["walk"]="creep",
            ["stop"]="freeze", ["wait"]="stake out", ["look"]="case",
            ["get"]="lift", ["take"]="acquire", ["fight"]="ambush",
            ["kill"]="eliminate", ["die"]="get caught", ["hit"]="shiv",
            ["help"]="back up", ["think"]="plan", ["know"]="have intel",
            ["want"]="have my eye on", ["need"]="gotta have",
            ["find"]="track down", ["leave"]="pull out",
            ["eat"]="scarf down", ["drink"]="swig",
            ["friend"]="contact", ["friends"]="crew",
            ["guy"]="mark", ["dude"]="amateur",
            ["people"]="civilians", ["everyone"]="witnesses",
            ["enemy"]="target", ["boss"]="the big score",
            ["group"]="outfit", ["party"]="crew",
            ["gold"]="the take", ["loot"]="the haul",
            ["food"]="grub", ["weapon"]="piece",
            ["good"]="clean", ["great"]="smooth", ["nice"]="slick",
            ["awesome"]="professional grade", ["bad"]="messy",
            ["terrible"]="sloppy", ["stupid"]="amateur hour",
            ["crazy"]="reckless", ["dead"]="done for",
            ["yes"]="yeah, sure", ["yeah"]="yep",
            ["no"]="hard pass", ["ok"]="fine, whatever",
            ["hello"]="hey", ["hi"]="yo",
            ["thanks"]="owe you one", ["sorry"]="my mistake",
            ["bye"]="I was never here", ["really"]="dead serious",
            ["very"]="real", ["happy"]="satisfied", ["angry"]="heated",
        },
        chance = 0.70,
    },

    HUNTER = {
        prefixes = { "So here's the thing, ", "My pet and I agree: ",
                     "Speaking as a hunter, ", "Hold on — *whistles for pet* — ",
                     "Okay look, ", "From range, I can see that ",
                     "Me and my pet think ", "No cap, ",
                     "Before my pet pulls, let me say: ", "Tracking says " },
        suffixes = { ". My pet agrees.", ". Feign Death is always an option.",
                     ". Ask my pet.", ". Don't blame the hunter.",
                     ". *pet growls in agreement*", ". From a safe distance.",
                     ". I have Aspect of the Cheetah ready.",
                     ". Not my fault. Probably." },
        swaps = {
            ["go"]="trek", ["run"]="kite", ["walk"]="track",
            ["stop"]="set a trap", ["wait"]="camp",
            ["look"]="track", ["get"]="tame", ["take"]="claim",
            ["fight"]="engage at range", ["kill"]="bag",
            ["die"]="Feign Death for real", ["hit"]="shoot",
            ["help"]="send my pet", ["think"]="scout ahead",
            ["know"]="can track", ["want"]="need for my pet",
            ["need"]="absolutely need", ["find"]="track down",
            ["eat"]="feed my pet and also me", ["drink"]="hydrate",
            ["friend"]="hunting buddy", ["friends"]="pack",
            ["guy"]="that guy over there", ["dude"]="bro",
            ["people"]="the melee players", ["everyone"]="the whole group",
            ["enemy"]="prey", ["boss"]="big game",
            ["group"]="hunting party", ["party"]="the pack",
            ["gold"]="pet food money", ["loot"]="spoils",
            ["food"]="pet food", ["weapon"]="boomstick",
            ["good"]="on target", ["great"]="critical hit",
            ["nice"]="clean shot", ["awesome"]="bullseye",
            ["bad"]="a miss", ["terrible"]="wide miss",
            ["stupid"]="pulled extra", ["crazy"]="wild",
            ["dead"]="not Feigning", ["yes"]="roger",
            ["yeah"]="yep", ["no"]="nah", ["ok"]="copy",
            ["hello"]="hey", ["hi"]="yo",
            ["thanks"]="good hunting", ["sorry"]="my pet's fault",
            ["bye"]="happy hunting", ["really"]="seriously",
            ["very"]="real", ["angry"]="triggered",
        },
        chance = 0.70,
    },

    DRUID = {
        prefixes = { "Nature says: ", "Shifting gears — ", "In my current form, ",
                     "Bear with me — ", "Naturally, ", "As the forest wills, ",
                     "Between shifts, ", "*shifts nervously* ",
                     "From a nature standpoint, ", "Mark of the Wild aside, " },
        suffixes = { ". Nature finds a way.", ". *shifts form*",
                     ". Might go bear after this.", ". The circle continues.",
                     ". Innervate pending.", ". Mark of the Wild refreshed.",
                     ". Bear form is always the answer.",
                     ". I have four forms for this." },
        swaps = {
            ["go"]="migrate", ["run"]="Dash", ["walk"]="prowl",
            ["stop"]="take root", ["wait"]="photosynthesize",
            ["look"]="survey", ["get"]="forage", ["take"]="harvest",
            ["fight"]="go feral", ["kill"]="cull", ["die"]="wilt",
            ["hit"]="swipe", ["help"]="Innervate",
            ["think"]="commune with nature", ["know"]="sense",
            ["want"]="nature requires", ["need"]="must shift for",
            ["find"]="track by scent", ["eat"]="graze", ["drink"]="absorb dew",
            ["friend"]="fellow druid... I mean friend",
            ["friends"]="the grove", ["guy"]="sapling",
            ["dude"]="cub", ["people"]="sapients",
            ["everyone"]="all living things",
            ["enemy"]="invasive species", ["boss"]="alpha predator",
            ["group"]="ecosystem", ["party"]="grove",
            ["gold"]="acorns", ["loot"]="nature's bounty",
            ["food"]="berries", ["weapon"]="natural weapons",
            ["good"]="balanced", ["great"]="flourishing",
            ["nice"]="harmonious", ["awesome"]="magnificent",
            ["bad"]="blighted", ["terrible"]="an ecological disaster",
            ["stupid"]="unnatural", ["crazy"]="feral",
            ["dead"]="composting", ["yes"]="nature approves",
            ["yeah"]="indeed", ["no"]="nature declines",
            ["ok"]="the balance is maintained", ["hello"]="greetings, friend",
            ["hi"]="well met", ["thanks"]="nature thanks you",
            ["sorry"]="I was in the wrong form", ["bye"]="may nature guide you",
            ["really"]="organically", ["very"]="deeply",
            ["angry"]="going bear", ["happy"]="in bloom",
        },
        chance = 0.70,
    },

    PALADIN = {
        prefixes = { "By the Light, ", "Righteously, ", "In the Light's name, ",
                     "As a champion of justice, ", "Stand tall — ",
                     "Blessings upon you. ", "The Light decrees: ",
                     "Judgment incoming: ", "With holy purpose, ",
                     "Before I bubble: " },
        suffixes = { ". The Light prevails.", ". Justice is served.",
                     ". Bubble is ready if needed.", ". Blessings refreshed.",
                     ". For the Alliance! ...or Horde. Whatever.",
                     ". Lay on Hands on cooldown.",
                     ". I will not be moved.", ". The Light is my shield." },
        swaps = {
            ["go"]="crusade forth", ["run"]="charge valiantly",
            ["walk"]="stride", ["stop"]="hold", ["wait"]="stand vigil",
            ["look"]="behold", ["get"]="claim in the Light's name",
            ["take"]="seize", ["fight"]="smite", ["kill"]="vanquish",
            ["die"]="fall with honor", ["hit"]="judge", ["help"]="bless",
            ["think"]="contemplate the Light", ["know"]="have faith",
            ["want"]="the Light wills", ["need"]="require for the crusade",
            ["find"]="divine", ["eat"]="feast", ["drink"]="partake",
            ["friend"]="brother in Light", ["friends"]="the faithful",
            ["guy"]="soul", ["dude"]="fellow champion",
            ["people"]="the flock", ["everyone"]="all ye righteous",
            ["enemy"]="heretic", ["boss"]="the unholy",
            ["group"]="order", ["party"]="holy order",
            ["gold"]="tithings", ["loot"]="divine rewards",
            ["food"]="sacrament", ["weapon"]="holy armament",
            ["good"]="righteous", ["great"]="glorious",
            ["nice"]="blessed", ["awesome"]="divinely inspired",
            ["bad"]="unholy", ["terrible"]="sacrilege",
            ["stupid"]="misguided", ["crazy"]="zealous",
            ["dead"]="martyred", ["yes"]="the Light wills it",
            ["yeah"]="indeed", ["no"]="the Light forbids",
            ["ok"]="so be it", ["hello"]="hail, champion",
            ["hi"]="greetings", ["thanks"]="the Light thanks you",
            ["sorry"]="I repent", ["bye"]="Light be with you",
            ["really"]="truly", ["very"]="most",
            ["angry"]="wrathful", ["happy"]="blessed",
        },
        chance = 0.75,
    },

    SHAMAN = {
        prefixes = { "The elements say: ", "Thunder rolls — ", "Totem check: ",
                     "By earth and storm, ", "The spirits agree: ",
                     "Wind whispers: ", "Quick elemental update: ",
                     "Between totems, ", "Storm's coming. Also: ",
                     "Fire, water, earth, air — " },
        suffixes = { ". The elements have spoken.", ". *drops totem*",
                     ". Ankh ready just in case.", ". Storm's brewing.",
                     ". Stay near my totems.", ". Lightning approves.",
                     ". Mana Spring is ticking.",
                     ". The wind carries the message." },
        swaps = {
            ["go"]="ride the wind", ["run"]="Ghost Wolf",
            ["walk"]="drift", ["stop"]="anchor", ["wait"]="commune",
            ["look"]="consult the elements", ["get"]="channel",
            ["take"]="claim", ["fight"]="unleash", ["kill"]="shock",
            ["die"]="return to the earth", ["hit"]="shock",
            ["help"]="drop a totem", ["think"]="consult the spirits",
            ["know"]="the elements confirm", ["want"]="the spirits call for",
            ["need"]="require elementally", ["find"]="seek through the earth",
            ["eat"]="share with the elements", ["drink"]="sip from Mana Spring",
            ["friend"]="element-kin", ["friends"]="the tribe",
            ["guy"]="spirit-touched", ["dude"]="earthling",
            ["people"]="the grounded", ["everyone"]="all spirits",
            ["enemy"]="nature's foe", ["boss"]="storm-breaker",
            ["group"]="tribe", ["party"]="circle",
            ["gold"]="earthen tribute", ["loot"]="elemental bounty",
            ["food"]="earth-fare", ["weapon"]="conduit",
            ["good"]="balanced", ["great"]="thunderous",
            ["nice"]="grounded", ["awesome"]="electrifying",
            ["bad"]="unstable", ["terrible"]="cataclysmic",
            ["stupid"]="disconnected", ["crazy"]="stormy",
            ["dead"]="one with the earth", ["yes"]="the elements say yes",
            ["yeah"]="indeed", ["no"]="the elements refuse",
            ["ok"]="balanced", ["hello"]="greetings, spirit-friend",
            ["hi"]="hail", ["thanks"]="the elements thank you",
            ["sorry"]="the elements regret", ["bye"]="may the wind guide you",
            ["really"]="elementally", ["very"]="profoundly",
            ["angry"]="storming", ["happy"]="at peace",
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

            local persona = ns.ResolvePersona and ns.ResolvePersona() or ns.db.persona
            local transformed = TransformMessage(text, persona)
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

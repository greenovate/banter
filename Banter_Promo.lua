-- Banter_Promo.lua
-- Detects "what addon?" questions in chat and responds in-character.
-- Toggleable via settings.  5-min global cooldown, once per asker per session.
local _, ns = ...

local promo = ns.promo

---------------------------------------------------------------------------
-- Config
---------------------------------------------------------------------------
local COOLDOWN         = 300   -- 5 minutes global cooldown
local RESPONSE_DELAY   = 3     -- seconds before responding
local lastPromoAt      = 0
local askedThisSession = {}    -- { ["Name"] = true }

---------------------------------------------------------------------------
-- Keyword patterns  (case-insensitive, checked via :lower())
---------------------------------------------------------------------------
local PATTERNS = {
    "what addon",
    "which addon",
    "what mod",
    "which mod",
    "what is that addon",
    "how are you doing that",
    "how do you do that",
    "what makes you talk",
    "why are you talking like",
    "is that an addon",
    "is that a mod",
    "banter addon",
    "what's making you say",
    "what plugin",
    "which plugin",
}

---------------------------------------------------------------------------
-- In-character promo lines  (per-persona, with fallback generic)
---------------------------------------------------------------------------
local PROMO_LINES = {
    WARRIOR = {
        "Banter addon. It talks so I don't have to. github.com/greenovate/banter",
        "It's called Banter. Does my trash-talking for me. github.com/greenovate/banter",
        "Banter. Free addon. Installs faster than a wipe call. github.com/greenovate/banter",
    },
    MAGE = {
        "It's called Banter — I conjured it from github.com/greenovate/banter. You're welcome.",
        "Banter addon. Intellectually superior to silence. github.com/greenovate/banter",
        "Downloaded from github.com/greenovate/banter. Yes, I know I'm brilliant. It's a burden.",
    },
    WARLOCK = {
        "Soul-bound to an addon called Banter. github.com/greenovate/banter — no soul required. Probably.",
        "Banter. Found it at github.com/greenovate/banter. My imp recommended it. He was right for once.",
        "That would be Banter. github.com/greenovate/banter. Consider it a dark gift.",
    },
    PRIEST = {
        "The Light provides — and so does Banter. github.com/greenovate/banter",
        "It's Banter. I'll pray for your download speed. github.com/greenovate/banter",
        "An addon called Banter. github.com/greenovate/banter. I heal AND entertain. You're welcome.",
    },
    ROGUE = {
        "...Banter. github.com/greenovate/banter. You didn't hear it from me.",
        "Wouldn't normally reveal my sources. Banter. github.com/greenovate/banter",
        "Banter. github.com/greenovate/banter. Install it before I vanish and you forget.",
    },
    HUNTER = {
        "Banter addon! My pet found it. github.com/greenovate/banter — good boy.",
        "That's Banter. github.com/greenovate/banter. Easier to train than my pet. Barely.",
        "github.com/greenovate/banter — it's called Banter. No, my pet didn't type that. ...mostly.",
    },
    DRUID = {
        "Banter. Naturally sourced from github.com/greenovate/banter. 100% organic comedy.",
        "The balance of nature demands you install Banter. github.com/greenovate/banter",
        "It's Banter — free as the wild. github.com/greenovate/banter",
    },
    PALADIN = {
        "Banter. Blessed by the Light and available at github.com/greenovate/banter",
        "The righteous path leads to github.com/greenovate/banter. Install Banter. You're welcome.",
        "It's called Banter. Consider it divine intervention. github.com/greenovate/banter",
    },
    SHAMAN = {
        "The elements whisper: 'Install Banter.' github.com/greenovate/banter",
        "Banter addon. The spirits insisted. github.com/greenovate/banter",
        "That's Banter. Channeled directly from github.com/greenovate/banter. No totems required.",
    },
    PIRATE = {
        "Arr, that be Banter! Plunder it from github.com/greenovate/banter, ye scurvy dog!",
        "Banter, ye landlubber. github.com/greenovate/banter — free as stolen rum!",
        "The name's Banter. Chart yer course to github.com/greenovate/banter 'fore I change me mind.",
    },
}

---------------------------------------------------------------------------
-- Pick a promo line for the active persona
---------------------------------------------------------------------------
local function PickLine()
    local persona = ns.ResolvePersona()
    local pool = PROMO_LINES[persona] or PROMO_LINES["WARRIOR"]
    return pool[math.random(#pool)]
end

---------------------------------------------------------------------------
-- Check incoming chat for addon questions
---------------------------------------------------------------------------
local function OnChatMessage(_, _, msg, sender, ...)
    if not ns.db or not ns.db.selfPromo then return end

    -- Strip realm name
    local name = sender:match("^([^-]+)") or sender
    if name == UnitName("player") then return end

    -- Already answered this person
    if askedThisSession[name] then return end

    -- Global cooldown
    if (GetTime() - lastPromoAt) < COOLDOWN then return end

    -- Pattern match
    local lower = msg:lower()
    local matched = false
    for _, pattern in ipairs(PATTERNS) do
        if lower:find(pattern, 1, true) then
            matched = true
            break
        end
    end
    if not matched then return end

    -- Fire after a short delay
    askedThisSession[name] = true
    lastPromoAt = GetTime()

    C_Timer.After(RESPONSE_DELAY, function()
        local line = PickLine()
        local channel = ns.core.GetOutputChannel()
        ns.core.SafeSend(line, channel)
        ns.Debug("PROMO → " .. name .. ": " .. line)
    end)
end

---------------------------------------------------------------------------
-- Init  (called from core.Init)
---------------------------------------------------------------------------
function promo.Init()
    if not ns.db then return end

    local f = CreateFrame("Frame")
    f:RegisterEvent("CHAT_MSG_SAY")
    f:RegisterEvent("CHAT_MSG_PARTY")
    f:RegisterEvent("CHAT_MSG_PARTY_LEADER")
    f:RegisterEvent("CHAT_MSG_RAID")
    f:RegisterEvent("CHAT_MSG_RAID_LEADER")
    f:RegisterEvent("CHAT_MSG_WHISPER")
    f:SetScript("OnEvent", OnChatMessage)

    ns.Debug("Promo initialised.")
end

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

    -- Basic context tokens
    r = r:gsub("{dead}",   ctx.dead   or "someone")
    r = r:gsub("{looter}", ctx.looter or "someone")
    r = r:gsub("{target}", ctx.target or "someone")
    r = r:gsub("{source}", ctx.source or "someone")
    r = r:gsub("{zone}",   ctx.zone   or GetRealZoneText() or "here")
    r = r:gsub("{spell}",  ctx.spell  or "something")

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

    -- Stat tokens  (only if roastMode is on and we have stats)
    if ns.db and ns.db.roastMode and ns.stats and ns.stats.GetTokens then
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
    ns.Debug("Core initialised (v" .. ns.version .. ").")
end

---------------------------------------------------------------------------
-- Solo Emote Mode — /me inner monologue when not in a group
-- No extra timers. Hooks into the existing AMBIENT trigger system.
-- When solo + soloMode, AMBIENT statements route through EMOTE with a
-- persona-flavoured prefix instead of being blocked by SAY.
---------------------------------------------------------------------------

local SOLO_PREFIXES = {
    WARRIOR = { "mutters:",   "grumbles:",  "grunts:" },
    MAGE    = { "muses:",     "ponders:",   "mutters:" },
    PRIEST  = { "murmurs:",   "whispers a prayer:", "reflects:" },
    ROGUE   = { "mutters from the shadows:", "thinks aloud:", "whispers:" },
    HUNTER  = { "mutters to their pet:",     "thinks aloud:", "sighs:" },
    PALADIN = { "reflects:",  "murmurs:",   "contemplates:" },
    WARLOCK = { "mutters darkly:", "hisses:", "chuckles:" },
    SHAMAN  = { "murmurs:",   "reflects:",  "communes:" },
    DRUID   = { "muses:",     "hums:",      "reflects:" },
    PIRATE  = { "mutters:",   "growls:",    "grumbles:" },
    NEUTRAL = { "mutters:",   "thinks:",    "muses:" },
}

local SOLO_SKIP = {
    " we ",  " we'",  "^we ",  " us ",  " us.",  " us,",
    "pull",  "anyone", " group", " crew ",  " party ",
}

local function IsSoloSafe(line)
    if not line or #line < 10 then return false end
    local l = " " .. line:lower() .. " "
    for _, pat in ipairs(SOLO_SKIP) do
        if l:find(pat, 1, true) then return false end
    end
    return true
end

---------------------------------------------------------------------------
-- Start a new scene  (called by trigger handlers)
---------------------------------------------------------------------------
function core.StartScene(trigger, ctx)
    ctx = ctx or {}

    -- PvP instance suppression (BGs / arenas — not yet supported)
    if core.IsInPvPInstance() then
        ns.Debug("Scene suppressed — inside PvP instance")
        return
    end

    -- Raid-disable check
    if ns.db.raid and not ns.db.raid.enabled and core.GetGroupMode() == "RAID" then
        ns.Debug("Scene suppressed — banter disabled in raids")
        return
    end

    -- Per-trigger RNG + cooldown check
    if not ns.triggers.CheckTrigger(trigger) then return end

    local persona   = ns.ResolvePersona()
    local statement = ns.scenes.PickStatement(persona, trigger)
    if not statement then
        ns.Debug("No statement for " .. trigger .. " (persona: " .. persona .. ")")
        return
    end

    -- Mark gates
    ns.triggers.MarkSceneStarted()
    ns.triggers.MarkTriggerFired(trigger)

    -- Build & send the line
    local line    = core.ReplaceTokens(statement.line, ctx)
    local channel = core.GetOutputChannel()

    -- Solo mode: route ALL triggers through EMOTE when not in a group
    local mode = core.GetGroupMode()
    if mode == "SOLO" and ns.db.soloMode then
        -- AMBIENT lines get filtered for group-dependent language
        if trigger == "AMBIENT" and not IsSoloSafe(line) then
            ns.Debug("Solo: skipped group-dependent AMBIENT line")
            return
        end
        local prefixes = SOLO_PREFIXES[persona] or SOLO_PREFIXES.WARRIOR
        local prefix   = prefixes[math.random(#prefixes)]
        line    = prefix .. ' "' .. line .. '"'
        channel = "EMOTE"
    end

    core.SafeSend(line, channel)
    ns.Debug("STMT [" .. trigger .. "/" .. statement.rarity .. "]: " .. line)

    -- Group coordination
    if mode ~= "SOLO" and ns.comm.GetPeerCount() > 0 then
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

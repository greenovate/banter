-- Banter_Core.lua
-- Scene orchestration: starting scenes, emitting statements & responses.
local _, ns = ...

local core = ns.core

---------------------------------------------------------------------------
-- Group mode / channel helpers
---------------------------------------------------------------------------
function core.GetGroupMode()
    if IsInRaid()  then return "RAID"  end
    if IsInGroup() then return "PARTY" end
    return "SOLO"
end

function core.GetOutputChannel()
    local db   = ns.db
    local mode = core.GetGroupMode()

    if db.outputChannel == "AUTO" then
        if mode == "RAID"  then return "RAID"  end
        if mode == "PARTY" then return "PARTY" end
        return "SAY"
    end
    return db.outputChannel
end

---------------------------------------------------------------------------
-- Safe chat output — SAY/YELL require a hardware event when outdoors.
-- PARTY / RAID / GUILD / EMOTE are unrestricted.
-- When the channel is restricted (solo + SAY), display locally instead.
---------------------------------------------------------------------------
function core.SafeSend(text, channel)
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
-- Tokens: {dead} {looter} {target} {source} {zone} {class}
---------------------------------------------------------------------------
function core.ReplaceTokens(line, ctx)
    if not ctx then return line end
    local r = line
    r = r:gsub("{dead}",   ctx.dead   or "someone")
    r = r:gsub("{looter}", ctx.looter or "someone")
    r = r:gsub("{target}", ctx.target or "someone")
    r = r:gsub("{source}", ctx.source or "someone")
    r = r:gsub("{zone}",   ctx.zone   or GetRealZoneText() or "here")

    if ctx.target then
        local _, cls = UnitClass(ctx.target)
        r = r:gsub("{class}", cls or "adventurer")
    else
        r = r:gsub("{class}", "adventurer")
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
-- Init  (called from Banter_Triggers ADDON_LOADED)
---------------------------------------------------------------------------
function core.Init()
    ns.comm.Init()
    -- WoW seeds math.random internally; math.randomseed is removed from the sandbox
    ns.settings.CreateOptionsPanel()
    ns.chatFilter.Init()
    ns.Debug("Core initialised.")
end

---------------------------------------------------------------------------
-- Start a new scene  (called by trigger handlers)
---------------------------------------------------------------------------
function core.StartScene(trigger, ctx)
    ctx = ctx or {}

    -- Per-trigger RNG + cooldown check
    if not ns.triggers.CheckTrigger(trigger) then return end

    local persona   = ns.db.persona
    local statement = ns.scenes.PickStatement(persona, trigger)
    if not statement then
        ns.Debug("No statement for " .. trigger)
        return
    end

    -- Mark gates
    ns.triggers.MarkSceneStarted()
    ns.triggers.MarkTriggerFired(trigger)

    -- Build & send the line
    local line    = core.ReplaceTokens(statement.line, ctx)
    local channel = core.GetOutputChannel()
    core.SafeSend(line, channel)
    ns.Debug("STMT [" .. trigger .. "/" .. statement.rarity .. "]: " .. line)

    -- Group coordination
    local mode = core.GetGroupMode()
    if mode ~= "SOLO" and ns.comm.GetPeerCount() > 0 then
        local ctxStr = core.SerializeContext(ctx)
        ns.comm.SendSceneStart(statement.id, trigger, ctxStr)

        -- Set up scene tracking (we're the initiator)
        ns.comm.activeScene = {
            sceneId    = statement.id,
            trigger    = trigger,
            initiator  = UnitName("player"),
            context    = ctx,
            claims     = {},
            locked     = false,
            responders = {},
            startTime  = GetTime(),
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
function core.EmitResponse(trigger, ctx)
    ctx = ctx or {}
    local persona = ns.db.persona
    local line    = ns.scenes.PickResponse(persona, trigger)
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

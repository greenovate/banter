-- Banter_State.lua
-- Activity state machine — tracks what the player is doing so triggers
-- and ambient lines can pick context-appropriate sub-pools.
--
-- States:  IDLE · COMBAT · POST_COMBAT · AFK · DEAD · RESTING · MOUNTED · TRAVEL
local _, ns = ...

local state = ns.state

---------------------------------------------------------------------------
-- State constants
---------------------------------------------------------------------------
state.IDLE        = "IDLE"
state.COMBAT      = "COMBAT"
state.POST_COMBAT = "POST_COMBAT"
state.AFK         = "AFK"
state.DEAD        = "DEAD"
state.RESTING     = "RESTING"
state.MOUNTED     = "MOUNTED"
state.TRAVEL      = "TRAVEL"

---------------------------------------------------------------------------
-- Internal tracking
---------------------------------------------------------------------------
local current       = state.IDLE
local postCombatEnd = 0          -- GetTime() when POST_COMBAT expires
local POST_COMBAT_WINDOW = 15    -- seconds to stay in POST_COMBAT

---------------------------------------------------------------------------
-- Public API
---------------------------------------------------------------------------

--- Return the current activity state string.
function state.Current()
    -- POST_COMBAT auto-expires
    if current == state.POST_COMBAT and GetTime() > postCombatEnd then
        current = state.IDLE
    end
    return current
end

--- Manually set state (used by triggers / events).
function state.Set(newState)
    if newState == current then return end
    ns.Debug("State: " .. current .. " -> " .. newState)
    current = newState
end

--- Convenience: enter post-combat cooldown window.
function state.EnterPostCombat()
    current = state.POST_COMBAT
    postCombatEnd = GetTime() + POST_COMBAT_WINDOW
    ns.Debug("State: POST_COMBAT (expires " .. POST_COMBAT_WINDOW .. "s)")
end

---------------------------------------------------------------------------
-- Evaluate state from game signals  (called on relevant events)
---------------------------------------------------------------------------
function state.Evaluate()
    -- Priority order: DEAD > COMBAT > AFK > MOUNTED > RESTING > POST_COMBAT > TRAVEL > IDLE
    if UnitIsDeadOrGhost("player") then
        current = state.DEAD
        return current
    end

    if UnitAffectingCombat("player") then
        current = state.COMBAT
        return current
    end

    if UnitIsAFK("player") then
        current = state.AFK
        return current
    end

    if IsMounted() then
        current = state.MOUNTED
        return current
    end

    if IsResting() then
        current = state.RESTING
        return current
    end

    -- Don't override POST_COMBAT until it expires
    if current == state.POST_COMBAT and GetTime() <= postCombatEnd then
        return current
    end

    -- Traveling: moving + not in combat/AFK/mounted (basic heuristic)
    if GetUnitSpeed("player") > 0 then
        current = state.TRAVEL
        return current
    end

    current = state.IDLE
    return current
end

---------------------------------------------------------------------------
-- Init  (called from core.Init)
---------------------------------------------------------------------------
function state.Init()
    state.Evaluate()
    ns.Debug("State initialised: " .. current)
end

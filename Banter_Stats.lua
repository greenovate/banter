-- Banter_Stats.lua
-- Session-scoped combat statistics for player callouts.
-- Hooks CLEU to track damage, healing, deaths, interrupts, CC-breaks, pulls.
-- Exposes context tokens used by persona lines.
local _, ns = ...

local stats = ns.stats

---------------------------------------------------------------------------
-- Session data  (reset on /banter reset or login)
---------------------------------------------------------------------------
local sessionData = {
    damage    = {},   -- { ["Name"] = total }
    healing   = {},   -- { ["Name"] = total }
    deaths    = {},   -- { ["Name"] = count }
    interrupts = {},  -- { ["Name"] = count }
    ccBreaks  = {},   -- { ["Name"] = count }
    pulls     = {},   -- { ["Name"] = count }  (first to enter combat with new mobs)
    fireDmg   = {},   -- { ["Name"] = total }  (periodic damage taken = "standing in fire")
}

---------------------------------------------------------------------------
-- Internal helpers
---------------------------------------------------------------------------
local function Inc(tbl, name, amount)
    if not name then return end
    tbl[name] = (tbl[name] or 0) + (amount or 1)
end

local function TopN(tbl, n)
    local sorted = {}
    for name, val in pairs(tbl) do
        table.insert(sorted, { name = name, val = val })
    end
    table.sort(sorted, function(a, b) return a.val > b.val end)
    local result = {}
    for i = 1, math.min(n or 1, #sorted) do
        table.insert(result, sorted[i])
    end
    return result
end

local function BottomN(tbl, n)
    local sorted = {}
    for name, val in pairs(tbl) do
        table.insert(sorted, { name = name, val = val })
    end
    table.sort(sorted, function(a, b) return a.val < b.val end)
    local result = {}
    for i = 1, math.min(n or 1, #sorted) do
        table.insert(result, sorted[i])
    end
    return result
end

local function HighestName(tbl)
    local top = TopN(tbl, 1)
    return top[1] and top[1].name or nil
end

local function LowestName(tbl)
    -- Only meaningful if >1 entry
    local count = 0
    for _ in pairs(tbl) do count = count + 1 end
    if count < 2 then return nil end
    local bot = BottomN(tbl, 1)
    return bot[1] and bot[1].name or nil
end

---------------------------------------------------------------------------
-- Public API — context tokens
---------------------------------------------------------------------------

--- Get token replacement table for stat-based tokens.
function stats.GetTokens()
    return {
        top_dps      = HighestName(sessionData.damage)   or "someone",
        worst_dps    = LowestName(sessionData.damage)     or "someone",
        top_healer   = HighestName(sessionData.healing)   or "someone",
        most_deaths  = HighestName(sessionData.deaths)    or "someone",
        death_count  = tostring(stats.GetDeathCount()),
        puller       = HighestName(sessionData.pulls)     or "someone",
        cc_breaker   = HighestName(sessionData.ccBreaks)  or "someone",
        fire_king    = HighestName(sessionData.fireDmg)   or "someone",
        interrupter  = HighestName(sessionData.interrupts) or "someone",
    }
end

function stats.GetDeathCount()
    local total = 0
    for _, v in pairs(sessionData.deaths) do total = total + v end
    return total
end

function stats.GetPlayerDeaths(name)
    return sessionData.deaths[name] or 0
end

function stats.Reset()
    for k in pairs(sessionData) do
        sessionData[k] = {}
    end
    ns.Debug("Stats reset.")
end

---------------------------------------------------------------------------
-- CLEU processing  (called from Banter_Triggers OnCombatLog)
---------------------------------------------------------------------------
function stats.ProcessCombatLog()
    local _, subEvent, _, srcGUID, srcName, _, _, dstGUID, dstName,
          _, _, spellId, spellName, _, amount = CombatLogGetCurrentEventInfo()

    -- Only track group members
    local srcIsGroup = srcName and ns.triggers.IsPlayerOrGroup(srcGUID)
    local dstIsGroup = dstName and ns.triggers.IsPlayerOrGroup(dstGUID)

    -- DAMAGE
    if subEvent == "SWING_DAMAGE" or subEvent == "SPELL_DAMAGE"
       or subEvent == "RANGE_DAMAGE" then
        if srcIsGroup and amount then
            Inc(sessionData.damage, srcName, amount)
        end

    -- HEALING
    elseif subEvent == "SPELL_HEAL" or subEvent == "SPELL_PERIODIC_HEAL" then
        if srcIsGroup and amount then
            Inc(sessionData.healing, srcName, amount)
        end

    -- DEATH
    elseif subEvent == "UNIT_DIED" then
        if dstIsGroup then
            Inc(sessionData.deaths, dstName, 1)
        end

    -- INTERRUPT
    elseif subEvent == "SPELL_INTERRUPT" then
        if srcIsGroup then
            Inc(sessionData.interrupts, srcName, 1)
        end

    -- CC BREAK  (SPELL_AURA_BROKEN_SPELL)
    elseif subEvent == "SPELL_AURA_BROKEN_SPELL" then
        if srcIsGroup then
            Inc(sessionData.ccBreaks, srcName, 1)
        end

    -- PERIODIC DAMAGE — "standing in fire"
    elseif subEvent == "SPELL_PERIODIC_DAMAGE" then
        if dstIsGroup and amount then
            Inc(sessionData.fireDmg, dstName, amount)
        end

    -- PULL TRACKING  (first hostile action against a new target)
    elseif (subEvent == "SPELL_DAMAGE" or subEvent == "SWING_DAMAGE"
            or subEvent == "RANGE_DAMAGE" or subEvent == "SPELL_CAST_SUCCESS") then
        if srcIsGroup and not dstIsGroup and dstGUID then
            -- Count pulls per player (rough heuristic — not perfect)
            if UnitAffectingCombat("player") == false then
                -- Pre-combat hit → this is likely the puller
                Inc(sessionData.pulls, srcName, 1)
            end
        end
    end
end

---------------------------------------------------------------------------
-- Init  (called from core.Init)
---------------------------------------------------------------------------
function stats.Init()
    stats.Reset()
    ns.Debug("Stats initialised.")
end

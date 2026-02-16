-- Banter_Scenes.lua
-- Scene data model, rarity selection, weighted picking, repeat protection.
local _, ns = ...

local scenes = ns.scenes

---------------------------------------------------------------------------
-- Rarity weights  (tweak to taste — selection normalises automatically)
---------------------------------------------------------------------------
scenes.RARITY_WEIGHTS = {
    COMMON   = 70,
    UNCOMMON = 25,
    RARE     = 4,
    MYTHIC   = 1,
}

scenes.RARITY_ORDER = { "COMMON", "UNCOMMON", "RARE", "MYTHIC" }

---------------------------------------------------------------------------
-- Per-trigger responder caps  { partyMin, partyMax, raidMin, raidMax }
---------------------------------------------------------------------------
scenes.CAPS = {
    PLAYER_DEAD     = { partyMin = 1, partyMax = 3, raidMin = 1, raidMax = 3 },
    WIPE            = { partyMin = 2, partyMax = 4, raidMin = 2, raidMax = 4 },
    HEALTH_LOW      = { partyMin = 0, partyMax = 2, raidMin = 0, raidMax = 2 },
    MANA_ZERO       = { partyMin = 0, partyMax = 1, raidMin = 0, raidMax = 1 },
    LOOT            = { partyMin = 1, partyMax = 2, raidMin = 1, raidMax = 2 },
    ENTER_INSTANCE  = { partyMin = 1, partyMax = 3, raidMin = 1, raidMax = 3 },
    INTERRUPT       = { partyMin = 0, partyMax = 1, raidMin = 0, raidMax = 1 },
    PERIODIC_DAMAGE = { partyMin = 0, partyMax = 2, raidMin = 0, raidMax = 2 },
    COMBAT_START    = { partyMin = 0, partyMax = 1, raidMin = 0, raidMax = 1 },
    MOB_KILL        = { partyMin = 0, partyMax = 1, raidMin = 0, raidMax = 1 },
    CROWD_CONTROL   = { partyMin = 0, partyMax = 1, raidMin = 0, raidMax = 1 },
    AMBIENT         = { partyMin = 0, partyMax = 2, raidMin = 0, raidMax = 2 },
}

---------------------------------------------------------------------------
-- Per-trigger base probability  (0-1, checked after global cooldown)
---------------------------------------------------------------------------
scenes.TRIGGER_CHANCE = {
    PLAYER_DEAD     = 0.80,
    WIPE            = 0.90,
    HEALTH_LOW      = 0.30,
    MANA_ZERO       = 0.25,
    LOOT            = 0.40,
    ENTER_INSTANCE  = 0.70,
    INTERRUPT       = 0.20,
    PERIODIC_DAMAGE = 0.25,
    COMBAT_START    = 0.25,
    MOB_KILL        = 0.20,
    CROWD_CONTROL   = 0.60,
    AMBIENT         = 0.10,
}

---------------------------------------------------------------------------
-- Repeat protection
---------------------------------------------------------------------------
local recentStatements  = {}     -- circular buffer of statement IDs
local recentResponses   = {}     -- circular buffer of response lines
local STATEMENT_CAP     = 20
local RESPONSE_CAP      = 30

local function IsRecentStatement(id)
    for _, v in ipairs(recentStatements) do
        if v == id then return true end
    end
    return false
end

local function TrackStatement(id)
    table.insert(recentStatements, id)
    if #recentStatements > STATEMENT_CAP then table.remove(recentStatements, 1) end
end

local function IsRecentResponse(line)
    for _, v in ipairs(recentResponses) do
        if v == line then return true end
    end
    return false
end

local function TrackResponse(line)
    table.insert(recentResponses, line)
    if #recentResponses > RESPONSE_CAP then table.remove(recentResponses, 1) end
end

---------------------------------------------------------------------------
-- Roll a rarity tier using weights
---------------------------------------------------------------------------
function scenes.RollRarity()
    local total = 0
    for _, tier in ipairs(scenes.RARITY_ORDER) do
        total = total + scenes.RARITY_WEIGHTS[tier]
    end
    local roll = math.random() * total
    local acc  = 0
    for _, tier in ipairs(scenes.RARITY_ORDER) do
        acc = acc + scenes.RARITY_WEIGHTS[tier]
        if roll <= acc then return tier end
    end
    return "COMMON"
end

---------------------------------------------------------------------------
-- Weighted random pick from a list of { id, weight, line }
-- Skips recently-used IDs when skipRecent is true.
---------------------------------------------------------------------------
function scenes.WeightedPick(pool, skipRecent)
    if not pool or #pool == 0 then return nil end

    local filtered = {}
    for _, item in ipairs(pool) do
        if not skipRecent or not IsRecentStatement(item.id) then
            table.insert(filtered, item)
        end
    end
    if #filtered == 0 then filtered = pool end   -- all filtered → allow repeats

    local total = 0
    for _, item in ipairs(filtered) do total = total + (item.weight or 1) end

    local roll = math.random() * total
    local acc  = 0
    for _, item in ipairs(filtered) do
        acc = acc + (item.weight or 1)
        if roll <= acc then return item end
    end
    return filtered[#filtered]
end

---------------------------------------------------------------------------
-- Pick a statement for a persona + trigger
---------------------------------------------------------------------------
function scenes.PickStatement(persona, trigger)
    local pData = ns.personas[persona]
    if not pData or not pData.statements or not pData.statements[trigger] then
        ns.Debug("No statement data for " .. tostring(persona) .. "/" .. tostring(trigger))
        return nil
    end

    local pool     = pData.statements[trigger]
    local tier     = scenes.RollRarity()
    local tierIdx  = 1
    for i, t in ipairs(scenes.RARITY_ORDER) do
        if t == tier then tierIdx = i; break end
    end

    -- Try rolled tier, then fall back down
    for i = tierIdx, 1, -1 do
        local t = scenes.RARITY_ORDER[i]
        if pool[t] and #pool[t] > 0 then
            local pick = scenes.WeightedPick(pool[t], true)
            if pick then
                TrackStatement(pick.id)
                return { id = pick.id, line = pick.line, rarity = t }
            end
        end
    end
    return nil
end

---------------------------------------------------------------------------
-- Pick a response line for a responder's persona + trigger
---------------------------------------------------------------------------
function scenes.PickResponse(persona, trigger)
    local pData = ns.personas[persona]
    if not pData or not pData.responses or not pData.responses[trigger] then
        ns.Debug("No response data for " .. tostring(persona) .. "/" .. tostring(trigger))
        return nil
    end

    local pool    = pData.responses[trigger]
    local tier    = scenes.RollRarity()
    local tierIdx = 1
    for i, t in ipairs(scenes.RARITY_ORDER) do
        if t == tier then tierIdx = i; break end
    end

    for i = tierIdx, 1, -1 do
        local t = scenes.RARITY_ORDER[i]
        if pool[t] and #pool[t] > 0 then
            local filtered = {}
            for _, line in ipairs(pool[t]) do
                if not IsRecentResponse(line) then table.insert(filtered, line) end
            end
            if #filtered == 0 then filtered = pool[t] end
            local line = filtered[math.random(#filtered)]
            TrackResponse(line)
            return line
        end
    end
    return nil
end

---------------------------------------------------------------------------
-- Responder cap helper
---------------------------------------------------------------------------
function scenes.GetResponderCap(trigger, mode)
    local cap = scenes.CAPS[trigger]
    if not cap then return 0 end

    if mode == "RAID" then
        return cap.raidMax == 0 and 0 or math.random(cap.raidMin, cap.raidMax)
    else
        return cap.partyMax == 0 and 0 or math.random(cap.partyMin, cap.partyMax)
    end
end

-- Banter_Triggers.lua
-- Event detection for all trigger types + global / per-trigger gating.
-- Supports solo play (fires in /s), party, and raid.
local _, ns = ...

local triggers = ns.triggers

---------------------------------------------------------------------------
-- Timing state
---------------------------------------------------------------------------
local lastSceneAt       = 0
local nextSceneDelay    = 0
local lastResponseAt    = 0
local nextResponseDelay = 0

local function ResetSceneGate()
    local db = ns.db or {}
    nextSceneDelay = ns.RandBetween(db.frequencyMin or 25, db.frequencyMax or 90)
end
local function ResetResponseGate()
    local db = ns.db or {}
    nextResponseDelay = ns.RandBetween(db.responseMin or 20, db.responseMax or 60)
end

---------------------------------------------------------------------------
-- Per-trigger independent cooldowns
---------------------------------------------------------------------------
local triggerCooldowns = {}
local TRIGGER_COOLDOWN = {
    PLAYER_DEAD     = 15,
    WIPE            = 60,
    HEALTH_LOW      = 30,
    MANA_ZERO       = 45,
    LOOT            = 20,
    ENTER_INSTANCE  = 120,
    INTERRUPT       = 30,
    PERIODIC_DAMAGE = 30,
    AMBIENT         = 0,
    COMBAT_START    = 20,
    MOB_KILL        = 12,
    CROWD_CONTROL   = 25,
}

---------------------------------------------------------------------------
-- Combat state
---------------------------------------------------------------------------
local inCombat = false

---------------------------------------------------------------------------
-- Wipe detection
---------------------------------------------------------------------------
local recentDeaths   = {}
local WIPE_WINDOW    = 8
local WIPE_THRESHOLD = 3

---------------------------------------------------------------------------
-- Public gating API
---------------------------------------------------------------------------
function triggers.CanStartScene()
    if not ns.db or not ns.db.enabled then return false end
    if not ns.initialized then return false end
    return (GetTime() - lastSceneAt) >= nextSceneDelay
end

function triggers.MarkSceneStarted()
    lastSceneAt = GetTime()
    ResetSceneGate()
end

function triggers.CanRespond()
    if not ns.db or not ns.db.enabled then return false end
    return (GetTime() - lastResponseAt) >= nextResponseDelay
end

function triggers.MarkResponded()
    lastResponseAt = GetTime()
    ResetResponseGate()
end

--- Per-trigger cooldown + RNG probability check.
function triggers.CheckTrigger(trigger)
    local cd   = TRIGGER_COOLDOWN[trigger] or 30
    local last = triggerCooldowns[trigger] or 0
    if (GetTime() - last) < cd then
        ns.Debug(trigger .. " on per-trigger cooldown")
        return false
    end

    local chance = ns.scenes.TRIGGER_CHANCE[trigger] or 0.50
    if math.random() > chance then
        ns.Debug(trigger .. " failed RNG (" .. (chance * 100) .. "%)")
        return false
    end
    return true
end

function triggers.MarkTriggerFired(trigger)
    triggerCooldowns[trigger] = GetTime()
end

function triggers.InCombat()
    return inCombat
end

---------------------------------------------------------------------------
-- Helper: is GUID player or group member?
---------------------------------------------------------------------------
function triggers.IsPlayerOrGroup(guid)
    if guid == UnitGUID("player") then return true end
    local n      = GetNumGroupMembers() or 0
    if n == 0 then return false end  -- solo
    local prefix = IsInRaid() and "raid" or "party"
    for i = 1, n do
        if guid == UnitGUID(prefix .. i) then return true end
    end
    return false
end

-- Legacy alias
triggers.IsGroupMember = triggers.IsPlayerOrGroup

---------------------------------------------------------------------------
-- Event frame + registration
---------------------------------------------------------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:RegisterEvent("CHAT_MSG_LOOT")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("UNIT_HEALTH")
frame:RegisterEvent("UNIT_POWER_UPDATE")

frame:SetScript("OnEvent", function(self, event, ...)
    -----------------------------------------------------------------------
    -- Initialisation
    -----------------------------------------------------------------------
    if event == "ADDON_LOADED" then
        local addon = ...
        if addon == ns.name then
            ns.settings.Init()
            ResetSceneGate()
            ResetResponseGate()
            ns.core.Init()
            ns.initialized = true
            ns.Debug("Banter loaded — persona: " .. (ns.db.persona or "?"))
            self:UnregisterEvent("ADDON_LOADED")
        end
        return
    end

    -- Guard: don't process triggers before init or when disabled
    if not ns.initialized or not ns.db or not ns.db.enabled then return end

    -----------------------------------------------------------------------
    -- Combat state tracking
    -----------------------------------------------------------------------
    if event == "PLAYER_REGEN_DISABLED" then
        inCombat = true
        triggers.OnCombatStart()
        return
    end
    if event == "PLAYER_REGEN_ENABLED" then
        inCombat = false
        return
    end

    -----------------------------------------------------------------------
    -- Trigger dispatch
    -----------------------------------------------------------------------
    if event == "PLAYER_ENTERING_WORLD" then
        triggers.OnEnterWorld()
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        triggers.OnCombatLog()
    elseif event == "CHAT_MSG_LOOT" then
        triggers.OnLoot(...)
    elseif event == "UNIT_HEALTH" then
        triggers.OnHealthChange(...)
    elseif event == "UNIT_POWER_UPDATE" then
        triggers.OnPowerChange(...)
    end
end)

---------------------------------------------------------------------------
-- Ambient timer  (OnUpdate, fires every AMBIENT_INTERVAL seconds)
---------------------------------------------------------------------------
local AMBIENT_INTERVAL = 60
local ambientElapsed   = 0

frame:SetScript("OnUpdate", function(_, elapsed)
    if not ns.initialized or not ns.db or not ns.db.enabled then return end
    ambientElapsed = ambientElapsed + elapsed
    if ambientElapsed >= AMBIENT_INTERVAL then
        ambientElapsed = 0
        if triggers.CanStartScene() then
            ns.core.StartScene("AMBIENT", {})
        end
    end
end)

---------------------------------------------------------------------------
-- COMBAT_START  (entering combat — battle chants, aggro lines)
---------------------------------------------------------------------------
function triggers.OnCombatStart()
    if triggers.CanStartScene() then
        local target = UnitName("target") or "something"
        ns.core.StartScene("COMBAT_START", { target = target })
    end
end

---------------------------------------------------------------------------
-- ENTER_INSTANCE
---------------------------------------------------------------------------
function triggers.OnEnterWorld()
    local inInstance, iType = IsInInstance()
    if inInstance and (iType == "party" or iType == "raid") then
        if triggers.CanStartScene() then
            ns.core.StartScene("ENTER_INSTANCE", { zone = GetRealZoneText() })
        end
    end
end

---------------------------------------------------------------------------
-- COMBAT_LOG_EVENT_UNFILTERED  (death, kill, interrupt, CC, periodic)
---------------------------------------------------------------------------
function triggers.OnCombatLog()
    local ts, subEvent, _, srcGUID, srcName, _, _, dstGUID, dstName = CombatLogGetCurrentEventInfo()

    -- UNIT_DIED → player/group death OR mob kill
    if subEvent == "UNIT_DIED" then
        if triggers.IsPlayerOrGroup(dstGUID) then
            triggers.OnDeath(dstGUID, dstName)
        else
            -- A mob died — check if we or group killed it
            triggers.OnMobKill(dstGUID, dstName)
        end
        return
    end

    -- SPELL_INTERRUPT
    if subEvent == "SPELL_INTERRUPT" then
        if triggers.IsPlayerOrGroup(srcGUID) and triggers.CanStartScene() then
            ns.core.StartScene("INTERRUPT", { source = srcName, target = dstName })
        end
        return
    end

    -- CROWD CONTROL — fear, polymorph, stun, etc. on the player
    if subEvent == "SPELL_AURA_APPLIED" then
        if dstGUID == UnitGUID("player") then
            local spellId, spellName, _, auraType = select(12, CombatLogGetCurrentEventInfo())
            if auraType == "DEBUFF" then
                triggers.OnCrowdControl(srcName, spellName)
            end
        end
        return
    end

    -- SPELL_PERIODIC_DAMAGE  (standing-in-fire proxy)
    if subEvent == "SPELL_PERIODIC_DAMAGE" then
        if triggers.IsPlayerOrGroup(dstGUID) then
            local amount = select(15, CombatLogGetCurrentEventInfo())
            local maxHP  = UnitHealthMax(dstName or "") or 1
            if maxHP > 0 and amount and (amount / maxHP) > 0.15 then
                if triggers.CanStartScene() then
                    ns.core.StartScene("PERIODIC_DAMAGE", { target = dstName })
                end
            end
        end
        return
    end
end

---------------------------------------------------------------------------
-- CC detection — only fire for meaningful CCs (fear, poly, stun, etc.)
---------------------------------------------------------------------------
local CC_KEYWORDS = {
    "fear", "polymorph", "sheep", "stun", "charm", "sleep", "horror",
    "gouge", "sap", "blind", "freeze", "frost nova", "entangling",
    "hammer of justice", "psychic scream", "howl of terror", "intimidating shout",
    "death coil", "repentance", "banish",
}

function triggers.OnCrowdControl(srcName, spellName)
    if not spellName then return end
    local lowerSpell = spellName:lower()
    local isCC = false
    for _, kw in ipairs(CC_KEYWORDS) do
        if lowerSpell:find(kw) then isCC = true; break end
    end
    if not isCC then return end

    if triggers.CanStartScene() then
        ns.core.StartScene("CROWD_CONTROL", { source = srcName, target = UnitName("player"), spell = spellName })
    end
end

---------------------------------------------------------------------------
-- Mob Kill  (something died that's NOT a group member)
---------------------------------------------------------------------------
function triggers.OnMobKill(guid, name)
    if triggers.CanStartScene() then
        ns.core.StartScene("MOB_KILL", { dead = name or "something" })
    end
end

---------------------------------------------------------------------------
-- Death / wipe logic
---------------------------------------------------------------------------
function triggers.OnDeath(guid, name)
    local now = GetTime()
    table.insert(recentDeaths, { time = now, name = name })

    -- Prune stale entries
    local i = 1
    while i <= #recentDeaths do
        if (now - recentDeaths[i].time) > WIPE_WINDOW then
            table.remove(recentDeaths, i)
        else
            i = i + 1
        end
    end

    -- Wipe?
    if #recentDeaths >= WIPE_THRESHOLD then
        if triggers.CanStartScene() then
            recentDeaths = {}
            ns.core.StartScene("WIPE", { dead = name })
            return
        end
    end

    -- Single death
    if triggers.CanStartScene() then
        ns.core.StartScene("PLAYER_DEAD", { dead = name })
    end
end

---------------------------------------------------------------------------
-- LOOT  (blue / purple / orange)
---------------------------------------------------------------------------
function triggers.OnLoot(msg)
    if not msg then return end
    local isBlue   = msg:match("|cff0070dd")
    local isPurple = msg:match("|cffa335ee")
    local isOrange = msg:match("|cffff8000")
    if not (isBlue or isPurple or isOrange) then return end

    local looter = msg:match("^(.+) receives") or UnitName("player")
    if triggers.CanStartScene() then
        local q = isPurple and "EPIC" or (isOrange and "LEGENDARY" or "RARE")
        ns.core.StartScene("LOOT", { looter = looter, quality = q })
    end
end

---------------------------------------------------------------------------
-- HEALTH_LOW  (≤ 15 %)  — works solo (checks "player" unit)
---------------------------------------------------------------------------
function triggers.OnHealthChange(unit)
    if unit ~= "player" and not UnitInParty(unit) and not UnitInRaid(unit) then return end
    if UnitIsDeadOrGhost(unit) then return end

    local hp, maxHP = UnitHealth(unit), UnitHealthMax(unit)
    if maxHP == 0 then return end
    if (hp / maxHP) > 0 and (hp / maxHP) <= 0.15 then
        if triggers.CanStartScene() then
            ns.core.StartScene("HEALTH_LOW", { target = UnitName(unit) })
        end
    end
end

---------------------------------------------------------------------------
-- MANA_ZERO  — works solo (checks "player" unit)
---------------------------------------------------------------------------
function triggers.OnPowerChange(unit, powerType)
    if powerType ~= "MANA" then return end
    if unit ~= "player" and not UnitInParty(unit) and not UnitInRaid(unit) then return end

    local mana    = UnitPower(unit, 0)
    local maxMana = UnitPowerMax(unit, 0)
    if maxMana == 0 then return end

    if mana == 0 then
        if triggers.CanStartScene() then
            ns.core.StartScene("MANA_ZERO", { target = UnitName(unit) })
        end
    end
end

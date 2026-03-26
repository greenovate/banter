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
    local ms  = ns.settings and ns.settings.GetModeSettings and ns.settings.GetModeSettings() or {}
    local mul = ns.core and ns.core.GetChattinessMultiplier and ns.core.GetChattinessMultiplier() or 1
    local lo  = (ms.frequencyMin or 25) / mul
    local hi  = (ms.frequencyMax or 90) / mul
    nextSceneDelay = ns.RandBetween(math.max(lo, 5), math.max(hi, lo + 1))
end
local function ResetResponseGate()
    local ms  = ns.settings and ns.settings.GetModeSettings and ns.settings.GetModeSettings() or {}
    local mul = ns.core and ns.core.GetChattinessMultiplier and ns.core.GetChattinessMultiplier() or 1
    local lo  = (ms.responseMin or 20) / mul
    local hi  = (ms.responseMax or 60) / mul
    nextResponseDelay = ns.RandBetween(math.max(lo, 3), math.max(hi, lo + 1))
end

---------------------------------------------------------------------------
-- Per-trigger independent cooldowns
---------------------------------------------------------------------------
local triggerCooldowns = {}
local TRIGGER_COOLDOWN = {
    PLAYER_DEAD        = 15,
    WIPE               = 60,
    HEALTH_LOW         = 30,
    MANA_ZERO          = 45,
    LOOT               = 20,
    ENTER_INSTANCE     = 120,
    INTERRUPT          = 5,
    PERIODIC_DAMAGE    = 30,
    AMBIENT            = 0,
    COMBAT_RECAP       = 0,
    COMBAT_START       = 20,
    MOB_KILL           = 12,
    CROWD_CONTROL      = 25,
    CC_CALLOUT         = 5,
    PLAYER_KILL        = 8,
    PLAYER_DISCONNECT  = 60,
    CONSUMABLE_USED    = 45,
    MAJOR_COOLDOWN     = 30,
    FLIGHT_PATH        = 0,
    ZONE_CHANGED       = 30,
    SOLO_AMBIENT       = 0,
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
-- Group-join grace period for callout dedup
-- Suppresses callouts for 5s after joining a group so peer discovery
-- can complete and only the leader fires.
---------------------------------------------------------------------------
local groupJoinTime = 0
local DEDUP_GRACE   = 5   -- seconds to wait for peer discovery

local function IsInDedupGrace()
    return (GetTime() - groupJoinTime) < DEDUP_GRACE
end

local function ShouldSuppressCallout()
    -- Solo: never suppress (caller already gates solo separately)
    if (GetNumGroupMembers() or 0) <= 1 then return false end
    -- Grace period: suppress all callouts while peers are still being discovered
    if IsInDedupGrace() then return true end
    -- After grace: normal leader dedup
    if ns.comm.GetPeerCount() > 0 and not ns.comm.AmLeader() then return true end
    return false
end

---------------------------------------------------------------------------
-- Disconnect tracking
---------------------------------------------------------------------------
local connectionState = {}   -- { ["Name"] = true/false (connected) }

---------------------------------------------------------------------------
-- Consumable / Major CD spell ID lists  (Anniversary Classic)
---------------------------------------------------------------------------
local CONSUMABLE_SPELLS = {
    -- Health/Mana potions
    [17534] = true,  -- Major Healing Potion
    [17530] = true,  -- Superior Healing Potion
    [17531] = true,  -- Major Mana Potion
    [17532] = true,  -- Superior Mana Potion
    [11359] = true,  -- Restorative Potion
    [6615]  = true,  -- Free Action Potion
    [3169]  = true,  -- Limited Invulnerability Potion
    -- Bandages
    [18608] = true,  -- Heavy Runecloth Bandage
    [10839] = true,  -- Heavy Mageweave Bandage
    -- Flasks
    [17626] = true,  -- Flask of the Titans
    [17627] = true,  -- Flask of Distilled Wisdom
    [17628] = true,  -- Flask of Supreme Power
    [17629] = true,  -- Flask of Chromatic Resistance
    -- Food/Drink
    [25660] = true,  -- Dirge's Kickin' Chimaerok Chops
    [18229] = true,  -- Runn Tum Tuber
}

local MAJOR_COOLDOWN_SPELLS = {
    -- Warrior
    [871]   = "Shield Wall",
    [1719]  = "Recklessness",
    [12975] = "Last Stand",
    -- Mage
    [12051] = "Evocation",
    [12472] = "Icy Veins",
    [11958] = "Cold Snap",
    -- Warlock
    [18540] = "Ritual of Doom",
    -- Priest
    [10060] = "Power Infusion",
    [724]   = "Lightwell",
    -- Rogue
    [14185] = "Preparation",
    [13750] = "Adrenaline Rush",
    [13877] = "Blade Flurry",
    -- Hunter
    [19574] = "Bestial Wrath",
    [3045]  = "Rapid Fire",
    -- Druid
    [17116] = "Nature's Swiftness",
    [29166] = "Innervate",
    -- Paladin
    [642]   = "Divine Shield",
    [633]   = "Lay on Hands",
    [1038]  = "Blessing of Salvation",
    -- Shaman
    [16190] = "Mana Tide Totem",
    [16166] = "Elemental Mastery",
    [20608] = "Reincarnation",
}

---------------------------------------------------------------------------
-- Public gating API
---------------------------------------------------------------------------
function triggers.CanStartScene()
    if not ns.db or not ns.db.enabled then return false end
    if not ns.initialized then return false end
    -- Raid-disable check
    if ns.db.raid and not ns.db.raid.enabled and (ns.core.GetGroupMode() == "RAID") then return false end
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

--- Per-trigger cooldown + RNG probability check (chattiness-modified).
function triggers.CheckTrigger(trigger)
    local cd   = TRIGGER_COOLDOWN[trigger] or 30
    local last = triggerCooldowns[trigger] or 0
    if (GetTime() - last) < cd then
        ns.Debug(trigger .. " on per-trigger cooldown")
        return false
    end

    local baseChance = ns.scenes.TRIGGER_CHANCE[trigger] or 0.50
    -- Solo AMBIENT gets a moderate boost for idle chatter between combat triggers
    if trigger == "AMBIENT" and ns.db.soloMode and ns.core.GetGroupMode() == "SOLO" then
        baseChance = 0.30
    end
    local mul = ns.core.GetChattinessMultiplier and ns.core.GetChattinessMultiplier() or 1
    local chance = math.min(baseChance * mul, 0.95)

    if math.random() > chance then
        ns.Debug(trigger .. " failed RNG (" .. math.floor(chance * 100) .. "%)")
        return false
    end

    -- Immediately mark cooldown to prevent same-frame duplicates (e.g., AoE kills)
    triggerCooldowns[trigger] = GetTime()
    return true
end

function triggers.MarkTriggerFired(trigger)
    triggerCooldowns[trigger] = GetTime()
end

function triggers.GetTriggerCooldown(trigger)
    return TRIGGER_COOLDOWN[trigger] or 30
end

function triggers.GetLastTriggerTime(trigger)
    return triggerCooldowns[trigger] or 0
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
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:RegisterEvent("CHAT_MSG_LOOT")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("UNIT_HEALTH")
frame:RegisterEvent("UNIT_POWER_UPDATE")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

frame:SetScript("OnEvent", function(self, event, ...)
    -----------------------------------------------------------------------
    -- Initialisation
    -----------------------------------------------------------------------
    if event == "ADDON_LOADED" then
        local addon = ...
        if addon == ns.name then
            ns.settings.Init()
            ns.context.Init()
            ns.engagements.Init()
            ResetSceneGate()
            ResetResponseGate()
            ns.core.Init()
            ns.initialized = true
            print(" |cff33ff99>|r Welcome to |cff33ff99Banter|r version |cff33ff99" .. (ns.version or "?") .. "|r, type |cff33ff99/banter|r for options.")
            ns.Debug("Banter loaded — persona: " .. (ns.db.persona or "?")
                     .. " class: " .. (ns.playerClassKey or "?"))
            self:UnregisterEvent("ADDON_LOADED")
        end
        return
    end

    -- Guard: don't process triggers before init or when disabled
    if not ns.initialized or not ns.db then return end

    if not ns.db.enabled then return end

    -----------------------------------------------------------------------
    -- Combat state tracking  + state machine
    -----------------------------------------------------------------------
    if event == "PLAYER_REGEN_DISABLED" then
        inCombat = true
        ns.state.Set(ns.state.COMBAT)
        triggers.OnCombatStart()
        return
    end
    if event == "PLAYER_REGEN_ENABLED" then
        inCombat = false
        ns.state.EnterPostCombat()
        return
    end

    -----------------------------------------------------------------------
    -- Trigger dispatch
    -----------------------------------------------------------------------
    if event == "PLAYER_ENTERING_WORLD" then
        triggers.OnEnterWorld()
        -- Show style picker FIRST (only on first-ever run or after update)
        -- Then show changelog popup ONCE on initial login only
        if not ns._changelogShown then
            ns._changelogShown = true
            local timer = CreateFrame("Frame")
            local elapsed = 0
            timer:SetScript("OnUpdate", function(self, dt)
                elapsed = elapsed + dt
                if elapsed >= 2 then
                    self:SetScript("OnUpdate", nil)
                    -- Style picker takes priority  (skips if already chosen)
                    if ns.ShowStylePicker then ns.ShowStylePicker() end
                    -- Changelog shows after (skips if style picker is up)
                    if ns.db and ns.db.styleChosen then
                        if ns.ShowChangelog then ns.ShowChangelog() end
                    end
                end
            end)
        end
    elseif event == "ZONE_CHANGED_NEW_AREA" then
        triggers.OnZoneChanged()
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        -- Feed stats tracker first
        ns.stats.ProcessCombatLog()
        -- Then check for trigger events
        triggers.OnCombatLog()
    elseif event == "CHAT_MSG_LOOT" then
        triggers.OnLoot(...)
    elseif event == "UNIT_HEALTH" then
        triggers.OnHealthChange(...)
    elseif event == "UNIT_POWER_UPDATE" then
        triggers.OnPowerChange(...)
    elseif event == "GROUP_ROSTER_UPDATE" then
        triggers.OnRosterUpdate()
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
        triggers.OnSpellCast(...)
    end
end)

---------------------------------------------------------------------------
-- Ambient + Flight-path timer  (OnUpdate, shared tick)
---------------------------------------------------------------------------
local AMBIENT_INTERVAL = 60
local FLIGHT_INTERVAL  = 35
local ambientElapsed   = 0
local flightElapsed    = 0
local wasOnTaxi        = false

frame:SetScript("OnUpdate", function(_, elapsed)
    if not ns.initialized or not ns.db or not ns.db.enabled then return end

    -- Taxi / flight-path banter
    local onTaxi = UnitOnTaxi("player")
    if onTaxi then
        if not wasOnTaxi then
            wasOnTaxi = true
            flightElapsed = FLIGHT_INTERVAL  -- fire soon after boarding
        end
        flightElapsed = flightElapsed + elapsed
        if flightElapsed >= FLIGHT_INTERVAL then
            flightElapsed = 0
            if triggers.CanStartScene() then
                ns.core.StartScene("FLIGHT_PATH", {})
            end
        end
        return  -- skip AMBIENT while on a taxi
    else
        if wasOnTaxi then
            wasOnTaxi = false
            flightElapsed = 0
        end
    end

    -- Normal ambient tick
    ambientElapsed = ambientElapsed + elapsed
    if ambientElapsed >= AMBIENT_INTERVAL then
        ambientElapsed = 0
        -- Evaluate activity state before ambient check
        ns.state.Evaluate()
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
    -- Update state
    ns.state.Evaluate()
end

---------------------------------------------------------------------------
-- ZONE_CHANGED — solo exploration trigger
-- Fires when the player moves into a new major zone (not subzones).
-- Only fires in solo mode — in groups, zone data is handled by engagements.
---------------------------------------------------------------------------
local lastZoneName = ""

function triggers.OnZoneChanged()
    local zone = GetRealZoneText() or ""
    if zone == "" or zone == lastZoneName then return end
    lastZoneName = zone

    -- Solo only — group/raid has engagements for zone content
    if ns.core.GetGroupMode() ~= "SOLO" then return end
    if not ns.db.soloMode then return end

    -- Brief delay so the player sees the zone name before banter fires
    C_Timer.After(4, function()
        if not ns.initialized then return end
        if ns.core.GetGroupMode() ~= "SOLO" then return end  -- may have grouped up
        if triggers.CanStartScene() then
            ns.core.StartScene("ZONE_CHANGED", { zone = zone })
        end
    end)
end

---------------------------------------------------------------------------
-- COMBAT_LOG_EVENT_UNFILTERED  (death, kill, interrupt, CC, periodic)
---------------------------------------------------------------------------
function triggers.OnCombatLog()
    local ts, subEvent, _, srcGUID, srcName, _, _, dstGUID, dstName = CombatLogGetCurrentEventInfo()

    -- Ignore events that don't involve the player or their group
    if not triggers.IsPlayerOrGroup(srcGUID) and not triggers.IsPlayerOrGroup(dstGUID) then
        return
    end

    -- UNIT_DIED → player/group death OR mob kill OR PVP kill
    if subEvent == "UNIT_DIED" then
        if triggers.IsPlayerOrGroup(dstGUID) then
            triggers.OnDeath(dstGUID, dstName)
        else
            -- Check if the dead unit is an enemy player (PVP kill)
            local dstFlags = select(10, CombatLogGetCurrentEventInfo())
            if dstFlags and bit.band(dstFlags, COMBATLOG_OBJECT_TYPE_PLAYER) ~= 0 then
                triggers.OnPlayerKill(dstGUID, dstName)
            else
                triggers.OnMobKill(dstGUID, dstName)
            end
        end
        return
    end

    -- SPELL_INTERRUPT
    if subEvent == "SPELL_INTERRUPT" then
        if (GetNumGroupMembers() or 0) == 0 then return end  -- solo = no callouts
        if triggers.IsPlayerOrGroup(srcGUID) then
            if not ns.db then return end
            if not ns.db.interruptCallouts and ns.db.banterStyle ~= "CALLOUTS" then return end
            if not ns.initialized then return end
            -- Per-trigger cooldown only (no global scene gate)
            local cd   = TRIGGER_COOLDOWN["INTERRUPT"] or 5
            local last = triggerCooldowns["INTERRUPT"] or 0
            if (GetTime() - last) < cd then return end
            -- Dedup: only one Banter user fires per event
            if ShouldSuppressCallout() then return end
            local spellName      = select(13, CombatLogGetCurrentEventInfo())
            local extraSpellName = select(16, CombatLogGetCurrentEventInfo())
            -- Determine if WE interrupted or a group member did
            local isSelf = (srcGUID == UnitGUID("player"))
            ns.core.StartScene("INTERRUPT", {
                source      = srcName,
                target      = dstName,
                spell       = spellName,
                interrupted = extraSpellName,
                isSelf      = isSelf,
            })
        end
        return
    end

    -- CROWD CONTROL — fear, polymorph, stun, etc.
    -- Self-CC fires existing CROWD_CONTROL trigger (persona reaction).
    -- Group-member CC from hostile mobs fires CC_CALLOUT (callout + dispel shame).
    if subEvent == "SPELL_AURA_APPLIED" then
        local spellId, spellName, _, auraType = select(12, CombatLogGetCurrentEventInfo())
        if auraType == "DEBUFF" then
            if dstGUID == UnitGUID("player") then
                triggers.OnCrowdControl(srcName, spellName)
            end
            -- CC_CALLOUT fires for ANY group member (including self) CC'd by a non-group source
            if triggers.IsPlayerOrGroup(dstGUID) and not triggers.IsPlayerOrGroup(srcGUID) then
                triggers.OnCCCallout(dstGUID, dstName, srcName, spellName, spellId)
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

    -- MAJOR_COOLDOWN — big CDs used by group members
    if subEvent == "SPELL_CAST_SUCCESS" then
        if triggers.IsPlayerOrGroup(srcGUID) then
            local spellId = select(12, CombatLogGetCurrentEventInfo())
            local spellName = MAJOR_COOLDOWN_SPELLS[spellId]
            if spellName and triggers.CanStartScene() then
                ns.core.StartScene("MAJOR_COOLDOWN", { source = srcName, spell = spellName })
            end
        end
        return
    end
end

---------------------------------------------------------------------------
-- CC detection — only fire for meaningful CCs (fear, poly, stun, etc.)
---------------------------------------------------------------------------
local CC_KEYWORDS = {
    -- Hard CC
    "fear", "polymorph", "sheep", "stun", "stunned", "charm", "sleep", "horror",
    "gouge", "sap", "blind", "freeze", "frozen", "frost nova", "entangling", "root",
    "hammer of justice", "psychic scream", "howl of terror", "intimidating shout",
    "death coil", "repentance", "banish", "incapacitat", "disorient", "seduc",
    -- Mob abilities
    "war stomp", "ground slam", "knock", "net", "web", "silence", "hex",
    "kidney shot", "cheap shot", "bash", "charge stun", "intercept stun",
    "scatter shot", "wyvern sting", "freezing trap",
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
-- CC CALLOUT — group member CC'd by a mob in dungeon/raid
-- Calls out the victim, spell, duration, and shames a dispeller if one exists.
---------------------------------------------------------------------------

-- Known CC spell durations (seconds) for common TBC Classic mob abilities.
-- Falls back to debuff scanning if not listed.
local CC_DURATIONS = {
    -- Generic mob CC types (lowercase spell name → seconds)
    ["fear"]                 = 8,
    ["psychic scream"]       = 8,
    ["howl of terror"]       = 8,
    ["bellowing roar"]       = 4,
    ["terrifying screech"]   = 4,
    ["intimidating shout"]   = 8,
    ["polymorph"]            = 8,
    ["hex"]                  = 6,
    ["freeze"]               = 5,
    ["frost nova"]           = 8,
    ["entangling roots"]     = 10,
    ["stun"]                 = 4,
    ["war stomp"]            = 2,
    ["hammer of justice"]    = 6,
    ["gouge"]                = 4,
    ["kidney shot"]          = 6,
    ["cheap shot"]           = 4,
    ["sap"]                  = 10,
    ["blind"]                = 10,
    ["charm"]                = 10,
    ["sleep"]                = 6,
    ["death coil"]           = 3,
    ["repentance"]           = 6,
    ["scatter shot"]         = 4,
    ["wyvern sting"]         = 12,
    ["seduction"]            = 15,
    ["banish"]               = 10,
    ["mind control"]         = 10,
    ["web"]                  = 5,
    ["net"]                  = 5,
}

-- Which classes can dispel which debuff categories (TBC Classic)
-- magic: Priest only  |  disease: Priest, Paladin, Shaman
-- poison: Paladin, Shaman, Druid  |  curse: Mage, Druid
-- NOTE: Paladin Cleanse (magic) requires Holy spec — no reliable spec check
-- in Classic API, so we exclude paladins from magic to avoid false callouts.
local DISPEL_CLASSES = {
    PRIEST  = { magic = true, disease = true },
    PALADIN = { disease = true, poison = true },
    SHAMAN  = { disease = true, poison = true },
    DRUID   = { poison = true, curse = true },
    MAGE    = { curse = true },
}

-- Guess the debuff category from the CC keyword
local function GuessDebuffType(spellName)
    local lower = spellName:lower()
    if lower:find("fear") or lower:find("horror") or lower:find("charm")
       or lower:find("polymorph") or lower:find("sheep") or lower:find("hex")
       or lower:find("mind control") or lower:find("seduction")
       or lower:find("banish") or lower:find("sleep") then
        return "magic"
    end
    if lower:find("poison") or lower:find("sting") then
        return "poison"
    end
    if lower:find("curse") then
        return "curse"
    end
    if lower:find("web") or lower:find("net") or lower:find("root")
       or lower:find("entangling") then
        return "magic"
    end
    return "magic"   -- default assumption for mob CCs
end

-- Scan group for a player who can dispel a specific debuff type
local function FindDispeller(debuffType, excludeGUID)
    local n = GetNumGroupMembers() or 0
    if n == 0 then return nil end
    local prefix = IsInRaid() and "raid" or "party"
    local candidates = {}

    -- Check self first
    local _, myClass = UnitClass("player")
    if DISPEL_CLASSES[myClass] and DISPEL_CLASSES[myClass][debuffType]
       and UnitGUID("player") ~= excludeGUID and not UnitIsDeadOrGhost("player") then
        table.insert(candidates, UnitName("player"))
    end

    for i = 1, n do
        local unit = prefix .. i
        if UnitExists(unit) and not UnitIsDeadOrGhost(unit) then
            local _, cls = UnitClass(unit)
            if cls and DISPEL_CLASSES[cls] and DISPEL_CLASSES[cls][debuffType] then
                local guid = UnitGUID(unit)
                if guid ~= excludeGUID then
                    table.insert(candidates, UnitName(unit) or "someone")
                end
            end
        end
    end

    if #candidates == 0 then return nil end
    return candidates[math.random(#candidates)]
end

-- Look up the CC duration: try known table, then scan unit debuffs
local function GetCCDuration(spellName, unitName)
    if not spellName then return nil end

    -- Check known durations (partial match)
    local lower = spellName:lower()
    for pat, dur in pairs(CC_DURATIONS) do
        if lower:find(pat, 1, true) then return dur end
    end

    -- Fallback: try scanning the unit's debuffs (only works for valid unit IDs)
    if unitName then
        for i = 1, 40 do
            local name, _, _, _, _, dur = UnitDebuff(unitName, i)
            if not name then break end
            if name == spellName then return dur end
        end
    end

    return nil
end

function triggers.OnCCCallout(dstGUID, dstName, srcName, spellName, spellId)
    if not spellName then return end
    if (GetNumGroupMembers() or 0) == 0 then return end  -- solo = no callouts

    -- Only fire for meaningful CCs
    local lowerSpell = spellName:lower()
    local isCC = false
    for _, kw in ipairs(CC_KEYWORDS) do
        if lowerSpell:find(kw) then isCC = true; break end
    end
    if not isCC then return end

    -- CC callouts have their own toggle — independent of main enabled
    if not ns.db then return end
    if not ns.db.ccCallouts and ns.db.banterStyle ~= "CALLOUTS" then return end
    if not ns.initialized then return end
    -- Per-trigger cooldown only (no global scene gate)
    local cd   = TRIGGER_COOLDOWN["CC_CALLOUT"] or 5
    local last = triggerCooldowns["CC_CALLOUT"] or 0
    if (GetTime() - last) < cd then return end
    -- Dedup: only one Banter user fires per event
    if ShouldSuppressCallout() then return end

    -- Gather context
    local duration = GetCCDuration(spellName, dstName)
    local debuffType = GuessDebuffType(spellName)
    local dispeller = FindDispeller(debuffType, dstGUID)

    local ctx = {
        victim   = dstName or "someone",
        target   = dstName or "someone",
        source   = srcName or "something",
        spell    = spellName,
        duration = duration and (tostring(math.floor(duration)) .. "s") or "???",
        dispeller = dispeller,
    }

    ns.core.StartScene("CC_CALLOUT", ctx)
end

---------------------------------------------------------------------------
-- Player Kill  (enemy player died — world PVP / BG / arena)
---------------------------------------------------------------------------
function triggers.OnPlayerKill(dstGUID, dstName)
    if not ns.db then return end
    if not ns.db.pvpCallouts and ns.db.banterStyle ~= "CALLOUTS" then return end
    if not ns.initialized then return end
    if (GetNumGroupMembers() or 0) == 0 then return end  -- solo = no callouts

    -- Per-trigger cooldown only (utility callout pattern)
    local cd   = TRIGGER_COOLDOWN["PLAYER_KILL"] or 8
    local last = triggerCooldowns["PLAYER_KILL"] or 0
    if (GetTime() - last) < cd then return end

    -- Dedup: only one Banter user fires per event
    if ShouldSuppressCallout() then return end

    -- Try to get victim class/level if they're our current target
    local killedClass, killedLevel
    if UnitName("target") == dstName then
        killedLevel = UnitLevel("target")
        local _, cls = UnitClass("target")
        killedClass = cls
    end

    -- Player level for level-gap humor
    local playerLevel = UnitLevel("player")
    local levelGap = (killedLevel and killedLevel > 0 and playerLevel)
        and (killedLevel - playerLevel) or nil

    ns.core.StartScene("PLAYER_KILL", {
        killed       = dstName or "someone",
        killed_class = killedClass and (killedClass:sub(1,1) .. killedClass:sub(2):lower()) or nil,
        killed_level = killedLevel and killedLevel > 0 and tostring(killedLevel) or nil,
        level_gap    = levelGap,
    })
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

---------------------------------------------------------------------------
-- PLAYER_DISCONNECT / RECONNECT  (track connection state per group member)
---------------------------------------------------------------------------
function triggers.OnRosterUpdate()
    if not IsInGroup() then
        connectionState = {}
        groupJoinTime = 0
        return
    end

    -- Track group join for dedup grace period
    if groupJoinTime == 0 then
        groupJoinTime = GetTime()
    end

    local prefix = IsInRaid() and "raid" or "party"
    local n = GetNumGroupMembers() or 0
    for i = 1, n do
        local unit = prefix .. i
        local name = UnitName(unit)
        if name then
            local connected = UnitIsConnected(unit)
            local prev = connectionState[name]

            if prev ~= nil and prev ~= connected then
                if not connected then
                    -- Player disconnected
                    if triggers.CanStartScene() then
                        ns.core.StartScene("PLAYER_DISCONNECT", { target = name })
                    end
                end
                -- Could add PLAYER_RECONNECT trigger here later
            end
            connectionState[name] = connected
        end
    end
end

---------------------------------------------------------------------------
-- CONSUMABLE_USED  (via UNIT_SPELLCAST_SUCCEEDED on group members)
---------------------------------------------------------------------------
function triggers.OnSpellCast(unit, _, spellId)
    if not unit then return end
    -- Only track group members (including self)
    if unit ~= "player" and not UnitInParty(unit) and not UnitInRaid(unit) then return end

    if CONSUMABLE_SPELLS[spellId] then
        local name = UnitName(unit) or "someone"
        local spellName = GetSpellInfo(spellId) or "something"
        if triggers.CanStartScene() then
            ns.core.StartScene("CONSUMABLE_USED", { source = name, spell = spellName })
        end
    end
end

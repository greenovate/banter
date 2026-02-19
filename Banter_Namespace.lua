-- Banter_Namespace.lua
-- Shared addon namespace. All modules attach to this table.
local ADDON_NAME, ns = ...

ns.name    = ADDON_NAME
ns.version = "1.0.0"

-- Module tables (populated by their respective files)
ns.settings   = {}
ns.scenes     = {}
ns.triggers   = {}
ns.comm       = {}
ns.core       = {}
ns.chatFilter = {}
ns.state      = {}   -- activity state machine  (Banter_State.lua)
ns.stats      = {}   -- combat stat tracking     (Banter_Stats.lua)
ns.promo      = {}   -- self-promotion detector  (Banter_Promo.lua)

-- Persona data registry (populated by Banter_Persona_*.lua)
ns.personas = {}

-- Player class cache (set once in core.Init)
ns.playerClass    = nil   -- localised name  ("Warrior")
ns.playerClassKey = nil   -- token key       ("WARRIOR")

-- Initialization flag (set true after ADDON_LOADED processing)
ns.initialized = false

-- Valid WoW Classic class persona keys (load order = alpha, Pirate last)
ns.CLASS_PERSONAS = {
    "WARRIOR", "MAGE", "WARLOCK", "PRIEST", "ROGUE",
    "HUNTER", "DRUID", "PALADIN", "SHAMAN",
}
ns.NOVELTY_PERSONAS = { "PIRATE" }

---------------------------------------------------------------------------
-- Utility
---------------------------------------------------------------------------

function ns.RandBetween(a, b)
    return a + math.random() * (b - a)
end

function ns.Debug(msg)
    if ns.db and ns.db.debug then
        DEFAULT_CHAT_FRAME:AddMessage("|cff888888[Banter]|r " .. tostring(msg))
    end
end

function ns.Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00[Banter]|r " .. tostring(msg))
end

--- Resolve "AUTO" persona to player's class, otherwise return the stored key.
function ns.ResolvePersona()
    local p = ns.db and ns.db.persona or "WARRIOR"
    if p == "AUTO" then
        return ns.playerClassKey or "WARRIOR"
    end
    return p
end

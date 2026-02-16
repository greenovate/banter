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

-- Persona data registry (populated by Banter_Persona_*.lua)
ns.personas = {}

-- Initialization flag (set true after ADDON_LOADED processing)
ns.initialized = false

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

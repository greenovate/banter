-- Banter_Context.lua
-- Tracks the player's current location, environment, and activity context.
-- Other modules query ns.context to decide what banter is appropriate.
local _, ns = ...
ns.context = {}

---------------------------------------------------------------------------
-- Location types  (mutually exclusive — one is always active)
---------------------------------------------------------------------------
-- "dungeon"       = 5-man instance (party)
-- "raid"          = raid instance
-- "battleground"  = PvP battleground or arena
-- "city"          = major faction city or neutral hub
-- "world"         = open-world zone (default)

---------------------------------------------------------------------------
-- Environment tags  (flavor based on terrain/biome)
---------------------------------------------------------------------------
-- "forest"     = Ashenvale, Feralas, Elwynn, Teldrassil, Hinterlands …
-- "desert"     = Tanaris, Silithus, Badlands, Thousand Needles …
-- "snow"       = Winterspring, Dun Morogh, Alterac Mountains …
-- "underground"= any dungeon/mine interior, Deeprun Tram …
-- "coastal"    = Stranglethorn, Dustwallow Marsh coast, Azshara …
-- "swamp"      = Swamp of Sorrows, Dustwallow Marsh, Un'Goro border …
-- "mountain"   = Burning Steppes, Searing Gorge, Stonetalon …
-- "haunted"    = Duskwood, Plaguelands, Scholomance, Stratholme …
-- "city"       = Stormwind, Orgrimmar, Ironforge, etc.
-- "generic"    = fallback

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------
local current = {
    location    = "world",       -- dungeon / raid / battleground / city / world
    zone        = "",            -- GetRealZoneText()
    subZone     = "",            -- GetSubZoneText()
    environment = "generic",     -- biome tag
}

---------------------------------------------------------------------------
-- City list  (Anniversary Classic — Vanilla + TBC capitals & hubs)
---------------------------------------------------------------------------
local CITIES = {
    -- Alliance
    ["Stormwind City"]      = true,
    ["Ironforge"]           = true,
    ["Darnassus"]           = true,
    ["The Exodar"]          = true,
    -- Horde
    ["Orgrimmar"]           = true,
    ["Thunder Bluff"]       = true,
    ["Undercity"]           = true,
    ["Silvermoon City"]     = true,
    -- Neutral
    ["Shattrath City"]      = true,
    ["Dalaran"]             = true,
    ["Booty Bay"]           = true,
    ["Gadgetzan"]           = true,
    ["Ratchet"]             = true,
    ["Everlook"]            = true,
    ["Mudsprocket"]         = true,
    ["Light's Hope Chapel"] = true,
    ["Cenarion Hold"]       = true,
    ["Area 52"]             = true,
    ["Moonglade"]           = true,
    ["Marshal's Refuge"]    = true,
    ["Nighthaven"]          = true,
    ["Cosmowrench"]         = true,
    ["Sporeggar"]           = true,
}

---------------------------------------------------------------------------
-- Zone → environment mapping
---------------------------------------------------------------------------
local ZONE_ENV = {
    ---------------------------------------------------------------------------
    -- EASTERN KINGDOMS  (every zone)
    ---------------------------------------------------------------------------
    ["Dun Morogh"]                = "snow",
    ["Elwynn Forest"]             = "forest",
    ["Tirisfal Glades"]           = "haunted",
    ["Westfall"]                  = "coastal",
    ["Loch Modan"]                = "mountain",
    ["Silverpine Forest"]         = "haunted",
    ["Redridge Mountains"]        = "mountain",
    ["Duskwood"]                  = "haunted",
    ["Wetlands"]                  = "coastal",
    ["Hillsbrad Foothills"]       = "forest",
    ["Alterac Mountains"]         = "snow",
    ["Arathi Highlands"]          = "forest",
    ["Stranglethorn Vale"]        = "coastal",
    ["Northern Stranglethorn"]    = "coastal",
    ["The Cape of Stranglethorn"] = "coastal",
    ["Badlands"]                  = "desert",
    ["Swamp of Sorrows"]          = "swamp",
    ["Burning Steppes"]           = "mountain",
    ["Searing Gorge"]             = "mountain",
    ["Blasted Lands"]             = "mountain",
    ["Western Plaguelands"]       = "haunted",
    ["Eastern Plaguelands"]       = "haunted",
    ["Deadwind Pass"]             = "haunted",
    ["Eversong Woods"]            = "forest",
    ["Ghostlands"]                = "haunted",
    ["Isle of Quel'Danas"]        = "coastal",

    ---------------------------------------------------------------------------
    -- KALIMDOR  (every zone)
    ---------------------------------------------------------------------------
    ["Durotar"]                   = "desert",
    ["Mulgore"]                   = "forest",
    ["The Barrens"]               = "desert",
    ["Teldrassil"]                = "forest",
    ["Darkshore"]                 = "coastal",
    ["Ashenvale"]                 = "forest",
    ["Stonetalon Mountains"]      = "mountain",
    ["Desolace"]                  = "desert",
    ["Dustwallow Marsh"]          = "swamp",
    ["Feralas"]                   = "forest",
    ["Thousand Needles"]          = "desert",
    ["Tanaris"]                   = "desert",
    ["Un'Goro Crater"]            = "forest",
    ["Silithus"]                  = "desert",
    ["Azshara"]                   = "coastal",
    ["Felwood"]                   = "haunted",
    ["Winterspring"]              = "snow",
    ["Moonglade"]                 = "forest",
    ["The Hinterlands"]           = "forest",

    ---------------------------------------------------------------------------
    -- DRAENEI / BLOOD ELF STARTING ZONES
    ---------------------------------------------------------------------------
    ["Azuremyst Isle"]            = "forest",
    ["Bloodmyst Isle"]            = "haunted",

    ---------------------------------------------------------------------------
    -- OUTLAND  (every zone)
    ---------------------------------------------------------------------------
    ["Hellfire Peninsula"]        = "desert",
    ["Zangarmarsh"]               = "swamp",
    ["Terokkar Forest"]           = "forest",
    ["Nagrand"]                   = "forest",
    ["Blade's Edge Mountains"]    = "mountain",
    ["Netherstorm"]               = "desert",
    ["Shadowmoon Valley"]         = "haunted",

    ---------------------------------------------------------------------------
    -- CLASSIC DUNGEONS  (all 19)
    ---------------------------------------------------------------------------
    ["Ragefire Chasm"]            = "underground",
    ["The Deadmines"]             = "underground",
    ["Wailing Caverns"]           = "underground",
    ["Shadowfang Keep"]           = "haunted",
    ["Blackfathom Deeps"]         = "underground",
    ["The Stockade"]              = "underground",
    ["Gnomeregan"]                = "underground",
    ["Razorfen Kraul"]            = "underground",
    ["Razorfen Downs"]            = "haunted",
    ["Scarlet Monastery"]         = "haunted",
    ["Uldaman"]                   = "underground",
    ["Zul'Farrak"]                = "desert",
    ["Maraudon"]                  = "underground",
    ["Temple of Atal'Hakkar"]     = "swamp",
    ["Blackrock Depths"]          = "underground",
    ["Lower Blackrock Spire"]     = "underground",
    ["Upper Blackrock Spire"]     = "underground",
    ["Dire Maul"]                 = "forest",
    ["Stratholme"]                = "haunted",
    ["Scholomance"]               = "haunted",

    ---------------------------------------------------------------------------
    -- TBC DUNGEONS  (all 16)
    ---------------------------------------------------------------------------
    ["Hellfire Ramparts"]         = "mountain",
    ["The Blood Furnace"]         = "underground",
    ["The Shattered Halls"]       = "underground",
    ["The Slave Pens"]            = "swamp",
    ["The Underbog"]              = "swamp",
    ["The Steamvault"]            = "underground",
    ["Mana-Tombs"]                = "haunted",
    ["Auchenai Crypts"]           = "haunted",
    ["Sethekk Halls"]             = "haunted",
    ["Shadow Labyrinth"]          = "haunted",
    ["Old Hillsbrad Foothills"]   = "forest",
    ["The Black Morass"]          = "swamp",
    ["The Mechanar"]              = "underground",
    ["The Botanica"]              = "forest",
    ["The Arcatraz"]              = "underground",
    ["Magisters' Terrace"]        = "city",

    ---------------------------------------------------------------------------
    -- CLASSIC RAIDS  (all 8)
    ---------------------------------------------------------------------------
    ["Molten Core"]               = "underground",
    ["Blackwing Lair"]            = "underground",
    ["Temple of Ahn'Qiraj"]       = "desert",
    ["Ruins of Ahn'Qiraj"]        = "desert",
    ["Naxxramas"]                 = "haunted",
    ["Onyxia's Lair"]             = "underground",
    ["Zul'Gurub"]                 = "forest",

    ---------------------------------------------------------------------------
    -- TBC RAIDS  (all 9)
    ---------------------------------------------------------------------------
    ["Karazhan"]                  = "haunted",
    ["Gruul's Lair"]              = "underground",
    ["Magtheridon's Lair"]        = "underground",
    ["Serpentshrine Cavern"]      = "underground",
    ["Tempest Keep"]              = "underground",
    ["The Eye"]                   = "underground",
    ["Hyjal Summit"]              = "forest",
    ["Black Temple"]              = "haunted",
    ["Sunwell Plateau"]           = "haunted",
    ["Zul'Aman"]                  = "forest",

    ---------------------------------------------------------------------------
    -- BATTLEGROUNDS  (environment flavor for zone-themed banter)
    ---------------------------------------------------------------------------
    ["Warsong Gulch"]             = "forest",
    ["Arathi Basin"]              = "forest",
    ["Alterac Valley"]            = "snow",
    ["Eye of the Storm"]          = "mountain",
}

---------------------------------------------------------------------------
-- Refresh context  (called on zone change events)
---------------------------------------------------------------------------
local function Refresh()
    local zone = GetRealZoneText() or ""
    local sub  = GetSubZoneText() or ""
    current.zone    = zone
    current.subZone = sub

    -- 1. Instance check (most specific)
    local inInstance, iType = IsInInstance()
    if inInstance then
        if iType == "party" then
            current.location = "dungeon"
        elseif iType == "raid" then
            current.location = "raid"
        elseif iType == "pvp" or iType == "arena" then
            current.location = "battleground"
        else
            current.location = "dungeon"  -- fallback for unknown instance types
        end
    -- 2. City check
    elseif CITIES[zone] or CITIES[sub] then
        current.location = "city"
    -- 3. Open world
    else
        current.location = "world"
    end

    -- Environment: try instance name first, then zone, then subzone
    local instanceName = GetInstanceInfo and GetInstanceInfo() or ""
    current.environment = ZONE_ENV[instanceName]
                       or ZONE_ENV[zone]
                       or ZONE_ENV[sub]
                       or "generic"

    if ns.db and ns.db.debug then
        ns.Print(("Context: location=%s  zone=%s  env=%s"):format(
            current.location, current.zone, current.environment))
    end
end

---------------------------------------------------------------------------
-- Public API
---------------------------------------------------------------------------

--- Get the current location type.
-- @return string  "dungeon", "raid", "battleground", "city", or "world"
function ns.context.GetLocation()
    return current.location
end

--- Get the current zone name.
function ns.context.GetZone()
    return current.zone
end

--- Get the current environment/biome tag.
-- @return string  "forest", "desert", "snow", "underground", "coastal",
--                 "swamp", "mountain", "haunted", "city", or "generic"
function ns.context.GetEnvironment()
    return current.environment
end

--- Check if a context tag matches the current state.
-- Tags can be location types, environment types, or the special "any" tag.
-- @param tag string  The context tag to check.
-- @return boolean
function ns.context.Matches(tag)
    if tag == nil or tag == "any" then return true end
    tag = tag:lower()
    if tag == "any" then return true end
    -- Location match
    if tag == current.location then return true end
    -- Environment match
    if tag == current.environment then return true end
    -- Compound tag: "dungeon|haunted" means dungeon OR haunted
    if tag:find("|") then
        for piece in tag:gmatch("[^|]+") do
            piece = piece:match("^%s*(.-)%s*$")  -- trim
            if piece == current.location or piece == current.environment then
                return true
            end
        end
    end
    return false
end

--- Get a snapshot of all current context data.
function ns.context.GetAll()
    return {
        location    = current.location,
        zone        = current.zone,
        subZone     = current.subZone,
        environment = current.environment,
    }
end

---------------------------------------------------------------------------
-- Init — register zone-change events
---------------------------------------------------------------------------
function ns.context.Init()
    local f = CreateFrame("Frame")
    f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    f:RegisterEvent("ZONE_CHANGED")
    f:RegisterEvent("ZONE_CHANGED_INDOORS")
    f:RegisterEvent("PLAYER_ENTERING_WORLD")
    f:SetScript("OnEvent", Refresh)
    -- Initial snapshot
    Refresh()
end

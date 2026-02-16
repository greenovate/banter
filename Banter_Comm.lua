-- Banter_Comm.lua
-- Addon communication: peer discovery, scene coordination, CLAIM / LOCK flow.
local _, ns = ...

local comm   = ns.comm
local PREFIX = "BNTR"
local SEP    = "|"

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------
comm.peers       = {}      -- { ["Name"] = { persona, lastSeen } }
comm.activeScene = nil     -- current scene tracking table

-- Fairness: track recent response counts per player
local responseHistory    = {}    -- { ["Name"] = count }
local FAIRNESS_DECAY     = 300   -- seconds between decay ticks
local lastDecay          = 0

---------------------------------------------------------------------------
-- Internal helpers
---------------------------------------------------------------------------
local function GetChannel()
    if IsInRaid()  then return "RAID"  end
    if IsInGroup() then return "PARTY" end
    return nil
end

local function Send(msgType, data, channel)
    channel = channel or GetChannel()
    if not channel then return end
    local payload = data and (msgType .. SEP .. data) or msgType
    C_ChatInfo.SendAddonMessage(PREFIX, payload, channel)
    ns.Debug("SEND [" .. channel .. "]: " .. payload)
end

local function Parse(text)
    local parts = {}
    for p in text:gmatch("[^" .. SEP .. "]+") do table.insert(parts, p) end
    return parts
end

---------------------------------------------------------------------------
-- Leader determination  (deterministic: alphabetical sort of Banter users)
---------------------------------------------------------------------------
function comm.GetLeader()
    local names = { UnitName("player") }
    for name in pairs(comm.peers) do table.insert(names, name) end
    table.sort(names)
    return names[1]
end

function comm.AmLeader()
    return comm.GetLeader() == UnitName("player")
end

---------------------------------------------------------------------------
-- Public API
---------------------------------------------------------------------------
function comm.Init()
    C_ChatInfo.RegisterAddonMessagePrefix(PREFIX)
    comm.peers       = {}
    comm.activeScene = nil
end

function comm.GetPeerCount()
    local n = 0
    for _ in pairs(comm.peers) do n = n + 1 end
    return n
end

function comm.SendHello()
    Send("HELLO", ns.db and ns.db.persona or "PIRATE")
end

function comm.SendSceneStart(sceneId, trigger, contextStr)
    Send("SCENE_START", sceneId .. SEP .. trigger .. SEP .. (contextStr or ""))
end

function comm.SendClaim(sceneId)
    Send("CLAIM", sceneId)
end

function comm.SendSceneLock(sceneId, responderCSV)
    Send("SCENE_LOCK", sceneId .. SEP .. responderCSV)
end

---------------------------------------------------------------------------
-- Incoming message router
---------------------------------------------------------------------------
function comm.OnMessage(prefix, text, distribution, sender)
    if prefix ~= PREFIX then return end

    local myName     = UnitName("player")
    local senderName = sender:match("^([^-]+)") or sender
    if senderName == myName then return end

    local parts   = Parse(text)
    local msgType = parts[1]
    ns.Debug("RECV [" .. senderName .. "]: " .. text)

    if msgType == "HELLO" then
        comm.peers[senderName] = { persona = parts[2] or "UNKNOWN", lastSeen = GetTime() }
        Send("HERE", ns.db and ns.db.persona or "PIRATE")
        ns.Debug("Discovered peer: " .. senderName)

    elseif msgType == "HERE" then
        comm.peers[senderName] = { persona = parts[2] or "UNKNOWN", lastSeen = GetTime() }
        ns.Debug("Confirmed peer: " .. senderName)

    elseif msgType == "SCENE_START" then
        comm.HandleSceneStart(senderName, parts[2], parts[3], parts[4])

    elseif msgType == "CLAIM" then
        comm.HandleClaim(senderName, parts[2])

    elseif msgType == "SCENE_LOCK" then
        comm.HandleSceneLock(senderName, parts[2], parts[3])
    end
end

---------------------------------------------------------------------------
-- SCENE_START  (received from another player)
---------------------------------------------------------------------------
function comm.HandleSceneStart(sender, sceneId, trigger, contextStr)
    -- Ignore if already in a scene
    if comm.activeScene and (GetTime() - (comm.activeScene.startTime or 0)) < 30 then
        ns.Debug("Ignoring SCENE_START — already in a scene")
        return
    end

    -- Parse context string  ("key=val,key2=val2")
    local ctx = {}
    if contextStr then
        for kv in contextStr:gmatch("[^,]+") do
            local k, v = kv:match("^(.-)=(.+)$")
            if k and v then ctx[k] = v end
        end
    end

    comm.activeScene = {
        sceneId    = sceneId,
        trigger    = trigger,
        initiator  = sender,
        context    = ctx,
        claims     = {},
        locked     = false,
        responders = {},
        startTime  = GetTime(),
    }

    -- Should we claim a response slot?
    if ns.triggers.CanRespond() then
        local my   = responseHistory[UnitName("player")] or 0
        local avg  = 0
        local cnt  = 0
        for _, c in pairs(responseHistory) do avg = avg + c; cnt = cnt + 1 end
        avg = cnt > 0 and (avg / cnt) or 0

        if my <= avg + 1 or math.random() < 0.4 then
            comm.SendClaim(sceneId)
            ns.Debug("Sent CLAIM for " .. sceneId)
        else
            ns.Debug("Skipping claim (fairness: my=" .. my .. " avg=" .. string.format("%.1f", avg) .. ")")
        end
    end
end

---------------------------------------------------------------------------
-- CLAIM  (relevant only to the current leader)
---------------------------------------------------------------------------
function comm.HandleClaim(sender, sceneId)
    if not comm.activeScene or comm.activeScene.sceneId ~= sceneId then return end
    if comm.activeScene.locked then return end

    table.insert(comm.activeScene.claims, sender)

    if comm.AmLeader() then
        local mode = IsInRaid() and "RAID" or "PARTY"
        local cap  = ns.scenes.GetResponderCap(comm.activeScene.trigger, mode)

        if #comm.activeScene.claims >= cap then
            comm.LockScene()
        elseif not comm.activeScene.lockTimer then
            comm.activeScene.lockTimer = true
            C_Timer.After(2, function()
                if comm.activeScene and not comm.activeScene.locked then
                    comm.LockScene()
                end
            end)
        end
    end
end

---------------------------------------------------------------------------
-- Lock scene: pick responders from claimants, broadcast
---------------------------------------------------------------------------
function comm.LockScene()
    if not comm.activeScene or comm.activeScene.locked then return end

    local mode   = IsInRaid() and "RAID" or "PARTY"
    local cap    = ns.scenes.GetResponderCap(comm.activeScene.trigger, mode)
    local claims = comm.activeScene.claims

    -- Shuffle for fairness
    for i = #claims, 2, -1 do
        local j = math.random(1, i)
        claims[i], claims[j] = claims[j], claims[i]
    end

    local approved = {}
    for i = 1, math.min(cap, #claims) do
        table.insert(approved, claims[i])
    end

    comm.activeScene.locked     = true
    comm.activeScene.responders = approved

    local csv = table.concat(approved, ",")
    comm.SendSceneLock(comm.activeScene.sceneId, csv)
    ns.Debug("Locked scene — responders: " .. csv)
end

---------------------------------------------------------------------------
-- SCENE_LOCK  (received from leader)
---------------------------------------------------------------------------
function comm.HandleSceneLock(sender, sceneId, responderCSV)
    if not comm.activeScene or comm.activeScene.sceneId ~= sceneId then return end

    comm.activeScene.locked = true
    local responders = {}
    for name in (responderCSV or ""):gmatch("[^,]+") do
        table.insert(responders, strtrim(name))
    end
    comm.activeScene.responders = responders

    -- Am I approved?  Stagger responses so they read like a real conversation.
    local myName = UnitName("player")
    for idx, name in ipairs(responders) do
        if name == myName then
            -- Each approved responder gets a wider delay window offset by their slot
            local baseDelay = 2 + (idx - 1) * ns.RandBetween(3, 5)
            local jitter    = ns.RandBetween(1, 4)
            local delay     = baseDelay + jitter
            C_Timer.After(delay, function()
                ns.core.EmitResponse(comm.activeScene.trigger, comm.activeScene.context)
            end)
            responseHistory[myName] = (responseHistory[myName] or 0) + 1
            break
        end
    end

    -- Periodic fairness decay
    if (GetTime() - lastDecay) > FAIRNESS_DECAY then
        lastDecay = GetTime()
        for k, v in pairs(responseHistory) do
            responseHistory[k] = math.max(0, v - 1)
        end
    end
end

---------------------------------------------------------------------------
-- Peer cleanup  (called periodically or on roster change)
---------------------------------------------------------------------------
function comm.CleanupPeers()
    local now = GetTime()
    for name, data in pairs(comm.peers) do
        if (now - data.lastSeen) > 600 then comm.peers[name] = nil end
    end
end

---------------------------------------------------------------------------
-- Event frame
---------------------------------------------------------------------------
local commFrame = CreateFrame("Frame")
commFrame:RegisterEvent("CHAT_MSG_ADDON")
commFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
commFrame:SetScript("OnEvent", function(_, event, ...)
    if event == "CHAT_MSG_ADDON" then
        comm.OnMessage(...)
    elseif event == "GROUP_ROSTER_UPDATE" then
        if IsInGroup() then
            C_Timer.After(2, function()
                comm.SendHello()
                comm.CleanupPeers()
            end)
        else
            comm.peers       = {}
            comm.activeScene = nil
        end
    end
end)

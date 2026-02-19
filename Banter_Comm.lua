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

-- Heartbeat
local HEARTBEAT_INTERVAL = 30
local PEER_TIMEOUT       = 90    -- (was 600)
local lastHeartbeat      = 0

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
    local persona = ns.ResolvePersona and ns.ResolvePersona() or (ns.db and ns.db.persona or "WARRIOR")
    local actualClass = ns.playerClassKey or "WARRIOR"
    Send("HELLO", persona .. SEP .. actualClass)
end

function comm.SendSceneStart(sceneId, trigger, sourcePersona, contextStr)
    Send("SCENE_START", sceneId .. SEP .. trigger .. SEP .. (sourcePersona or "UNKNOWN") .. SEP .. (contextStr or ""))
end

function comm.SendClaim(sceneId)
    Send("CLAIM", sceneId)
end

function comm.SendSceneLock(sceneId, responderCSV)
    Send("SCENE_LOCK", sceneId .. SEP .. responderCSV)
end

---------------------------------------------------------------------------
-- Engagement protocol — directed persona-to-persona banter threads
---------------------------------------------------------------------------
function comm.SendEngageStart(threadKey, targetName)
    Send("ENGAGE_START", threadKey .. SEP .. targetName)
end

function comm.SendEngageReply(threadKey)
    Send("ENGAGE_REPLY", threadKey)
end

function comm.SendEngageFollowUp(threadKey)
    Send("ENGAGE_FOLLOWUP", threadKey)
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
        comm.peers[senderName] = { persona = parts[2] or "UNKNOWN", actualClass = parts[3] or "UNKNOWN", lastSeen = GetTime() }
        local persona = ns.ResolvePersona and ns.ResolvePersona() or (ns.db and ns.db.persona or "WARRIOR")
        local actualClass = ns.playerClassKey or "WARRIOR"
        Send("HERE", persona .. SEP .. actualClass)
        ns.Debug("Discovered peer: " .. senderName .. " (" .. (parts[2] or "?") .. "/" .. (parts[3] or "?") .. ")")

    elseif msgType == "HERE" then
        comm.peers[senderName] = { persona = parts[2] or "UNKNOWN", actualClass = parts[3] or "UNKNOWN", lastSeen = GetTime() }
        ns.Debug("Confirmed peer: " .. senderName .. " (" .. (parts[2] or "?") .. "/" .. (parts[3] or "?") .. ")")

    elseif msgType == "SCENE_START" then
        comm.HandleSceneStart(senderName, parts[2], parts[3], parts[4], parts[5])

    elseif msgType == "CLAIM" then
        comm.HandleClaim(senderName, parts[2])

    elseif msgType == "SCENE_LOCK" then
        comm.HandleSceneLock(senderName, parts[2], parts[3])

    elseif msgType == "ENGAGE_START" then
        comm.HandleEngageStart(senderName, parts[2], parts[3])

    elseif msgType == "ENGAGE_REPLY" then
        comm.HandleEngageReply(senderName, parts[2])

    elseif msgType == "ENGAGE_FOLLOWUP" then
        comm.HandleEngageFollowUp(senderName, parts[2])
    end
end

---------------------------------------------------------------------------
-- SCENE_START  (received from another player)
---------------------------------------------------------------------------
function comm.HandleSceneStart(sender, sceneId, trigger, sourcePersona, contextStr)
    -- Ignore if already in a scene  (reduced stale window to 30s → 20s)
    if comm.activeScene and (GetTime() - (comm.activeScene.startTime or 0)) < 20 then
        ns.Debug("Ignoring SCENE_START — already in a scene")
        return
    end

    -- Ignore duplicate SCENE_START within 5s window
    if comm.activeScene and comm.activeScene.sceneId == sceneId
       and (GetTime() - (comm.activeScene.startTime or 0)) < 5 then
        ns.Debug("Ignoring duplicate SCENE_START for " .. sceneId)
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
        sceneId       = sceneId,
        trigger       = trigger,
        initiator     = sender,
        sourcePersona = sourcePersona,
        context       = ctx,
        claims        = {},
        locked        = false,
        responders    = {},
        startTime     = GetTime(),
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
                if comm.activeScene then
                    ns.core.EmitResponse(comm.activeScene.trigger, comm.activeScene.context, comm.activeScene.sourcePersona)
                end
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
-- Engagement handlers — directed persona banter threads
---------------------------------------------------------------------------
comm.activeEngagement = nil  -- current engagement tracking

function comm.HandleEngageStart(sender, threadKey, targetName)
    local myName = UnitName("player")
    if targetName ~= myName then return end  -- not for us

    -- We're the target. Look up our response line.
    if not ns.engagements or not ns.engagements.GetThread then return end
    local thread = ns.engagements.GetThread(threadKey)
    if not thread or not thread.response then return end

    -- Suppress if we're already in a scene or engagement
    if comm.activeScene and (GetTime() - (comm.activeScene.startTime or 0)) < 20 then return end
    if comm.activeEngagement and (GetTime() - (comm.activeEngagement.startTime or 0)) < 20 then return end

    comm.activeEngagement = {
        threadKey = threadKey,
        initiator = sender,
        startTime = GetTime(),
    }

    -- Reply after natural delay
    local delay = ns.RandBetween(3, 6)
    C_Timer.After(delay, function()
        if not comm.activeEngagement then return end
        local line = thread.response
        line = line:gsub("{name}", sender)
        local channel = ns.core.GetOutputChannel()
        ns.core.SafeSend(line, channel)
        ns.Debug("ENGAGE REPLY: " .. line)
        comm.SendEngageReply(threadKey)
    end)
end

function comm.HandleEngageReply(sender, threadKey)
    -- We're the initiator and the target replied. Fire the follow-up if any.
    if not comm.activeEngagement or comm.activeEngagement.threadKey ~= threadKey then return end
    if comm.activeEngagement.initiator ~= UnitName("player") then return end

    local thread = ns.engagements.GetThread(threadKey)
    if not thread or not thread.followUp then
        comm.activeEngagement = nil
        return
    end

    local delay = ns.RandBetween(3, 6)
    C_Timer.After(delay, function()
        local line = thread.followUp
        line = line:gsub("{name}", sender)
        local channel = ns.core.GetOutputChannel()
        ns.core.SafeSend(line, channel)
        ns.Debug("ENGAGE FOLLOWUP: " .. line)
        comm.SendEngageFollowUp(threadKey)
        comm.activeEngagement = nil
    end)
end

function comm.HandleEngageFollowUp(sender, threadKey)
    -- Target receives the follow-up, clear engagement state
    if comm.activeEngagement and comm.activeEngagement.threadKey == threadKey then
        comm.activeEngagement = nil
    end
end

---------------------------------------------------------------------------
-- Peer cleanup  (called periodically or on roster change)
---------------------------------------------------------------------------
function comm.CleanupPeers()
    local now = GetTime()
    for name, data in pairs(comm.peers) do
        if (now - data.lastSeen) > PEER_TIMEOUT then
            ns.Debug("Peer timed out: " .. name)
            comm.peers[name] = nil
        end
    end

    -- Auto-clear stale scenes (>30s)
    if comm.activeScene and (now - (comm.activeScene.startTime or 0)) > 30 then
        ns.Debug("Stale scene cleared: " .. (comm.activeScene.sceneId or "?"))
        comm.activeScene = nil
    end
end

---------------------------------------------------------------------------
-- Heartbeat — periodic HELLO re-broadcast while in a group
---------------------------------------------------------------------------
local function DoHeartbeat()
    if not ns.initialized or not IsInGroup() then return end
    local now = GetTime()
    if (now - lastHeartbeat) >= HEARTBEAT_INTERVAL then
        lastHeartbeat = now
        comm.SendHello()
        comm.CleanupPeers()
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

-- Heartbeat on a ticker  (piggyback OnUpdate on the comm frame)
commFrame:SetScript("OnUpdate", function(_, elapsed)
    DoHeartbeat()
end)

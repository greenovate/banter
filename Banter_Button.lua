-- Banter_Button.lua
-- Floating "Banter Button" — click to manually trigger a contextual banter line.
-- When Manual Mode is ON, auto-triggers are suppressed but auto-responses to
-- other Banter users still fire.  The button has a 10-second visual cooldown.
local _, ns = ...

ns.button = {}

local BUTTON_SIZE     = 40
local COOLDOWN_SEC    = 10
local DRAG_THRESHOLD  = 5   -- pixels before a click becomes a drag

local btn, cdModel, cdText, lastFired, isDragging

---------------------------------------------------------------------------
-- Context-aware trigger selection
-- Picks the most relevant trigger based on what the player is doing.
---------------------------------------------------------------------------
local function PickContextualTrigger()
    -- On a flight path
    if UnitOnTaxi("player") then return "FLIGHT_PATH" end

    -- In combat
    if ns.triggers and ns.triggers.InCombat and ns.triggers.InCombat() then
        -- Target exists → MOB_KILL flavour, otherwise COMBAT_START
        if UnitExists("target") and UnitCanAttack("player", "target") then
            return "COMBAT_START"
        end
        return "COMBAT_START"
    end

    -- Inside an instance
    local inInstance, iType = IsInInstance()
    if inInstance and (iType == "party" or iType == "raid") then
        return "AMBIENT"
    end

    -- Solo or general group
    local mode = ns.core and ns.core.GetGroupMode and ns.core.GetGroupMode() or "SOLO"
    if mode == "SOLO" then
        return "AMBIENT"   -- routes through solo ambient path in Core
    end

    return "AMBIENT"
end

---------------------------------------------------------------------------
-- Fire banter on click
---------------------------------------------------------------------------
local function FireBanter()
    if not ns.initialized or not ns.db or not ns.db.enabled then
        ns.Print("Banter is disabled.")
        return
    end

    -- 10-second cooldown check
    local now = GetTime()
    if lastFired and (now - lastFired) < COOLDOWN_SEC then
        local remaining = math.ceil(COOLDOWN_SEC - (now - lastFired))
        ns.Debug("Button on cooldown (" .. remaining .. "s)")
        return
    end

    -- PvP instance suppression
    if ns.core.IsInPvPInstance() then
        ns.Print("Banter is suppressed in PvP instances.")
        return
    end

    local trigger = PickContextualTrigger()
    ns.Debug("Button pressed — trigger: " .. trigger)

    -- Call StartScene with the manual flag so it bypasses the normal RNG/cooldown
    ns.core.StartScene(trigger, { manualTrigger = true })

    -- Start cooldown visuals
    lastFired = GetTime()
    if cdModel then
        cdModel:SetCooldown(lastFired, COOLDOWN_SEC)
    end
end

---------------------------------------------------------------------------
-- Create the floating action button
---------------------------------------------------------------------------
function ns.button.Create()
    if btn then return btn end

    btn = CreateFrame("Button", "BanterActionButton", UIParent)
    btn:SetSize(BUTTON_SIZE, BUTTON_SIZE)
    btn:SetFrameStrata("MEDIUM")
    btn:SetFrameLevel(100)
    btn:SetClampedToScreen(true)
    btn:SetMovable(true)
    btn:RegisterForDrag("MiddleButton")
    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    -- Position from saved variables or default centre-bottom
    local posX = ns.db.buttonX or (GetScreenWidth() / 2)
    local posY = ns.db.buttonY or 140
    btn:SetPoint("CENTER", UIParent, "BOTTOMLEFT", posX, posY)

    -- Icon
    local bg = btn:CreateTexture(nil, "ARTWORK")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\AddOns\\Banter\\Textures\\BanterMinimapIcon")

    -- Simple gold border via ActionButton backdrop
    local border = btn:CreateTexture(nil, "OVERLAY")
    border:SetSize(BUTTON_SIZE + 2, BUTTON_SIZE + 2)
    border:SetPoint("CENTER")
    border:SetTexture("Interface\\Buttons\\UI-Quickslot2")

    -- Highlight on hover
    local highlight = btn:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints()
    highlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
    highlight:SetBlendMode("ADD")

    -- Cooldown overlay (standard WoW cooldown wheel)
    cdModel = CreateFrame("Cooldown", "BanterActionButtonCD", btn, "CooldownFrameTemplate")
    cdModel:SetAllPoints()
    cdModel:SetDrawEdge(true)
    cdModel:SetDrawBling(false)

    -- Cooldown text overlay
    cdText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    cdText:SetPoint("CENTER", 0, 0)
    cdText:SetText("")

    ---------------------------------------------------------------------------
    -- Drag handling: distinguish click from drag
    ---------------------------------------------------------------------------
    local dragStartX, dragStartY

    btn:SetScript("OnDragStart", function(self)
        local cx, cy = GetCursorPosition()
        dragStartX, dragStartY = cx, cy
        isDragging = false
        self:StartMoving()
    end)

    btn:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        -- Save position
        local x, y = self:GetCenter()
        ns.db.buttonX = x
        ns.db.buttonY = y

        -- Check if it was a drag or just a click
        local cx, cy = GetCursorPosition()
        local dx = math.abs(cx - (dragStartX or cx))
        local dy = math.abs(cy - (dragStartY or cy))
        isDragging = (dx > DRAG_THRESHOLD or dy > DRAG_THRESHOLD)
    end)

    btn:SetScript("OnClick", function(self, button)
        if isDragging then
            isDragging = false
            return
        end
        if button == "RightButton" then
            -- Right-click opens settings
            if ns.settings and ns.settings.Toggle then
                ns.settings.Toggle()
            end
        else
            FireBanter()
        end
    end)

    ---------------------------------------------------------------------------
    -- Tooltip
    ---------------------------------------------------------------------------
    btn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:AddLine("Banter", 1, 0.82, 0)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Left-click: Fire banter line", 1, 1, 1)
        GameTooltip:AddLine("Right-click: Open settings", 0.7, 0.7, 0.7)
        GameTooltip:AddLine("Middle-click drag to move", 0.7, 0.7, 0.7)
        if ns.db.manualMode then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("Manual Mode: ON", 0.3, 1, 0.3)
            GameTooltip:AddLine("Auto-triggers suppressed, responses still active.", 0.6, 0.6, 0.6)
        end
        -- Cooldown remaining
        if lastFired then
            local remaining = COOLDOWN_SEC - (GetTime() - lastFired)
            if remaining > 0 then
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine(string.format("Cooldown: %.0fs", remaining), 1, 0.3, 0.3)
            end
        end
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    ---------------------------------------------------------------------------
    -- Visibility: only show when Banter is enabled + button is toggled on
    ---------------------------------------------------------------------------
    ns.button.UpdateVisibility()

    return btn
end

---------------------------------------------------------------------------
-- Show / hide based on saved setting
---------------------------------------------------------------------------
function ns.button.UpdateVisibility()
    if not btn then return end
    if ns.db and ns.db.showButton then
        btn:Show()
    else
        btn:Hide()
    end
end

---------------------------------------------------------------------------
-- Slash command: /banter button
---------------------------------------------------------------------------
function ns.button.Toggle()
    if ns.db then
        ns.db.showButton = not ns.db.showButton
        ns.button.UpdateVisibility()
        ns.Print("Banter Button " .. (ns.db.showButton and "shown." or "hidden."))
    end
end

---------------------------------------------------------------------------
-- Init (called from Core.Init)
---------------------------------------------------------------------------
function ns.button.Init()
    ns.button.Create()
end

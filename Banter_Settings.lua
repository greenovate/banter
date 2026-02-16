-- Banter_Settings.lua
-- SavedVariables, defaults, GUI settings window, minimap button.
local _, ns = ...

local DEFAULTS = {
    enabled          = true,
    persona          = "PIRATE",   -- PIRATE | WARRIOR | NINJA | NEUTRAL
    outputChannel    = "AUTO",     -- AUTO | SAY | PARTY | RAID
    frequencyMin     = 25,         -- min seconds between scene starts
    frequencyMax     = 90,         -- max seconds between scene starts
    responseMin      = 20,         -- min seconds between responding
    responseMax      = 60,         -- max seconds between responding
    enableChatFilter = false,      -- persona chat filter on outgoing messages
    chatFilterChannels = { SAY = true, PARTY = true, RAID = true },
    debug            = false,
    minimapPos       = 195,        -- degrees around minimap
}

local PERSONA_LIST = { "PIRATE", "WARRIOR", "NINJA", "NEUTRAL" }
local CHANNEL_LIST = { "AUTO", "SAY", "PARTY", "RAID" }

---------------------------------------------------------------------------
-- Apply defaults to SavedVariables
---------------------------------------------------------------------------
local function ApplyDefaults(db)
    for k, v in pairs(DEFAULTS) do
        if db[k] == nil then
            if type(v) == "table" then
                db[k] = {}
                for kk, vv in pairs(v) do db[k][kk] = vv end
            else
                db[k] = v
            end
        elseif type(v) == "table" and type(db[k]) == "table" then
            -- Merge missing sub-keys into existing tables
            for kk, vv in pairs(v) do
                if db[k][kk] == nil then db[k][kk] = vv end
            end
        end
    end
end

---------------------------------------------------------------------------
-- Public API
---------------------------------------------------------------------------

function ns.settings.Init()
    BanterDB = BanterDB or {}
    ApplyDefaults(BanterDB)
    ns.db = BanterDB
end

function ns.settings.Get(key)
    if key then return ns.db and ns.db[key] end
    return ns.db
end

function ns.settings.Set(key, value)
    if ns.db then ns.db[key] = value end
end

---------------------------------------------------------------------------
-- Widget Helpers
---------------------------------------------------------------------------

local function MakeCheckbox(parent, name, x, y, label, dbKey)
    local cb = CreateFrame("CheckButton", name, parent, "UICheckButtonTemplate")
    cb:SetPoint("TOPLEFT", x, y)
    cb:SetSize(26, 26)
    local text = cb:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    text:SetPoint("LEFT", cb, "RIGHT", 6, 0)
    text:SetText(label)
    cb.label = text
    cb:SetChecked(ns.db[dbKey])
    cb:SetScript("OnClick", function(self)
        ns.db[dbKey] = self:GetChecked() and true or false
    end)
    return cb
end

local function MakeLabel(parent, x, y, text, template)
    local fs = parent:CreateFontString(nil, "ARTWORK", template or "GameFontNormal")
    fs:SetPoint("TOPLEFT", x, y)
    fs:SetText(text)
    return fs
end

local function MakeSlider(parent, name, x, y, label, lo, hi, step, dbKey)
    local lbl = MakeLabel(parent, x, y, label)

    local s = CreateFrame("Slider", name, parent, "OptionsSliderTemplate")
    s:SetPoint("TOPLEFT", x, y - 18)
    s:SetWidth(200)
    s:SetMinMaxValues(lo, hi)
    s:SetValueStep(step)
    s:SetObeyStepOnDrag(true)
    s:SetValue(ns.db[dbKey])
    s.Low:SetText(lo .. "s")
    s.High:SetText(hi .. "s")

    local valText = s:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    valText:SetPoint("TOP", s, "BOTTOM", 0, -2)
    valText:SetText(ns.db[dbKey] .. "s")

    s:SetScript("OnValueChanged", function(self, val)
        val = math.floor(val + 0.5)
        ns.db[dbKey] = val
        valText:SetText(val .. "s")
    end)

    return s
end

local function MakeDropdown(parent, name, x, y, label, options, dbKey)
    MakeLabel(parent, x, y, label)

    local dd = CreateFrame("Frame", name, parent, "UIDropDownMenuTemplate")
    dd:SetPoint("TOPLEFT", x - 16, y - 16)

    local function OnClick(self)
        ns.db[dbKey] = self.value
        UIDropDownMenu_SetText(dd, self.value)
    end

    UIDropDownMenu_SetWidth(dd, 140)
    UIDropDownMenu_SetText(dd, ns.db[dbKey])
    UIDropDownMenu_Initialize(dd, function(self, level)
        for _, opt in ipairs(options) do
            local info = UIDropDownMenu_CreateInfo()
            info.text   = opt
            info.value  = opt
            info.func   = OnClick
            info.checked = (ns.db[dbKey] == opt)
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    return dd
end

---------------------------------------------------------------------------
-- Main Settings Frame
---------------------------------------------------------------------------
local frame

local function CreateSettingsFrame()
    if frame then return frame end

    frame = CreateFrame("Frame", "BanterSettingsFrame", UIParent, "BackdropTemplate")
    frame:SetSize(420, 520)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetFrameStrata("DIALOG")
    frame:SetClampedToScreen(true)

    frame:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tile     = true, tileSize = 32, edgeSize = 32,
        insets   = { left = 8, right = 8, top = 8, bottom = 8 },
    })
    frame:SetBackdropColor(0.05, 0.05, 0.08, 0.95)

    -- Title bar
    local titleBg = frame:CreateTexture(nil, "ARTWORK")
    titleBg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    titleBg:SetSize(280, 64)
    titleBg:SetPoint("TOP", 0, 12)

    local titleText = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    titleText:SetPoint("TOP", 0, -2)
    titleText:SetText("Banter v" .. ns.version)

    -- Close button
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -4, -4)

    -- ═══════════════════════════════════════════════════════════════
    -- Content
    -- ═══════════════════════════════════════════════════════════════
    local LEFT = 24

    -- Enable checkbox
    MakeCheckbox(frame, "BanterCB_Enable", LEFT, -40, "Enable Banter", "enabled")

    -- Persona dropdown
    MakeDropdown(frame, "BanterDD_Persona", LEFT, -80, "Persona", PERSONA_LIST, "persona")

    -- Output channel dropdown
    MakeDropdown(frame, "BanterDD_Channel", LEFT, -140, "Output Channel", CHANNEL_LIST, "outputChannel")

    -- Frequency sliders
    MakeLabel(frame, LEFT, -204, "Scene Frequency", "GameFontNormalLarge")

    MakeSlider(frame, "BanterSlider_FreqMin", LEFT, -228, "Min Delay",
               10, 120, 5, "frequencyMin")

    MakeSlider(frame, "BanterSlider_FreqMax", LEFT + 220, -228, "Max Delay",
               20, 300, 5, "frequencyMax")

    -- Response sliders
    MakeLabel(frame, LEFT, -296, "Response Timing", "GameFontNormalLarge")

    MakeSlider(frame, "BanterSlider_RespMin", LEFT, -320, "Min Delay",
               5, 60, 5, "responseMin")

    MakeSlider(frame, "BanterSlider_RespMax", LEFT + 220, -320, "Max Delay",
               10, 120, 5, "responseMax")

    -- Chat filter section
    MakeLabel(frame, LEFT, -388, "Chat Filter", "GameFontNormalLarge")

    MakeCheckbox(frame, "BanterCB_Filter", LEFT, -406,
                 "Transform outgoing chat in persona voice", "enableChatFilter")

    -- Debug
    MakeCheckbox(frame, "BanterCB_Debug", LEFT, -446,
                 "Debug Mode (verbose logging)", "debug")

    -- Credits
    local credit = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    credit:SetPoint("BOTTOM", 0, 28)
    credit:SetTextColor(0.6, 0.6, 0.6)
    credit:SetText("Made by evild \"Iowke\" on Dreamweaver  |  github.com/greenovate/banter")

    -- Footer
    local footer = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    footer:SetPoint("BOTTOM", 0, 14)
    footer:SetTextColor(0.5, 0.5, 0.5)
    footer:SetText("/banter — toggle this window  |  /banter help — chat commands")

    frame:Hide()
    tinsert(UISpecialFrames, "BanterSettingsFrame")
    return frame
end

function ns.settings.Toggle()
    local f = CreateSettingsFrame()
    if f:IsShown() then f:Hide() else f:Show() end
end

---------------------------------------------------------------------------
-- Minimap Button
---------------------------------------------------------------------------
local function CreateMinimapButton()
    local btn = CreateFrame("Button", "BanterMinimapButton", Minimap)
    btn:SetSize(32, 32)
    btn:SetFrameStrata("MEDIUM")
    btn:SetFrameLevel(8)
    btn:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

    local icon = btn:CreateTexture(nil, "BACKGROUND")
    icon:SetSize(20, 20)
    icon:SetPoint("TOPLEFT", 7, -5)
    icon:SetTexture("Interface\\Icons\\Spell_Holy_Silence")

    local border = btn:CreateTexture(nil, "OVERLAY")
    border:SetSize(53, 53)
    border:SetPoint("TOPLEFT", 0, 0)
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")

    local function UpdatePosition()
        local angle = math.rad(ns.db.minimapPos or 195)
        local x = 80 * math.cos(angle)
        local y = 80 * math.sin(angle)
        btn:SetPoint("CENTER", Minimap, "CENTER", x, y)
    end

    btn:RegisterForDrag("LeftButton")
    btn:SetScript("OnDragStart", function()
        btn:SetScript("OnUpdate", function()
            local mx, my = Minimap:GetCenter()
            local cx, cy = GetCursorPosition()
            local scale = Minimap:GetEffectiveScale()
            cx, cy = cx / scale, cy / scale
            ns.db.minimapPos = math.deg(math.atan2(cy - my, cx - mx))
            UpdatePosition()
        end)
    end)
    btn:SetScript("OnDragStop", function()
        btn:SetScript("OnUpdate", nil)
    end)

    btn:SetScript("OnClick", function() ns.settings.Toggle() end)

    btn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("Banter")
        GameTooltip:AddLine("Click to open settings", 1, 1, 1)
        GameTooltip:AddLine("Drag to move", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    UpdatePosition()
end

---------------------------------------------------------------------------
-- Options panel creator (called from Core.Init)
---------------------------------------------------------------------------
function ns.settings.CreateOptionsPanel()
    CreateSettingsFrame()
    CreateMinimapButton()
end

---------------------------------------------------------------------------
-- Slash command  — /banter opens GUI, subcommands still work
---------------------------------------------------------------------------
SLASH_BANTER1 = "/banter"
SlashCmdList["BANTER"] = function(input)
    local cmd = strtrim(input):lower()

    -- No args or "config"/"settings"/"options" → open GUI
    if cmd == "" or cmd == "config" or cmd == "settings" or cmd == "options" then
        ns.settings.Toggle()
        return
    end

    if cmd == "help" then
        ns.Print("Commands:")
        ns.Print("  /banter  — open settings window")
        ns.Print("  /banter on|off  — enable / disable")
        ns.Print("  /banter persona pirate|warrior|ninja|neutral")
        ns.Print("  /banter filter on|off  — persona chat filter")
        ns.Print("  /banter freq <min> <max>  — scene frequency (seconds)")
        ns.Print("  /banter status  — show current settings")
        ns.Print("  /banter debug  — toggle debug mode")
        return
    end

    if cmd == "on" then
        ns.db.enabled = true
        ns.Print("Enabled.")
    elseif cmd == "off" then
        ns.db.enabled = false
        ns.Print("Disabled.")
    elseif cmd:match("^persona") then
        local p = cmd:match("^persona%s+(%a+)")
        if p then
            p = p:upper()
            if ns.personas[p] then
                ns.db.persona = p
                ns.Print("Persona set to " .. p .. ".")
            else
                ns.Print("Unknown persona. Options: pirate, warrior, ninja, neutral")
            end
        else
            ns.Print("Current persona: " .. (ns.db.persona or "?"))
        end
    elseif cmd:match("^filter") then
        local toggle = cmd:match("^filter%s+(%a+)")
        if toggle == "on" then
            ns.db.enableChatFilter = true
            ns.Print("Chat filter enabled.")
        elseif toggle == "off" then
            ns.db.enableChatFilter = false
            ns.Print("Chat filter disabled.")
        else
            ns.Print("Chat filter: " .. (ns.db.enableChatFilter and "ON" or "OFF"))
        end
    elseif cmd:match("^freq") then
        local lo, hi = cmd:match("^freq%s+(%d+)%s+(%d+)")
        if lo and hi then
            lo, hi = tonumber(lo), tonumber(hi)
            if lo >= 10 and hi >= lo and hi <= 300 then
                ns.db.frequencyMin = lo
                ns.db.frequencyMax = hi
                ns.Print("Frequency set to " .. lo .. "–" .. hi .. "s.")
            else
                ns.Print("Invalid range. Min >= 10, Max >= Min, Max <= 300.")
            end
        else
            ns.Print("Frequency: " .. ns.db.frequencyMin .. "–" .. ns.db.frequencyMax .. "s")
        end
    elseif cmd == "status" then
        ns.Print("Enabled: "   .. (ns.db.enabled and "YES" or "NO"))
        ns.Print("Persona: "   .. ns.db.persona)
        ns.Print("Frequency: " .. ns.db.frequencyMin .. "–" .. ns.db.frequencyMax .. "s")
        ns.Print("Response: "  .. ns.db.responseMin  .. "–" .. ns.db.responseMax  .. "s")
        ns.Print("Chat filter: " .. (ns.db.enableChatFilter and "ON" or "OFF"))
        ns.Print("Debug: "     .. (ns.db.debug and "ON" or "OFF"))
        ns.Print("Banter peers: " .. ns.comm.GetPeerCount())
    elseif cmd == "debug" then
        ns.db.debug = not ns.db.debug
        ns.Print("Debug " .. (ns.db.debug and "ON" or "OFF"))
    else
        ns.Print("Unknown command. Type /banter help")
    end
end

-- Banter_Settings.lua
-- SavedVariables, defaults, tabbed GUI settings window, minimap button.
local _, ns = ...

local DEFAULTS = {
    enabled          = true,
    persona          = "AUTO",
    roastMode        = false,
    selfPromo        = true,
    soloMode         = false,
    enableChatFilter = false,
    chatFilterChannels = { SAY = true, PARTY = true, RAID = true },
    debug            = false,
    minimapPos       = 195,
    -- Per-mode settings
    group = {
        channel      = "AUTO",
        chattiness   = 5,
        frequencyMin = 25,
        frequencyMax = 90,
        responseMin  = 20,
        responseMax  = 60,
    },
    raid = {
        enabled      = true,
        channel      = "AUTO",
        chattiness   = 5,
        frequencyMin = 25,
        frequencyMax = 90,
        responseMin  = 20,
        responseMax  = 60,
    },
    solo = {
        chattiness   = 5,
        frequencyMin = 30,
        frequencyMax = 120,
    },
}

-- Build persona list: "AUTO" + 9 class personas + novelty
local PERSONA_LIST = { "AUTO" }
for _, cls in ipairs(ns.CLASS_PERSONAS)   do table.insert(PERSONA_LIST, cls) end
for _, nov in ipairs(ns.NOVELTY_PERSONAS) do table.insert(PERSONA_LIST, nov) end

local GROUP_CHANNEL_LIST = { "AUTO", "PARTY", "SAY", "EMOTE" }
local RAID_CHANNEL_LIST  = { "AUTO", "RAID", "RAID_WARNING", "SAY", "EMOTE" }

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
-- Migrate pre-tab settings -> per-mode sub-tables
---------------------------------------------------------------------------
local function MigrateV1(db)
    if db._settingsVersion then return end
    local c    = db.chattiness   or 5
    local fmin = db.frequencyMin or 25
    local fmax = db.frequencyMax or 90
    local rmin = db.responseMin  or 20
    local rmax = db.responseMax  or 60

    db.group = db.group or {}
    db.raid  = db.raid  or {}
    db.solo  = db.solo  or {}

    local function sn(t, k, v) if t[k] == nil then t[k] = v end end

    sn(db.group, "chattiness",   c)
    sn(db.group, "frequencyMin", fmin)
    sn(db.group, "frequencyMax", fmax)
    sn(db.group, "responseMin",  rmin)
    sn(db.group, "responseMax",  rmax)

    sn(db.raid, "chattiness",   c)
    sn(db.raid, "frequencyMin", fmin)
    sn(db.raid, "frequencyMax", fmax)
    sn(db.raid, "responseMin",  rmin)
    sn(db.raid, "responseMax",  rmax)
    if db.disableInRaids ~= nil then
        sn(db.raid, "enabled", not db.disableInRaids)
    end

    sn(db.solo, "chattiness",   c)
    sn(db.solo, "frequencyMin", fmin)
    sn(db.solo, "frequencyMax", fmax)

    -- Migrate global outputChannel → per-mode channel
    if db.outputChannel then
        local ch = db.outputChannel
        if ch ~= "AUTO" then
            sn(db.group, "channel", ch)
            sn(db.raid,  "channel", ch)
        end
        db.outputChannel = nil
    end

    db._settingsVersion = 2
end

---------------------------------------------------------------------------
-- Public API
---------------------------------------------------------------------------

function ns.settings.Init()
    BanterDB = BanterDB or {}
    MigrateV1(BanterDB)
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

--- Returns the per-mode settings table for the current group mode.
function ns.settings.GetModeSettings()
    if not ns.db then return {} end
    local mode = ns.core and ns.core.GetGroupMode and ns.core.GetGroupMode() or "PARTY"
    if mode == "RAID"  then return ns.db.raid  or {} end
    if mode == "SOLO"  then return ns.db.solo  or {} end
    return ns.db.group or {}
end

---------------------------------------------------------------------------
-- Widget Helpers  (generic: pass table + key)
---------------------------------------------------------------------------

local function MakeLabel(parent, x, y, text, template)
    local fs = parent:CreateFontString(nil, "ARTWORK", template or "GameFontNormal")
    fs:SetPoint("TOPLEFT", x, y)
    fs:SetText(text)
    return fs
end

local function MakeCheckbox(parent, name, x, y, label, tbl, key)
    local cb = CreateFrame("CheckButton", name, parent, "UICheckButtonTemplate")
    cb:SetPoint("TOPLEFT", x, y)
    cb:SetSize(26, 26)
    local text = cb:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    text:SetPoint("LEFT", cb, "RIGHT", 6, 0)
    text:SetText(label)
    cb.label = text
    cb:SetChecked(tbl[key])
    cb:SetScript("OnClick", function(self)
        tbl[key] = self:GetChecked() and true or false
    end)
    return cb
end

local function AddSliderTrack(s)
    local bg = s:CreateTexture(nil, "BACKGROUND")
    bg:SetColorTexture(0.15, 0.15, 0.15, 0.8)
    bg:SetHeight(8)
    bg:SetPoint("LEFT", 0, 0)
    bg:SetPoint("RIGHT", 0, 0)
    local border = s:CreateTexture(nil, "BORDER")
    border:SetColorTexture(0.4, 0.4, 0.4, 0.6)
    border:SetHeight(1)
    border:SetPoint("TOPLEFT", bg, "TOPLEFT", 0, 0)
    border:SetPoint("TOPRIGHT", bg, "TOPRIGHT", 0, 0)
    local border2 = s:CreateTexture(nil, "BORDER")
    border2:SetColorTexture(0.4, 0.4, 0.4, 0.6)
    border2:SetHeight(1)
    border2:SetPoint("BOTTOMLEFT", bg, "BOTTOMLEFT", 0, 0)
    border2:SetPoint("BOTTOMRIGHT", bg, "BOTTOMRIGHT", 0, 0)
end

local sliderID = 0
local function MakeSlider(parent, x, y, label, lo, hi, step, tbl, key)
    sliderID = sliderID + 1
    MakeLabel(parent, x, y, label)
    local s = CreateFrame("Slider", "BanterSlider" .. sliderID, parent, "OptionsSliderTemplate")
    s:SetPoint("TOPLEFT", x, y - 18)
    s:SetWidth(170)
    AddSliderTrack(s)
    s:SetMinMaxValues(lo, hi)
    s:SetValueStep(step)
    s:SetObeyStepOnDrag(true)
    s:SetValue(tbl[key] or lo)
    s.Low:SetText(lo .. "s")
    s.High:SetText(hi .. "s")
    local valText = s:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    valText:SetPoint("TOP", s, "BOTTOM", 0, -2)
    valText:SetText((tbl[key] or lo) .. "s")
    s:SetScript("OnValueChanged", function(self, val)
        val = math.floor(val + 0.5)
        tbl[key] = val
        valText:SetText(val .. "s")
    end)
    return s
end

local ddID = 0
local function MakeDropdown(parent, x, y, label, options, tbl, key)
    ddID = ddID + 1
    MakeLabel(parent, x, y, label)
    local dd = CreateFrame("Frame", "BanterDD" .. ddID, parent, "UIDropDownMenuTemplate")
    dd:SetPoint("TOPLEFT", x - 16, y - 16)
    local function OnClick(self)
        tbl[key] = self.value
        UIDropDownMenu_SetText(dd, self.value)
    end
    UIDropDownMenu_SetWidth(dd, 140)
    UIDropDownMenu_SetText(dd, tbl[key])
    UIDropDownMenu_Initialize(dd, function(self, level)
        for _, opt in ipairs(options) do
            local info = UIDropDownMenu_CreateInfo()
            info.text   = opt
            info.value  = opt
            info.func   = OnClick
            info.checked = (tbl[key] == opt)
            UIDropDownMenu_AddButton(info, level)
        end
    end)
    return dd
end

---------------------------------------------------------------------------
-- Frequency panel builder  (shared by Group / Raid / Solo tabs)
---------------------------------------------------------------------------
local function MakeFrequencyControls(panel, modeDB, startY, includeResponse)
    local LEFT = 16
    local y = startY

    MakeLabel(panel, LEFT, y, "Chattiness", "GameFontNormalLarge")
    do
        sliderID = sliderID + 1
        local s = CreateFrame("Slider", "BanterSlider" .. sliderID, panel, "OptionsSliderTemplate")
        s:SetPoint("TOPLEFT", LEFT, y - 18)
        s:SetWidth(200)
        AddSliderTrack(s)
        s:SetMinMaxValues(1, 10)
        s:SetValueStep(1)
        s:SetObeyStepOnDrag(true)
        s:SetValue(modeDB.chattiness or 5)
        s.Low:SetText("1 (Shy)")
        s.High:SetText("10 (Loud)")
        local vt = s:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        vt:SetPoint("TOP", s, "BOTTOM", 0, -2)
        vt:SetText(modeDB.chattiness or 5)
        s:SetScript("OnValueChanged", function(self, val)
            val = math.floor(val + 0.5)
            modeDB.chattiness = val
            vt:SetText(val)
        end)
    end
    y = y - 60

    MakeLabel(panel, LEFT, y, "Scene Frequency", "GameFontNormalLarge")
    MakeSlider(panel, LEFT, y - 24, "Min Delay", 10, 120, 5, modeDB, "frequencyMin")
    MakeSlider(panel, LEFT + 200, y - 24, "Max Delay", 20, 300, 5, modeDB, "frequencyMax")
    y = y - 95

    if includeResponse then
        MakeLabel(panel, LEFT, y, "Response Timing", "GameFontNormalLarge")
        MakeSlider(panel, LEFT, y - 24, "Min Delay", 5, 60, 5, modeDB, "responseMin")
        MakeSlider(panel, LEFT + 200, y - 24, "Max Delay", 10, 120, 5, modeDB, "responseMax")
    end
end

---------------------------------------------------------------------------
-- "Coming Soon" stub for PVP tabs
---------------------------------------------------------------------------
local function MakeComingSoon(panel, desc)
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalHuge")
    title:SetPoint("CENTER", 0, 20)
    title:SetText("Coming Soon")
    title:SetTextColor(0.5, 0.5, 0.5)
    local sub = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    sub:SetPoint("CENTER", 0, -10)
    sub:SetText(desc)
    sub:SetTextColor(0.6, 0.6, 0.6)
end

---------------------------------------------------------------------------
-- Tab system
---------------------------------------------------------------------------
local TAB_DEFS = {
    { key = "general", label = "General" },
    { key = "group",   label = "Group" },
    { key = "raid",    label = "Raid" },
    { key = "solo",    label = "Solo" },
    { key = "pvpbg",   label = "PVP BG" },
    { key = "arena",   label = "Arenas" },
}

local tabButtons = {}
local tabPanels  = {}

local function SelectTab(key)
    for _, def in ipairs(TAB_DEFS) do
        local btn   = tabButtons[def.key]
        local panel = tabPanels[def.key]
        if def.key == key then
            btn.text:SetTextColor(1, 0.82, 0, 1)
            btn.underline:Show()
            if panel then panel:Show() end
        else
            btn.text:SetTextColor(0.6, 0.6, 0.6, 1)
            btn.underline:Hide()
            if panel then panel:Hide() end
        end
    end
end

---------------------------------------------------------------------------
-- Main Settings Frame  (tabbed)
---------------------------------------------------------------------------
local frame

local function CreateSettingsFrame()
    if frame then return frame end

    frame = CreateFrame("Frame", "BanterSettingsFrame", UIParent, "BackdropTemplate")
    frame:SetSize(420, 620)
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

    -- Banner
    local banner = frame:CreateTexture(nil, "ARTWORK")
    banner:SetTexture("Interface\\AddOns\\Banter\\Textures\\BanterSettingsBanner")
    banner:SetSize(404, 101)
    banner:SetPoint("TOP", 0, -8)

    local titleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    titleText:SetPoint("TOP", 0, -100)
    titleText:SetText("v" .. ns.version)

    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -4, -4)

    -- ═══════════════════════════════════════════════════════════════
    -- Tab bar
    -- ═══════════════════════════════════════════════════════════════
    local TAB_Y = -118
    local TAB_H = 26
    local tabX  = 14

    for _, def in ipairs(TAB_DEFS) do
        local btn = CreateFrame("Button", nil, frame)
        local w   = def.label:len() * 7 + 16
        btn:SetSize(w, TAB_H)
        btn:SetPoint("TOPLEFT", tabX, TAB_Y)
        tabX = tabX + w + 2

        local text = btn:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
        text:SetPoint("CENTER", 0, 1)
        text:SetText(def.label)
        btn.text = text

        local underline = btn:CreateTexture(nil, "ARTWORK")
        underline:SetColorTexture(1, 0.82, 0, 1)
        underline:SetSize(w - 4, 2)
        underline:SetPoint("BOTTOM", 0, 0)
        underline:Hide()
        btn.underline = underline

        btn:SetScript("OnClick", function() SelectTab(def.key) end)
        btn:SetScript("OnEnter", function()
            if not btn.underline:IsShown() then
                btn.text:SetTextColor(0.9, 0.9, 0.9, 1)
            end
        end)
        btn:SetScript("OnLeave", function()
            if not btn.underline:IsShown() then
                btn.text:SetTextColor(0.6, 0.6, 0.6, 1)
            end
        end)

        tabButtons[def.key] = btn
    end

    -- Separator
    local sep = frame:CreateTexture(nil, "ARTWORK")
    sep:SetColorTexture(0.4, 0.4, 0.4, 0.5)
    sep:SetSize(396, 1)
    sep:SetPoint("TOP", 0, TAB_Y - TAB_H - 2)

    -- ═══════════════════════════════════════════════════════════════
    -- Content panels  (one per tab, shown/hidden)
    -- ═══════════════════════════════════════════════════════════════
    local CONTENT_TOP = TAB_Y - TAB_H - 8

    for _, def in ipairs(TAB_DEFS) do
        local panel = CreateFrame("Frame", nil, frame)
        panel:SetPoint("TOPLEFT", 8, CONTENT_TOP)
        panel:SetPoint("BOTTOMRIGHT", -8, 58)
        panel:Hide()
        tabPanels[def.key] = panel
    end

    -- ── General ──────────────────────────────────────────
    do
        local p = tabPanels.general
        local LEFT = 16
        local y = -8

        MakeCheckbox(p, "BanterCB_Enable", LEFT, y,
                     "Enable Banter", ns.db, "enabled")
        y = y - 40

        MakeDropdown(p, LEFT, y, "Persona", PERSONA_LIST, ns.db, "persona")
        y = y - 60

        MakeLabel(p, LEFT, y, "Options", "GameFontNormalLarge")
        y = y - 24

        MakeCheckbox(p, "BanterCB_Filter", LEFT, y,
                     "Transform outgoing chat in persona voice",
                     ns.db, "enableChatFilter")
        y = y - 28

        MakeCheckbox(p, "BanterCB_Roast", LEFT, y,
                     "Roast Mode — stat-based player callouts",
                     ns.db, "roastMode")
        y = y - 28

        MakeCheckbox(p, "BanterCB_Promo", LEFT, y,
                     "Self-promo — respond to \"what addon?\" questions",
                     ns.db, "selfPromo")
        y = y - 28

        MakeCheckbox(p, "BanterCB_Debug", LEFT, y,
                     "Debug Mode (verbose logging)", ns.db, "debug")
    end

    -- ── Group ────────────────────────────────────────────
    do
        local p = tabPanels.group
        local info = p:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        info:SetPoint("TOPLEFT", 16, -8)
        info:SetText("Settings for party play (2–5 players).")
        info:SetTextColor(0.7, 0.7, 0.7)
        MakeDropdown(p, 16, -30, "Output Channel", GROUP_CHANNEL_LIST,
                     ns.db.group, "channel")
        MakeFrequencyControls(p, ns.db.group, -90, true)
    end

    -- ── Raid ─────────────────────────────────────────────
    do
        local p = tabPanels.raid
        MakeCheckbox(p, "BanterCB_RaidEn", 16, -8,
                     "Enable banter in raids", ns.db.raid, "enabled")
        local info = p:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        info:SetPoint("TOPLEFT", 16, -38)
        info:SetText("Frequency settings for raid groups (6–40 players).")
        info:SetTextColor(0.7, 0.7, 0.7)
        MakeDropdown(p, 16, -58, "Output Channel", RAID_CHANNEL_LIST,
                     ns.db.raid, "channel")
        MakeFrequencyControls(p, ns.db.raid, -120, true)
    end

    -- ── Solo ─────────────────────────────────────────────
    do
        local p = tabPanels.solo
        MakeCheckbox(p, "BanterCB_Solo", 16, -8,
                     "Enable Solo Mode", ns.db, "soloMode")
        local info = p:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        info:SetPoint("TOPLEFT", 16, -38)
        info:SetText("Uses /me emotes with persona-flavoured inner monologue\nwhile you're adventuring alone.")
        info:SetTextColor(0.7, 0.7, 0.7)
        local chNote = p:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        chNote:SetPoint("TOPLEFT", 16, -64)
        chNote:SetText("Output channel: |cff888888/emote (locked — WoW restricts chat channels when solo)|r")
        MakeFrequencyControls(p, ns.db.solo, -86, false)
    end

    -- ── PVP BG ───────────────────────────────────────────
    MakeComingSoon(tabPanels.pvpbg,
                   "PVP Battleground-specific banter is in development.")

    -- ── Arenas ───────────────────────────────────────────
    MakeComingSoon(tabPanels.arena,
                   "PVP Arena-specific banter is in development.")

    -- ═══════════════════════════════════════════════════════════════
    -- Footer  (persistent across all tabs)
    -- ═══════════════════════════════════════════════════════════════
    local whatsNewBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    whatsNewBtn:SetSize(120, 24)
    whatsNewBtn:SetPoint("BOTTOMLEFT", 24, 36)
    whatsNewBtn:SetText("What's New")
    whatsNewBtn:SetScript("OnClick", function()
        if ns.ShowChangelog then ns.ShowChangelog(true) end
    end)

    local credit = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    credit:SetPoint("BOTTOM", 0, 22)
    credit:SetTextColor(0.6, 0.6, 0.6)
    credit:SetText("Made by evild \"Iowke\" on Dreamweaver  |  curseforge.com/wow/addons/banter")

    local footer = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    footer:SetPoint("BOTTOM", 0, 10)
    footer:SetTextColor(0.5, 0.5, 0.5)
    footer:SetText("/banter — toggle this window  |  /banter help — chat commands")

    SelectTab("general")

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
    icon:SetTexture("Interface\\AddOns\\Banter\\Textures\\BanterMinimapIcon")

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
        ns.Print("  /banter persona auto|warrior|mage|...")
        ns.Print("  /banter filter on|off  — persona chat filter")
        ns.Print("  /banter freq <min> <max>  — scene frequency (current mode)")
        ns.Print("  /banter chattiness <1-10>  — chattiness (current mode)")
        ns.Print("  /banter solo on|off  — solo /me inner monologue")
        ns.Print("  /banter roast on|off  — stat-based player callouts")
        ns.Print("  /banter promo on|off  — self-promotion responses")
        ns.Print("  /banter reset  — reset session stats")
        ns.Print("  /banter changelog  — show version changelog")
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
            if p == "AUTO" or ns.personas[p] then
                ns.db.persona = p
                local display = p
                if p == "AUTO" then display = "AUTO (" .. (ns.playerClassKey or "?") .. ")" end
                ns.Print("Persona set to " .. display .. ".")
            else
                ns.Print("Unknown persona. Options: auto, warrior, mage, warlock, priest, rogue, hunter, druid, paladin, shaman, pirate")
            end
        else
            local active = ns.ResolvePersona()
            ns.Print("Current persona: " .. ns.db.persona .. " (active: " .. active .. ")")
        end
    elseif cmd:match("^chattiness") then
        local val = cmd:match("^chattiness%s+(%d+)")
        local ms = ns.settings.GetModeSettings()
        if val then
            val = tonumber(val)
            if val >= 1 and val <= 10 then
                ms.chattiness = val
                local mode = ns.core.GetGroupMode()
                ns.Print("Chattiness set to " .. val .. " (" .. mode:lower() .. ").")
            else
                ns.Print("Chattiness must be 1–10.")
            end
        else
            ns.Print("Chattiness: " .. (ms.chattiness or 5))
        end
    elseif cmd:match("^solo") then
        local toggle = cmd:match("^solo%s+(%a+)")
        if toggle == "on" then
            ns.db.soloMode = true
            ns.Print("Solo Mode enabled. Inner monologue activated.")
        elseif toggle == "off" then
            ns.db.soloMode = false
            ns.Print("Solo Mode disabled.")
        else
            ns.Print("Solo Mode: " .. (ns.db.soloMode and "ON" or "OFF"))
        end
    elseif cmd:match("^roast") then
        local toggle = cmd:match("^roast%s+(%a+)")
        if toggle == "on" then
            ns.db.roastMode = true
            ns.Print("Roast Mode enabled. Gloves off.")
        elseif toggle == "off" then
            ns.db.roastMode = false
            ns.Print("Roast Mode disabled. Safe space restored.")
        else
            ns.Print("Roast Mode: " .. (ns.db.roastMode and "ON" or "OFF"))
        end
    elseif cmd:match("^promo") then
        local toggle = cmd:match("^promo%s+(%a+)")
        if toggle == "on" then
            ns.db.selfPromo = true
            ns.Print("Self-promo enabled.")
        elseif toggle == "off" then
            ns.db.selfPromo = false
            ns.Print("Self-promo disabled.")
        else
            ns.Print("Self-promo: " .. (ns.db.selfPromo and "ON" or "OFF"))
        end
    elseif cmd == "reset" then
        ns.stats.Reset()
        ns.Print("Session stats reset.")
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
        local ms = ns.settings.GetModeSettings()
        if lo and hi then
            lo, hi = tonumber(lo), tonumber(hi)
            if lo >= 10 and hi >= lo and hi <= 300 then
                ms.frequencyMin = lo
                ms.frequencyMax = hi
                local mode = ns.core.GetGroupMode()
                ns.Print("Frequency set to " .. lo .. "–" .. hi .. "s (" .. mode:lower() .. ").")
            else
                ns.Print("Invalid range. Min >= 10, Max >= Min, Max <= 300.")
            end
        else
            ns.Print("Frequency: " .. (ms.frequencyMin or 25) .. "–" .. (ms.frequencyMax or 90) .. "s")
        end
    elseif cmd == "status" then
        local active = ns.ResolvePersona()
        local mode = ns.core.GetGroupMode()
        local ms = ns.settings.GetModeSettings()
        ns.Print("Enabled: "      .. (ns.db.enabled and "YES" or "NO"))
        ns.Print("Persona: "      .. ns.db.persona .. " (active: " .. active .. ")")
        ns.Print("Class: "        .. (ns.playerClassKey or "?"))
        ns.Print("Mode: "         .. mode)
        ns.Print("Chattiness: "   .. (ms.chattiness or 5))
        ns.Print("Frequency: "    .. (ms.frequencyMin or 25) .. "–" .. (ms.frequencyMax or 90) .. "s")
        if ms.responseMin then
            ns.Print("Response: " .. ms.responseMin .. "–" .. ms.responseMax .. "s")
        end
        ns.Print("Solo mode: "    .. (ns.db.soloMode and "ON" or "OFF"))
        ns.Print("Chat filter: "  .. (ns.db.enableChatFilter and "ON" or "OFF"))
        ns.Print("Raid banter: "  .. (ns.db.raid and ns.db.raid.enabled and "ON" or "OFF"))
        ns.Print("Roast Mode: "   .. (ns.db.roastMode and "ON" or "OFF"))
        ns.Print("Self-promo: "   .. (ns.db.selfPromo and "ON" or "OFF"))
        ns.Print("Debug: "        .. (ns.db.debug and "ON" or "OFF"))
        ns.Print("Banter peers: " .. ns.comm.GetPeerCount())
        ns.Print("State: "        .. (ns.state.Current and ns.state.Current() or "?"))
        ns.Print("Deaths: "       .. ns.stats.GetDeathCount())
    elseif cmd == "changelog" then
        ns.ShowChangelog(true)
    elseif cmd == "debug" then
        ns.db.debug = not ns.db.debug
        ns.Print("Debug " .. (ns.db.debug and "ON" or "OFF"))
    else
        ns.Print("Unknown command. Type /banter help")
    end
end

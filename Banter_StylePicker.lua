-- Banter_StylePicker.lua
-- First-run style picker: large polished popup with three card-style buttons.
-- Shown once on first login (or after update that introduces styleChosen flag).
-- Each card has an icon, title, subtitle, and description. Hover highlights.
local _, ns = ...

---------------------------------------------------------------------------
-- Style definitions
---------------------------------------------------------------------------
local STYLES = {
    {
        key         = "SOCIAL",
        title       = "Social",
        subtitle    = "The full experience",
        icon        = "Interface\\AddOns\\Banter\\Textures\\BanterMinimapIcon",
        description = "Your character has a personality. They crack jokes, tell stories, banter with other Banter users, and react to everything happening around them — deaths, loot, combat, travel. Chatty, in-character, and unpredictable.",
        color       = { 0.33, 1.0, 0.60 },   -- green
    },
    {
        key         = "NARRATIVE",
        title       = "Narrative",
        subtitle    = "Combat commentary",
        icon        = "Interface\\Icons\\INV_Misc_Book_09",
        description = "Ambient chatter is replaced with stat-driven combat analysis — who dealt the most damage, who ate the most fire, who died the most. Your persona still speaks, but only when there's something worth reporting. Focused but flavorful.",
        color       = { 0.40, 0.80, 1.0 },   -- blue
    },
    {
        key         = "CALLOUTS",
        title       = "Callouts",
        subtitle    = "Utility only",
        icon        = "Interface\\Icons\\Ability_DualWield",
        description = "Zero chatter. Your addon only speaks for CC alerts, interrupt callouts, and PVP kills — pure utility. No jokes, no stories, no banter. Turns the addon into a tactical information tool with personality.",
        color       = { 1.0, 0.82, 0.0 },   -- gold
    },
}

---------------------------------------------------------------------------
-- Card dimensions
---------------------------------------------------------------------------
local POPUP_WIDTH   = 640
local POPUP_HEIGHT  = 560
local CARD_WIDTH    = 175
local CARD_HEIGHT   = 340
local CARD_SPACING  = 18
local ICON_SIZE     = 64

---------------------------------------------------------------------------
-- Frame builder (cached, creates once)
---------------------------------------------------------------------------
local popup

local function CreateCard(parent, styleDef, index)
    local template = "BackdropTemplate"

    local card = CreateFrame("Button", nil, parent, template)
    card:SetSize(CARD_WIDTH, CARD_HEIGHT)

    -- Card backdrop (dark panel)
    card:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile     = true, tileSize = 16, edgeSize = 16,
        insets   = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    card:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)

    -- Highlight on hover
    local highlight = card:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints()
    highlight:SetColorTexture(styleDef.color[1], styleDef.color[2], styleDef.color[3], 0.15)

    -- Icon
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE, ICON_SIZE)
    icon:SetPoint("TOP", 0, -16)
    icon:SetTexture(styleDef.icon)

    -- Title
    local title = card:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", icon, "BOTTOM", 0, -10)
    title:SetText("|cff" .. string.format("%02x%02x%02x",
        math.floor(styleDef.color[1] * 255),
        math.floor(styleDef.color[2] * 255),
        math.floor(styleDef.color[3] * 255)) .. styleDef.title .. "|r")

    -- Subtitle
    local subtitle = card:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOP", title, "BOTTOM", 0, -4)
    subtitle:SetTextColor(0.7, 0.7, 0.7, 1)
    subtitle:SetText(styleDef.subtitle)

    -- Description (wrapped)
    local desc = card:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    desc:SetPoint("TOP", subtitle, "BOTTOM", 0, -12)
    desc:SetPoint("LEFT", card, "LEFT", 14, 0)
    desc:SetPoint("RIGHT", card, "RIGHT", -14, 0)
    desc:SetJustifyH("CENTER")
    desc:SetJustifyV("TOP")
    desc:SetText(styleDef.description)
    desc:SetSpacing(2)

    -- Bottom "Select" label
    local selectLabel = card:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    selectLabel:SetPoint("BOTTOM", card, "BOTTOM", 0, 14)
    selectLabel:SetText("|cff999999Click to select|r")

    -- Hover handlers for polish
    card:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(styleDef.color[1], styleDef.color[2], styleDef.color[3], 1)
        selectLabel:SetText("|cffffffff> Select " .. styleDef.title .. " <|r")
    end)
    card:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
        selectLabel:SetText("|cff999999Click to select|r")
    end)

    -- Click handler
    card:SetScript("OnClick", function()
        ns.db.banterStyle  = styleDef.key
        ns.db.styleChosen  = true
        ns.Print("Banter style set to |cff" .. string.format("%02x%02x%02x",
            math.floor(styleDef.color[1] * 255),
            math.floor(styleDef.color[2] * 255),
            math.floor(styleDef.color[3] * 255)) .. styleDef.title .. "|r. Change anytime with /banter style.")
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or 856)
        -- Sync settings dropdown if it exists
        if ns._styleDropdown then
            UIDropDownMenu_SetText(ns._styleDropdown, styleDef.key)
        end
        parent:GetParent():Hide()  -- hide the popup
    end)

    return card
end

local function CreatePopup()
    if popup then return popup end

    local template = "BackdropTemplate"
    local f = CreateFrame("Frame", "BanterStylePicker", UIParent, template)
    f:SetSize(POPUP_WIDTH, POPUP_HEIGHT)
    f:SetPoint("CENTER")
    f:SetFrameStrata("DIALOG")
    f:SetFrameLevel(200)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)

    -- Main backdrop
    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tile     = true, tileSize = 32, edgeSize = 32,
        insets   = { left = 11, right = 11, top = 12, bottom = 11 },
    })

    -- Banner texture (reuse the settings banner)
    local banner = f:CreateTexture(nil, "ARTWORK")
    banner:SetTexture("Interface\\AddOns\\Banter\\Textures\\BanterSettingsBanner")
    banner:SetSize(580, 100)
    banner:SetPoint("TOP", 0, -12)

    -- Heading
    local heading = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    heading:SetPoint("TOP", banner, "BOTTOM", 0, -8)
    heading:SetText("|cffffcc00Choose Your Banter Style|r")

    -- Subheading
    local subheading = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    subheading:SetPoint("TOP", heading, "BOTTOM", 0, -4)
    subheading:SetText("How should your persona behave? You can change this anytime.")
    subheading:SetTextColor(0.7, 0.7, 0.7, 1)

    -- Card container (centered horizontally)
    local container = CreateFrame("Frame", nil, f)
    local totalWidth = (#STYLES * CARD_WIDTH) + ((#STYLES - 1) * CARD_SPACING)
    container:SetSize(totalWidth, CARD_HEIGHT)
    container:SetPoint("TOP", subheading, "BOTTOM", 0, -16)

    -- Create the three cards
    for i, styleDef in ipairs(STYLES) do
        local card = CreateCard(container, styleDef, i)
        local xOffset = (i - 1) * (CARD_WIDTH + CARD_SPACING)
        card:SetPoint("TOPLEFT", container, "TOPLEFT", xOffset, 0)
    end

    -- Close button (top-right X) — just hides, doesn't change any settings
    local closeX = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    closeX:SetPoint("TOPRIGHT", -4, -4)
    closeX:SetScript("OnClick", function()
        f:Hide()
    end)

    -- Checkbox: show on every login (global name so Settings can sync)
    local cb = CreateFrame("CheckButton", "BanterStylePickerAlwaysCB", f, "UICheckButtonTemplate")
    cb:SetPoint("BOTTOMLEFT", 16, 12)
    cb:SetSize(26, 26)
    local cbText = cb:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    cbText:SetPoint("LEFT", cb, "RIGHT", 4, 0)
    cbText:SetText("Show this on every login")
    cbText:SetTextColor(0.6, 0.6, 0.6, 1)
    cb:SetScript("OnClick", function(self)
        if ns.db then
            ns.db.showStylePickerAlways = self:GetChecked() and true or false
        end
        -- Sync the settings panel checkbox if it exists
        local settingsCB = _G["BanterCB_StylePickerLaunch"]
        if settingsCB then settingsCB:SetChecked(ns.db.showStylePickerAlways) end
    end)
    cb:SetScript("OnShow", function(self)
        self:SetChecked(ns.db and ns.db.showStylePickerAlways)
    end)

    -- Bottom hint text
    local hint = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    hint:SetPoint("BOTTOM", f, "BOTTOM", 0, 16)
    hint:SetText("|cff666666Change your style anytime: /banter style social | narrative | callouts|r")

    -- Don't add to UISpecialFrames — Escape should NOT dismiss this
    popup = f
    return f
end

---------------------------------------------------------------------------
-- Public API — called from PLAYER_ENTERING_WORLD flow
---------------------------------------------------------------------------
function ns.ShowStylePicker(forceShow)
    if not forceShow then
        -- Show if: never chosen, OR user opted into "show every login"
        if ns.db and ns.db.styleChosen and not ns.db.showStylePickerAlways then return end
    end

    local ok, err = pcall(function()
        local f = CreatePopup()
        f:Show()
        -- Force-sync the checkbox to the actual saved value every time we show
        local pickerCB = _G["BanterStylePickerAlwaysCB"]
        if pickerCB and ns.db then
            pickerCB:SetChecked(ns.db.showStylePickerAlways and true or false)
        end
    end)
    if not ok then
        ns.Print("Style picker error: " .. tostring(err))
    end
end

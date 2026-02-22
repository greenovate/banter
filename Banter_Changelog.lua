-- Banter_Changelog.lua
-- Version-gated popup shown on first login per new version.
-- Displays changelog, CurseForge notice, and UAT thank-yous.
-- Checkbox hides the popup until ns.version changes.
local _, ns = ...

---------------------------------------------------------------------------
-- Changelog data  (update this table each release)
---------------------------------------------------------------------------
local CHANGELOG_VERSION = ns.version   -- ties to ns.version in Namespace

local CHANGELOG_LINES = {
    "|cffffcc00Banter v" .. ns.version .. " — Banter Button & Dedup Fix|r",
    "|cffffffffThe Comedy RP Engine for WoW Classic|r",
    "",
    "|cff00ff00Click-to-banter. Less spam. More control.|r",
    "",
    "|cffffcc00—— BANTER BUTTON ——|r",
    "• New floating action button — click to fire a banter line on demand",
    "• 10-second cooldown with visual cooldown wheel",
    "• Context-aware: picks the right trigger for your situation",
    "• Right-click opens settings, middle-click drag to reposition",
    "• /banter button to toggle visibility",
    "",
    "|cffffcc00—— MANUAL MODE ——|r",
    "• New toggle in General settings: Manual Mode",
    "• Suppresses all auto-triggered banter — you control when lines fire",
    "• Auto-responses to other Banter users still work",
    "• Perfect for new groups or when you want less chat aggression",
    "• /banter manual on|off",
    "",
    "|cffffcc00—— REPEAT PROTECTION ——|r",
    "• Overhauled dedup system with LRU-half fallback",
    "• No more back-to-back duplicate lines, even with small content pools",
    "• Buffers now maintain true recency order across all pick paths",
    "• Solo zone lines and cross-class banter also improved",
    "",
    "|cffffcc00Bugs & Feedback|r",
    "Report issues or share ideas on CurseForge:",
    "|cff00ccffcurseforge.com/wow/addons/banter|r",
    "",
    "|cff888888Thank you for using Banter!|r",
}

---------------------------------------------------------------------------
-- Frame builder
---------------------------------------------------------------------------
local popup  -- cached frame reference

local function CreatePopup()
    if popup then return popup end

    -- BackdropTemplate exists in retail but may not in Classic; use native SetBackdrop
    local template = BackdropTemplateMixin and "BackdropTemplate" or nil
    local f = CreateFrame("Frame", "BanterChangelogPopup", UIParent, template)
    f:SetSize(480, 640)
    f:SetPoint("CENTER")
    f:SetFrameStrata("DIALOG")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)

    -- Backdrop
    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tile     = true, tileSize = 32, edgeSize = 32,
        insets   = { left = 11, right = 11, top = 12, bottom = 11 },
    })

    -- Custom banner header
    local banner = f:CreateTexture(nil, "ARTWORK")
    banner:SetTexture("Interface\\AddOns\\Banter\\Textures\\BanterChangelogBanner")
    banner:SetSize(440, 110)
    banner:SetPoint("TOP", 0, -8)

    -- Scrollable body
    local scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 20, -124)
    scroll:SetPoint("BOTTOMRIGHT", -36, 70)

    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(390, 10)  -- height grows dynamically
    scroll:SetScrollChild(content)

    local y = -4
    for _, line in ipairs(CHANGELOG_LINES) do
        local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        fs:SetPoint("TOPLEFT", 4, y)
        fs:SetWidth(380)
        fs:SetJustifyH("LEFT")
        fs:SetText(line)
        if line == "" then
            y = y - 8
        else
            y = y - (fs:GetStringHeight() + 3)
        end
    end
    content:SetHeight(math.abs(y) + 16)

    -- "Don't show until next update" checkbox
    local cb = CreateFrame("CheckButton", nil, f, "UICheckButtonTemplate")
    cb:SetPoint("BOTTOMLEFT", 16, 16)
    cb:SetSize(26, 26)
    local cbText = cb:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    cbText:SetPoint("LEFT", cb, "RIGHT", 4, 0)
    cbText:SetText("Don't show again until next update")
    cb:SetScript("OnClick", function(self)
        if self:GetChecked() then
            ns.db.lastChangelogVersion = CHANGELOG_VERSION
        else
            ns.db.lastChangelogVersion = nil
        end
    end)
    -- Pre-check if they've already dismissed this version before
    cb:SetScript("OnShow", function(self)
        self:SetChecked(ns.db and ns.db.lastChangelogVersion == CHANGELOG_VERSION)
    end)

    -- Close button (top-right X)
    local closeX = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    closeX:SetPoint("TOPRIGHT", -4, -4)

    -- "Got it" button (bottom-right) — always dismisses this version
    local btn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    btn:SetSize(100, 24)
    btn:SetPoint("BOTTOMRIGHT", -18, 18)
    btn:SetText("Got it!")
    btn:SetScript("OnClick", function()
        ns.db.lastChangelogVersion = CHANGELOG_VERSION
        cb:SetChecked(true)
        f:Hide()
    end)

    -- Escape closes
    table.insert(UISpecialFrames, "BanterChangelogPopup")

    popup = f
    return f
end

---------------------------------------------------------------------------
-- Public API — called once from ADDON_LOADED after ns.db is ready
---------------------------------------------------------------------------
function ns.ShowChangelog(forceShow)
    if not forceShow then
        -- Skip if user already dismissed this version
        if ns.db and ns.db.lastChangelogVersion == CHANGELOG_VERSION then
            ns.Debug("Changelog: skipped (already dismissed v" .. CHANGELOG_VERSION .. ")")
            return
        end
    end
    local ok, err = pcall(function()
        local f = CreatePopup()
        f:Show()
    end)
    if not ok then
        ns.Print("Changelog popup error: " .. tostring(err))
    end
end

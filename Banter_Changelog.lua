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
    "|cffffcc00Banter v" .. ns.version .. " — The Solo & Settings Update|r",
    "|cffffffffThe Comedy RP Engine for WoW Classic|r",
    "",
    "|cff00ff00Banter now works when you're ALONE.|r",
    "|cff00ff00New settings. New triggers. New banter. Solo or grouped.|r",
    "",
    "|cffffcc00—— SOLO MODE ——|r",
    "• Full banter experience while playing solo",
    "• ALL triggers fire solo — kills, loot, combat, low HP, everything",
    "• Character talks to themselves via /emote — no channel needed",
    "• Dedicated frequency slider in the Solo settings tab",
    "• Every persona has unique solo voice lines",
    "",
    "|cffffcc00—— FLIGHT PATH BANTER ——|r",
    "• Your character now comments while riding flight paths",
    "• Detects taxi automatically — banter triggers every ~35 seconds",
    "• 35 unique statements + 7 responses per persona",
    "• Works solo AND in groups — 10 personas, 350+ flight lines",
    "• Ambient banter pauses while on a taxi (no overlap)",
    "",
    "|cffffcc00—— REDESIGNED SETTINGS ——|r",
    "• Brand-new tabbed interface — 6 tabs for every mode",
    "• General, Group, Raid, Solo, PVP BG, and Arena tabs",
    "• Independent frequency sliders per mode",
    "• Per-mode enable/disable for fine-grained control",
    "• Fixed slider backgrounds for ElvUI users",
    "• PVP tabs coming soon in a future update",
    "",
    "|cffffcc00—— QUALITY OF LIFE ——|r",
    "• Ambient timer restored to standard 60-second interval",
    "• Solo ambient boost balanced at 30% chance",
    "• Settings automatically migrate from older versions",
    "• Cleaner internal structure for future content updates",
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

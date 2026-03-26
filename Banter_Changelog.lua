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
    "|cffffcc00Banter v" .. ns.version .. " — Style Picker & Smart Callouts|r",
    "|cffffffffClass-Driven Chat Engine for WoW Classic|r",
    "",
    "|cff00ff00NEW: Choose your Banter style on first login!|r",
    "",
    "|cffffcc00—— STYLE PICKER ——|r",
    "• Polished popup with three cards: Social, Narrative, Callouts",
    "• Shows on first login (and after this update for existing users)",
    "• Persists until you make a choice — closing doesn't dismiss it forever",
    "• 'Show on every login' checkbox in picker AND settings",
    "• Syncs with the settings panel in real-time",
    "",
    "|cffffcc00—— STYLE RIBBING ——|r",
    "• NEW: Social users tease quiet Callouts users every ~5 minutes",
    "• Callouts users fire back with in-character comebacks",
    "• 12 unique lines per persona per side (240 total)",
    "• Style broadcasting — peers now know each other's mode",
    "",
    "|cffffcc00—— SMARTER CALLOUTS ——|r",
    "• Interrupt callouts now name WHO interrupted WHAT spell",
    "• CC callouts now name WHO got hit with WHAT crowd control",
    "• All 10 personas rewritten for specificity",
    "• Self-aware: says 'I' when the callout is about you",
    "• Fixed callout spam with 3+ Banter users (dedup grace period)",
    "• Callouts mode no longer claims response slots for non-utility scenes",
    "",
    "|cffffcc00Bugs & Feedback|r",
    "Report issues or share ideas on CurseForge:",
    "|cff00ccffcurseforge.com/wow/addons/banter|r",
    "",
    "|cff888888Made by Evildz on Nightslayer|r",
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

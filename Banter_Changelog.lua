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
    "|cffffcc00Banter v" .. ns.version .. " — The Variety Update|r",
    "|cffffffffThe Comedy RP Engine for WoW Classic|r",
    "",
    "|cff00ccffNow available on CurseForge!|r",
    "|cff00ccffSearch 'Banter' or visit the project page.|r",
    "",
    "|cffffcc00—— MASSIVE ENGAGEMENT OVERHAUL ——|r",
    "The #1 complaint was hearing the same banter twice",
    "in a dungeon run. That era is OVER.",
    "",
    "|cff00ff0073 new conversation topics|r added on top of",
    "the original 404 engagement threads:",
    "",
    "  |cff00ccff44 target-specific topics|r — anyone can roast",
    "  any persona. Warriors, Mages, Warlocks, Rogues...",
    "  everyone gets called out.",
    "",
    "  |cff00ccff29 universal topics|r — group names, loot drama,",
    "  hot takes, campfire confessions, worst-group stories,",
    "  explaining WoW to normies, and more.",
    "",
    "Each topic has |cff00ff004-6 openers|r × |cff00ff004-6 responses|r",
    "× |cff00ff003-5 follow-ups|r = up to |cffffcc00100+ unique|r",
    "conversations per topic. Total unique combos:",
    "",
    "  |cffffcc0015,000+ unique conversation combinations|r",
    "  (and that's just the new topics)",
    "",
    "|cffffcc00—— NEVER HEAR THE SAME LINE TWICE ——|r",
    "New smart dedup engine tracks every conversation",
    "you've seen — |cff00ff00persists across /reload, logout,|r",
    "|cff00ff00and disconnects|r. Keys expire after 6 hours so",
    "the pool naturally refreshes for your next session.",
    "",
    "In a typical 45-min dungeon with 2 Banter users:",
    "  • ~43+ topic keys available per pair",
    "  • ~9-15 engagements fire during the run",
    "  • |cff00ff00Zero repeats. Ever.|r",
    "",
    "|cffffcc00—— STILL INCLUDED FROM V1.0 ——|r",
    "  |cff00ff96Druid|r  |cffabd473Hunter|r  |cff3fc7ebMage|r",
    "  |cfff58cbaPaladin|r  |cffffffffPriest|r  |cfffff569Rogue|r",
    "  |cff0070deShaman|r  |cff8788eeWarlock|r  |cffc79c6eWarrior|r",
    "  |cff888888...and the legendary |cffffcc00Pirate|r|cff888888!|r",
    "",
    "• 404 legacy engagement threads (81 mismatch + 323 general)",
    "• 1,510 lines of cross-class banter",
    "• Chattiness scaler, chat filter, minimap button",
    "• Hidden addon comm channel with leader election",
    "• Promo system & this changelog popup",
    "",
    "|cffffcc00—— BY THE NUMBERS ——|r",
    "• 24 Lua files | ~13,000 lines of code",
    "• 477 engagement keys (404 legacy + 73 topics)",
    "• 15,000+ unique conversation combinations",
    "• 10 personas with hundreds of voice lines each",
    "• 6-hour cross-session dedup with auto-expiry",
    "",
    "|cffffcc00Special Thanks|r",
    "|cff00ff00Drake|r and |cff00ff00spicysteveTV|r — for UAT testing,",
    "catching the repeat problem, and pushing us to fix it.",
    "This update exists because of your feedback. Cheers!",
    "",
    "|cffffcc00Bugs & Feedback|r",
    "Report issues or share ideas on GitHub:",
    "|cff00ccffgithub.com/greenovate/banter/issues|r",
    "",
    "|cff888888github.com/greenovate/banter|r",
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
    f:SetSize(480, 580)
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

    -- Title bar
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -20)
    title:SetText("|cffffcc00Banter|r — What's New")

    -- Scrollable body
    local scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 20, -50)
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

    -- "Got it" button (bottom-right)
    local btn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    btn:SetSize(100, 24)
    btn:SetPoint("BOTTOMRIGHT", -18, 18)
    btn:SetText("Got it!")
    btn:SetScript("OnClick", function()
        -- Save dismissal if checkbox is checked
        if cb:GetChecked() then
            ns.db.lastChangelogVersion = CHANGELOG_VERSION
        end
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

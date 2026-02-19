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
    "|cffffcc00Banter v" .. ns.version .. " — Beta 2|r",
    "|cffffffffThe Comedy RP Engine for WoW Classic|r",
    "",
    "|cff00ccffCurseForge upload is pending.|r",
    "|cff00ccffLook for future updates there!|r",
    "",
    "|cffffcc00—— 10 CLASS PERSONAS ——|r",
    "Every WoW Classic class now has a fully-voiced",
    "comedy persona with unique combat barks, idle",
    "chatter, group reactions, death lines, and more:",
    "",
    "  |cff00ff96Druid|r  |cffabd473Hunter|r  |cff3fc7ebMage|r",
    "  |cfff58cbaPaladin|r  |cffffffffPriest|r  |cfffff569Rogue|r",
    "  |cff0070deShaman|r  |cff8788eeWarlock|r  |cffc79c6eWarrior|r",
    "  |cff888888...and the legendary |cffffcc00Pirate|r|cff888888!|r",
    "",
    "Pick yours with |cff00ccff/banter persona|r",
    "",
    "|cffffcc00—— ENGAGEMENT SYSTEM (400+ Threads!) ——|r",
    "Brand new directed banter between two players:",
    "• Name-targeted conversations over hidden addon channel",
    "• 81 class-mismatch callout threads — if your persona",
    "  doesn't match your actual class, others WILL notice",
    "• 323 general persona-to-persona threads covering:",
    "  combat philosophy, lifestyle jabs, food & drink,",
    "  loot arguments, class envy, ability jealousy,",
    "  who-would-win debates, dares, party roles,",
    "  mounts, campfire stories, and way more",
    "• 2,222 lines of engagement dialogue total",
    "",
    "|cffffcc00—— CROSS-CLASS BANTER ——|r",
    "• 1,510 lines of persona-to-persona targeted dialogue",
    "• Personas react to each other based on who's in",
    "  the group — every class pair has unique interactions",
    "",
    "|cffffcc00—— NEW FEATURES ——|r",
    "• Hidden addon comm channel (BNTR) for coordination",
    "• Leader election & claim/lock scene flow",
    "• Chattiness scaler (1–10) — controls how often",
    "  your persona talks. Crank it up or tone it down",
    "• Chat filter — your outgoing messages get persona flair",
    "• Minimap button — left-click settings, right-click info",
    "• Promo system — auto-responds when someone asks",
    "  'what addon is that?'",
    "• This changelog popup! |cff00ccff/banter changelog|r to reopen",
    "",
    "|cffffcc00—— BUG FIXES & POLISH ——|r",
    "• Fixed SAY/YELL blocked outdoors (hardware event)",
    "• Balanced all persona response rarities",
    "• Improved peer timeout and heartbeat reliability",
    "",
    "|cffffcc00—— BY THE NUMBERS ——|r",
    "• 23 Lua files | 11,124 lines added this release",
    "• 404 engagement threads | 1,510 cross-class lines",
    "• 10 unique personas with hundreds of voice lines each",
    "",
    "|cffffcc00Special Thanks|r",
    "|cff00ff00Drake|r and |cff00ff00spicysteveTV|r — for UAT testing,",
    "feedback, and helping shape Banter into what it is.",
    "You two are the real MVPs. Cheers!",
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

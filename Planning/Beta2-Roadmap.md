# Banter V1.0 Beta 2 — Roadmap

**Target:** Complete overhaul — class personas, stat tracking, real back-and-forth banter,
new triggers, settings upgrades, comedy rewrite, self-promotion.

---

## Phase 0 — Infrastructure & Settings (Foundation)

Everything else depends on these being solid first.

| # | Task | UAT Items | Est. |
|---|------|-----------|------|
| 0.1 | **Version bump** — TOC to 1.1.0-beta2, namespace version | — | 5 min |
| 0.2 | **Namespace expansion** — add `ns.stats`, `ns.state` module stubs, `ns.playerClass` cached on init | #7, #12, #13 | 15 min |
| 0.3 | **Settings overhaul** — Chattiness slider (1-10), "Disable in Raids" checkbox, "Roast Mode" checkbox (OFF default), "Self-Promo" checkbox (ON default), persona dropdown updated for 9 classes + "AUTO (Current Class)" | #10, #12, #13, #15 | 1 hr |
| 0.4 | **Activity state machine** — `Banter_State.lua`: tracks IDLE / COMBAT / POST_COMBAT / AFK / DEAD / RESTING / MOUNTED. Exposes `ns.state.Current()`. AMBIENT trigger checks state to pick context-appropriate sub-pool. | #7 | 45 min |
| 0.5 | **Stat tracking module** — `Banter_Stats.lua`: hooks CLEU for damage/healing/deaths/interrupts/CC-breaks/pulls per player. Session-scoped. Exposes tokens: `{worst_dps}`, `{top_dps}`, `{most_deaths}`, `{death_count}`, `{puller}`, `{cc_breaker}`, `{fire_king}`. Reset on `/banter reset`. | #13 | 1.5 hr |
| 0.6 | **Token system expansion** — add new tokens to `core.ReplaceTokens()`: stat tokens + `{spell}`, `{resource}`, `{myclass}` | #11, #13 | 30 min |

---

## Phase 1 — Comm System Fix + Back-and-Forth Protocol

Fix what's broken, then extend for multi-turn exchanges.

| # | Task | UAT Items | Est. |
|---|------|-----------|------|
| 1.1 | **Periodic heartbeat** — 30s HELLO re-broadcast while in group, peer timeout reduced to 90s, re-discover on GROUP_ROSTER_UPDATE including join mid-session | #2 | 30 min |
| 1.2 | **Scene protocol hardening** — CLAIM timeout fallback (3s→2s), handle stale activeScene (>30s auto-clear), ignore duplicate SCENE_START within 5s window | #2 | 30 min |
| 1.3 | **Multi-turn exchange protocol** — new message types: `SCENE_REPLY` (response volley), `SCENE_CONTINUE` (invitation for comeback). Max 4 turns total. Delay 2-5s per turn with jitter. | #14 | 1.5 hr |
| 1.4 | **Persona announcement** — peers share their class persona in HELLO so cross-persona reaction tables work | #14 | 15 min |

---

## Phase 2 — New Triggers

| # | Task | UAT Items | Est. |
|---|------|-----------|------|
| 2.1 | **PLAYER_DISCONNECT / PLAYER_RECONNECT** — track `UnitIsConnected()` state per group member on GROUP_ROSTER_UPDATE, fire on transition. 60s cooldown per player. | #5 | 30 min |
| 2.2 | **CONSUMABLE_USED** — hook `UNIT_SPELLCAST_SUCCEEDED` + curated consumable spell ID list (health pot, mana pot, bandage, food/drink, flasks, Free Action Pot). 45s cooldown. | #3 | 45 min |
| 2.3 | **MAJOR_COOLDOWN** — hook CLEU `SPELL_CAST_SUCCESS` against curated list of major CDs per class. Context tokens: `{spell}`, `{source}`. 30s cooldown. | #6 | 45 min |
| 2.4 | **Activity-aware AMBIENT** — split AMBIENT into sub-pools: AMBIENT_IDLE, AMBIENT_COMBAT, AMBIENT_AFK, AMBIENT_TRAVEL. State machine selects pool. | #7 | 30 min |
| 2.5 | **Register new triggers** in Scenes.lua — CAPS, TRIGGER_CHANCE, cooldowns for all new triggers | — | 15 min |

---

## Phase 3 — Class Personas (The Big One)

9 class persona files. Each needs statements + responses for **15 triggers** × 4 rarity tiers.
Keep Pirate as a novelty/legacy option.

| # | Task | UAT Items | Est. |
|---|------|-----------|------|
| 3.1 | **Comedy bibles** — write 3-5 voice rules per class defining what makes that class's humor work | #9, #12 | 30 min |
| 3.2 | **Persona: Warrior** — rewrite existing file for class voice (melee, rage, confused by magic) | #12 | 2 hr |
| 3.3 | **Persona: Mage** — new file, intellectual superiority, squishy panic, conjure food obsession | #12 | 2 hr |
| 3.4 | **Persona: Warlock** — new file, casually sinister, demon coworkers, "this is fine" | #12 | 2 hr |
| 3.5 | **Persona: Priest** — new file, passive-aggressive healer guilt, martyr complex | #12 | 2 hr |
| 3.6 | **Persona: Rogue** — rewrite Ninja into Rogue class voice (paranoid, exits, stealth humor) | #12 | 2 hr |
| 3.7 | **Persona: Hunter** — new file, pet excuses, accidental pulls, Feign Death | #12 | 2 hr |
| 3.8 | **Persona: Druid** — new file, form identity crisis, nature hippie meets bear | #12 | 2 hr |
| 3.9 | **Persona: Paladin** — new file, righteous condescension, bubble-hearth, Light puns | #12 | 2 hr |
| 3.10 | **Persona: Shaman** — new file, elemental small talk, totem management, ankh smugness | #12 | 2 hr |
| 3.11 | **Persona: Pirate** — keep as novelty, audit for comedy quality | #9 | 1 hr |
| 3.12 | **Cross-persona reaction tables** — each class has opinion lines about 8 other classes for back-and-forth | #14 | 2 hr |
| 3.13 | **Chat filter per class** — swap dictionaries for each class persona voice | #4 | 2 hr |

---

## Phase 4 — Response System Overhaul

Fix the "responses are nonsense" problem.

| # | Task | UAT Items | Est. |
|---|------|-----------|------|
| 4.1 | **Statement-response pairing format** — statements can carry `paired_responses = { "line1", "line2" }`. Scene picker prefers paired responses when available. | #8 | 1 hr |
| 4.2 | **Tone tagging** — statements and responses carry a `tone` tag (dry, panic, philosophical, angry, smug). Response picker matches tone when no direct pair exists. | #8 | 45 min |
| 4.3 | **Write paired responses** — go through every statement in all 10 personas, write 1-3 direct response lines that actually reply to that specific statement | #8, #9 | 4+ hr |
| 4.4 | **Fallback pool** — keep existing random response pool as fallback when no pair/tone match found or when running solo | #8 | 15 min |

---

## Phase 5 — Self-Promotion + Polish

| # | Task | UAT Items | Est. |
|---|------|-----------|------|
| 5.1 | **"What addon?" detector** — `Banter_Promo.lua`: hook incoming CHAT_MSG_PARTY/SAY/RAID/WHISPER, scan for keyword patterns. Fire in-character response with GitHub link. 5 min global cooldown, once per asker per session. Toggleable. | #15 | 45 min |
| 5.2 | **Promo response lines** — write 3-5 per class persona + generic fallback | #15 | 30 min |
| 5.3 | **Comedy audit** — full pass through all persona lines. Cut cheesy/corny. Sharpen punchlines. Apply: subversion, specificity, brevity, rule of three, escalation. | #9 | 3+ hr |
| 5.4 | **TOC + file list update** — add all new .lua files to Banter.toc in correct load order | — | 10 min |
| 5.5 | **README update** — reflect new features, class personas, updated screenshots | — | 20 min |

---

## Phase 6 — Test, Commit, Release

| # | Task | Est. |
|---|------|------|
| 6.1 | Syntax verify — `/reload` all files, fix any Lua errors | 30 min |
| 6.2 | Solo trigger test — verify all 15 triggers fire | 20 min |
| 6.3 | Multi-user comm test (if possible) | 30 min |
| 6.4 | Git commit, push, tag V1.0-Beta-2 | 10 min |
| 6.5 | Build release zip, publish to GitHub | 10 min |

---

## File Changes Summary

### New Files
- `Banter_State.lua` — activity state machine
- `Banter_Stats.lua` — combat stat tracking
- `Banter_Promo.lua` — self-promotion detector
- `Banter_Persona_Mage.lua` — Mage class persona
- `Banter_Persona_Warlock.lua` — Warlock class persona
- `Banter_Persona_Priest.lua` — Priest class persona
- `Banter_Persona_Hunter.lua` — Hunter class persona
- `Banter_Persona_Druid.lua` — Druid class persona
- `Banter_Persona_Paladin.lua` — Paladin class persona
- `Banter_Persona_Shaman.lua` — Shaman class persona

### Modified Files
- `Banter.toc` — version bump, new file list
- `Banter_Namespace.lua` — new module stubs, playerClass cache
- `Banter_Settings.lua` — chattiness slider, raid disable, roast mode, promo toggle, class persona dropdown, resized GUI
- `Banter_Scenes.lua` — new trigger entries, paired response picking, tone matching
- `Banter_Triggers.lua` — new trigger handlers (disconnect, consumable, cooldown), state-aware ambient
- `Banter_Comm.lua` — heartbeat, protocol hardening, multi-turn exchange, persona sharing
- `Banter_Core.lua` — expanded token replacement, stat tokens, multi-turn scene flow
- `Banter_ChatFilter.lua` — class-specific swap dictionaries
- `Banter_Persona_Warrior.lua` — full rewrite for class voice
- `Banter_Persona_Ninja.lua` → renamed/rewritten to `Banter_Persona_Rogue.lua`
- `Banter_Persona_Pirate.lua` — comedy audit, kept as novelty
- `Banter_Persona_Neutral.lua` — removed (replaced by class personas)

### Removed Files
- `Banter_Persona_Neutral.lua` — no longer needed
- `Banter_Persona_Ninja.lua` — replaced by Rogue

---

## Priority Order (if we need to ship incrementally)

1. **Phase 0** — nothing works without infrastructure
2. **Phase 1** — comm fixing is a reported bug, must fix
3. **Phase 3.1-3.2** — start with ONE class persona (Warrior) as proof-of-concept
4. **Phase 4.1-4.2** — response pairing format so new content is written correctly
5. **Phase 3.3-3.10** — remaining class personas (written with pairing from the start)
6. **Phase 2** — new triggers
7. **Phase 5** — polish and promo
8. **Phase 6** — ship it

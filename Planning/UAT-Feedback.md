# Banter — UAT Feedback Log

Collected from beta testers during V1.0-Beta-1 testing.
No changes implemented yet — capture first, discuss, then act.

---

## 1. More Class-Specific Personas

**Feedback:** Users want personas tied to WoW classes rather than (or in addition to) the current archetype personas.

**Elaboration:**
Currently Banter ships 4 archetype personas (Pirate, Warrior, Ninja, Neutral) that any class can use. Testers are asking for personas that reflect their actual class identity — a Mage persona that makes arcane/fire/frost jokes, a Priest persona with holy guilt, a Warlock persona that's suspiciously comfortable with demons, etc.

**Considerations:**
- Could be new personas alongside existing ones, or a replacement system
- 9 classes in Anniversary Classic: Warrior, Mage, Warlock, Priest, Rogue, Hunter, Druid, Paladin, Shaman
- Each persona requires lines across all 12 triggers × 4 rarity tiers for both statements AND responses — that's a significant content investment per class
- Could auto-detect class and suggest a matching persona, or let users pick freely
- Risk of personas feeling generic if class flavor isn't strong enough — each needs a distinct comedic angle (e.g., Hunter = "my pet did it," Warlock = "this is fine, everything is on fire, I caused it")
- Alternative: class-flavored "sub-voices" that inject a few class-specific lines into existing personas rather than building 9 full persona files

---

## 2. Banter Doesn't Communicate Consistently With Other Users

**Feedback:** Multi-addon sync between Banter users is unreliable. Scenes don't coordinate properly, responses may overlap or not fire, peer discovery seems inconsistent.

**Elaboration:**
Banter uses addon comm channel (prefix "BNTR") for peer discovery, scene claiming (SCENE_START → CLAIM → SCENE_LOCK), leader election, and fairness rotation. Testers report that this system doesn't work reliably in practice.

**Considerations:**
- Possible causes: comm messages not reaching peers (channel registration timing, zone transitions), race conditions in claim/lock, peers not discovered if they loaded after the initial HELLO handshake
- Need to verify: Does peer discovery re-broadcast on group roster changes? Does it handle players joining mid-session?
- The deterministic leader election may not account for edge cases (disconnects, reloads, /reload during a scene)
- Fairness rotation state may desync if one client misses a SCENE_LOCK message
- Staggered response timing windows may be too narrow or too wide depending on latency
- Debug mode output from multiple users running simultaneously would help diagnose — need testers to enable debug and capture logs
- May need a periodic heartbeat/re-sync mechanism rather than relying solely on event-driven discovery

---

## 3. Have Banter React When Using Consumables

**Feedback:** Users want Banter to comment when players use potions, food, bandages, scrolls, or other consumables.

**Elaboration:**
This is a new trigger (13th) that would fire when consumable usage is detected. WoW fires combat log events and unit aura events when buffs from consumables are applied.

**Considerations:**
- Detection methods: `UNIT_SPELLCAST_SUCCEEDED` for the player using items, `COMBAT_LOG_EVENT_UNFILTERED` for buff applications, or bag item count changes
- Need to distinguish consumables from regular spell casts — could maintain a list of known consumable spell IDs or check item categories
- Relevant consumable categories: health potions, mana potions, food/drink (well fed buffs), bandages (First Aid), scrolls, elixirs/flasks, engineering items, Free Action Potions (PvP classic staple)
- Comedy angles: "drinking mid-combat panic," "snacking between pulls," "chugging potions like a frat party," ninja being philosophically conflicted about relying on external substances
- Frequency control: consumable usage can be very frequent (food between every pull) — needs a longer cooldown or lower trigger chance to avoid spam
- Should it react to the player's own consumable use, party members' use, or both?

---

## 4. Chat Filter Doesn't Translate Correctly Into Persona Voice

**Feedback:** The "Transform outgoing chat" feature doesn't produce convincing persona-voiced output. Translations feel incomplete, inconsistent, or miss the mark.

**Elaboration:**
The chat filter uses word-swap dictionaries (100-150+ entries per persona), prefix/suffix injection (70-85% chance), and case-preserving replacement. Testers report the output doesn't feel like the persona is actually speaking.

**Considerations:**
- Current approach is word-by-word substitution — this can produce awkward results when swaps don't account for surrounding context (e.g., swapping "you" to "ye" works, but grammar around it may break)
- Prefix/suffix injection may feel bolted-on rather than natural if the same prefixes repeat too often
- Some personas may need more than word swaps — sentence structure changes, contractions, dropped words (ninja dropping articles: "the" → ""), warrior using military shorthand
- The swap dictionaries may have gaps — common words that should transform but don't, making output feel half-transformed
- Case preservation may be producing odd results in some edge cases
- Possible improvements: phrase-level swaps (not just single words), more prefix/suffix variety, persona-specific punctuation rules (ninja adds "..." frequently, pirate adds "!" more often), grammar post-processing
- Need specific examples of "bad" translations from testers to identify patterns — ask testers to provide before/after screenshots

---

## 5. Trigger When a Player Disconnects / Goes Offline

**Feedback:** Banter should react when a party or raid member disconnects.

**Elaboration:**
WoW fires `GROUP_ROSTER_UPDATE` when the group composition changes, and disconnected players show as offline via `UnitIsConnected("unit")`. Banter could track connected state per group member and fire a trigger when someone transitions from connected → disconnected.

**Considerations:**
- Detection: Poll `UnitIsConnected()` for all group members on `GROUP_ROSTER_UPDATE`, compare against a cached state table
- Should also detect reconnects — "oh, you're back" lines are equally funny
- Need to distinguish disconnect from leaving the group entirely (left vs DC)
- Comedy angles: "they rage-quit," "the internet claimed another," ninja treating it like a death, pirate treating it like someone fell overboard, warrior treating it like a soldier going AWOL
- Cooldown needed — if someone has a flaky connection and DCs repeatedly, Banter shouldn't spam
- Edge case: mass DC during server issues — rate-limit so Banter doesn't fire 5 lines in 2 seconds
- New trigger name: `PLAYER_DISCONNECT` (and possibly `PLAYER_RECONNECT` as a separate trigger or sub-trigger)

---

## 6. Trigger on Major Cooldown Usage (Personal + Party/Raid)

**Feedback:** Banter should react when big cooldowns are popped — both the player's own and party/raid members'.

**Elaboration:**
Major cooldowns are the "oh shit" buttons — Lay on Hands, Shield Wall, Divine Shield (bubble), Innervate, Reincarnation, Recklessness, etc. Banter reacting to these adds comedy to high-pressure moments.

**Considerations:**
- Detection: `COMBAT_LOG_EVENT_UNFILTERED` sub-events `SPELL_CAST_SUCCESS` or `SPELL_AURA_APPLIED` filtered against a curated list of "big cooldown" spell IDs
- Need a maintained list of major cooldowns per class for Anniversary Classic:
  - **Warrior:** Shield Wall, Recklessness, Retaliation, Last Stand
  - **Paladin:** Lay on Hands, Divine Shield, Blessing of Protection
  - **Mage:** Ice Block, Evocation, Combustion, Presence of Mind
  - **Priest:** Desperate Prayer, Inner Focus, Power Infusion
  - **Warlock:** Soulstone (pre-use), Death Coil (fear component)
  - **Rogue:** Evasion, Vanish, Blind, Preparation
  - **Hunter:** Feign Death, Intimidation, Bestial Wrath
  - **Druid:** Innervate, Nature's Swiftness, Rebirth (brez)
  - **Shaman:** Reincarnation (Ankh), Nature's Swiftness, Mana Tide Totem
- Comedy angles differ by context: defensive cooldown = panic/desperation humor, offensive cooldown = hype/overconfidence humor, Paladin bubble = universal mockery
- Should distinguish self-cast vs party member cast — "I just used my panic button" vs "they just used their panic button"
- New trigger name: `MAJOR_COOLDOWN` — possibly with context tokens like `{spell}`, `{source}`
- Frequency/cooldown: boss fights can see multiple big CDs in quick succession — needs a per-scene or per-encounter rate limit

---

## 7. Recognize Activity State (AFK, Combat, Idling, etc.)

**Feedback:** Banter should be aware of the player's current activity state and draw from appropriate phrase pools — different lines when AFK, in combat, idling between pulls, traveling, etc.

**Elaboration:**
Currently the AMBIENT trigger fires on a timer regardless of what the player is doing. Testers want Banter to be contextually aware — a "sitting around doing nothing" line shouldn't fire mid-boss fight, and a combat quip shouldn't fire while AFK.

**Considerations:**
- Detectable states in WoW:
  - **AFK:** `UnitIsAFK("player")` or `PLAYER_FLAGS_CHANGED`
  - **In Combat:** `UnitAffectingCombat("player")` or `PLAYER_REGEN_DISABLED` / `PLAYER_REGEN_ENABLED`
  - **Dead:** `UnitIsDeadOrGhost("player")`
  - **Resting (inn/city):** `IsResting()`
  - **Mounted:** `IsMounted()`
  - **In Instance:** `IsInInstance()`
  - **Eating/Drinking:** check for well-known buff IDs or `UNIT_AURA` for food/drink buffs
- This could work as a state machine: IDLE → COMBAT → POST_COMBAT → AFK → TRAVELING, etc.
- Each state could have its own AMBIENT sub-pool, or a state tag that filters which AMBIENT lines are eligible
- Would make AMBIENT feel much more natural — "why are we just standing here" only fires when actually standing around, not during a pull
- This is also a prerequisite for making responses feel contextual (ties into item #8 below)
- New trigger possibilities: `AFK_START`, `AFK_RETURN`, `IDLE` (extended non-combat non-movement), `MOUNTED_TRAVEL`

---

## 8. Responses Feel Like Nonsense / Don't Read as Actual Responses

**Feedback:** The response lines don't feel like they're responding to anything. They read as standalone quips, not reactions to the statement that preceded them. This breaks the conversation illusion entirely.

**Elaboration:**
This is a **critical issue**. The core promise of Banter's multi-user sync is that one player's persona makes a statement and another player's persona *responds* to it — creating the illusion of an actual conversation. If responses are just random lines from the same trigger pool, it reads as two people talking past each other.

**Considerations:**
- Current system: Statements and responses are separate pools per trigger, but responses are picked randomly without any awareness of WHAT the statement said
- The fundamental problem: a response to "We fell as one. Poetic. Stupid. But poetic." needs to ACKNOWLEDGE that line — not just be another random wipe comment
- Possible approaches:
  - **Tagged pairing:** Statements carry a tone/theme tag (e.g., "philosophical," "angry," "sad," "sarcastic") and responses are tagged to match — pick a response whose tag fits the statement's tag
  - **Direct call-and-response pairs:** Some statements ship with 2-3 designated response IDs that directly reply to them, falling back to pool picks if no pair exists
  - **Keyword echo:** Response selection scans the statement for keywords and favors responses that reference similar themes
- The call-and-response pairing approach is the most reliable for comedy — setup and punchline need to be written together
- This may require restructuring the persona data format — statements could include a `responses` sub-table of paired lines
- Significant content rework needed — every paired response needs to be written to follow a specific statement
- Could keep the existing random pool as a fallback when no pair exists or when running solo

---

## 9. Comedy Quality — Funnier One-Liners, Less Cheesy/Corny

**Feedback:** Double down on genuinely funny lines. Current content has too many cheesy or corny phrases that land flat. Need to research actual comedy writing, stand-up one-liners, and inject real humor.

**Elaboration:**
The addon's entire value proposition is making people laugh. If the lines aren't funny, nothing else matters. Testers want sharper, wittier content — the kind of lines that make you actually snort, not groan.

**Considerations:**
- Comedy principles to apply:
  - **Subversion of expectations:** Setup leads one direction, punchline goes another ("I could save them. I won't. But I could.")
  - **Specificity is funnier than vague:** "died in 0.3 seconds" is funnier than "died fast"
  - **Brevity:** The best jokes are tight. Cut every unnecessary word.
  - **Callbacks and self-awareness:** Lines that reference the absurdity of the game itself (repair bills, corpse runs, RNG)
  - **Escalation:** Start calm, end absurd
  - **Rule of three:** Two normal things, third thing breaks the pattern
- Content audit needed — go through every persona line-by-line, cut anything that feels like a greeting card or bumper sticker
- Research sources for tone/style:
  - Dry British humor (Blackadder, Fawlty Towers) for Ninja/Neutral
  - Over-the-top absurdist humor (Monty Python, Airplane!) for Pirate
  - Military dark comedy (Catch-22, Generation Kill, Terminal Lance) for Warrior
  - Meta/fourth-wall gaming humor (actual player frustrations said out loud) for Neutral
- Each persona needs a "comedy bible" — 3-5 rules for what makes THAT voice funny, so new lines stay consistent
- MYTHIC tier lines especially need to land hard — they're the rarest, they should be the best
- Consider having a few "signature lines" per persona that become recognizable — the line people quote to friends

---

## 10. Chattiness Slider + Raid Disable Toggle

**Feedback:** Users want granular control over how much Banter talks, plus the ability to completely disable Banter in raids or other contexts.

**Elaboration:**
Currently Banter has frequency sliders (min/max delay between scenes) and per-trigger chance percentages, but there's no single "how chatty is this addon" knob. Testers want a simple volume control for Banter's output, plus a quick toggle to shut it up in raids where chat spam is unwelcome.

**Considerations:**
- **Chattiness slider:** A single 1-10 (or percentage) slider that acts as a global multiplier on all trigger chances and/or scene frequency
  - At 1 (minimum): Only the rarest, most important triggers fire, with long delays
  - At 10 (maximum): Banter fires at every opportunity, maximum comedy density
  - Implementation: Multiply all `TRIGGER_CHANCE` values by `chattiness / 10` or similar scaling
  - Simpler than asking users to tune individual frequency/response sliders — one knob to rule them all
- **Raid disable toggle:** A checkbox "Disable in Raids" that suppresses all Banter output when `IsInRaid()` is true
  - Could extend to other contexts: "Disable in Battlegrounds," "Disable in World PvP"
  - Some users may WANT raid banter (farm content, fun guilds) so it should be a toggle, not hardcoded
- **Additional context toggles to consider:**
  - Disable while AFK
  - Disable in cities/resting areas
  - "Party only" mode (only fires when in a party, never solo)
  - Per-channel muting (e.g., never use SAY, only PARTY)
- Settings GUI impact: Need to add widgets without making the panel feel cluttered — the chattiness slider could replace or supplement the existing frequency sliders
- These controls also tie into item #7 (activity state awareness) — if Banter knows you're in a raid, it can auto-adjust behavior

---

## 11. BUG — Persona Lines Assume Player's Class Resource Incorrectly

**Feedback:** Persona lines like "I don't use mana" are wrong when the player is a class that uses mana (e.g., Hunter). Hunters use mana in Anniversary Classic / TBC-era WoW.

**Elaboration:**
Several persona lines hardcode assumptions about the player's resource type. The Ninja persona says *"I do not use mana. I use patience. ...also kunai."* and *"I never had mana. Discipline suffices."* — these break immersion if the player is a Hunter, Paladin, Shaman, Druid, or any mana-using class running that persona.

**Known offending lines (from quick scan):**
- Ninja MANA_ZERO statements: `nin_mana_c04` — "I do not use mana. I use patience. ...also kunai."
- Ninja MANA_ZERO responses: "I never had mana. Discipline suffices."
- Warrior and Pirate likely have similar "I don't use mana" lines
- Any line that claims the speaker doesn't use a resource that their actual class DOES use

**Affected classes in Anniversary Classic that use mana:**
- Hunter, Paladin, Shaman, Druid (all forms), Mage, Warlock, Priest — that's 7 of 9 classes
- Only Warrior (rage) and Rogue (energy) genuinely don't use mana

**Considerations:**
- Fix option A: Remove or rewrite lines that assume "no mana." Replace with lines that work regardless of class — focus the humor on the SITUATION (someone running dry) not the speaker's resource type
- Fix option B: Gate these lines behind a class check — `UnitClass("player")` returns the player's class, only serve "I don't use mana" lines if the player is actually a Warrior or Rogue
- Fix option C: Use a `{resource}` token that resolves to "mana," "rage," or "energy" based on player class — though this only works for self-referencing lines, not comments about others
- Option A is simplest and avoids adding class-awareness complexity to the line picker
- Full audit needed across ALL 4 personas for any line that assumes the player's class, resource type, armor type, or abilities

---

## 12. Replace Archetype Personas With Class Personas (SUPERSEDES #1)

**Feedback:** Scrap the pirate/ninja/warrior/neutral archetype concept entirely. Replace with class-based personas — Warlock, Mage, Hunter, Druid, Paladin, Priest, Rogue, Shaman, Warrior. Add a "Current Class" auto-detect option.

**Elaboration:**
This is a fundamental identity shift for Banter. Instead of "pick a funny hat" (pirate, ninja), the persona IS the player's class. A Warlock sounds like a Warlock — dark, casually evil, too comfortable with demons. A Hunter sounds like a Hunter — blaming the pet, feigning death at the first sign of trouble, accidentally pulling. This unlocks a massive amount of class-relevant humor that archetype personas can never touch.

**Considerations:**
- **9 class personas required:** Warrior, Mage, Warlock, Priest, Rogue, Hunter, Druid, Paladin, Shaman
- **"Current Class" dropdown option:** Auto-detects via `UnitClass("player")` and loads the matching persona. No manual selection needed. Could be the default.
- **Content scale:** Each class persona needs lines across all triggers (currently 12, expanding to 15+ per other feedback items) × 4 rarity tiers × statements AND responses. That's ~200+ lines per class minimum for good coverage = ~1,800+ new lines total
- **Comedy angles per class (initial brainstorm):**
  - **Warrior:** Gruff, straightforward, solves problems by hitting them, confused by magic ("I don't understand what you just did but things are on fire now")
  - **Mage:** Intellectually superior, annoyed by melee, obsessed with food/water conjuring, secretly terrified of anything that gets close
  - **Warlock:** Casually sinister, treats demons like coworkers, weirdly calm about dark magic, "this is fine" energy during disasters
  - **Priest:** Passive-aggressive healer guilt, martyr complex, "I could let you die and nobody would know," Holy vs Shadow internal conflict
  - **Rogue:** Paranoid, always planning an exit, judging everyone's positioning, "I was never here"
  - **Hunter:** Pet excuses for everything, accidental puller, Feign Death enthusiast, "my pet's DPS is higher than yours"
  - **Druid:** Identity crisis across forms, hippie-meets-bear, passive nature commentary, "I could be a tree right now but instead I'm here"
  - **Paladin:** Self-righteous, bubble-hearth jokes, Light-powered condescension, reluctant tank/healer
  - **Shaman:** Elemental small talk, totem micromanagement, reincarnation smugness ("I'll be fine, you won't"), constantly buffing people who don't appreciate it
- **Migration path:** Could keep 1-2 archetype personas as "novelty" options (Pirate stays as a fun pick) while making class personas the primary system
- **This also fixes #11** — class personas naturally use the correct resource type, abilities, and class identity
- **File structure:** One file per class — `Banter_Persona_Warrior.lua`, `Banter_Persona_Mage.lua`, etc. (Warrior file already exists but needs full rewrite for class voice vs. generic gruff soldier)

---

## 13. Track Player Actions & Reference Them in Banter

**Feedback:** Banter should track what's actually happening — DPS/healing performance, death counts, who keeps pulling, who keeps dying — and weave that data into lines. "Oh look, {name} was last on the meters AGAIN" or "After 3 deaths you'd think {name} would get it by now."

**Elaboration:**
This transforms Banter from scripted quips into something that feels almost sentient. Instead of generic "someone died" lines, Banter calls out SPECIFIC players by name with SPECIFIC stats. This is where the addon goes from funny to legendary-clip-worthy.

**Considerations:**
- **Trackable metrics via combat log:**
  - **Death count per player** (per session or per boss)
  - **Damage done / DPS** — can parse `SWING_DAMAGE`, `SPELL_DAMAGE`, `RANGE_DAMAGE` from `COMBAT_LOG_EVENT_UNFILTERED`
  - **Healing done / HPS** — `SPELL_HEAL`, `SPELL_PERIODIC_HEAL`
  - **Damage taken** — who's eating the most damage (standing in fire king)
  - **Interrupts performed** — who's actually kicking
  - **Pull count** — who initiated combat (first `SPELL_DAMAGE` or `SWING_DAMAGE` in a new combat session)
  - **Crowd control breaks** — who broke the sheep
- **New context tokens for phrases:**
  - `{worst_dps}` — player name with lowest damage
  - `{top_dps}` — player name with highest damage
  - `{most_deaths}` — player who has died the most this session
  - `{death_count}` — number of times that player has died
  - `{puller}` — who started combat
  - `{cc_breaker}` — who broke CC
  - `{fire_king}` — player who took the most avoidable damage
- **Example lines with stat references:**
  - *"{most_deaths} has died {death_count} times. At this point it's a lifestyle choice."*
  - *"I've seen training dummies do more damage than {worst_dps}."*
  - *"{top_dps} is carrying so hard their back is filing a workers' comp claim."*
  - *"{puller} pulled again. Shocking. My surprised face is somewhere in my bags."*
  - *"{cc_breaker} broke the CC. Again. The sheep had a FAMILY."*
- **Storage:** Session-scoped stat table, reset on instance reset or manual `/banter reset`. No need to persist to SavedVariables.
- **Sensitivity concern:** Calling out the worst DPS in a pug could be toxic. Options:
  - Only fire performance-callout lines in parties with other Banter users (opt-in humor)
  - Add a "Roast Mode" toggle in settings — OFF by default
  - Keep callouts lighthearted, never mean-spirited — the line should make the roasted player laugh too
  - Limit to party chat, never /say or /yell
- **Implementation:** New module `Banter_Stats.lua` that hooks `COMBAT_LOG_EVENT_UNFILTERED` and maintains running tallies. Stats exposed to phrase system via new tokens.

---

## 14. Real Back-and-Forth Banter Between Addon Users

**Feedback:** Lean HARD into the "banter" name. When multiple group members have the addon, their personas should have actual conversations — ribbing each other, callbacks, escalating bits. Not just statement → generic response, but genuine comedic dialogues.

**Elaboration:**
This expands on #8 (responses feel like nonsense) but goes further. The vision isn't just "statement + matching response" — it's multi-turn exchanges where personas develop running bits during a session. A Warlock and a Paladin should ARGUE. A Rogue and a Hunter should blame each other. The personas should have OPINIONS about other personas.

**Considerations:**
- **Cross-persona reaction tables:** Each class persona has opinions about the other classes:
  - Warlock → Paladin: antagonistic ("Your Light gives me a headache. Intentionally.")
  - Paladin → Warlock: judgmental ("I can smell the fel from here. You need the Light. And soap.")
  - Rogue → Hunter: competitive ("Your pet has more raid awareness than you.")
  - Hunter → Rogue: defensive ("At least my pet SHOWS UP to fights. Where were you?")
  - Priest → Everyone: passive-aggressive healing guilt ("Oh, you need a heal? After standing in that? Interesting choice.")
  - Druid → Warrior: confused respect ("You just... hit things? With your BODY? No shapeshifting? Bold.")
- **Multi-turn scene structure:**
  - Current: Player A statement → Player B response (2 lines, done)
  - Proposed: Player A statement → Player B response → Player A comeback → Player B closer (2-4 lines, escalating)
  - Comm protocol needs extension: After SCENE_LOCK, allow a "SCENE_CONTINUE" message for follow-up volleys
  - Need a max turn limit (3-4 exchanges) to prevent infinite ping-pong
- **Running bits / session memory:**
  - Track what topics have come up this session
  - Enable callbacks: If Ninja made a comment about someone standing in fire earlier, reference it later ("Still thinking about that fire incident. It haunts me.")
  - Session-scoped, not persisted — fresh bits every play session
- **Timing:**
  - Exchanges need human-feeling delays (2-5 seconds between turns)
  - Can't feel instant or scripted — slight randomness in reply timing
- **This is the feature that makes Banter go viral.** Two players in a dungeon whose addons are casually roasting each other in party chat = screenshot → Reddit → "what addon is that?" → downloads.

---

## 15. Self-Promotion — Detect "What Addon?" Questions & Respond Comedically

**Feedback:** When someone in chat asks "what addon is that?" or similar, Banter should detect it and fire a comedic self-promotional response.

**Elaboration:**
This is brilliant marketing built into the product itself. If Banter's lines are funny enough, non-users WILL ask what addon is producing them. Banter detecting that question and responding in-character turns organic curiosity into automatic advertising.

**Considerations:**
- **Detection method:** Chat message filter on incoming `CHAT_MSG_PARTY`, `CHAT_MSG_SAY`, `CHAT_MSG_RAID`, `CHAT_MSG_WHISPER`. Scan for keyword patterns:
  - "what addon" / "which addon"
  - "what mod" / "which mod"
  - "how are you doing that"
  - "is that an addon"
  - "what's making you say that"
  - "lol what is that"
  - "banter" (if someone names us directly)
- **Response approach — in persona voice, never breaking character:**
  - **Warlock:** "Addon? I made a pact with something. It speaks through me now. ...google 'Banter addon' if you want your own demon."
  - **Paladin:** "The Light provides. Also github.com/greenovate/banter. Mostly the second one."
  - **Rogue:** "I could tell you. But then I'd have to... actually, just search for Banter. I can't be bothered with the threat."
  - **Hunter:** "My pet found it. github.com/greenovate/banter. Good boy."
  - **Mage:** "It's called Banter. I'd conjure you a copy but it's on GitHub. Technology. Disgusting."
  - **General fallback:** "I am Banter. I live here now. github.com/greenovate/banter"
- **Rate limiting:** Only fire once per session per player asking. Don't spam if multiple people ask.
- **Cooldown:** Max once every 5 minutes globally to prevent it from being annoying.
- **Settings toggle:** "Self-promotion" checkbox, ON by default. Some users might want to disable it.
- **Legal/ToS consideration:** This is just an addon talking in chat. No different from DBM announcing boss timers. Should be fine as long as it's not actually spammy.
- **The URL must always be included** — `github.com/greenovate/banter` — because funny without a link is just entertainment, funny WITH a link is growth.

---

## Next Steps

- [ ] Gather specific examples and screenshots from testers where possible
- [ ] Prioritize items by impact and feasibility
- [ ] Discuss approach for each item before implementing
- [ ] Determine what goes into V1.0-Beta-2 vs later releases
- [ ] Item #8 (broken responses) and #9 (comedy quality) are arguably blockers — addon's core promise is broken if conversations don't flow and lines aren't funny
- [ ] Item #10 (chattiness + raid toggle) is low-effort, high-impact QoL
- [ ] Items #5, #6, #7 are new triggers — each requires persona content across all 4 personas × 4 tiers
- [ ] Item #12 (class personas) is now the CORE direction — supersedes #1, fixes #11, and is prerequisite for #13 and #14
- [ ] Item #13 (stat tracking) and #14 (real back-and-forth) are the "make it legendary" features
- [ ] Item #15 (self-promotion) is low-effort, high-reward viral marketing
- [ ] Archetype personas (Pirate, Ninja) may remain as "novelty/fun" options alongside class personas

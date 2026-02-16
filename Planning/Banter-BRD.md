# Banter Addon — BRD (Business Requirements Document)

## 1. Purpose
Banter is a fully automated RP / banter addon for WoW Anniversary Classic that injects ambient persona dialogue into party/raid gameplay.

Install path: `World of Warcraft\_anniversary_\Interface\AddOns\Banter`

Goals:
- Automated RP statements based on gameplay triggers + time gating
- Optional coordinated auto-responses from other Banter users
- Zero user engagement during play (beyond initial settings)
- Lightweight and non-spammy (hard caps + cooldowns)
- No visible addon branding or explanations in chat

Players without Banter will see strange RP lines.
Players with Banter will experience coordinated group banter.

## 2. Core Design Principles
- Imperfect and organic
- Short lines
- No mechanics blame/callouts
- Scene-based: statement -> responses -> stop
- Party/raid safe by enforcing responder caps

## 3. High-Level Behavior
Solo (no other Banter users):
- Emit random RP statements from triggers + randomized cooldown gate.

Group (Banter users detected):
- One client emits a statement.
- Up to N clients emit responses.
- Scene ends (no chaining).

## 4. Scene Model
All dialogue is structured as Scenes.

Scene fields:
- id: unique string
- trigger: event bucket identifier
- weight: rarity/selection weight
- statement: the initiating line
- responses: list of possible reply lines (response lines never trigger further responses)

Rules:
- Only statements start a scene.
- Only responses may reply.
- Responses never trigger additional replies.
- Scene ends after responder cap or timeout.

## 5. Triggers (examples)
- PLAYER_DEAD / party member death
- WIPE (multiple deaths in short window)
- HEALTH_LOW threshold
- MANA_ZERO threshold
- LOOT events (blue/purple)
- ENTER_INSTANCE
- INTERRUPT_SUCCESS
- PERIODIC_DAMAGE (proxy for standing in fire)
- Ambient timer (low probability + time gated)

Triggers are gated by RNG + cooldown, not guaranteed.

## 6. Timing & Gating
- Global scene start gate: randomized 25–90s
- Response gate: randomized 20–60s
- Per-trigger caps (examples):
  - Death: Party 1–2, Raid 1
  - Wipe: Party 1–3, Raid 1–2
  - Loot: Party 0–1, Raid 0
  - Damage: Party 0–1, Raid 0
  - Ambient: 0 responses

## 7. Addon Communication (invisible)
Use SendAddonMessage with PARTY/RAID distribution for coordination only (players never see it).

Message types:
- HELLO / HERE (handshake to detect Banter users)
- SCENE_START (announce new scene)
- CLAIM (client requests a response slot)
- SCENE_LOCK (leader grants allowed responders)

Used to:
- Detect Banter users
- Enforce responder caps
- Prevent raid spam
- Rotate/fairness (avoid same person always responding)

## 8. Personas
User selects one persona:
- Pirate, Warrior, Ninja, Neutral (extensible)

Persona affects phrase pools only.

## 9. Phrase Pools & Rarity
Phrase sets organized by:
- Persona
- Trigger bucket
- Rarity tier

Rarity tiers:
- Common 60–70%
- Uncommon 20–30%
- Rare 8–10%
- Mythic 1–2%

Add repeat protection:
- track last N spoken lines
- skip repeats
- track recent scenes

## 10. Optional: Persona Chat Filter
Optional feature: transform the player's outgoing party/raid messages into persona style automatically.

Guardrails:
- Party/Raid only by default
- Never modify slash commands, whispers, or hyperlinks
- Bypass via prefix (e.g. leading "!") or modifier key

## 11. Minimal Configuration
- Enable/disable
- Persona selection
- Allowed channels (say/party/raid)
- Frequency slider
- Persona chat filter toggle

No “test” buttons. Discovery stays organic.

## 12. Non-goals
- Gameplay optimization
- Mechanics warnings
- Blame/shaming
- Branding spam
- Mandatory usage

## 13. Success Criteria
- Feels spontaneous and human
- No chat spam (caps enforced)
- Non-users confused
- Users with Banter feel connected

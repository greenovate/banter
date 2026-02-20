# Banter

**Your party just got a lot louder.**

Banter is a comedy RP engine for World of Warcraft Anniversary Classic (TBC 2.5.5). It watches what happens in-game — deaths, wipes, low health, loot rolls, combat, flight paths, zone changes, and more — then fires off class-specific comedic commentary in chat as if your character has *opinions*.

No macros. No keybinds. No effort. Just laughs.

---

## 10 Personas — Class Identity Comedy

Every WoW Classic class has its own persona with a unique comedic voice. Your character doesn't just react — they react *in character*.

| Persona | Voice | Sample |
|---------|-------|--------|
| **Warrior** | Frustrated, combat-obsessed, impatient | *"Just me out here. No healer. No problem. I AM the problem."* |
| **Mage** | Insufferably smug intellectual | *"Alone with my intellect. The best company there is."* |
| **Warlock** | Casually evil, darkly self-aware | *"My demons don't judge. Well, the Voidwalker judges. But quietly."* |
| **Priest** | Overworked, exasperated healer | *"I have a res. I have standards. Only one of those is going your way."* |
| **Rogue** | Cold tactical operative | *"I was never here. This conversation didn't happen. You saw nothing."* |
| **Hunter** | Oblivious, lovable goofball | *"My pet's judging that pull. I can tell by the ears."* |
| **Druid** | Perpetually flustered shapeshifter | *"Wrong form. Wrong form. ...still wrong form."* |
| **Paladin** | Self-righteous holy warrior | *"The Light provides. Specifically, it provides ME."* |
| **Shaman** | Beleaguered elemental diplomat | *"Earth says slow down. Wind says speed up. Typical."* |
| **Pirate** | Salty, dramatic sea dog *(novelty)* | *"THAT LOOT BE MINE BY BIRTHRIGHT! ...I were born on a boat, everythin' on boats be mine!"* |

Set your persona to **AUTO** and it matches your class automatically.

---

## 18 Triggers — 4 Rarity Tiers — Thousands of Lines

Every trigger pulls from **COMMON**, **UNCOMMON**, **RARE**, and **MYTHIC** pools — the best lines are the ones you almost never hear.

| Trigger | Fires When... |
|---------|---------------|
| Player Dead | A party member dies |
| Wipe | The whole group goes down |
| Health Low | Someone drops below 25% HP |
| Mana Zero | A caster goes OOM |
| Loot | Someone wins a roll |
| Enter Instance | You zone into a dungeon |
| Interrupt | Someone kicks a cast |
| Periodic Damage | Someone stands in fire. Again. |
| Combat Start | A pull happens |
| Mob Kill | Something dies |
| Crowd Control | Someone gets CC'd |
| Ambient | Nothing's happening (yet) |
| Player Disconnect | Someone DCs mid-run |
| Consumable Used | Someone pops a consumable |
| Major Cooldown | A big cooldown gets used |
| Flight Path | You hop on a flight path |
| Zone Changed | You enter a new zone (solo) |
| Solo Ambient | Inner monologue while adventuring alone |

---

## Solo Mode — Your Character Has Thoughts

When you're not in a group, Banter doesn't go silent — it gives your character an inner monologue. Solo mode uses `/emote` to deliver **zone-aware observations** and **persona-specific musings** as you travel the world.

- **Zone-aware lines** — over 100 zones have unique commentary ("The lava here is... enthusiastic." in Blackrock)
- **Dedicated solo content** — every persona has a full pool of solo-only inner thoughts, separate from group banter
- **Zone change trigger** — entering a new zone can fire fresh observations about your surroundings
- **No recycled group lines** — solo content is written for solo; it sounds like it

---

## Cross-Class Engagements

In groups and raids, Banter fires **engagement threads** — multi-line conversations between party members based on their class combinations. A Warrior might call out a Mage for drinking again; a Priest might lecture a Warlock about life tapping.

- **Targeted threads** — class-vs-class banter with openers, responses, and follow-ups
- **Zone-specific threads** — unique banter that fires in specific dungeons, raids, and zones
- **Universal threads** — general topics any class can start

---

## Multi-Addon Sync

Running Banter with friends? The addon automatically discovers other Banter users in your group, elects a scene leader, and staggers responses so everyone's persona reacts in sequence.

No setup. No configuration. Just more chaos.

---

## Three Group Modes — Independent Settings

| Mode | When | Output |
|------|------|--------|
| **Group** | Party of 2–5 | PARTY, SAY, or EMOTE |
| **Raid** | Raid groups | RAID, RAID_WARNING, SAY, or EMOTE |
| **Solo** | Alone | /emote (automatic) |

Each mode has its own **enabled toggle**, **frequency**, **output channel**, and **per-trigger controls** via the tabbed settings UI.

---

## Chat Filter — Talk Like Your Persona

Turn on the **Persona Chat Filter** and your typed messages get transformed before they're sent. Pirate slang, warrior jargon, rogue operative-speak — your words, their voice.

Type: `"Nice job on that pull everyone"`
Send as Pirate: `"Yarr! Nice job on that pull ye scallywags, arr!"`

Bypass anytime with `!` prefix.

---

## Settings

- **Tabbed UI** — General, Group, Raid, Solo, PVP BG, Arena
- **Minimap button** — click to open, drag to reposition
- **Persona selector** — switch voices instantly, or set to AUTO for class detection
- **Per-mode output channel** — choose where banter goes for each group type
- **Frequency sliders** — control how often scenes fire
- **Per-trigger toggles** — enable or disable individual triggers per mode
- **Chat filter toggle** — transform your outgoing messages
- **Debug mode** — see exactly what's firing and why
- `/banter` slash command with full subcommand support

---

## Install

**CurseForge (recommended):** Search for **Banter** in the CurseForge app, or visit [curseforge.com](https://www.curseforge.com/wow/addons/banter).

**Manual:**
1. Download the latest release from [Releases](https://github.com/greenovate/banter/releases)
2. Extract so the `Banter` folder is inside `Interface\AddOns\`
3. Restart WoW or `/reload`
4. Type `/banter` to open settings

---

## Requirements

- World of Warcraft Anniversary Classic (Interface 20505)
- A group that can take a joke (recommended)

---

## Credits

Made by **evild "Iowke"** on Dreamweaver.

GitHub: [github.com/greenovate/banter](https://github.com/greenovate/banter)
CurseForge: [curseforge.com/wow/addons/banter](https://www.curseforge.com/wow/addons/banter)

---

*"Out here, alone, full plate, big axe, nothing but horizon and hostiles — this is what they trained me for."*
— Warrior, MYTHIC Solo Ambient

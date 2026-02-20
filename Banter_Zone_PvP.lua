-- Banter_Zone_PvP.lua
-- Zone-specific banter for every battleground in Classic + TBC.
-- References SPECIFIC strategies, objectives, and PvP culture.
-- Loaded after Banter_Engagements.lua.
local _, ns = ...
local Z  = ns.engagements.Z
local ZT = ns.engagements.ZT

---------------------------------------------------------------------------
--  BATTLEGROUNDS
---------------------------------------------------------------------------

-- Warsong Gulch ---------------------------------------------------------------
Z("Warsong Gulch", {
    "Warsong Gulch. Capture the flag. Simple concept. Total chaos in execution.",
    "Get the flag. Bring the flag back. Don't die. PLEASE don't drop the flag in the middle.",
    "The Warsong Lumber Camp versus the Silverwing Sentinels. Orcs need wood. Elves say no. PvP.",
    "Three captures to win. Sounds easy. It is NOT easy.",
}, {
    "The flag room has one entrance and every enemy in the battleground knows where it is.",
    "Druids in travel form with the flag are the BANE of every WSG team. Un-catchable bears.",
    "The midfield fight happens every game. People forget the objective and just... brawl.",
    "Roof sitting. Tunnel hugging. Graveyard camping. WSG has developed its own criminal culture.",
    "A good flag carrier is worth five DPS. A BAD flag carrier is worth negative five.",
    "The trees in the middle block line of sight. Rogues love those trees. Everyone else hates them.",
}, {
    "WSG is about the flag. THE FLAG. Not the fight in the middle. THE FLAG.",
    "Fastest WSG game: two minutes. Slowest: the full timer. Both feel like they lasted a week.",
    "Capture the flag in WoW means 'capture the flag while nine other people do something completely different.'",
    "I love WSG. And I hate WSG. Both at the same time. Every game.",
})

-- Arathi Basin ----------------------------------------------------------------
Z("Arathi Basin", {
    "Arathi Basin. Five bases. Fifteen players. Hold three to win. Sounds manageable. It's not.",
    "Farm, Stables, Blacksmith, Mine, Lumber Mill. The five points that determine victory.",
    "The Blacksmith is in the CENTER and everyone fights there first. Every. Single. Game.",
    "Two thousand resources to win. Points tick based on how many bases you hold. Math AND combat.",
}, {
    "Stables is the closest Alliance base. Farm is closest Horde. The first cap is always predictable.",
    "The Lumber Mill overlooks everything. Height advantage AND resource generation.",
    "The Mine is isolated. Far from everything. Whoever holds it usually holds it alone. And lonely.",
    "Three base strategy: cap three, defend three, ignore two. Simple. Nobody follows it.",
    "The Blacksmith fight is a brawl that never ends. People LOVE fighting at BS even when they shouldn't.",
    "A well-coordinated five-cap is the most satisfying thing in WoW PvP. And the rarest.",
}, {
    "AB is won by defense, not offense. Holding bases matters more than killing people. But try telling that to anyone.",
    "If everyone went to Blacksmith, who's defending Stables? NOBODY. That's who.",
    "The resource ticking sound when you're losing is the most stressful audio in the game.",
    "Arathi Basin: where strategy meets stubbornness and stubbornness usually wins.",
})

-- Alterac Valley --------------------------------------------------------------
Z("Alterac Valley", {
    "Alterac Valley. The EPIC battleground. Forty vs forty. Bosses, mines, towers, and pure war.",
    "Drek'Thar for Horde. Vanndar Stormpike for Alliance. Kill the enemy general to win.",
    "Old school AV lasted HOURS. Days even. People would LOG OUT and come back. It was a war.",
    "The Frostwolf and Stormpike factions have been fighting in this valley since before we showed up.",
}, {
    "Galvangar and Balinda are lieutenant bosses. Killing them despawns reinforcements. Tactical value.",
    "Captain Balinda hits hard but goes down fast with a coordinated group. Key early target.",
    "Towers burn down over time once captured. The enemies try to recapture them. Defense matters.",
    "The Field of Strife is the snowy no-man's-land in the middle. Mass PvP happens here.",
    "Korrak the Bloodrager used to roam the valley. A yeti boss mid-battleground. Classic chaos.",
    "The mine resources contribute to your faction's reinforcement counts. Control the economy of war.",
}, {
    "Alterac Valley is the closest WoW gets to actual warfare. Supply lines, objectives, boss kills.",
    "A good AV rush kills the general in fifteen minutes. A bad one turns into a three-hour stalemate.",
    "Back in my day, AV lasted all day. People took SHIFTS. True story.",
    "Forty people charging through snow toward enemy towers. Peak WoW PvP.",
})

-- Eye of the Storm ------------------------------------------------------------
Z("Eye of the Storm", {
    "Eye of the Storm. The TBC battleground. Towers AND a flag. TWO objectives. Multitasking required.",
    "Four towers at the edges. A flag in the CENTER. Capture both tower types AND run the flag.",
    "The bridges between towers are NARROW. One knockback and you're falling off the edge.",
    "Mage Tower, Draenei Ruins, Blood Elf Tower, Fel Reaver Ruins — four control points.",
}, {
    "The flag spawns in the center on a floating pillar. Grab it. Run to a CAPTURED tower. Score.",
    "Knockbacks on the bridges create the best moments. Engineers with rocket boots fear nothing.",
    "Two towers held generates enough points to win slowly. Three towers AND the flag? Dominant.",
    "The Fel Reaver Ruins are in the northeast. Even in a battleground, Fel Reavers haunt us.",
    "The center fight for the flag is constant. Whoever controls mid controls the pace.",
    "Mage Tower has the high ground. Mages love it. Everyone else has to climb to get there.",
}, {
    "EotS combines AB's base control with WSG's flag running. Maximum multitasking.",
    "The bridge fights are BRUTAL. One well-timed knockback sends three people to their death.",
    "Flag carriers sprinting from center to a captured tower is the most exciting thing in TBC PvP.",
    "Eye of the Storm is where TBC PvP shines. Floating islands, dual objectives, and bridges of death.",
})

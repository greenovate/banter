-- Banter_Zone_Cities.lua
-- Zone-specific banter for every major city in Classic + TBC.
-- References SPECIFIC landmarks, NPCs, culture, and city life.
-- Loaded after Banter_Engagements.lua.
local _, ns = ...
local Z  = ns.engagements.Z
local ZT = ns.engagements.ZT

---------------------------------------------------------------------------
--  ALLIANCE CITIES
---------------------------------------------------------------------------

-- Stormwind City --------------------------------------------------------------
Z("Stormwind City", {
    "Stormwind City. Trade chat, the auction house, and a thousand people standing on the bridge doing nothing.",
    "The Defias REBUILT this city. Every wall, every tower. Then the kingdom didn't pay them. Awkward.",
    "The Deeprun Tram connects to Ironforge. Underground. Under the ocean. Gnomish engineering is WILD.",
    "The Park District, the Mage Quarter, Cathedral Square... Stormwind has more culture than half the kingdoms.",
}, {
    "Trade chat is either the best or worst part of Stormwind. There is absolutely no in-between.",
    "The canals are nice until you fall in and can't find the exit. Which happens constantly.",
    "SI:7 headquarters is hidden in Old Town. The king's spy network operates from a cheese shop.",
    "Bolvar Fordragon protects young King Anduin. The regent is basically running the Alliance.",
    "The Cathedral of Light dominates the skyline. The most impressive building in the Eastern Kingdoms.",
    "The auction house is where fortunes are made and dreams die. Supply and demand is brutal.",
}, {
    "Stormwind is the heart of the Alliance. Also the heart of Trade chat arguments.",
    "I could spend hours in Stormwind. And I HAVE. Waiting for a dungeon group. At the meeting stone.",
    "Say what you want about Stormwind — the architecture is incredible. Thank the Stonemasons. Oh wait.",
    "The fact that this city's builders became its greatest enemy is the most tragic story in WoW.",
})

ZT("Stormwind City", "WARRIOR", {
    "{name}, Stormwind's military is always recruiting. You could join the guard. Easy commute.",
    "A Warrior in Stormwind. {name}, have you visited the training grounds? They could use instructors.",
    "Hey {name}, the arms trainers in Old Town are supposed to be the best. Tried them?",
}, {
    "Stormwind's guard could use more warriors like me. The ones they have keep getting reassigned.",
    "The Arena District has practice dummies. I've broken four of them. Today.",
    "I trained in this city. These streets made me. Well, the TRAINING grounds made me. The streets just confused me.",
    "Old Town has the real fighters' tavern. The one where nobody starts a fight. Because everyone CAN.",
}, {
    "Stormwind raised me as a warrior. I'll defend it as one.",
    "The training grounds here are world-class. The dummies less so. They keep needing replacement.",
})

-- Ironforge -------------------------------------------------------------------
Z("Ironforge", {
    "Ironforge. Built inside a MOUNTAIN. With lava. The dwarves carved a city around a FORGE.",
    "The Great Forge in the center is always burning. The whole city is basically a sauna.",
    "The auction house here is the busiest in the Eastern Kingdoms. Dwarves know commerce.",
    "Tinker Town is the gnome quarter. They got a SECTION of Ironforge after losing Gnomeregan.",
}, {
    "The Military Ward has all the weapon trainers. And the most aggressive bartenders in Azeroth.",
    "The Mystic Ward has mages, priests, and warlocks. Plus a portal to Stormwind. Convenient.",
    "King Magni Bronzebeard rules from the throne. He's been king since before the Second War.",
    "The Dwarven District in Stormwind is just the BRANCH office. Ironforge is headquarters.",
    "The Library of Ironforge has the Explorer's League records. Every dig, every find, catalogued.",
    "Tinker Town smells like oil, sparks, and regret. The gnomes love it.",
}, {
    "Ironforge is the coziest capital city. Stone walls, warm lava, and unlimited beer.",
    "The Great Forge never goes out. Dwarves have been hammering at it for centuries.",
    "I love Ironforge but the circular layout confuses me every single time. WHERE is the bank?!",
    "The dwarves carved paradise out of solid rock. And then put a pub in every ward.",
})

-- Darnassus -------------------------------------------------------------------
Z("Darnassus", {
    "Darnassus. An entire city inside a World Tree. Night elf architecture is just trees. LIVING trees.",
    "Tyrande Whisperwind and Malfurion's influence is everywhere. Moonwells, groves, temple of Elune.",
    "The Cenarion Enclave has all the druid trainers. Because druids need a GROVE inside a TREE.",
    "This city is gorgeous. And empty. Nobody comes here. It's the most beautiful ghost town.",
}, {
    "The Temple of the Moon is dedicated to Elune. The night elven goddess. It's breathtaking.",
    "The bank is built into a tree root. The night elves don't build ON nature — they build IN it.",
    "The Warrior's Terrace has training grounds overlooking the canopy. Best workout view possible.",
    "Rut'theran Village below is the only real dock. One boat to Auberdine. Darnassus is ISOLATED.",
    "The moonwells glow with Elune's blessing. Touching one feels... right. Even if you're not a night elf.",
    "Darnassus was built after the World Tree Nordrassil was damaged. This is the night elves' second attempt.",
}, {
    "Darnassus is proof that beauty doesn't guarantee foot traffic. This city is DESERTED.",
    "If more people came here they'd realize it's the prettiest city in the game. But they don't. So.",
    "The night elves have a whole capital nobody visits. Ten thousand years of civilization, zero auction house traffic.",
    "I always come back to Darnassus to relax. It's the only city where nobody's yelling in Trade chat.",
})

-- The Exodar ------------------------------------------------------------------
Z("The Exodar", {
    "The Exodar. A crashed SPACESHIP that the draenei turned into a city. Just casually.",
    "This was a naaru vessel. Then the blood elves sabotaged it. Then it crashed. Now it's a capital city.",
    "The crystal architecture pulses with energy. The ship isn't dead — it's dormant.",
    "O'ros the naaru is IN the city. A being of pure Light just floating in the main hall.",
}, {
    "The Vault of Lights has arcane entities the draenei brought from Draenor. Alien imports.",
    "The Seat of the Naaru is where O'ros resides. The draenei's navigation spirit, grounded forever.",
    "Vindicator Maraad trains warriors. A draenei paladin the size of a small house.",
    "The crystal halls are alien technology. This isn't stone — it's crystallized arcane energy.",
    "Prophet Velen leads from here. The oldest leader on Azeroth. Older than CIVILIZATIONS.",
    "The draenei traders still have inter-dimensional goods. Shopping here is a cosmic experience.",
}, {
    "The Exodar is the most unique capital in the game. It's a spaceship. On a beach. Still humming.",
    "Velen has been alive for twenty-five THOUSAND years. He's seen galaxies. And now he's on Azeroth.",
    "I get lost in the Exodar constantly. The layout makes sense if you're an alien. I'm not.",
    "The crystals still glow. The ship wants to FLY. It just... can't.",
})

---------------------------------------------------------------------------
--  HORDE CITIES
---------------------------------------------------------------------------

-- Orgrimmar -------------------------------------------------------------------
Z("Orgrimmar", {
    "Orgrimmar. Built from red rock, iron spikes, and pure Horde determination.",
    "Thrall's Orgrimmar is a fortress city. Every building looks like it could survive a siege.",
    "The Valley of Strength has the auction house and the bank. Also a giant bonfire. For ambiance.",
    "The Drag is the shady alley district. Rogues, warlocks, and questionable vendors.",
}, {
    "The Valley of Wisdom is where Thrall holds court. The Warchief's throne room is OPEN AIR. Bold.",
    "Grommash Hold is named after Grom Hellscream. The hero of the Horde. And the guy who drank demon blood first.",
    "The Cleft of Shadow has the warlock and rogue trainers. Underground, dark, and suspicious.",
    "The flight master is on a cliff overlooking the city. The wyverns launch from there. Practical AND dramatic.",
    "The Horde auction house has different dynamics than Alliance. Supply lines are DIFFERENT here.",
    "The Valley of Spirits has troll and undead representatives. Multicultural. In a brutal way.",
}, {
    "Orgrimmar LOOKS intimidating. The spikes, the iron, the red canyon. It's designed to say 'don't.'",
    "Thrall built this city from nothing in a harsh land. That's the Horde spirit in architecture form.",
    "I love that the Drag exists. Every city needs a shady district where the warlocks hang out.",
    "Orgrimmar is hot, loud, and aggressive. Just like the Horde.",
})

-- Thunder Bluff ---------------------------------------------------------------
Z("Thunder Bluff", {
    "Thunder Bluff. An entire city on top of stone pillars. Connected by BRIDGES. No guardrails.",
    "Cairne Bloodhoof leads from the High Rise. The wisest leader in the Horde.",
    "The totems and hides decorating the bluffs are Tauren tradition. Every tent tells a story.",
    "The elevator is the most dangerous thing in Thunder Bluff. More people die to it than to enemies.",
}, {
    "Spirit Rise has the shaman and druid trainers. Plus the priest trainers. Spiritual real estate.",
    "Hunter Rise is where the hunters gather. With a shooting range overlooking the plains. Best training spot.",
    "The Elder Rise has the DRUID trainers. Archdruid Hamuul Runetotem lives up there.",
    "The auction house is tiny compared to Orgrimmar's. Thunder Bluff is about community, not commerce.",
    "The lifts to the city are Tauren engineering. Counterweight systems. Simple, effective, deadly when mistimed.",
    "Cairne's wisdom guides the Tauren. He joined Thrall's Horde because he saw honor in it.",
}, {
    "Thunder Bluff is the ONLY city where fall damage is a serious threat. Multiple times per visit.",
    "The Tauren build UP because the plains are sacred. Don't build on them — build ABOVE them.",
    "I've fallen off Thunder Bluff three times. EVERYONE has fallen off Thunder Bluff.",
    "This is the most peaceful Horde city. And also the most deadly, thanks to gravity.",
})

-- Undercity -------------------------------------------------------------------
Z("Undercity", {
    "The Undercity. Built under the ruins of Lordaeron. Where the Forsaken conduct their... experiments.",
    "Sylvanas Windrunner rules from the Royal Quarter. The Dark Lady controls everything beneath the ruins.",
    "The Apothecarium has plague researchers. They're developing 'solutions.' Chemical solutions.",
    "The sewer ring design is confusing. Everything is green, damp, and slightly concerning.",
}, {
    "The War Quarter has the training grounds. Forsaken warriors train in the bones of Lordaeron.",
    "The Magic Quarter has mages and warlocks. The division between them is... blurry. In the Undercity.",
    "The Rogues' Quarter has Varimathras — a DREADLORD serving Sylvanas. Demon middle management.",
    "The Trade Quarter has the auction house and bank. Even the undead need commerce.",
    "Above us are the ruins of Lordaeron castle. Arthas's throne room. Where it all went wrong.",
    "The Apothecary Society is 'developing medicines.' That is a VERY generous description.",
}, {
    "The Undercity is the only capital where the architecture actively depresses you.",
    "Sylvanas runs a tight ship. Or a tight sewer. The Forsaken are efficient, if nothing else.",
    "Getting lost in the Undercity means running the ring three times before finding the right exit.",
    "I appreciate the Undercity's commitment to a theme. The theme is 'abandoned hope.'",
})

-- Silvermoon City -------------------------------------------------------------
Z("Silvermoon City", {
    "Silvermoon City. The blood elves rebuilt HALF of it. The other half is a ruin they pretend doesn't exist.",
    "The architecture is stunning. Golden spires, arcane enchantments, floating brooms that sweep by themselves.",
    "Lor'themar Theron runs the city as Regent. He's been doing it since Kael'thas left for Outland.",
    "The Sunfury Spire has the mage and paladin trainers. The BLOOD KNIGHT trainers. Former draenei-drainers.",
}, {
    "Murder Row is the shady district. Rogues and questionable deals. Even Silvermoon has a seedy side.",
    "The Court of the Sun is gorgeous. Pristine. Enchanted to LOOK perfect even though half the city is destroyed.",
    "The Bazaar has vendors selling enchanted goods. Blood elf commerce is 90% magical luxuries.",
    "The Walk of Elders leads to the ruined half. The city literally has a wall separating beauty from devastation.",
    "The Shepherd's Gate was sealed to keep out the Scourge. Everything beyond it is dead.",
    "Arcane guardians patrol the streets. Floating crystals monitoring everything. Big Brother, blood elf style.",
}, {
    "Silvermoon is beautiful AND tragic. The facade hides a city that lost half its people.",
    "The blood elves live in splendor while their city crumbles behind a wall. Very on-brand.",
    "I respect the rebuilding effort. They made half a city look like a full one through pure illusion.",
    "The floating brooms are the best detail in any city. Self-cleaning streets. Magical efficiency.",
})

---------------------------------------------------------------------------
--  NEUTRAL CITIES
---------------------------------------------------------------------------

-- Shattrath City --------------------------------------------------------------
Z("Shattrath City", {
    "Shattrath City. Where Aldor and Scryers coexist through gritted teeth and A'dal's presence.",
    "A'dal the naaru floats in the Terrace of Light. A being of pure Light holding the peace.",
    "Choose Aldor or Scryers. The most impactful faction choice in TBC. And you WILL regret changing.",
    "The Lower City has all the practical stuff. Banks, inns, and refugees from across Outland.",
}, {
    "The Aldor are draenei priests on the upper rise. Holy warriors dedicated to the Light.",
    "The Scryers are blood elf defectors from Kael'thas. Former enemies now seeking redemption.",
    "A'dal's light fills the Terrace. Standing near the naaru is the most peaceful experience in Outland.",
    "The Lower City is run by refugees — all races, all factions. The melting pot of Outland.",
    "World's End Tavern has a bar AND a PvP arena. Drink and fight. Shattrath multitasking.",
    "The portals to every capital city are here. Shattrath is the HUB of TBC travel.",
}, {
    "Shattrath proves that enemies can coexist. Barely. With a naaru mediating. And lots of tension.",
    "The Aldor vs Scryer grind is TBC's real endgame. Reputation. All the reputation.",
    "I come to Shattrath for the portals. I stay for A'dal's vibes.",
    "World's End Tavern is my favorite place in Outland. Bar fights with a cosmic backdrop.",
})

-- Booty Bay -------------------------------------------------------------------
Z("Booty Bay", {
    "Booty Bay. Goblin neutral territory. Where pirates dock, goods move, and the bruisers keep the peace.",
    "Baron Revilgaz runs this port. From a platform. Overlooking everything. The ultimate micro-manager.",
    "The Bloodsail Buccaneers attack constantly. The goblins just put bounties on them. Business model.",
    "The auction house here is neutral. Horde and Alliance can trade through Booty Bay. Commerce unites all.",
}, {
    "Booty Bay is carved into cliffs. Rickety platforms connected by rope bridges. No safety codes.",
    "The inn has the best rum in Stranglethorn. And the cheapest. Goblin efficiency.",
    "The fishing tournament starts from the dock. Stranglethorn Fishing Extravaganza. Serious business.",
    "Goblin bruisers patrol everywhere. They're neutral — they'll kill ANYONE who causes trouble. Equal opportunity.",
    "The Arena is in the basement. Gurubashi Arena tournament. No rules, no mercy, grab the chest.",
    "Captain Smotts and the pirates that DON'T attack Booty Bay hang around the coast. Pirates vs pirates.",
}, {
    "Booty Bay is the most fun city in the game. Pirates, goblins, and a functional economy.",
    "No laws except 'don't start fights near the bruisers.' The purest form of capitalism.",
    "The Booty Bay auction house is where cross-faction deals happen. Economic diplomacy.",
    "I could retire here. Fishing, drinking, occasional pirate battles. Perfect life.",
})

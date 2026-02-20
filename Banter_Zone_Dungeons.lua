-- Banter_Zone_Dungeons.lua
-- Zone-specific banter for every dungeon in Classic + TBC.
-- References SPECIFIC bosses, trash, layout, and memorable moments.
-- Loaded after Banter_Engagements.lua.
local _, ns = ...
local Z  = ns.engagements.Z
local ZT = ns.engagements.ZT

---------------------------------------------------------------------------
--  CLASSIC DUNGEONS
---------------------------------------------------------------------------

-- Ragefire Chasm --------------------------------------------------------------
Z("Ragefire Chasm", {
    "Ragefire Chasm. A dungeon UNDER Orgrimmar. The Horde has demons in the basement.",
    "The Burning Blade has a whole cult operating underneath the Horde capital. Security is... lax.",
    "Taragaman the Hungerer is down here. A demon. Under Orgrimmar. And Thrall's just... okay with it?",
    "This is the first dungeon most Horde players see. And it's full of demon-worshipping traitors. Fun start.",
}, {
    "Oggleflint leads the troggs down here. Even the troggs have a boss. Respect the hierarchy.",
    "Jergosh the Invoker is a Burning Blade warlock. Summoning demons under the Warchief's feet.",
    "The lava in here connects to something deep. The whole cavern is volcanic.",
    "I love that Orgrimmar's dungeon is just 'go clean out the basement.' Very practical.",
    "Bazzalan is a satyr. A SATYR. Under Orgrimmar. How long has he been here?!",
    "The Searing Blade cultists are the worst kind of traitors. Hiding in plain sight.",
}, {
    "Only the Horde could have a demon infestation under their capital and call it a 'rite of passage.'",
    "Ragefire Chasm is short, hot, and full of betrayal. Classic first dungeon experience.",
    "If Thrall knew there were satyrs under his throne room, he'd... well, he probably does know. He's busy.",
    "At least we cleared it out. Until they respawn. Which they will. Immediately.",
})

-- The Deadmines ---------------------------------------------------------------
Z("The Deadmines", {
    "The Deadmines. Where the Defias Brotherhood built an entire PIRATE SHIP inside a mine.",
    "Edwin VanCleef is at the end. On his ship. Underground. The man committed to a VISION.",
    "This mine goes from goblins to undead to ogres to pirates. The variety is impressive.",
    "The Defias were STONEMASONS who rebuilt Stormwind. Then the kingdom didn't pay them. This is the result.",
}, {
    "VanCleef built the Stormwind we know. Every wall, every tower. And they stiffed him on the bill.",
    "Rhahk'Zor has the biggest hammer I've ever seen. He's the first real fight and he hits HARD.",
    "Sneed's Shredder is a goblin in a mech suit. Inside a mine. Inside a mountain.",
    "The foundry section has hot rivets everywhere. Watch your step and your face.",
    "Gilnid the Smelter guards the forge. He's been making weapons for the entire Defias operation.",
    "Cookie is the ship's cook. We fight a COOK. He throws food at us. This dungeon is incredible.",
}, {
    "A pirate ship underground. I've said it three times and it's still insane.",
    "VanCleef had a legitimate grievance. He expressed it through piracy and cave-building. Bold approach.",
    "The Deadmines layout goes: mine, goblins, forge, harbor, SURPRISE PIRATE SHIP. 10/10 dungeon design.",
    "Cookie dropping loot is the highlight. I beat up a cook for a blue item. No regrets.",
})

ZT("The Deadmines", "ROGUE", {
    "A Rogue in the Deadmines. {name}, this is YOUR kind of operation. Thieves' guild. Underground ship.",
    "VanCleef started as a man of the people, {name}. Then he built a pirate fleet. Career goals.",
    "{name}, I bet the Defias tried to recruit you at some point. Don't lie.",
}, {
    "The Defias have style. Secret mines, hidden harbors, a SHIP. I appreciate the craft.",
    "VanCleef was a master planner. I'm here to stop him, but I can respect the execution.",
    "These tunnels are built for stealth operations. I feel right at home.",
    "The SI:7 has a file on every Defias leader in here. I... may have read it.",
}, {
    "Van Cleef's dead, but the Defias Brotherhood lives on. The idea was always bigger than one man.",
    "I'm keeping this mask. It's well-made. And stylish.",
})

-- Wailing Caverns ------------------------------------------------------------
Z("Wailing Caverns", {
    "Wailing Caverns. Where druids went in to heal the Barrens and came out as SNAKE PEOPLE.",
    "The Serpentis and the Druids of the Fang run this place. They were GOOD druids. Then the Nightmare got them.",
    "This dungeon is the most confusing layout in Classic. I've been lost here for HOURS.",
    "Mutanus the Devourer is the final boss. A giant murloc thing that ate the head druid. Lovely.",
}, {
    "Lady Anacondra, Lord Cobrahn, Lord Pythas, Lord Serpentis — all were nature druids. Now they're snake lords.",
    "The Disciple of Naralex is trying to wake his master. Naralex is trapped in a nightmare. Literally.",
    "Deviate creatures are everywhere. Things that SHOULD be normal but got twisted by the Nightmare.",
    "Skum is a thunder lizard boss. In a cave. Because why not put a thunder lizard underground.",
    "The escort at the end to wake Naralex is either triumphant or a total wipe. No in-between.",
    "Deviate fish from this cave can be cooked into Savory Deviate Delight. Turns you into a pirate or ninja.",
}, {
    "I got lost twice already. The paths all look the same. It's a cave of IDENTICAL tunnels.",
    "The Druids of the Fang are a cautionary tale about trying to fix the Barrens. Don't mess with the Nightmare.",
    "Saving Naralex is worth it. Probably. If the escort doesn't glitch. Which it will.",
    "Deviate Delights turn you into a pirate. This dungeon keeps on giving.",
})

-- Shadowfang Keep ------------------------------------------------------------
Z("Shadowfang Keep", {
    "Shadowfang Keep. Archmage Arugal's haunted mansion. Full of worgen he summoned from another dimension.",
    "Arugal was hired to fight the Scourge. He summoned worgen instead. From ANOTHER WORLD. Problem solved?",
    "The ghosts in here are the keep's original residents. Arugal's magic killed them all.",
    "Baron Silverlaine haunts the dining hall. Even in death he's hosting dinner. Commitment.",
}, {
    "Commander Springvale is a ghostly paladin. He still patrols. Duty beyond death.",
    "Razorclaw the Butcher is a worgen in the kitchen. The KITCHEN. Dinner is canceled.",
    "Wolf Master Nandos has trained worgen like attack dogs. He has a PACK of them.",
    "Arugal sits at the top of the keep, looking out over Silverpine. Very dramatic villain placement.",
    "The courtyard has worgen everywhere. Arugal's pets. He's got an army up here.",
    "Deathstalker Adamant and the Forsaken want Arugal dead. They can't reach him. We can.",
}, {
    "Arugal turned a perfectly good castle into a worgen factory. Real estate prices in Silverpine collapsed.",
    "The ghosts here are POLITE compared to the worgen. At least they don't bite.",
    "Shadowfang Keep has the best atmosphere of any Classic dungeon. And by 'best' I mean 'most terrifying.'",
    "I hope Arugal has a good explanation for the worgen. 'Oops' doesn't cover interdimensional summoning.",
})

-- Blackfathom Deeps -----------------------------------------------------------
Z("Blackfathom Deeps", {
    "Blackfathom Deeps. A flooded temple where naga, satyr, and Old God worshippers coexist. Badly.",
    "This was a temple to Elune. Now it's a waterlogged nightmare full of Twilight's Hammer cultists.",
    "Lady Sarevess is a naga down here. Leading raids on a sunken temple. Naga love water. Checks out.",
    "Aku'mai is at the bottom. A servant of the Old Gods. A HYDRA in a drowned temple.",
}, {
    "Ghamoo-ra is a giant turtle at the entrance. Because no dungeon is complete without a surprise turtle.",
    "The Twilight's Hammer has altars set up throughout. Old God worship with a waterfront view.",
    "Lorgus Jett is a Twilight Lord hiding in the ruins. Multiple cults competing for worst cult.",
    "Kelris was a night elf who betrayed his people for the Old Gods. Now he guards the deeps.",
    "The architecture is ancient Kaldorei. Ten thousand years old, now home to things it was built to contain.",
    "The water sections are beautiful if you ignore everything trying to eat you.",
}, {
    "Blackfathom Deeps is what happens when an Old God gets a nice temple AND a hydra.",
    "Swimming through a dungeon is never fun. Swimming through an Old God's dungeon is worse.",
    "Aku'mai is proof that some things should stay in the deep. Very, very deep.",
    "I need to dry off. This dungeon is 60% swimming.",
})

-- The Stockade ----------------------------------------------------------------
Z("The Stockade", {
    "The Stockade. Stormwind's prison. Which is currently experiencing a RIOT. Inside the city.",
    "Bazil Thredd started this riot. A Defias agent INSIDE the prison. Bold infiltration.",
    "This is a prison dungeon. We're going INTO the prison to stop a breakout. Simple. Efficient.",
    "Dextren Ward is in here somewhere. A former noble turned mad. High society doesn't prepare you for jail.",
}, {
    "Kam Deepfury is one of the meanest inmates. Dark Iron dwarf spy, apparently.",
    "Hamhock is an ogre in the Stockade. Who put an OGRE in a human-sized prison?!",
    "The inmates have crude weapons. Someone smuggled gear into a maximum security prison. Impressive.",
    "Bruegal Ironknuckle is a rare spawn. When the random prisoner is HARDER than the boss, something's wrong.",
    "Targorr the Dread is a gnoll chieftain. A gnoll. In Stormwind's prison. How did they even CATCH him?",
    "The prison guards are overwhelmed. There are like six of them against a hundred inmates.",
}, {
    "The Stockade is the shortest dungeon in Classic. That's either efficient or lazy.",
    "Stormwind should probably improve their prison. The inmates are WINNING.",
    "At least the Stockade is inside the city. No travel time. Riot suppression on demand.",
    "I feel like Stormwind could have PREVENTED this with like... ten more guards.",
})

-- Gnomeregan -----------------------------------------------------------------
Z("Gnomeregan", {
    "Gnomeregan. The gnome capital that got irradiated and overrun by troggs and leper gnomes.",
    "Thermaplugg betrayed the gnomes and irradiated their own city. Then STAYED. He's ruling the radioactive ruin.",
    "Leper gnomes are gnomes who didn't escape the radiation. They're aggressive and glowing. Sad AND dangerous.",
    "The whole place is a marvel of gnomish engineering. Pistons, gears, teleporters... all broken.",
}, {
    "The entrance requires jumping off a ledge. Then an elevator. Then MORE ledges. Very gnome.",
    "Viscous Fallout is a radioactive ooze. The ENVIRONMENT is a boss in this dungeon.",
    "Electrocutioner 6000. The gnomes named a killbot 'Electrocutioner 6000.' Peak gnome nomenclature.",
    "Crowd Pummeler 9-60 is a recycled mech. Rebuilt by troggs. Troggs who can operate gnomish tech. Worrying.",
    "The irradiated hallways require careful navigation. Or just running through and hoping.",
    "The Dark Iron ambassador is here. Even other factions are trying to exploit the gnome disaster.",
}, {
    "Gnomeregan is a tragedy wrapped in an engineering disaster inside a radiation leak.",
    "Thermaplugg is STILL down there. Running a city of leper gnomes. As a king. Of a toxic ruin.",
    "The gnomes will reclaim their city someday. They keep saying that. I believe them. Mostly.",
    "I'm glowing slightly. Is that normal for Gnomeregan? Everyone says it's normal.",
})

-- Razorfen Kraul --------------------------------------------------------------
Z("Razorfen Kraul", {
    "Razorfen Kraul. A quilboar city built inside a massive thornwall. Nature's worst fence.",
    "Charlga Razorflank leads the Kraul. She's a quilboar crone with serious power.",
    "The thorns here are ENORMOUS. The quilboar grew them with earth magic. Aggressive gardening.",
    "Agathelos the Raging is a giant boar. The quilboar worship boars. This is their war pig.",
}, {
    "The Death Speaker leads the quilboar shamans. Their earth magic shaped this entire maze of thorns.",
    "Overlord Ramtusk commands the warriors. He's got the biggest tusks I've ever seen on a quilboar.",
    "The bat rider section has quilboar on BATS. They've got an air force. In a thorn tunnel.",
    "The spirit of Agamaggan, the boar god, lingers here. This whole thornwall grew from his blood.",
    "Roogug is a quilboar who summons earth elementals. Shaman pig. I've seen everything.",
    "The thornwall connects to Razorfen Downs too. It's a whole quilboar kingdom in thorns.",
}, {
    "Razorfen Kraul is impressive in a 'pig people built a fortress out of thorns' way.",
    "Charlga Razorflank is no joke. She's old, mean, and commands an army of boar-worshippers.",
    "The quilboar civilization is genuinely developed. They have leaders, armies, and a religion. All underground. In thorns.",
    "I have thorns in places thorns should NEVER be.",
})

-- Razorfen Downs --------------------------------------------------------------
Z("Razorfen Downs", {
    "Razorfen Downs. The quilboar have a necromancy problem. Some of the boar people are UNDEAD now.",
    "Amnennar the Coldbringer brought the Scourge into a quilboar city. A lich in a thorn maze.",
    "The gong event summons waves of undead quilboar. Hit the gong, fight the horde. Classic.",
    "Mordresh Fire Eye has undead DANCING around a fire. A skeleton dance party. In a quilboar dungeon.",
}, {
    "Glutton is a massive undead boar. The quilboar's war pig, now zombified. Even death can't stop the pig.",
    "Ragglesnout is a rare quilboar boss. He drops decent loot for being a pig man in a sewer.",
    "The spirit realm section has you fighting ghosts. Quilboar ghosts. Oinking phantoms.",
    "Tuten'kash is a giant spider. In the quilboar downs. Where a spider got THAT big underground is unclear.",
    "Henry Stern is a neutral NPC who makes potions. A human. Living among quilboar. He's fine with it.",
    "The Murder Pens have the undead quilboar warriors. They're dead but still fighting. Persistent.",
}, {
    "The Scourge got into a quilboar city. Nothing is sacred. NOTHING is safe from undeath.",
    "Amnennar turned a boar civilization into an undead boar civilization. That's efficient evil.",
    "Hitting that gong is one of the most stressful decisions in any dungeon. But we do it anyway.",
    "Undead quilboar dancing around a bonfire. I've seen weird things, but that's up there.",
})

-- Scarlet Monastery -----------------------------------------------------------
Z("Scarlet Monastery", {
    "Scarlet Monastery. Four wings, one fanatical crusade, zero self-awareness.",
    "The Scarlet Crusade thinks EVERYONE is undead or a traitor. They're wrong about us. Probably.",
    "Mograine AND Whitemane in the Cathedral. He dies, she resurrects him, they both attack. Every time.",
    "The Library has Arcanist Doan. He's hoarding knowledge behind a locked door. And a forcefield.",
}, {
    "High Inquisitor Whitemane is a priest who resurrects Mograine mid-fight. That's a power move.",
    "Herod the Scarlet Champion spins. And spins. And SPINS. Whirlwind of red-armored death.",
    "Houndmaster Loksey has attack dogs. The Scarlet Crusade even weaponized PUPPIES.",
    "Bloodmage Thalnos is undead. Leading a WING of the anti-undead crusade. Nobody noticed.",
    "Arcanist Doan's room has a bubble shield. Pop the bubble, then he turns into a problem.",
    "The Graveyard is the shortest wing. Just undead. Straightforward. The other three wings... less so.",
}, {
    "The Scarlet Crusade is SO committed to hating undead that they don't notice undead IN THEIR RANKS.",
    "Mograine's ashbringer is legendary. He's less legendary. Mostly he just stands there until Whitemane yells.",
    "Four wings means four chances to wipe. The Cathedral is worth it though. Good loot, great drama.",
    "Herod's shoulder pads are an experience. The man's armor has more personality than most NPCs.",
})

-- Uldaman --------------------------------------------------------------------
Z("Uldaman", {
    "Uldaman. Titan vaults, stone watchers, and a run so long you might need to pack LUNCH.",
    "Archaedas guards the final vault. A Titan construct who's been standing there for millennia.",
    "The Dark Iron dwarves AND the Explorer's League are both digging here. Competing excavations.",
    "The Discs of Norgannon are inside. Ancient Titan records. The secret history of the dwarves.",
}, {
    "Revelosh summons lightning and commands the stone troopers. He's been guarding this place for ages.",
    "The Ironaya encounter activates a Titan defense golem. She wakes up angry.",
    "Grimlok is a trogg who commands other troggs. A trogg LEADER. They're evolving. Slowly.",
    "The back entrance skips half the dungeon. Veterans use it exclusively. For sanity.",
    "Galgann Firehammer is a Dark Iron boss who really doesn't want you in his dig site.",
    "The Hall of the Crafters has Titan forge technology. They literally MADE the dwarves here.",
}, {
    "Uldaman proves the Titans created the Earthen, who became dwarves. The dwarves are artificial life. Deep.",
    "Archaedas has been standing in that vault since before recorded history. Patient man. Stone man. Whatever.",
    "This dungeon is SO long. Multiple entrances exist because even Blizzard knew it was too much.",
    "The Discs reveal the truth about dwarvenkind. Then Archaedas tries to kill you for reading them. Classic.",
})

-- Zul'Farrak ----------------------------------------------------------------
Z("Zul'Farrak", {
    "Zul'Farrak. A troll city in the Tanaris desert. The stair event is a LEGEND.",
    "The stairs. THE stairs. Waves of trolls rushing up while you defend prisoners at the top.",
    "Gahz'rilla is a massive hydra the trolls worship. They summon it with a sacred mallet.",
    "Chief Ukorz Sandscalp rules the city. He's waiting at the bottom with his basilisk buddy.",
}, {
    "The Sandfury trolls are some of the oldest troll tribes. They've been here since before Tanaris was desert.",
    "Witch Doctor Zum'rah raises zombies mid-fight. A troll necromancer in a desert. Creative.",
    "Shadowpriest Sezz'ziz worships Hakkar. Shadow magic in the sand. Always with the shadow magic.",
    "The pyramid at the center has the stair defense. It's the best encounter in any 5-man. Fight me.",
    "Antu'sul commands the basilisks. He's bonded with them somehow. Troll-basilisk friendship is terrifying.",
    "Theka the Martyr transforms into a scarab mid-fight. Shapeshifting troll beetles. Okay.",
}, {
    "The stair event in Zul'Farrak is the most fun you'll have in a Classic dungeon. Absolute chaos.",
    "Gahz'rilla emerging from the pool is cinematic. Then it hits you and the cinematic ends.",
    "Every group remembers their first stair defense. Trolls pouring up, spells flying. Perfection.",
    "The Sandfury trolls built a whole city in the desert. Impressive. Unfortunately, we need to destroy it.",
})

-- Maraudon -------------------------------------------------------------------
Z("Maraudon", {
    "Maraudon. The centaur holy site. Three entrances, zero clear directions. Good luck.",
    "Princess Theradras is at the bottom. Daughter of Therazane the Stonemother. She's... memorable.",
    "The orange and purple paths lead to different sections. You WILL go down the wrong one at least once.",
    "The centaur believe their race was born here. From Theradras and Cenarius's son Zaetar. It's complicated.",
}, {
    "Celebras the Cursed used to be a keeper of this place. Now he's one of the bosses. Career change.",
    "Lord Vyletongue is a satyr who moved into the centaur holy site. Even demons squat sometimes.",
    "Noxxion is a multi-add fight. He splits into smaller versions of himself. Like evil mitosis.",
    "Rotgrip is a crocolisk at the bottom of the waterfalls. Because every waterfall needs a murder lizard.",
    "The inner sanctum is actually beautiful. Waterfalls, crystals, pristine caves. Then Theradras ruins it.",
    "The Celebras quest gives you a scepter to skip directly to the inner section. Essential for repeat runs.",
}, {
    "Maraudon is the dungeon where 'which entrance?' becomes a philosophical debate.",
    "Princess Theradras... let's just say the art team made a CHOICE. A bold, unfortunate choice.",
    "The inner falls are genuinely the most beautiful spot in any Classic dungeon. Shame about the bosses.",
    "Two paths, three entrances, one confused group. The Maraudon experience.",
})

-- Temple of Atal'Hakkar (Sunken Temple) ---------------------------------------
Z("Temple of Atal'Hakkar", {
    "The Sunken Temple. Trolls worshipping Hakkar in a half-submerged zigguart. And it's a MAZE.",
    "This temple has MORE levels and confusing paths than any dungeon should legally have.",
    "The Atal'ai priests are trying to summon Hakkar here. An avatar of the Blood God. In a swamp.",
    "Eranikus guards the deeps. A corrupted green dragon, once a protector of the Emerald Dream.",
}, {
    "Jammal'an the Prophet leads the Atal'ai. He's convinced bleeding people will summon a god. He's not wrong.",
    "The dragon mini-bosses at the top each guard a floor. Six of them. SIX floors of mini-bosses.",
    "Shade of Eranikus is what happens when an emerald dragon gets corrupted by Hakkar. Tragic and deadly.",
    "The ring of statues puzzle requires activating them in order. Nobody remembers the order. Ever.",
    "Morphaz and Hazzas are green drakes serving the Atal'ai. Corrupted by the blood god's influence.",
    "Atal'alarion is the optional boss at the statue circle. Activate wrong and he wakes up angry.",
}, {
    "The Sunken Temple is a navigation nightmare. I've been here before and I'm STILL lost.",
    "Every group has ONE person who knows the statue order. If they're not here, we guess. And wipe.",
    "Hakkar worship seems popular underground. This temple, Zul'Gurub, Zul'Farrak... trolls love blood gods.",
    "Beautiful temple. Horrible layout. The trolls built this to confuse invaders. It's working.",
})

-- Blackrock Depths -----------------------------------------------------------
Z("Blackrock Depths", {
    "Blackrock Depths. The BIGGEST dungeon in the game. It has a CITY in it. With a BAR.",
    "The Grim Guzzler is a functioning tavern inside the dungeon. You can buy drinks. Mid-dungeon.",
    "Emperor Dagran Thaurissan rules the Dark Iron dwarves from here. He married Moira Bronzebeard. Politics.",
    "This dungeon is so big it takes HOURS. Most groups don't even finish. They just... stop.",
}, {
    "The bar fight in the Grim Guzzler is triggered by talking to the wrong NPC. Or the right one.",
    "Bael'Gar is a fire elemental chained by the Dark Irons. They ENSLAVED a fire elemental. Bold.",
    "The Ring of Law forces you into an arena fight. Gladiator combat as dungeon progression.",
    "Lord Incendius guards a bridge over lava. Over LAVA. Dark Iron dwarves love lava.",
    "High Interrogator Gerstahn tortures prisoners. The Dark Irons have a full interrogation department.",
    "Ambassador Flamelash represents Ragnaros. A fire elemental diplomat. Even demons need ambassadors.",
}, {
    "BRD has more bosses than most RAIDS. Twenty-plus encounters. In a DUNGEON.",
    "The Grim Guzzler is the best room in any dungeon. Period. A BAR. Underground. With vendors.",
    "Emperor Thaurissan is at the very end. Of a dungeon that takes three hours. If you're fast.",
    "I love BRD but I also never want to do the full run again. It's a JOURNEY.",
})

ZT("Blackrock Depths", "PALADIN", {
    "A Paladin in BRD. {name}, the Dark Iron dwarves here serve Ragnaros. They need some Light.",
    "{name}, this dungeon has fire EVERYWHERE. Got any fire resistance? No? Fun.",
    "Hey {name}, there's an entire evil empire in this dungeon. Think your hammer can handle it?",
}, {
    "The Light burns brighter where darkness concentrates. And BRD is VERY dark. And very hot.",
    "Emperor Thaurissan will answer for what he's done. After we get through twenty other bosses.",
    "There's actually a chapel somewhere in here. Corrupted, of course. But the architecture is familiar.",
    "Fire resistance would be nice. I'll just... pray harder.",
}, {
    "BRD tests everything a Paladin has. Stamina, faith, and the patience for a three-hour dungeon.",
    "At least there's a bar. Even Paladins need a drink after the Ring of Law.",
})

-- Lower Blackrock Spire -------------------------------------------------------
Z("Lower Blackrock Spire", {
    "Lower Blackrock Spire. Orcs, trolls, ogres, and spiders sharing a mountain. Like a terrible apartment building.",
    "War Master Voone commands the Smolderthorn trolls. They're staging operations from inside the mountain.",
    "Highlord Omokk is an ogre boss. He's big, he's loud, and he's blocking the hallway.",
    "The spiders in the lower section are Smolderweb brood. Mother Smolderweb is... large.",
}, {
    "Shadow Hunter Vosh'gajin uses shadow magic and trollish voodoo. Troll shadow hunters are no joke.",
    "Urok Doomhowl is summoned by placing objects on an altar. Optional boss, maximum ogre.",
    "Quartermaster Zigris manages the Blackrock orc army's supplies. Even evil armies need logistics.",
    "Crystal Fang is a spider boss. There's always a spider boss. This is a law of dungeon design.",
    "Burning Felguard is a random encounter. Demons just show up sometimes. In an orc dungeon.",
    "The troll and ogre sections feel like different dungeons sewn together. Because they basically are.",
}, {
    "LBRS is the 'we need to clear THIS before we can do UBRS' dungeon. The appetizer.",
    "Voone's trolls, Omokk's ogres, and Wyrmthalak's orcs. Everyone has a piece of the mountain.",
    "At least LBRS is shorter than BRD. Most things are shorter than BRD.",
    "The drop from Overlord Wyrmthalak's room is the real boss. Fall damage claims more than he does.",
})

-- Upper Blackrock Spire -------------------------------------------------------
Z("Upper Blackrock Spire", {
    "Upper Blackrock Spire. Where Rend Blackhand claims to be Warchief. Thrall disagrees.",
    "The UBRS key quest was legendary. You needed the key AND a 10-man group. Back in the day.",
    "Rend Blackhand rides Gyth — a chromatic drake. A dragon boss on a dragon. Doubled up.",
    "General Drakkisath guards the entrance to Blackwing Lair. He's the last gatekeeper.",
}, {
    "Warchief Rend Blackhand is Blackhand's son. He thinks he should lead the Horde. He's wrong.",
    "The Beast is a corehound in the stadium. It drops a skinnable hide for a fire resist cloak. Everyone needs it.",
    "Jed Runewatcher is a rare spawn mage. Half the raid goes to UBRS just hoping Jed is up.",
    "Pyroguard Emberseer is imprisoned and you free him by clearing flames. Then he attacks you. Ungrateful.",
    "Father Flame in the rookery hatches dragon eggs. If you aggro the room, it's fifty whelps. Famous fifty whelps.",
    "Solakar Flamewreath protects the dragon eggs. She does NOT appreciate visitors.",
}, {
    "UBRS is where the Blackrock story climaxes. Rend, drakes, and the gateway to bigger threats.",
    "The rookery egg room is the most anxiety-inducing room in WoW. 'DON'T TOUCH THE EGGS.'",
    "Getting the UBRS key was a rite of passage. Kill the beast, get the gem, forge the brand.",
    "After UBRS you're ready for Molten Core. That's either exciting or terrifying. Probably both.",
})

-- Dire Maul ------------------------------------------------------------------
Z("Dire Maul", {
    "Dire Maul. Three wings of an ancient Highborne city. Ogres, demons, and a LIBRARY.",
    "The north wing has King Gordok. You can do a tribute run — kill everyone EXCEPT the king for better loot.",
    "The west wing has Immol'thar — a demon the Highborne imprisoned to siphon magic from. It's still working.",
    "The east wing has a corrupted treant named Zevrim Thornhoof who's sacrificing people to the satyrs.",
}, {
    "Tribute runs are the smartest dungeon strategy. Don't kill the king — kill his guard and claim his tribute.",
    "Tendris Warpwood is a corrupted ancient of war. Even the tree guardians went wrong here.",
    "The Shen'dralar Highborne in the library are STILL alive. They've been here for 10,000 years. Reading.",
    "Prince Tortheldrin killed his own Highborne to absorb their magic. Long-lived AND homicidal.",
    "Stomper Kreeg in the north wing is an ogre who sells booze. Even ogre dungeons have commerce.",
    "The library has class books. Powerful tomes. The BOOKS are the best loot in this dungeon.",
}, {
    "Dire Maul tribute runs are peak Classic dungeon strategy. Outsmarting ogres. For profit.",
    "The Shen'dralar have been living in a ruin for millennia. Their library has books that don't exist anywhere else.",
    "Three wings, three different vibes. Ogre kingdom, demon prison, satyr cult. Full variety.",
    "I'd visit the library more often if it wasn't guarded by an insane Highborne prince.",
})

-- Stratholme -----------------------------------------------------------------
Z("Stratholme", {
    "Stratholme. The city Arthas purged. Now it's a zombie-infested ruin with a baron who rides a deathcharger.",
    "Baron Rivendare is at the end. Timed run — reach him in 45 minutes or the hostage is zombie food.",
    "The live side has the Scarlet Crusade. The dead side has the Scourge. Pick your flavor of nightmare.",
    "Rivendare's Deathcharger mount drops here. Everyone runs Strath for that mount. The drop rate is a myth.",
}, {
    "The Unforgiven is a ghost who regrets what happened to Stratholme. Even undead can feel guilt.",
    "Timmy the Cruel is a named ghoul. He was a CHILD before the plague. This dungeon doesn't pull punches.",
    "Balnazzar the dreadlord disguises himself as a Scarlet Crusade leader. A DEMON running the anti-undead faction.",
    "Magistrate Barthilas holds a key. You need that key for the Baron side. Every. Single. Time.",
    "The Slaughter House has abominations in pens. The Scourge are manufacturing soldiers. Assembly line evil.",
    "Aurius the paladin helps you fight Rivendare if you bring him a medallion. Even ghosts need motivation.",
}, {
    "The Baron run timer made Stratholme legendary. Nothing beats the 45-minute rush.",
    "Rivendare's mount. The reason we all learn Stratholme shortcuts. That horse haunts our dreams.",
    "Balnazzar being a DREADLORD disguised as a Scarlet leader is the best plot twist in Classic.",
    "Stratholme reminds us what Arthas did. An entire city, purged. The beginning of the end.",
})

-- Scholomance ----------------------------------------------------------------
Z("Scholomance", {
    "Scholomance. A necromancy SCHOOL in a basement. Darkmaster Gandling runs the curriculum.",
    "This place teaches necromancy to aspiring dark mages. Homework: raise the dead. Extra credit: raise MORE dead.",
    "Gandling teleports players to random rooms during the fight. The principal's office is EVERYWHERE.",
    "The Barov family sold their estate to the Scourge for power. Real estate deals with liches. Bold.",
}, {
    "Rattlegore is a bone construct guarding the basement. He's made of BONES. Lots of them.",
    "Doctor Theolen Krastinov — the Butcher — experiments on living subjects. He's the worst teacher here.",
    "Lorekeeper Polkelt has the loot list and the knowledge. He's undead but he kept his academics.",
    "Ras Frostwhisper was a mage who became a lich voluntarily. For TENURE.",
    "Lady Illucia Barov is a ghost protecting her family legacy. Of selling their house to necromancers.",
    "The Viewing Room has students watching lectures. Undead STUDENTS. Sitting in desks. Taking notes. Probably.",
}, {
    "Scholomance is proof that if you combine education with necromancy, you get a dungeon.",
    "Gandling teleporting you to random rooms is the most annoying boss mechanic in Classic. Learn the layout.",
    "The Barov family history is wild. They literally SOLD their home to Kel'Thuzad. For immortality.",
    "Every room is a classroom for something horrifying. Anatomy (the dead kind), necromancy, bone construction...",
})

---------------------------------------------------------------------------
--  TBC DUNGEONS
---------------------------------------------------------------------------

-- Hellfire Ramparts -----------------------------------------------------------
Z("Hellfire Ramparts", {
    "Hellfire Ramparts. The very first TBC dungeon. Welcome to Outland, here's an orc fortress.",
    "Watchkeeper Gargolmar is the first boss of TBC. He yells a LOT.",
    "Nazan is a dragon who Vazruden rides. You fight a guy ON a dragon ON a rampart.",
    "Omor the Unscarred commands from inside. He keeps HIS scars on the INSIDE. How poetic.",
}, {
    "Gargolmar calls for heals when he's low. Smart boss. Annoying boss, but smart.",
    "Vazruden and Nazan are a two-phase fight. Ground phase then dragon phase. Classic.",
    "Omor summons felhounds. Because one boss wasn't enough — he brings demon DOGS.",
    "The ramparts overlook Hellfire Peninsula. Great view of the red wasteland. Scenic combat.",
    "These orcs are Fel Horde — corrupted by Magtheridon's blood. They're meaner than regular orcs.",
    "The whole fortress is a prelude to Magtheridon's Lair. The big demon is UNDER this citadel.",
}, {
    "Hellfire Ramparts sets the tone for TBC dungeons. Fast, focused, and full of orcs.",
    "Nazan's fire breath on the landing platform is the TBC 'welcome to Outland' moment.",
    "Short dungeon, good loot, quick rep. Everyone loves Ramps.",
    "The Fel Horde is just the beginning. Hellfire Citadel has two more dungeons AND a raid.",
})

-- The Blood Furnace -----------------------------------------------------------
Z("The Blood Furnace", {
    "The Blood Furnace. Where the Fel Horde bleeds — literally. They're manufacturing demon blood.",
    "Keli'dan the Breaker runs this place. He channels Magtheridon's blood to create fel orcs.",
    "Broggok's event locks you in a room with waves of fel orc prisoners. They are NOT happy.",
    "The Maker experiments on prisoners. Creating new fel orc soldiers. This is an evil FACTORY.",
}, {
    "The Maker's room has cages full of victims. This is what the Fel Horde does to prisoners.",
    "Broggok releases four waves of adds. Each wave from a different pen. Arena-style survival.",
    "Keli'dan channels in the center and then EXPLODES. Get out. Just get out when he channels.",
    "The blood pipes carry Magtheridon's blood through the whole citadel. Demon blood infrastructure.",
    "Laughing Skull orc bodies are everywhere. Another clan, sacrificed for the Fel Horde.",
    "The fel orc production line ends when we kill Keli'dan. But Magtheridon is still alive down below.",
}, {
    "The Blood Furnace is disturbing. An industrial operation to produce corrupted soldiers.",
    "Keli'dan's shadow bolt volley into the explosion combo is the TBC 'did you read the dungeon journal' check.",
    "Between the Maker's experiments and Broggok's arena, this dungeon does NOT let up.",
    "Every TBC dungeon in Hellfire is connected. Ramparts → Blood Furnace → Shattered Halls → Magtheridon.",
})

-- The Shattered Halls ---------------------------------------------------------
Z("The Shattered Halls", {
    "The Shattered Halls. The hardest 5-man in Hellfire Citadel. And it has a GAUNTLET.",
    "Warchief Kargath Bladefist is at the end. THE Kargath. One of the original Horde chieftains.",
    "The gauntlet section has endless adds spawning. You fight your way through a hallway of pure chaos.",
    "Grand Warlock Nethekurse tortures prisoners at the start. He monologues about it. Super villain.",
}, {
    "Nethekurse kills his own minions for power. Then fears the group. A warlock who plays dirty.",
    "Blood Guard Porung is the lieutenant. He hits like a truck. A fel-infused truck.",
    "The gauntlet is famous because if you stop moving, you die. The adds NEVER stop.",
    "Kargath Bladefist replaced his own hand with a BLADE. Literal bladefist. Committed to the name.",
    "The execution event has prisoners on a timer. Save them or they die. Pressure AND waves of enemies.",
    "Centurion mobs have a mortal strike. Getting hit by Shattered Halls trash hurts more than most bosses.",
}, {
    "Shattered Halls is where TBC says 'okay, are you ACTUALLY ready for heroics?'",
    "Kargath's blade-fist is the most metal thing in all of Warcraft. He just... replaced his hand. With a blade.",
    "The gauntlet run is either glorious teamwork or a complete disaster. No middle ground.",
    "This dungeon has some of the most brutal trash in TBC. The TRASH is harder than some bosses.",
})

-- The Slave Pens -------------------------------------------------------------
Z("The Slave Pens", {
    "The Slave Pens. Naga slave operations powered by Coilfang Reservoir. Very evil, very wet.",
    "Mennu the Betrayer runs the front section. A broken draenei who joined the naga. Traitors everywhere.",
    "Rokmar the Crackler is a giant bogstrok. A LOBSTER boss. In a sewer.",
    "Quagmirran is the final boss. Huge mushroom giant. Zangarmarsh flora gone very wrong.",
}, {
    "Mennu drops totems. Lots of totems. Kill the totems or things get bad quickly.",
    "Rokmar has a grievous wound ability. Your healer HATES this boss.",
    "Quagmirran poisons the whole group. Nature damage in a fungal environment. It's thematic AND painful.",
    "The slave pens hold captured Cenarian druids. Lady Vashj is holding them hostage.",
    "Naturalist Bite is a caged druid. You can free him for help. Or just leave him. Your call.",
    "The water sections connect to Serpentshrine Cavern above. Lady Vashj is upstairs.",
}, {
    "Slave Pens is the entry to Coilfang Reservoir. Naga, lobsters, and fungus giants. Classic TBC.",
    "Mennu betrayed everyone. Rokmar is a lobster. Quagmirran is a mushroom. The bosses here are CREATIVE.",
    "The Cenarion hold druids need rescuing. We're saving druids from naga. In a sewer. Heroic work.",
    "Every time I come to Coilfang I get wet. EVERY time.",
})

-- The Underbog ----------------------------------------------------------------
Z("The Underbog", {
    "The Underbog. Below Coilfang Reservoir. Swampy, fungal, and full of things that should not exist.",
    "Hungarfen is a massive bog beast. He summons mushrooms that heal him. Kill the mushrooms!",
    "Swamplord Musel'ek hunts with his pet bear Claw. A swamp lord with a BEAR. Outland is wild.",
    "The Black Stalker is the final boss. A giant bog lord with lightning. Nature's worst creation.",
}, {
    "Ghaz'an is a hydra in an acid pool. He spits acid. The pool IS acid. Everything is acid.",
    "The mushroom adds from Hungarfen are genuinely problematic. They spawn, they heal. It's a mushroom crisis.",
    "Musel'ek calls his bear to fight alongside him. If the bear dies first, Musel'ek enrages. Understandable.",
    "The Black Stalker drops from the ceiling. Surprise! Giant tentacle monster!",
    "Underbat swarms fill the caverns. Thousands of tiny angry bats.",
    "The Underbog is the most claustrophobic Coilfang dungeon. Low ceilings, thick fog, and things in the water.",
}, {
    "The Underbog is what's UNDER the swamp under the reservoir. We're three layers deep. Into fungus.",
    "Ghaz'an's acid pool is the real boss. Positioning matters when the floor is dissolving.",
    "I appreciate that the Underbog commits to a theme. Fungus, swamp, poison. Consistent.",
    "The Black Stalker fight is genuinely terrifying. It LEVITATES you. In a cave full of acid.",
})

-- The Steamvault --------------------------------------------------------------
Z("The Steamvault", {
    "The Steamvault. The HARDEST Coilfang Reservoir dungeon. Naga engineers running the water supply.",
    "Hydromancer Thespia controls the water systems. The naga are draining Zangarmarsh from HERE.",
    "Mekgineer Steamrigger is a gnomish traitor helping the naga. A GNOME. Working for NAGA.",
    "Warlord Kalithresh is the final boss. He activates the distillers — destroy them or he powers up.",
}, {
    "Thespia has water elementals that hit hard. Combined with her frost spells, it's a cold combo.",
    "Steamrigger repairs himself using gnomish engineering. Interrupt him or he heals to full.",
    "Kalithresh channels the distillers to buff himself. Break them fast or the tank becomes a puddle.",
    "The naga and gnome alliance is one of TBC's weirdest team-ups. Underwater + engineering.",
    "The steam pipes throughout the dungeon vent superheated water. Walking hazards everywhere.",
    "This dungeon is required for the Serpentshrine Cavern attunement. The key is in Kalithresh's pocket.",
}, {
    "The Steamvault is where 'Coilfang attunement' nightmares begin. That key chain is brutal.",
    "Kalithresh's distiller mechanic taught an entire generation to FOCUS TARGETS. Classic design.",
    "I respect the naga's engineering. They built a whole water-siphoning operation. Efficient evil.",
    "After the Steamvault, heroic Coilfang makes a lot more sense. You know every inch of these pipes now.",
})

-- Mana-Tombs -----------------------------------------------------------------
Z("Mana-Tombs", {
    "Mana-Tombs. Where Auchindoun's draenei spirits meet ethereal tomb raiders. In a crypt.",
    "Pandemonius is a void creature accidentally summoned by the ethereals. Whoops.",
    "Nexus-Prince Shaffar runs the operation. An ethereal prince looting holy draenei tombs.",
    "The shadow damage in here is relentless. Everything hits with void energy.",
}, {
    "Pandemonius reflects spells. Casters learn this the hard way. EVERY time.",
    "Tavarok is an earth elemental corrupted by the Auchindoun explosion. He's just standing in the middle, angry.",
    "Shaffar has ethereal adds that phase in and out. Beautiful and lethal simultaneously.",
    "The draenei mausoleums here held generations of honored dead. The ethereals are LOOTING them.",
    "Yor is a void lord in heroic. A bonus boss who shows up to darken everyone's day.",
    "The mana crystals the ethereals extract power the whole operation. They're mining SOULS.",
}, {
    "Mana-Tombs is the shadow resist check of Auchindoun. Bring protection or bring corpse runs.",
    "Shaffar considers this a business venture. Tomb raiding is just 'resource extraction' to an ethereal.",
    "The draenei spirits here are ANGRY. Can't blame them. Someone's looting their graves.",
    "Auchindoun has four dungeons and they're all equally unsettling. Mana-Tombs is the void flavor.",
})

-- Auchenai Crypts -------------------------------------------------------------
Z("Auchenai Crypts", {
    "Auchenai Crypts. Where the draenei priests guard their dead. Except the priests have gone MAD.",
    "Exarch Maladaar leads the fallen Auchenai. Driven insane by death and the Auchindoun explosion.",
    "Shirrak the Dead Watcher calculates. Always calculates. He reduces magic resistance passively.",
    "The draenei dead here are RISING. The souls won't rest after what happened to Auchindoun.",
}, {
    "Shirrak has a mana burn aura that punishes casters for standing close. Positioning dungeon.",
    "Maladaar summons an Avatar of the Martyred at 25%. It's a ghost of a famous draenei hero. Fighting you. Sad.",
    "The Auchenai used to be the most respected draenei order. They tended the dead with honor.",
    "The explosion of Auchindoun shattered the death barrier. The dead keep coming back.",
    "Draenei spirits fill the crypts. Some attack. Some just wander. All are tragic.",
    "This was a holy site. Now it's a meat grinder of undead draenei. Religion hits different in Outland.",
}, {
    "Auchenai Crypts is the saddest dungeon in TBC. Holy priests gone mad, honored dead walking.",
    "Maladaar's story is heartbreaking. He was a good man before the crypt drove him insane.",
    "The draenei mourn this place. Everything the Auchenai built has been destroyed.",
    "Death dungeon with death boss who summons death ghosts. The Auchenai theme is CONSISTENT.",
})

-- Sethekk Halls ---------------------------------------------------------------
Z("Sethekk Halls", {
    "Sethekk Halls. Arakkoa who left society to worship the shadows. Bird cultists.",
    "Darkweaver Syth is the first boss. He summons elemental birds. Fire hawk, frost hawk, shadow hawk.",
    "Talon King Ikiss is the king of the Sethekk. He blinks and detonates. Mage bird.",
    "The arakkoa here are even MORE insane than the ones outside. They worship Sethe, the dead wind god.",
}, {
    "Syth splits into four elemental copies. Each one is a different school of magic. Stylish.",
    "Ikiss casts Arcane Explosion — the bird blinks to a pillar and BOOMS. Hide behind pillars.",
    "The Sethekk prophecy says their god will return. Given Outland's track record, probably.",
    "Anzu, the raven god, can be summoned by druids. A secret boss. A raven god in an arakkoa dungeon. Perfect.",
    "The halls are covered in feathers and talons. Bird architecture. It's exactly what it sounds like.",
    "These arakkoa experimented with shadow magic until they transformed themselves. Bird self-modification.",
}, {
    "Sethekk Halls has the most unique aesthetic in Auchindoun. Bird cult chic.",
    "Ikiss blinking behind a pillar and exploding is the TBC 'get behind the pillar' tutorial.",
    "Anzu the raven lord drops a mount. THE raven mount. Druids farm this until their eyes bleed.",
    "Bird people worshipping a dead bird god in a bone crypt. Outland is... creative.",
})

-- Shadow Labyrinth -----------------------------------------------------------
Z("Shadow Labyrinth", {
    "Shadow Labyrinth. The HARDEST Auchindoun wing. And Murmur lives at the end. MURMUR.",
    "Murmur is a sound elemental. A being of PURE SOUND. So loud it warps reality.",
    "Ambassador Hellmaw is a demon the Shadow Council summoned. In a draenei crypt. Dimensional layering.",
    "Grandmaster Vorpil serves the Shadow Council. He's working with demons to open a portal.",
}, {
    "Hellmaw is chained at the start. You break the chains, he breaks loose. Then HE breaks you.",
    "Blackheart the Inciter mind controls the entire group. You FIGHT EACH OTHER. Most stressful encounter.",
    "Vorpil summons voidwalkers and teleports to the altar. Add management meets boss chasing.",
    "Murmur is 40% health when the fight STARTS. He's so powerful his own existence damages him.",
    "Murmur's Sonic Boom nearly one-shots if you don't run out. LISTEN for the cast.",
    "The Shadow Council has the Karazhan key fragment here. Shadow Labyrinth is on the Kara attunement chain.",
}, {
    "Shadow Labyrinth is the Auchindoun endgame. Everything in this wing wants to kill you. Aggressively.",
    "Blackheart mind-controlling the party is hilarious in retrospect. Terrifying in the moment.",
    "Murmur is one of the coolest boss concepts in WoW. A sound so powerful it became alive.",
    "The Karazhan attunement passes through here. Shadow Lab is a rite of passage.",
})

-- Old Hillsbrad Foothills (Caverns of Time) -----------------------------------
Z("Old Hillsbrad Foothills", {
    "Old Hillsbrad. The Caverns of Time sent us BACK in time. To when Thrall was a slave in Durnholde.",
    "We're inside a MEMORY. Everything here is the past. Don, Carlos, his hat... the NPCs are historical.",
    "Young Thrall is here. Before he was Warchief. When he was just a prisoner. This is heavy.",
    "Lieutenant Drake runs Durnholde's guard. Time says he lives. We say otherwise.",
}, {
    "Captain Skarloc patrols the road. He's the guy who hunts escaped slaves. In the PAST.",
    "Epoch Hunter is the infinite dragonflight agent. He's trying to prevent Thrall's escape. To change history.",
    "Thrall doesn't know us. He doesn't know his future. We just help him escape. Silently.",
    "Taretha Foxton helps Thrall escape in the real timeline. We're just making sure it happens.",
    "Don Carlos has an amazing hat. You can get a REPLICA. Time travel for loot.",
    "The Infinite Dragonflight is trying to alter the timeline. By stopping Thrall. Everything collapses if they succeed.",
}, {
    "Old Hillsbrad is the most EMOTIONAL dungeon in TBC. We're watching young Thrall fight for freedom.",
    "Time travel dungeons are wild. We're IN the past, fighting dragons who want to CHANGE the past.",
    "If Thrall doesn't escape Durnholde, the Horde never forms. Everything changes. No pressure.",
    "Walking through old Southshore is surreal. Peaceful. Pre-war. Before everything went wrong.",
})

-- The Black Morass ------------------------------------------------------------
Z("The Black Morass", {
    "The Black Morass. Caverns of Time again — this time we're defending Medivh while he opens the Dark Portal.",
    "We're HELPING open the Dark Portal. The thing that started the orc invasion. Time says it HAS to happen.",
    "Portals keep opening. Infinite Dragonflight agents pour through. Survive eighteen waves.",
    "Chrono Lord Deja is wave six. Temporus is wave twelve. Aeonus is wave eighteen. Escalation.",
}, {
    "Chrono Lord Deja has time-based abilities. Slow, haste, rewind. Time magic is cheating.",
    "Temporus hits like tomorrow. Literally the hardest mid-boss in any 5-man dungeon.",
    "Aeonus is the final Infinite agent. He's trying to stop the Portal from opening. We're stopping him.",
    "Medivh channels the Portal throughout. If his shield drops to zero, we fail. Protect the possessed mage.",
    "The beacon NPCs help manage portals. Activate them early. They buy precious seconds.",
    "This swamp is what the Blasted Lands USED to be. Before the Portal energy killed everything.",
}, {
    "We're defending the opening of the Dark Portal. The THING that caused the first war. Because time demands it.",
    "Temporus is probably responsible for more wipes than any other five-man boss in TBC.",
    "The moral complexity of Black Morass is wild. We MUST let the invasion happen. Fixed point in time.",
    "Eighteen portal waves with three bosses woven in. The most stressful 5-man event in the game.",
})

-- The Mechanar ---------------------------------------------------------------
Z("The Mechanar", {
    "The Mechanar. Tempest Keep's factory wing. Blood elf engineers and constructs everywhere.",
    "Nethermancer Sepethrea commands the defense. She rides a fire elemental. As TRANSPORTATION.",
    "Pathaleon the Calculator is the final boss. Kael'thas's advisor. He's... calculating.",
    "Mechano-Lord Capacitus has a bomb mechanic. Some people are positive, some negative. SCIENCE.",
}, {
    "Capacitus's positive/negative charge mechanic is the 'stay away from matching debuffs' tutorial.",
    "Sepethrea's fire elemental rager does massive AOE. Kite it. Or die. Those are the options.",
    "Pathaleon summons mind-controlled adds. He breaks your group apart methodically.",
    "The Mechanar is the shortest Tempest Keep instance. But the trash is DENSE.",
    "Blood elf researchers are studying naaru technology here. They're reverse-engineering divine power.",
    "The gauntlet before Pathaleon has fire and arcane damage EVERYWHERE. Sprint through or fight through.",
}, {
    "The Mechanar is where Kael'thas keeps his R&D department. Explosive R&D.",
    "Capacitus taught me about positive and negative charges. More than school ever did.",
    "Sepethrea RIDES a fire elemental like a mount. That's either genius or insanity.",
    "Quick dungeon, good rep, guaranteed chaos. The Mechanar delivers.",
})

-- The Botanica ---------------------------------------------------------------
Z("The Botanica", {
    "The Botanica. Tempest Keep's garden wing. Blood elves growing demon-infused plants. What could go wrong?",
    "Commander Sarannis leads the guards. She yells A LOT. Multiple phases of yelling.",
    "High Botanist Freywinn is hybridizing plants with MAGIC. Some mornings the plants bite back.",
    "Warp Splinter is a treant infused with arcane energy. An inter-dimensional tree. Outland.",
}, {
    "Sarannis summons reinforcement waves. Kill the adds or they overwhelm you. Simple in theory.",
    "Freywinn turns into a tree and heals. A botanist who BECOMES a plant. Ultimate career commitment.",
    "Thorngrin the Tender sacrifices his plant allies for power. Even evil has workplace issues.",
    "Warp Splinter summons saplings that heal him. The whole fight is about killing baby trees.",
    "Laj is a floral colossus. A walking flower the size of a house. Very Botanica.",
    "The greenhouse sections have rare herbs. Mana Thistle grows IN this dungeon. Herbalists love it.",
}, {
    "The Botanica is the prettiest Tempest Keep instance. It's a garden. A DEADLY garden.",
    "Freywinn literally becomes a tree to heal. When your boss IS the remedy, that's awkward.",
    "Warp Splinter is one of the coolest-looking bosses in TBC. Giant glowing tree creature.",
    "I'd grow these plants at home if they wouldn't try to eat me. The Botanica has trust issues.",
})

-- The Arcatraz ---------------------------------------------------------------
Z("The Arcatraz", {
    "The Arcatraz. Tempest Keep's PRISON wing. The HARDEST Tempest Keep 5-man.",
    "Harbinger Skyriss is the final boss. He's been imprisoned here because he's TOO dangerous. For TEMPEST KEEP.",
    "Zereketh the Unbound is a voidwalker who broke free of his cell. Containment breach.",
    "Dalliah the Doomsayer and Wrath-Scryer Soccothrates share a room. They HATE each other. And you.",
}, {
    "Zereketh casts Seed of Corruption on targets. Spread OUT or learn what chain explosions feel like.",
    "Dalliah heals off Soccothrates's charges. Pull them apart or the fight never ends.",
    "Wrath-Scryer Soccothrates charges random players. Then fire trails follow. Room-wide chaos.",
    "Skyriss mind controls, splits into images, and hits harder every phase. The grand finale.",
    "The prisoner holding cells have random creatures. Released as trash waves. The zoo of evil.",
    "Millhouse Manastorm is a gnome prisoner who HELPS you in one fight. Then sends you a letter later. Legend.",
}, {
    "The Arcatraz is where Tempest Keep puts things they can't kill. And WE have to go inside.",
    "Skyriss is there because he's too powerful for anywhere else. And we're fighting HIM. In HIS cell.",
    "Millhouse Manastorm is my favorite NPC in TBC. A gnome mage prisoner who just wants revenge.",
    "Dalliah and Soccothrates bickering during their boss fight is peak dungeon writing.",
})

-- Magisters' Terrace ---------------------------------------------------------
Z("Magisters' Terrace", {
    "Magisters' Terrace. Kael'thas is back. AGAIN. On the Isle of Quel'Danas. He won't quit.",
    "This is the HARDEST 5-man in TBC. Kael'thas returned with more power and fewer ethics.",
    "Selin Fireheart is the first boss. A fel crystal addict. Don't let him reach the crystals.",
    "Priestess Delrissa has a random party composition. You fight what's basically another 5-MAN GROUP.",
}, {
    "Selin drains fel crystals to heal. Destroy the crystals or the fight is infinite.",
    "Vexallus is a pure energy elemental. He splits into sparks. Don't let too many sparks hit one person.",
    "Delrissa's adds are RANDOM. Each run is a different comp. Sometimes easy. Sometimes horrifying.",
    "Kael'thas has a phoenix. Gravity lapse lifts everyone into the air. Zero gravity combat.",
    "The white hawkstrider mount drops from Kael'thas. Rare, gorgeous, and the reason people re-run this.",
    "Kael'thas at the end has a speech. 'Tempest Keep was merely a setback.' ICONIC line.",
}, {
    "Magisters' Terrace is the PEAK of TBC 5-man design. Mechanics, difficulty, rewards — all top tier.",
    "'Tempest Keep was merely a SETBACK!' Kael'thas is the most dramatic villain in WoW.",
    "Delrissa's random comp means every run is unpredictable. That's either exciting or terrifying.",
    "The phoenix fight with gravity lapse floating everyone is the most unique boss mechanic in any 5-man.",
})

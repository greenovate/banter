-- Banter_Zone_Raids.lua
-- Zone-specific banter for every raid in Classic + TBC.
-- References SPECIFIC bosses, mechanics, loot, and legendary moments.
-- Loaded after Banter_Engagements.lua.
local _, ns = ...
local Z  = ns.engagements.Z
local ZT = ns.engagements.ZT

---------------------------------------------------------------------------
--  CLASSIC RAIDS
---------------------------------------------------------------------------

-- Molten Core -----------------------------------------------------------------
Z("Molten Core", {
    "Molten Core. Forty people. In a volcano. Fighting a FIRE LORD. This is fine.",
    "Ragnaros is at the end. 'TOO SOON, EXECUTUS! YOU HAVE AWAKENED ME TOO SOON!' ICONIC.",
    "The amount of fire resist gear we need for this place could outfit a small army.",
    "The trash respawn in Molten Core is LEGENDARY. Clear too slow and the whole instance resets behind you.",
}, {
    "Lucifron has mind control AND a curse. Double threat right at the entrance. Welcome to MC.",
    "Magmadar is a corehound. The BIGGEST corehound. And he fears the entire raid.",
    "Gehennas, Shazzrah, Garr, Baron Geddon... eight bosses before Ragnaros. Marathon, not a sprint.",
    "Sulfuron Harbinger has four adds. FOUR. Each one heals. Kill them first or cry.",
    "Golemagg is guarded by two dogs. The dogs can't die until he does. Dog loyalty is powerful.",
    "Baron Geddon's Living Bomb sends one person running into the raid screaming. Every. Time.",
    "Majordomo Executus surrenders after you beat his guards. Then he SUMMONS Ragnaros. Nice of him.",
    "Ragnaros submerges at 50% and sends sons of flame. Phase two of a fire god.",
}, {
    "'BY FIRE BE PURGED!' Ragnaros doesn't just fight — he ANNOUNCES himself.",
    "Molten Core is where guilds were forged. And wiped. Repeatedly. The original raid experience.",
    "Fire resist is not optional here. It's the REAL boss of Molten Core.",
    "After MC, you never look at lava the same way. It's always hostile. ALWAYS.",
})

ZT("Molten Core", "HUNTER", {
    "A Hunter in Molten Core. {name}, if Perdition's Blade drops, it's NOT for you. Please.",
    "Hey {name}, Rhok'delar — the hunter bow from Molten Core. You know you want it.",
    "{name}, please don't melee Ragnaros. I know you WANT to. Don't.",
}, {
    "Rhok'delar requires killing special demons across the world. Solo. As a Hunter. It's the ultimate test.",
    "Tranquilizing Shot is REQUIRED here. Magmadar's enrage must be dispelled. Hunters have ONE job.",
    "I brought extra fire resist. And ammo. So much ammo.",
    "Core Hound packs need to die together or they resurrect. I'll trap one. Maybe.",
}, {
    "Hunters are essential in MC. Tranq Shot, kiting, pulling. We're the MVP and nobody admits it.",
    "If a caster weapon drops, I'll only THINK about rolling. I won't DO it. Probably.",
})

-- Onyxia's Lair ---------------------------------------------------------------
Z("Onyxia's Lair", {
    "Onyxia's Lair. One boss. One dragon. Three phases. And deep breaths that wipe raids.",
    "Onyxia is a BLACK DRAGON who was disguised as Lady Katrana Prestor in Stormwind. Political espionage.",
    "'MORE DOTS! MORE DOTS! OKAY, STOP DOTS.' — someone, during this raid. Forever legendary.",
    "Phase Two: she flies. Phase Two is where raids die. Whelps from the sides. HANDLE IT.",
}, {
    "Phase One is tank and spank. Phase Two she takes off and rains fire. Phase Three she ENRAGES.",
    "The whelp caves on each side spawn adds during Phase Two. They just KEEP spawning.",
    "Deep Breaths are her aerial fire attack. She lines up and torches half the room. Move or die.",
    "Onyxia influenced Stormwind politics for YEARS. She was advisor to the king. While being a dragon.",
    "Head of Onyxia turns in for a buff. The WHOLE city buffs from one dragon head.",
    "The attunement chain requires investigating her disguise. A DETECTIVE quest line for a RAID.",
}, {
    "Onyxia is proof that one boss can be a complete raid experience. Three phases of dragon chaos.",
    "'THAT'S A 50 DKP MINUS!' The Onyxia Wipe Animation is forever part of WoW culture.",
    "Deep Breaths either happen or they don't. Nobody has ever accurately predicted them.",
    "After the political intrigue quest chain, killing her feels PERSONAL. For the Alliance!",
})

-- Blackwing Lair --------------------------------------------------------------
Z("Blackwing Lair", {
    "Blackwing Lair. Nefarian's laboratory. Chromatic dragonkin, eight bosses, and a LOT of class calls.",
    "Vaelastrasz — the SADDEST boss in Classic. He was a FRIEND. Nefarian corrupts him and we fight him.",
    "Razorgore has to kite eggs while the raid defends him. Thirty eggs. In a room full of adds.",
    "Nefarian calls out specific classes and disables them mid-fight. Class discrimination. Literally.",
}, {
    "Razorgore's egg event: control the boss, break eggs, defend the controller. The most chaotic encounter in Classic.",
    "Vael gives you a buff so powerful the fight is three minutes. Then you explode. Every 30 seconds someone dies.",
    "Broodlord Lashlayer is a gatekeeper. Pure tank check. Fire resist STILL matters.",
    "Firemaw, Ebonroc, Flamegor — three drakes in a row. The Drake Gauntlet.",
    "Chromaggus breathes every school of magic. Detect the combo or wipe to vulnerability stacks.",
    "Nefarian raises all the boss skeletons during Phase Two. Your KILLS come back. Including Vael. Brutal.",
}, {
    "BWL is where raid coordination really matters. Razorgore ALONE requires more planning than all of MC.",
    "Vaelastrasz dying is the most emotional moment in Classic raiding. He ASKS you to kill him.",
    "Nefarian's class calls turn YOUR strengths against you. Hunters shoot the raid. Priests heal Nefarian. Evil.",
    "Tier 2 gear drops in BWL and looks INCREDIBLE on everyone. The real endgame: fashion.",
})

-- Zul'Gurub ------------------------------------------------------------------
Z("Zul'Gurub", {
    "Zul'Gurub. Twenty-man troll raid. Hakkar the Soulflayer. And that one time a plague actually escaped.",
    "The Corrupted Blood incident started HERE. Hakkar's debuff spread to Ironforge. Actual plague simulation.",
    "High Priest bosses each channel an animal aspect to Hakkar. Kill them first to weaken him.",
    "Razzashi raptors and Zulian tigers drop as MOUNTS. Rare. Gorgeous. The reason people run ZG forever.",
}, {
    "High Priestess Jeklik is the bat aspect. She transforms. And screams. A LOT.",
    "High Priest Venoxis is the snake aspect. Poison everywhere. Classic troll poison.",
    "High Priestess Mar'li sends spider adds. The spider aspect does what spider aspects do.",
    "Jin'do the Hexxer is the optional boss. He mind controls and hexes. Voodoo at its finest.",
    "Mandokir is the Bloodlord who LEVELS UP during the fight. He kills someone and gains power. Unique.",
    "Hakkar's Corrupted Blood was supposed to stay in the instance. It DID NOT. It spread worldwide. Oops.",
}, {
    "ZG is the chill raid. Twenty people, troll loot, cool mounts. The vibes are good.",
    "The Corrupted Blood pandemic accidentally predicted real world virus transmission. Scientists studied it.",
    "Hakkar the Soulflayer is a blood god. Trolls love their loa. Even the evil ones.",
    "If the tiger or raptor mount drops, the raid goes SILENT. Then chaos. Pure chaos.",
})

-- Ruins of Ahn'Qiraj ---------------------------------------------------------
Z("Ruins of Ahn'Qiraj", {
    "Ruins of Ahn'Qiraj. The 20-man bug raid. Bugs EVERYWHERE. Giant ones.",
    "Ossirian the Unscarred can only be damaged near Anubisath crystals. Kite him or he destroys you.",
    "Kurinnaxx burrows and emerges. Sand traps. A giant bug that ambushes from BELOW.",
    "The war effort to open these gates was server-wide. Thousands of resources gathered. Historic.",
}, {
    "General Rajaxx has WAVES of adds before the actual boss fight. Wave after wave.",
    "Moam is a stone colossus. He drains mana and explodes. Casters hate him specifically.",
    "Buru the Gorger is a kiting fight. Lead him over eggs to lower his defenses.",
    "Ayamiss the Hunter flies and sends worms at the raid. A flying bug boss with babysitting adds.",
    "The Scarab Gong resonated across the server when rung. The opening of AQ was a world event.",
    "Ossirian without crystals hits tanks for their entire health bar. FIND the crystals.",
}, {
    "AQ20 is where you learn that bugs can be organized, military, and absolutely terrifying.",
    "Ossirian's crystal mechanic was ahead of its time. Positioning AND kiting AND DPS checks.",
    "The Ahn'Qiraj War Effort united entire servers. For ONCE, both factions worked together.",
    "Nothing prepares you for the SOUND of a billion silithid.",
})

-- Temple of Ahn'Qiraj --------------------------------------------------------
Z("Temple of Ahn'Qiraj", {
    "Temple of Ahn'Qiraj. AQ40. C'Thun — an actual OLD GOD — is at the end. Staring at us.",
    "C'Thun is a GIANT EYE that beams people. An Old God who kills you with VISION.",
    "Twin Emperors share health and teleport between platforms. Coordination nightmare.",
    "The Prophet Skeram is the first boss. He splits into three copies. Welcome to AQ40.",
}, {
    "Skeram's split at 75% and 50% means you fight THREE bosses. Determine the real one. Quickly.",
    "Bug Trio — Yauj, Vem, and Kri. Three bugs, different abilities. Kill order matters.",
    "Sartura bladestorms through the raid. Whirlwind meets 40 people. Carnage.",
    "Fankriss the Unyielding summons worms. Unyielding AND wormy. Great combination.",
    "Viscidus is a slime who requires FROST damage to shatter. Bring frost. ALL the frost.",
    "Twin Emperors Vek'lor and Vek'nilash — one takes physical, one takes magic. Tank swap across the room.",
    "C'Thun's beam chains to nearby players. SPREAD OUT. The beam hits harder with each jump.",
    "Inside C'Thun's stomach is an actual fight phase. You get SWALLOWED. BY an Old God.",
}, {
    "AQ40 is the most alien raid in Classic. Bug civilizations serving an Old God. We're in their TEMPLE.",
    "Getting swallowed by C'Thun is an experience. You fight tentacles. Inside a god. Small room.",
    "The Twin Emperors fight is the hardest coordination check in Classic. Both tanks, perfect timing.",
    "C'Thun was unkillable for weeks after launch. Mathematically impossible. They had to nerf him. A GOD needed nerfing.",
})

-- Naxxramas ------------------------------------------------------------------
Z("Naxxramas", {
    "Naxxramas. Kel'Thuzad's floating necropolis. The HARDEST raid in Classic. Four wings of death.",
    "Four wings: Arachnid, Plague, Military, Construct. Then Sapphiron and Kel'Thuzad. The gauntlet of a lifetime.",
    "The Four Horsemen are in the Military Quarter. Four bosses. Simultaneously. On a rotation.",
    "Kel'Thuzad is the lich who started the plague. THE plague. The one that killed Lordaeron.",
}, {
    "Anub'Rekhan, Grand Widow Faerlina, Maexxna — the Spider Wing. Webs, enrages, and locusts.",
    "Noth the Plaguebringer teleports to a balcony AND raises dead. Combat management at its finest.",
    "Heigan's Safety Dance. Dodge the green waves on the floor. The most famous mechanic in Classic.",
    "Loatheb has a unique mechanic: healing is restricted to a 3-second window every 20 seconds.",
    "Patchwerk is the DPS check. No mechanics. Just hit him before he kills the tanks. Pure damage race.",
    "Grobbulus drops poison clouds. The room slowly fills with green death. Positioning dungeon.",
    "Thaddius requires charge management. Positive and negative polarity. Wrong side = raid explosion.",
    "Instructor Razuvious is controlled through mind control crystals. His own students attack him.",
    "Gothik the Harvester splits the raid between living and dead sides. Adds flow between realms.",
    "Four Horsemen: Mograine, Thane, Blaumeux, Zeliek. Tank rotation across corners. The ultimate coordination check.",
}, {
    "Naxxramas is the final test. If you beat Kel'Thuzad, you've conquered Classic.",
    "Heigan's Safety Dance has killed more raiders than all other bosses combined. DODGE. THE. WAVES.",
    "Kel'Thuzad was a mage of the Kirin Tor before he joined the Scourge. Career pivot.",
    "This necropolis floats over the Plaguelands. A flying fortress of undeath. Peak villain architecture.",
})

---------------------------------------------------------------------------
--  TBC RAIDS
---------------------------------------------------------------------------

-- Karazhan -------------------------------------------------------------------
Z("Karazhan", {
    "Karazhan. Medivh's tower. Ten-man TBC entry raid and quite possibly the best raid ever made.",
    "The Opera Event is RANDOM. Romeo and Juliet, Big Bad Wolf, or Wizard of Oz. You never know.",
    "The Chess Event is a LITERAL chess match. You possess pieces. Medivh cheats. Of course he does.",
    "Prince Malchezaar sits at the top: 'All realities, all dimensions, are open to me!' Dramatic entrance.",
}, {
    "Attumen the Huntsman rides Midnight. Kill him and the horse drops as a mount. THE Fiery Warhorse.",
    "Moroes has four random dinner guests. Interrupt, shackle, trap — crowd control the dinner party.",
    "Maiden of Virtue stuns the raid with Repentance. Holy damage from a Holy boss. In an evil tower.",
    "The Curator is a mana construct. He spawns Astral Flares and enters Evocate phase. DPS the flares. Then HIM.",
    "Shade of Aran, Medivh's father, fights in the library. 'I'll not move when Flame Wreath is cast, or the raid blows up.'",
    "Nightbane is the hidden boss. Summon a burning skeletal dragon on the terrace. Optional and EPIC.",
    "Netherspite has portals. Stand in the right beams. Wrong beam = bad time. Portal management.",
    "Prince Malchezaar drops infernals randomly. Phase three is a chaos zone of fire and pray.",
}, {
    "Karazhan is everyone's first TBC raid and many people's favorite raid of ALL TIME.",
    "The Opera Event RNG is the best designed randomness in WoW. Every option is fun. And Deadly.",
    "Shade of Aran Flame Wreath: 'I WILL NOT MOVE.' Everyone says it. Someone always moves.",
    "Prince Phase 3: infernals fall from the sky. Where they land is RNG. Sometimes they land on YOU.",
})

ZT("Karazhan", "MAGE", {
    "A Mage in Karazhan. {name}, Medivh's tower is basically your dream home.",
    "Hey {name}, the Shade of Aran is Medivh's father. A mage ghost. Hitting us with mage spells. Familiar?",
    "{name}, Medivh was the most powerful mage who ever lived. And his tower is still full of his magic.",
}, {
    "The arcane energy in this tower is INCREDIBLE. Every room pulses with it.",
    "Shade of Aran uses Blizzard, Flame Wreath, AND Arcane Missiles. The mage toolkit at its deadliest.",
    "Medivh's library is my dream. Every spell ever written. Behind one homicidal ghost.",
    "This tower contains more arcane knowledge than Dalaran. If we could GET to it without dying.",
}, {
    "Karazhan is proof that mages, even dead ones, make everything more complicated.",
    "I'd love to study here. After we clear out the demons, ghosts, and possessed chess pieces.",
})

-- Gruul's Lair ----------------------------------------------------------------
Z("Gruul's Lair", {
    "Gruul's Lair. Two bosses. One gronn. The DRAGONKILLER lives here.",
    "Gruul grows during the fight. He literally gets BIGGER and hits HARDER every minute.",
    "High King Maulgar has a council of five. Each requires a different tank and CC approach.",
    "This is the quickest TBC raid. In, council, Gruul, out. Efficient.",
}, {
    "Maulgar's council: a priest, a warlock, a mage, a shaman, AND Maulgar. Five targets, five strategies.",
    "Gruul's Ground Slam launches the entire raid. Then Shatter hits anyone standing too close. SPREAD.",
    "Cave In drops the ceiling periodically. Move out of rocks. While managing the GROWING boss.",
    "Gruul killed dragons. Like, casually. He has dragon skeletons in his lair as DECORATION.",
    "The Shatter mechanic taught an entire generation of raiders to SPREAD OUT after Slam.",
    "This is a 25-man raid that takes 30 minutes. Speed raiding before speed raiding was cool.",
}, {
    "Gruul growing bigger every thirty seconds means the fight has a built-in timer. Beat it or get squished.",
    "The Shatter combo — slam then shatter — is one of the cleanest mechanics in TBC. Learn it or die.",
    "Maulgar's council is harder than Gruul himself. Five different crowd controls. Five different tanks.",
    "Short raid, great loot, minimal trash. Gruul's Lair is perfect for raid night time crunch.",
})

-- Magtheridon's Lair ----------------------------------------------------------
Z("Magtheridon's Lair", {
    "Magtheridon's Lair. ONE boss. One GIANT pit lord. Five channelers keeping him contained.",
    "Magtheridon is chained by Burning Legion channelers. Kill the channelers, the pit lord wakes up. Handle it.",
    "The cube mechanic: click the cubes when he casts Blast Nova or the entire raid explodes.",
    "This is the demon under Hellfire Citadel. The Fel Horde has been draining his blood for soldiers.",
}, {
    "Five channelers heal each other. Crowd control and focus fire to whittle them down.",
    "When Magtheridon breaks free at 30%, the CEILING COLLAPSES. Actual cave-in damage.",
    "Cube clicks must be synced. Five people, five cubes, same second. Communication is everything.",
    "The cave-in during Phase 2 makes the arena smaller. Less room, bigger demon. Great.",
    "Magtheridon's blood is what created the Fel Horde. He's been a battery for orc corruption.",
    "Pre-nerf Magtheridon was a wall. Guilds wiped for weeks on cube timing alone.",
}, {
    "One boss, one room, one chance. Magtheridon's Lair is the most focused raid in TBC.",
    "The cube mechanic is beautiful. Five people must be alert and synchronized. Teamwork or death.",
    "A pit lord imprisoned by his own army, drained for blood. Even demons have bad days.",
    "When the ceiling falls, things get REAL. That transition from 'we're fine' to 'everything is collapsing' is *chef's kiss*.",
})

-- Serpentshrine Cavern --------------------------------------------------------
Z("Serpentshrine Cavern", {
    "Serpentshrine Cavern. Lady Vashj's underwater fortress. She flooded Coilfang for THIS.",
    "Lady Vashj has three phases. The tainted core mechanic in Phase 2 requires EVERYONE to participate.",
    "The Lurker Below is summoned by FISHING. You FISH a raid boss out of a pool. Peak WoW.",
    "SSC is underwater naga territory. Wet, dark, and full of things that bite.",
}, {
    "Hydross the Unstable shifts between frost and nature forms. Resist gear for BOTH. In ONE fight.",
    "The Lurker Below submerges and sends geysers at the platforms. Avoid the water. The BOSS is in the water.",
    "Leotheras the Blind is a demon hunter possessed by his own demon. Inner Demon mechanic.",
    "Fathom-Lord Karathress has three advisors. Kill them in order or suffer overlapping mechanics.",
    "Morogrim Tidewalker sends murloc WAVES. Actual tidal waves of murlocs. Hundreds.",
    "Vashj Phase 2: tainted cores must be chain-tossed player-to-player to shield generators. Team coordination.",
}, {
    "SSC has some of the most creative boss mechanics in TBC. Fishing bosses, core tossing, resist toggling.",
    "Lady Vashj's core-tossing mechanic is either beautiful teamwork or complete chaos. Usually chaos.",
    "Morogrim's murloc waves are HILARIOUS. Until you wipe to them. Then they're less funny.",
    "The Lurker Below coming out of the water is one of the most spectacular boss reveals in WoW.",
})

-- Tempest Keep (The Eye) ------------------------------------------------------
Z("Tempest Keep", {
    "Tempest Keep: The Eye. Kael'thas Sunstrider's fortress. The LONGEST boss fight in TBC.",
    "Kael'thas has FIVE phases. Five. The fight is twenty minutes long if everything goes right.",
    "Void Reaver is the 'loot reaver' — a loot pinata boss. Everyone farms him. No shame.",
    "Al'ar the Phoenix is a fire bird that resurrects from ashes. You kill it TWICE.",
}, {
    "Al'ar flies between platforms and rebirths from a pile of ash. The phoenix fight is beautiful.",
    "Void Reaver pounds and launches orbs. Simple fight, great loot. The definition of a farm boss.",
    "High Astromancer Solarian splits into agents and has a Wrath of the Astromancer debuff that explodes.",
    "Kael'thas Phase 1: kill four advisors. Phase 2: THEIR WEAPONS ATTACK. Phase 3: Advisors RETURN.",
    "Phase 4: Kael'thas himself, with a gravity lapse. Phase 5: He goes full power. Five phases of insanity.",
    "Thaladred the Darkener, Lord Sanguinar, Grand Astromancer Capernian, Master Engineer Telonicus — the four advisors.",
}, {
    "Kael'thas is the ultimate multi-phase boss. By Phase 5, you've fought FIFTEEN targets.",
    "Void Reaver is proof that simple bosses with great loot keep raids happy.",
    "Al'ar's rebirth mechanic is the phoenix fantasy done perfectly. Kill the bird, it comes back. Kill it again.",
    "'Tempest Keep was merely a setback' — Kael'thas, after dying HERE. He came BACK. In a 5-man.",
})

Z("The Eye", {
    "The Eye of Tempest Keep. If you thought Kael'thas was dramatic before, wait until five phases.",
    "We're fighting in a naaru ship. The blood elves stole a DIVINE vessel and turned it into a throne room.",
    "Void Reaver first — easy loot. Then Al'ar — phoenix beauty. Then Solarian — astral chaos. Then Kael'thas — insanity.",
    "The Ashes of Al'ar mount drops from Kael'thas. The RAREST mount in TBC. Everyone wants it.",
}, {
    "Al'ar rebirths mid-fight. A phoenix that actually does the phoenix thing. Stunning encounter.",
    "Kael'thas's legendary weapons from Phase 2 are USABLE temporarily. His advisor weapons in your hands.",
    "Gravity Lapse in Phase 4 sends everyone floating. Flying combat in a throne room.",
    "Solarian's Wrath debuff turns one player into a bomb. Run OUT. Way out.",
    "The advisors each have unique abilities. Thaladred gazes at targets. Capernian Pyroblasts. Telonicus has bombs.",
    "The Ashes of Al'ar has a drop rate of about 1%. People run this weekly for YEARS.",
}, {
    "The Eye is peak TBC raiding. Every boss is memorable, from the loot pinata to the five-phase finale.",
    "If the phoenix mount drops, the entire raid loses its mind. Every time. Without exception.",
    "Kael'thas's five-phase fight is the most complex single encounter in TBC. Learn it or despair.",
    "We're in a naaru ship. Fighting a blood elf prince. In space. Outland is something else.",
})

-- Hyjal Summit ----------------------------------------------------------------
Z("Hyjal Summit", {
    "Hyjal Summit. The Battle for Mount Hyjal — wave survival with Thrall AND Jaina. Working together.",
    "Eight waves per boss. Archimonde at the end. Wisp explosion. The most epic raid finale.",
    "We're literally reliving the Third War. Defending the World Tree. This is HISTORY.",
    "Archimonde is the raid ender. One mistake — one Grip of the Legion — and the whole raid can fall.",
}, {
    "Rage Winterchill leads the first assault. Ice-based attacks against Jaina's base.",
    "Anetheron attacks with infernals and Carrion Swarm. The second wave is significantly harder.",
    "Kaz'rogal drains mana and EXPLODES anyone who runs dry. Mana management raid-wide.",
    "Azgalor has Doom, which kills a target and spawns a demon. Every thirty seconds. Death produces more enemies.",
    "Archimonde: Grip of the Legion, Air Burst, and Soul Charge. One death cascades into more deaths.",
    "Trash wave management requires AOE discipline. Pull too many waves and you're overrun.",
}, {
    "Hyjal combines wave survival with epic bosses. The pacing is brilliant.",
    "Archimonde's Air Burst + fall damage means you need Tears of the Goddess. Use. Them.",
    "Fighting alongside Thrall and Jaina is a dream come true. They're actual NPCs. Helping. Sort of.",
    "The wisps at the end of Archimonde's fight echo the original battle. Chills every time.",
})

-- Black Temple ----------------------------------------------------------------
Z("Black Temple", {
    "Black Temple. Illidan Stormrage awaits. 'You are not prepared!' We'll see about that.",
    "Nine bosses. The most iconic raid entrance. The gates open and you see the TEMPLE stretching ahead.",
    "Illidan is the Betrayer. The first demon hunter. Half night elf, half demon. ALL dramatic.",
    "The Illidari Council — four bosses SIMULTANEOUSLY. The Reliquary of Souls has THREE faces.",
}, {
    "High Warlord Naj'entus opens with a shield that requires raid-wide coordination to pop.",
    "Supremus is a big infernal who chases random players. Run. Just RUN.",
    "Shade of Akama is a gauntlet defense encounter. Protect Akama while he breaks Illidan's control.",
    "Teron Gorefiend ghosts random players. If you die as a ghost, the constructs overwhelm the raid.",
    "Gurtogg Bloodboil has a stacking debuff on the raid. Rotate the bloodboil between groups.",
    "Reliquary of Souls: Essence of Suffering, Desire, and Anger. THREE bosses in ONE encounter.",
    "Mother Shahraz requires shadow resist gear. SPECIFIC resist for ONE boss. Classic TBC.",
    "Illidari Council: Gathios, Malande, Zerevor, Veras. Kill them within seconds of each other.",
    "Illidan Phase 2: HE TURNS INTO A DEMON. Phase 4: Maiev Shadowsong arrives to help. NARRATIVE.",
}, {
    "Black Temple is THE TBC raid. Illidan, the temple, the drama. Everything builds to this.",
    "'You are not prepared' is the most quoted line in WoW. And he's RIGHT. We're usually NOT prepared.",
    "Illidan Phase 2 demon form is the most terrifying transformation in any boss fight.",
    "After nine bosses and seventeen trash packs, Illidan falls. The Betrayer, betrayed by his own ambition.",
})

ZT("Black Temple", "WARLOCK", {
    "{name}, a Warlock in the Black Temple. Illidan uses demonic power too. You two have things in common.",
    "Hey {name}, the fel energy in here is dense. Try not to absorb TOO much. Seriously.",
    "{name}, Illidan became what he is by embracing demonic power. Sound familiar?",
}, {
    "The fel magic in these walls is ancient and concentrated. I can feel it pulling.",
    "Illidan consumed the Skull of Gul'dan. A warlock's artifact. He chose this path.",
    "The demon within me recognizes this place. Which is either useful or VERY concerning.",
    "Shadow resist on Mother Shahraz is my TIME to shine. Shadow Wardding everyone.",
}, {
    "The line between demon hunter and warlock is thinner than Illidan admits.",
    "After Black Temple, I understand Illidan's choices. I just made different ones. Hopefully better ones.",
})

-- Sunwell Plateau -------------------------------------------------------------
Z("Sunwell Plateau", {
    "Sunwell Plateau. The FINAL raid of TBC. Kil'jaeden himself. Through the Sunwell.",
    "Brutallus is the gear check. If your raid can't kill him, nothing past this point is possible.",
    "Kil'jaeden is being summoned THROUGH the Sunwell. A demon lord using the elves' own power source.",
    "M'uru — a naaru turned void god. The most brutal boss in TBC. Pre-nerf M'uru broke guilds.",
}, {
    "Kalecgos shares a dual-realm fight. Half the raid in the normal realm, half in the demon realm.",
    "Brutallus is a DPS race. Burn debuff stacks. Tank swaps. Pure numbers. Beat the timer or die.",
    "Felmyst is a corrupted blue dragon. She has an encapsulate AND a breath that mind controls.",
    "The Eredar Twins — Lady Sacrolash and Grand Warlock Alythess — share health. Fire and shadow.",
    "M'uru starts as a naaru. Phase 2: he becomes ENTROPIUS, a void god. The difficulty spike is legendary.",
    "Kil'jaeden emerges from the Sunwell in phases. Each phase he rises further. The drama is INCREDIBLE.",
}, {
    "Sunwell Plateau is where the best raiders prove themselves. The hardest content TBC ever offered.",
    "M'uru broke guilds. GUILDS. Entire organizations disbanded over this one encounter.",
    "Kil'jaeden rising from the Sunwell is the most dramatic boss reveal in WoW history.",
    "After Sunwell, you've done everything. TBC is complete. The Burning Legion is defeated. For now.",
})

-- Zul'Aman -------------------------------------------------------------------
Z("Zul'Aman", {
    "Zul'Aman. The TIMED troll raid. Save hostages in time and earn a war bear mount.",
    "Four animal bosses: bear, eagle, lynx, dragonhawk. Each one has a hostage on a timer.",
    "Nalorakk the Bear Lord is first. He charges and MAULS. Tank awareness required.",
    "The timed run to earn the Amani War Bear is the most exciting content in TBC 10-mans.",
}, {
    "Nalorakk shifts between troll and bear forms. Troll phase: ranged damage. Bear phase: tank destruction.",
    "Akil'zon the Eagle Lord summons an electrical storm. Get UNDER the player he targets. Stack mechanic.",
    "Jan'alai the Dragonhawk Lord has egg hatchers. If all eggs hatch at once, firehawk SWARM.",
    "Halazzi the Lynx Lord splits into troll + lynx. Two targets, double trouble.",
    "Hex Lord Malacrass steals a CLASS ABILITY from a random player. He uses YOUR powers against you.",
    "Zul'jin is the final boss. He cycles through all FOUR animal aspects. Bear. Eagle. Lynx. Dragonhawk.",
}, {
    "Zul'Aman's timed run is the most intense PvE experience in TBC. Speed AND execution.",
    "Zul'jin cycling through all four aspects is the ultimate final boss. You fight every animal again.",
    "The Amani War Bear is the pinnacle of TBC prestige. If you have one, you EARNED it.",
    "Hex Lord stealing player abilities is genius. Every attempt is different based on group comp.",
})

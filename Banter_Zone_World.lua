-- Banter_Zone_World.lua
-- Zone-specific banter for every overworld zone in Classic + TBC.
-- Each topic references SPECIFIC landmarks, NPCs, lore, and events
-- that make the zone unique.  Loaded after Banter_Engagements.lua.
local _, ns = ...
local Z  = ns.engagements.Z
local ZT = ns.engagements.ZT

---------------------------------------------------------------------------
--  EASTERN KINGDOMS
---------------------------------------------------------------------------

-- Dun Morogh -----------------------------------------------------------------
Z("Dun Morogh", {
    "I love Dun Morogh. Snow, troggs, and the constant threat of frostbite. What's not to love?",
    "You ever wonder how the dwarves keep Kharanos warm? That tavern has ONE fireplace for the whole town.",
    "The Frostmane trolls out here are impressively dedicated to wearing almost nothing in a blizzard.",
    "Coldridge Valley is nice until you realize every quest is 'kill wolves.' Just... so many wolves.",
}, {
    "At least the beer in Kharanos is warm. That's really all I need.",
    "The troggs burrowing out of Gnomeregan are NOT improving the property values around here.",
    "I heard Gnomeregan is still irradiated. The gnomes just keep the door shut and pretend it's fine.",
    "Ironforge is RIGHT there in the mountain. This is basically the suburbs.",
    "Brewnall Village has the best brew in Dun Morogh. Don't let anyone tell you otherwise.",
    "Those wendigo are enormous. Why are we fighting things three times our size with a rusty axe?",
}, {
    "At least the scenery is nice. If you like snow. Endless, relentless snow.",
    "I'm convinced the troggs are just grumpy because they're cold.",
    "You think the Frostmane trolls and the wendigo ever fight each other? Or do they just both hate US?",
    "One day I'll retire to a cabin out here. Right after I clear out the four hundred troggs on the doorstep.",
})

Z("Dun Morogh", {
    "That airfield up north is supposed to be dwarven military. All I see is a couple of planes and a LOT of snow.",
    "Apparently there used to be a tram connecting Ironforge to Stormwind. Under the OCEAN.",
    "The yetis in this zone are a menace. They're just giant angry snowmen that can punch.",
    "I passed through Amberstill Ranch earlier. Those rams are tougher than most adventurers I've met.",
}, {
    "The Deeprun Tram is an engineering marvel. Also completely unguarded. That seems like an oversight.",
    "Steelgrill's Depot keeps pumping out those steam tanks. Gnomish engineering at its... well, it works sometimes.",
    "Have you seen the frozen lake? I keep expecting something horrible to crawl out of it.",
    "The dwarves carved an entire city inside that mountain. Meanwhile I can't even set up a proper camp.",
    "Frostmane Hold is way too organized for trolls. They've got a whole cave system in there.",
    "I hear there's a hidden gnome base somewhere in the mountains. Knowing gnomes, it probably exploded already.",
}, {
    "Dun Morogh would be perfect if it was about forty degrees warmer.",
    "Let's just get to Ironforge. I need something warm that isn't on fire.",
    "At least the snow covers up the trogg holes. You only fall in SOME of them.",
    "Winter never ends here. I think the dwarves like it that way.",
})

-- Elwynn Forest ---------------------------------------------------------------
Z("Elwynn Forest", {
    "Elwynn Forest. Home of Goldshire, wolves, and adventurers who have no idea what they're doing yet.",
    "Did you know Hogger has been terrorizing Elwynn for YEARS? He's basically a local celebrity at this point.",
    "The Goldshire inn has a... reputation. Let's just walk past it quickly.",
    "Every kobold in this forest is protecting a candle like it's worth more than gold. What is WITH them?",
}, {
    "Marshal Dughan has been standing in Goldshire giving orders since the Third War. The man NEVER moves.",
    "Those Defias lurking around here are just the appetizer. Wait until you see what they built in Westfall.",
    "Northshire Abbey keeps pumping out fresh recruits. Straight from prayers to punching wolves.",
    "'You no take candle!' ...I don't WANT your candle. I want you to stop living in my mine.",
    "The Eastvale Logging Camp seems peaceful until the wolves show up. Which is constantly.",
    "Stone Cairn Lake has murlocs. Because of COURSE it has murlocs. Everywhere has murlocs.",
}, {
    "Elwynn looks peaceful, but there's literally a gnoll warlord a five-minute walk from Stormwind.",
    "I respect Hogger's commitment. That gnoll has defeated more adventurers than most raid bosses.",
    "Next time someone sends me to kill kobolds, I'm asking for hazard pay.",
    "You know what, the kobolds can KEEP the candles. I'm done.",
})

ZT("Elwynn Forest", "PALADIN", {
    "A Paladin in Elwynn Forest. Let me guess — Northshire Abbey trained you?",
    "You know {name}, every Paladin I've met started their career killing wolves near Goldshire.",
    "Ah, Elwynn Forest. Where every future hero of the Alliance begins by punching a kobold.",
}, {
    "Hey, someone has to start somewhere. At least the wolves are manageable.",
    "Northshire was... educational. Mostly I learned that wolves travel in packs.",
    "The Light guided me to this forest. Specifically, Brother Neals pointed me toward the vineyard.",
    "I've blessed more bandages than I can count. Elwynn has a LOT of things that bite.",
}, {
    "I'll always have a soft spot for this place. Even the kobolds.",
    "At least the Defias here are low-ranking. The ones in Westfall are a different story.",
})

-- Tirisfal Glades -------------------------------------------------------------
Z("Tirisfal Glades", {
    "Tirisfal Glades. It's like someone took a nice forest and added a permanent fog of despair.",
    "The Scarlet Crusade has a monastery AND random patrols out here? They're really committed to being everywhere.",
    "Brill is charming in a 'most of the residents are undead' kind of way.",
    "I keep hearing whispers near the Whispering Forest. Subtle name for a deeply unsettling place.",
}, {
    "The Undercity entrance is through a ruined castle. Very on-brand for the Forsaken.",
    "Agamand Mills is haunted. More haunted than the rest of Tirisfal, which is saying something.",
    "Deathknell is where the Forsaken wake up. Imagine your first memory being 'you're dead, here's a sword.'",
    "The pumpkin patches are nice. Probably cursed, but nice.",
    "Scarlet Crusade zealots wandering around in bright red. Not exactly stealthy.",
    "I swear the bats in this zone are the size of small horses.",
}, {
    "Tirisfal would be lovely if literally everything wasn't trying to corrode my soul.",
    "You get used to the smell. I'm told. By people who no longer have functioning noses.",
    "At least the Forsaken have a sense of humor about the whole 'being dead' thing.",
    "I need to leave before the Glades start feeling like home. That's when you know you've been here too long.",
})

-- Westfall --------------------------------------------------------------------
Z("Westfall", {
    "Westfall used to be farmland. Now it's Defias territory with a side of harvest golems.",
    "The People's Militia is basically five guys and a dream trying to hold this place together.",
    "Sentinel Hill has one tower and a whole lot of hope. Bless their hearts.",
    "Every harvest golem in this zone was built to tend crops. Now they tend to MURDER.",
}, {
    "Gryan Stoutmantle has been running Sentinel Hill on pure determination and Alliance neglect.",
    "The Defias Brotherhood started as stonemasons who built Stormwind. Then the kingdom stiffed them on the bill. Awkward.",
    "Those mechanical harvest watchers are everywhere. Farming really took a dark turn in Westfall.",
    "Moonbrook is a ghost town now. The Defias moved in and redecorated. With bandits.",
    "I hear the Deadmines are somewhere below this zone. A whole pirate ship, underground.",
    "The shore here is nice. If you ignore the murlocs. Which you can't, because they're EVERYWHERE.",
}, {
    "Westfall is what happens when a government forgets an entire zone exists.",
    "I'd feel bad for the farmers, but most of them already left. Smart move, honestly.",
    "One day Stormwind will actually send help here. One day. Probably.",
    "The wind never stops in Westfall. Neither do the Defias, apparently.",
})

-- Loch Modan -----------------------------------------------------------------
Z("Loch Modan", {
    "That dam is ENORMOUS. The Stonewrought Dam is genuinely one of the most impressive things I've seen.",
    "Thelsamar is a nice little town. Quiet. Until the troggs show up, which is always.",
    "The loch itself is beautiful. Just don't look too closely at what's swimming in it.",
    "Mo'grosh Stronghold is full of ogres. Big ones. Why are there always ogres?",
}, {
    "The dwarves built that dam to create the whole lake. That's some serious engineering commitment.",
    "There's an excavation site east of here. Dwarves love digging. It's in their blood.",
    "Stonesplinter troggs are everywhere. They're like cockroaches but bigger and angrier.",
    "Those Dark Iron spies near the dam are NOT subtle. Red glowing eyes kind of give it away.",
    "Farstrider Lodge has some of the best hunters in Loch Modan. They're also incredibly smug about it.",
    "I hear there are crocolisks in the loch. Because a peaceful lake in a dwarf zone needs murder lizards.",
}, {
    "Loch Modan is where dwarves go to relax. It's still full of troggs, but they consider that relaxing.",
    "At least the dam is holding. If THAT breaks, everything south of here is having a very bad day.",
    "I could retire to Thelsamar. Good beer, nice view of the loch. Just need to exterminate the troggs first.",
    "The archaeology sites here probably predate the entire kingdom. And they've got three interns and a shovel.",
})

-- Silverpine Forest -----------------------------------------------------------
Z("Silverpine Forest", {
    "Silverpine Forest. Where the trees are dead, the wolves are feral, and the worgen are... everywhere.",
    "Pyrewood Village is normal during the day. At night the whole town turns into worgen. ALL of them.",
    "Shadowfang Keep is up on that hill looking appropriately menacing. Classic haunted castle location.",
    "The Dalaran crater is around here somewhere. An entire CITY just picked up and left.",
}, {
    "Arugal summoned worgen from another dimension. As you do. For science.",
    "The Forsaken and the Scourge are fighting over this forest. It's a battle between the dead and the deader.",
    "Ambermill has mages who are NOT happy about the Forsaken moving in. Can't blame them.",
    "The Deep Elem Mine is full of Rot Hides. Even for undead, they're disgusting.",
    "That lake in the middle of the forest? Don't swim in it. Just... trust me.",
    "The Sepulcher is the Forsaken's main base here. It's as cheerful as you'd expect.",
}, {
    "Silverpine makes Tirisfal Glades look like a vacation spot. And Tirisfal is already awful.",
    "If Arugal spent less time summoning worgen and more time on home repair, Shadowfang Keep wouldn't be so drafty.",
    "At least the Forsaken are organized. Evil, but organized.",
    "I hear Dalaran just teleported away one day. Imagine the property damage.",
})

-- Redridge Mountains ----------------------------------------------------------
Z("Redridge Mountains", {
    "Lakeshire is under siege by Blackrock orcs and the Alliance response is basically 'good luck.'",
    "The bridge to Lakeshire gets attacked so often they should just make it out of steel.",
    "There's a whole orc army in the mountains and the town guard is like twelve guys. Seems fine.",
    "Stonewatch Keep was nice before the Blackrock clan moved in and redecorated with skulls.",
}, {
    "Magistrate Solomon has been writing letters to Stormwind for help. For YEARS. Still waiting.",
    "The gnolls, the orcs, AND the murlocs? Redridge can't catch a break.",
    "Corporal Keeshan is a legend around here. One man against an entire orc fortress. Bold.",
    "Lake Everstill is scenic. The Murlocs trying to eat fishermen is less scenic.",
    "Render's Valley is crawling with Blackrock orcs. They turned a nice canyon into an invasion staging ground.",
    "The tower guards here deserve medals. Or reinforcements. Preferably reinforcements.",
}, {
    "Redridge proves that being close to Stormwind means absolutely nothing in terms of getting help.",
    "At least Lakeshire still has that inn. Good food, gorgeous lake view, constant threat of invasion.",
    "Some day Stormwind will actually defend Redridge. Some day.",
    "The orcs picked a beautiful spot for their evil fortress. You have to give them that.",
})

-- Duskwood --------------------------------------------------------------------
Z("Duskwood", {
    "Anyone else notice it's ALWAYS night in Duskwood? Like, does the sun just skip this zone?",
    "Darkshire is held together by the Night Watch militia and pure stubbornness.",
    "The story of Stalvan Mistmantle is all over this place. That guy's journals are DARK.",
    "Stitches walks the road at night. A giant abomination. On the ROAD. Just strolling.",
}, {
    "Commander Althea Ebonlocke runs the Night Watch. She's basically holding this zone together personally.",
    "Abercrombie the Hermit seems harmless. He is NOT. Do not trust the hermit.",
    "Mor'Ladim is a death knight wandering the cemetery. He used to be a paladin. That's... rough.",
    "The Rotting Orchard gives me the creeps. Nothing should rot for THAT long.",
    "Raven Hill Cemetery has more undead than buried dead at this point. The math doesn't add up.",
    "I heard something howls in the woods near Manor Mistmantle. Stalvan's ghost maybe. Fun.",
}, {
    "Duskwood is proof that a zone can have atmosphere. Terrible, horrifying atmosphere.",
    "You know it's bad when the town's most reliable defense is 'hope the abomination goes the other direction.'",
    "I'm not sleeping until we leave Duskwood. Neither should you.",
    "The worgen around here come from Shadowfang Keep. Arugal's mess SPREADS apparently.",
})

ZT("Duskwood", "PRIEST", {
    "A Priest in Duskwood. {name}, your Light is probably the brightest thing this zone has seen in years.",
    "Duskwood could use about a thousand more Priests. And maybe some actual daylight.",
    "{name}, ever thought about setting up a permanent chapel in Darkshire? They NEED one.",
}, {
    "The undead here aren't mindless — some of them used to be the TOWNSPEOPLE. That's the worst part.",
    "I've been blessing every crossroad we pass. Can't hurt.",
    "The Light feels... dimmer here. Like the shadows are actively pushing back.",
    "Darkshire's chapel is barely standing. I offered to help repair it. They said 'just keep the undead out' instead.",
}, {
    "I'll keep my Light burning. Duskwood needs it more than most places.",
    "If anyone needs last rites, I'm available. In Duskwood, that's not a joke.",
})

-- Wetlands -------------------------------------------------------------------
Z("Wetlands", {
    "The Wetlands. Where the rain never stops and every step is slightly moist.",
    "Menethil Harbor is the only way to sail to Kalimdor from here. It's also half-flooded. Constantly.",
    "There's a tram from Ironforge but then you still have to RUN through the Wetlands. The whole way.",
    "Dark Iron dwarves attack Menethil Harbor like it's their part-time job.",
}, {
    "Dun Algaz is the pass between Loch Modan and here. It's full of Dark Iron dwarves. Lovely commute.",
    "The crocolisks in the Wetlands are the size of boats. I'm not exaggerating.",
    "Whelgar's Excavation is another dwarf dig site. Naturally, it's overrun by raptors.",
    "The Mosshide gnolls have taken over half the zone. They love mud almost as much as this place produces it.",
    "Greenwarden's Grove has a tree guardian. Even the TREES are fighting here.",
    "That bridge at the Thandol Span? It's been destroyed and rebuilt more times than I can count.",
}, {
    "If I ever dry off completely after leaving the Wetlands, it'll be a miracle.",
    "Menethil Harbor's dock master deserves a raise. That harbor is held together with hope and damp wood.",
    "The Wetlands exist to remind you that some places are just inherently uncomfortable.",
    "At least the rain keeps the fires out. Can't say that about Burning Steppes.",
})

-- Hillsbrad Foothills ---------------------------------------------------------
Z("Hillsbrad Foothills", {
    "Hillsbrad Foothills. Where Southshore and Tarren Mill have been at war since... forever.",
    "The Southshore vs Tarren Mill rivalry is the original world PvP. Legends were made here.",
    "Dalaran's dome is visible from here. A whole magical city under a bubble. They literally sealed themselves in.",
    "Ravenholdt Manor is hidden in the mountains. The rogues there are VERY secretive. Except about their location.",
}, {
    "Southshore is Alliance territory but the Horde visits regularly. Violently.",
    "The Hillsbrad Fields are constantly under attack by the Syndicate. Farmers can't catch a break.",
    "Durnholde Keep is where they held Thrall prisoner. Look how that turned out.",
    "The yeti cave in Hillsbrad is absolutely terrifying. Giant yetis in a tiny cave. No thanks.",
    "Alterac Mountains are right next door. Nothing good comes from Alterac.",
    "The Azurelode Mine has been fought over more times than anyone can count. It's just a mine!",
}, {
    "Hillsbrad is proof that geography creates conflict. Put two towns this close and someone starts a war.",
    "I bet the innkeepers in Southshore have STORIES. PvP stories.",
    "One day Hillsbrad will be peaceful. But probably not while anyone alive remembers Tarren Mill.",
    "At least the foothills are green. Enjoy it before the Plaguelands, which are... not.",
})

-- Alterac Mountains -----------------------------------------------------------
Z("Alterac Mountains", {
    "The ruins of Alterac are everywhere. An entire kingdom, destroyed. Now it's ogres and Syndicate thugs.",
    "Crushridge ogres have claimed most of the zone. They're not great housemates.",
    "The Syndicate operates out of these ruins. Bandits in fancy clothes — at least they have style.",
    "There's a whole Alterac Valley battleground entrance up here. In case you want ORGANIZED chaos.",
}, {
    "Alterac used to be one of the Alliance kingdoms. Then they betrayed everyone. That went well.",
    "The Ruins of Alterac are actually impressive. You can tell it was a real city once.",
    "Strahnbrad is technically still a town. A town full of Syndicate, but a town.",
    "The ogres here aren't as stupid as they look. Some of them are even organized. That's concerning.",
    "Chillwind Point is nearby. It's the last outpost before you enter the Plaguelands. Cheerful.",
    "The snow up here is relentless. I think Alterac WANTS to be uncomfortable.",
}, {
    "Alterac is a cautionary tale about betraying your allies. Look at this place.",
    "At least the ogres are consistent. They've been here for years and they still just want to hit things.",
    "Maybe one day someone will reclaim Alterac. Until then, it's ogre country.",
    "I genuinely cannot tell where the ruins end and the actual mountains begin.",
})

-- Arathi Highlands ------------------------------------------------------------
Z("Arathi Highlands", {
    "Arathi Highlands. Home of Stromgarde, the once-great fortress that's now split three ways.",
    "Stromgarde is a mess. Ogres, Syndicate, AND Alliance remnants all crammed into one fortress.",
    "Hammerfall is up on the ridge. The Horde outpost looks like it was built angry.",
    "The Witherbark trolls are down south doing... troll things. As always.",
}, {
    "Stromgarde used to be one of the most powerful human kingdoms. Now it's a fixer-upper.",
    "The Circle of Inner Binding has actual elemental rifts. Someone bound elementals here. It went badly.",
    "Refuge Pointe is the Alliance holdout. 'Refuge' is generous — it's a camp with a flag.",
    "Go'Shek Farm was once productive. Now it's contested territory with dead crops.",
    "Faldir's Cove has pirates. Of COURSE there are pirates. There are always pirates.",
    "The raptors in Arathi are aggressive even by raptor standards.",
}, {
    "Arathi has so much history. And also so many things trying to kill you.",
    "Stromgarde could be saved. Just need a few hundred soldiers and someone to evict the ogres.",
    "At least the Highlands are pretty from a distance. Up close it's all political collapse.",
    "The trolls, the ogres, the Syndicate... Arathi's got a full roster of problems.",
})

-- Stranglethorn Vale ----------------------------------------------------------
Z("Stranglethorn Vale", {
    "Stranglethorn Vale. Where Nesingwary asks you to hunt EVERYTHING and Booty Bay sells the loot.",
    "Hemet Nesingwary is down here with his hunting buddies. They want you to kill thirty of each animal. Each.",
    "Booty Bay is a goblin paradise. Neutral territory, cheap rum, and absolutely no building codes.",
    "The Gurubashi Arena is in the center of the jungle. Every chest drop turns into a brawl.",
}, {
    "The trolls in Stranglethorn have been here since before humans could READ. Their ruins are massive.",
    "Grom'gol Base Camp is the Horde's spot here. Complete with a zeppelin tower in the JUNGLE.",
    "The bloodsail pirates attack Booty Bay constantly. Baron Revilgaz just puts bounties on them. Circle of life.",
    "Nesingwary's kill quests are legendary. 'Kill 30 raptors. Now 30 tigers. Now 30 panthers.' The man's insatiable.",
    "Zul'Gurub is somewhere in the north. An entire troll temple city. Hakkar the Soulflayer lives there.",
    "The pages of that Green Hills of Stranglethorn book are scattered EVERYWHERE. Who does that?",
}, {
    "Stranglethorn is beautiful but deadly. Like a tiger. Which you will fight seven hundred of.",
    "If Nesingwary ever runs out of animals to hunt, the whole zone's economy collapses.",
    "Booty Bay at sunset is gorgeous. Right up until someone flags for PvP.",
    "I found another page from that book. Just one. Out of like thirty. This is going to take a while.",
})

-- Badlands -------------------------------------------------------------------
Z("Badlands", {
    "The Badlands live up to the name. It's rocks, dust, and the occasional very angry rock elemental.",
    "Uldaman is somewhere under these hills. Titan ruins, sealed vaults — very mysterious and full of troggs.",
    "Kargath is the Horde's outpost here, right on the edge. It looks as inviting as the Badlands itself.",
    "There are dragon whelps nesting in the canyons. DRAGON WHELPS. Baby dragons. Still dangerous.",
}, {
    "The Dustbelcher ogres are camping near the road. Ogres love blocking roads. It's like a hobby.",
    "Uldaman holds Titan artifacts older than recorded history. And we send adventurers in there with pickaxes.",
    "The Anvilrage dwarves — Dark Iron clan — have a presence here. They're NOT friendly.",
    "Lethlor Ravine has full-grown dragonkin and their nests. Approach with extreme caution.",
    "Hammertoe Grez was an explorer who went deep into Uldaman. He didn't come back in great shape.",
    "The ridge overlooking the Searing Gorge is right there. The temperature jumps about a hundred degrees.",
}, {
    "Badlands is what happens when a zone gives up on having vegetation.",
    "The Titan ruins are amazing. The troggs living in them are significantly less amazing.",
    "At least in the Badlands you can see enemies coming from miles away. Nothing grows tall enough to hide behind.",
    "I respect any zone that's just honest about being terrible. 'The Badlands.' No pretense.",
})

-- Swamp of Sorrows ------------------------------------------------------------
Z("Swamp of Sorrows", {
    "Swamp of Sorrows. Named that way for a REASON. It's depressing and wet.",
    "The Temple of Atal'Hakkar is sunk into the swamp. An entire temple, just... submerged. Troll engineering.",
    "The Lost Ones wander the swamp. Broken draenei who've been here since the Dark Portal first opened.",
    "Stonard is the Horde's base here. It's been here since the First War. It still looks temporary.",
}, {
    "The Harborage has a few Alliance draenei trying to save the Lost Ones. Noble, but rough odds.",
    "The green dragons in this swamp are being corrupted by the Emerald Nightmare. Everything is terrible.",
    "Stagalbog has those undead murlocs. Because regular murlocs weren't bad enough.",
    "The Pool of Tears is where the Sunken Temple entrance is. 'Pool of Tears' captures the experience perfectly.",
    "Swamp jaguars are the least of your worries here. Which says a lot about the swamp.",
    "The Fallow Sanctuary is full of corrupted wildlife. The whole zone is slowly going wrong.",
}, {
    "Every zone has a charm. The Swamp of Sorrows' charm is that it teaches you to appreciate ANYWHERE else.",
    "I've been wet since we entered this zone. I will be wet until we leave. I've accepted this.",
    "Whoever named this the Swamp of Sorrows clearly visited in person.",
    "At least we're not in the Blasted Lands. Yet.",
})

-- Burning Steppes -------------------------------------------------------------
Z("Burning Steppes", {
    "Burning Steppes. Where Blackrock Mountain looms and everything is on fire or about to be.",
    "Blackrock Mountain is RIGHT THERE. Two dungeons, two raids, and a very angry firelord inside.",
    "The dragonkin roaming the Steppes are Nefarian's brood. Because regular enemies were too easy.",
    "Morgan's Vigil is the Alliance outpost here. Vigil is right — you don't SLEEP near Blackrock.",
}, {
    "Flame Crest is held by the Thorium Brotherhood, neutral dwarves who specialize in fire resistance. Convenient.",
    "The Blackrock orcs have a massive army here. They just keep coming out of the mountain.",
    "Dreadmaul Rock has ogres, because of course it does. Blackrock chose the ogres as allies. Inspired.",
    "The ruins of Thaurissan are from the old Dark Iron capital. The emperor blew it up. On purpose.",
    "Dragon whelps AND dragonkin. The whole Burning Steppes is basically a dragon zoo with no fences.",
    "Pillar of Ash is a volcano vent. Active volcano, roaming dragons, evil orcs — this zone has EVERYTHING.",
}, {
    "Burning Steppes is the welcome mat for Blackrock Mountain. And it's a terrible welcome.",
    "If the lava pools don't get you, the dragonkin will. If they don't, the orcs will. Redundant security.",
    "At least it's warm. Aggressively, dangerously warm.",
    "This whole zone exists to make you question your life choices before entering Blackrock Mountain.",
})

-- Searing Gorge ---------------------------------------------------------------
Z("Searing Gorge", {
    "Searing Gorge is like the Burning Steppes but with MORE lava and LESS hope.",
    "The Cauldron is a massive pit of Dark Iron industry. They literally smelted a hole in the ground.",
    "Thorium Point is run by the Thorium Brotherhood. They're neutral because BOTH sides need fire resist gear.",
    "The Dark Iron dwarves here are running a full industrial operation. Mines, forges, slag pits.",
}, {
    "The Cauldron is impressive in a 'nature is screaming' kind of way.",
    "Dark Iron Steelworkers are everywhere. They've got a better labor force than most cities.",
    "The Grimesilt Dig Site has Dark Iron excavations going deep. They're always digging for SOMETHING.",
    "Firewatch Ridge overlooks the whole Gorge. The view is 90% lava.",
    "Lunk is a friendly ogre near Thorium Point. A FRIENDLY ogre. In the Searing Gorge. I'm suspicious.",
    "The entrance to Blackrock Mountain is shared between here and Burning Steppes. Double the misery.",
}, {
    "Searing Gorge makes you appreciate temperatures below 'scorching.'",
    "The Dark Iron dwarves are actually impressive. Evil, enslaved by a firelord, but productive.",
    "I'm going to need new boots after this zone. Mine are partially melted.",
    "At least Thorium Point has water. Everything else here is magma.",
})

-- Blasted Lands ---------------------------------------------------------------
Z("Blasted Lands", {
    "The Blasted Lands. Everything here is dead because the Dark Portal corrupted the entire zone.",
    "The Dark Portal is right there. THE portal. Where the orcs first invaded Azeroth.",
    "Nethergarde Keep watches the Portal. They've been standing guard here for years. Rough assignment.",
    "The Tainted Scar has actual DEMONS. Not metaphorical ones. Real, fire-breathing demons.",
}, {
    "The Dark Portal's energy warped this entire landscape. Used to be the Black Morass. Now it's just blasted.",
    "The boars here are mutated and enormous. Dark Portal radiation is not kind to wildlife.",
    "Nethergarde's mages monitor the Portal constantly. Must be a thrilling shift rotation.",
    "Dreadmaul Hold has enslaved ogres. The demons got to them.",
    "The Serpent's Coil is full of basilisks. Stone-gazers in a dead zone. Fitting.",
    "Everything in this zone has that slightly wrong look. Warped. Tainted. Uncomfortable.",
}, {
    "Blasted Lands is what happens when you open a portal to a demon world in your backyard.",
    "The first time I saw the Dark Portal, I understood why everyone was afraid. That thing is HUGE.",
    "At least now the Portal leads to Outland. Mostly. When it's not leaking demons.",
    "I don't envy the Nethergarde garrison. Years of staring at a giant evil portal. Great for morale.",
})

-- Western Plaguelands ---------------------------------------------------------
Z("Western Plaguelands", {
    "Welcome to the Western Plaguelands. Where the crops are blighted and the dead walk. ALL of them.",
    "Andorhal used to be a major grain city. Then the plague hit. Now it's a three-way warzone.",
    "The Cauldrons are spread across the zone. Each one pumps out plague. The Scourge is efficient.",
    "Scholomance is in the southeast. A necromancy school inside a basement. Higher education at its finest.",
}, {
    "Andorhal is fought over by Alliance, Horde, AND the Scourge. Because one enemy at a time is too simple.",
    "The Cauldron lords maintain the plague in each area. Kill the lord, cleanse the cauldron. Simple. Horrifying.",
    "Hearthglen used to be Scarlet Crusade territory. They're fanatics, but they kept the undead out.",
    "Uther's Tomb is here. The greatest Paladin who ever lived, buried in a plagued wasteland. Tragic.",
    "Sorrow Hill is a cemetery. In the Plaguelands. So yes, the dead are very much not resting.",
    "The Writhing Haunt used to be a farm. The 'writhing' part is new and deeply unsettling.",
}, {
    "Western Plaguelands is heartbreaking. You can see what it USED to be.",
    "Every building was someone's home. Every field was someone's livelihood. The plague took everything.",
    "I wonder if this land can ever be healed. The druids say maybe. Eventually. The druids are optimistic.",
    "At least the Argent Dawn is trying. That's more than most people do when surrounded by plague zombies.",
})

-- Eastern Plaguelands ---------------------------------------------------------
Z("Eastern Plaguelands", {
    "Eastern Plaguelands. Where the Scourge threw EVERYTHING and the Argent Dawn stands against it.",
    "Light's Hope Chapel is the last bastion of hope here. The Light literally protects it.",
    "Stratholme is in the north. An entire city of undead, led by Baron Rivendare. Good times.",
    "Naxxramas floats above Plaguewood. A giant necropolis. In the SKY. Just hovering there menacingly.",
}, {
    "Light's Hope Chapel sits on consecrated ground so holy the Scourge CAN'T take it. The Light delivers.",
    "Tyr's Hand was Scarlet Crusade territory. Zealots, but heavily fortified zealots.",
    "The Fungal Vale is a disease-ridden mushroom nightmare. The Plaguelands keep finding new ways to be awful.",
    "Darrowshire was the site of a famous battle. The ghosts still fight it. Every. Night.",
    "Plaguewood has Scourge ziggurats and necromancers everywhere. It's Kel'Thuzad's front yard.",
    "The Noxious Glade has plague cauldrons too. Because Western Plaguelands' cauldrons weren't enough.",
}, {
    "Eastern Plaguelands is worse than Western. I didn't think that was possible.",
    "The Argent Dawn operates from Light's Hope because literally nowhere else is safe.",
    "If we ever clear the Scourge from this zone, it'll be the greatest achievement since the Second War.",
    "Naxxramas up there means Kel'Thuzad is watching. The lich who started ALL of this.",
})

-- Deadwind Pass ---------------------------------------------------------------
Z("Deadwind Pass", {
    "Deadwind Pass. The most EMPTY zone in the Eastern Kingdoms. Nothing lives here. By design.",
    "Karazhan towers over everything. Medivh's tower. Where the Guardian opened the Dark Portal.",
    "There's literally nothing here except ghosts, ogres, and one very spooky tower.",
    "Even the wildlife abandoned Deadwind Pass. When the ANIMALS leave, that's your sign.",
}, {
    "Karazhan is Medivh's tower. THE Medivh. Guardian of Tirisfal. The guy who let the orcs in.",
    "The ghosts in Deadwind Pass are remnants of the people Medivh's magic killed. The whole zone died.",
    "Morgan's Plot and the Deadwind ogres are the only living things here. The ogres don't seem to mind.",
    "The mana in this zone is completely drained. Karazhan absorbed everything.",
    "The road through Deadwind connects Duskwood to the Swamp of Sorrows. Both terrible. Perfect middle ground.",
    "I can feel Karazhan watching us. The tower has eyes. Lots of them.",
}, {
    "Deadwind Pass exists to remind you that powerful mages ruin EVERYTHING around them.",
    "At least it's a short zone. Small mercies.",
    "Karazhan is allegedly full of phantom parties, cursed operas, and a chess game. A CHESS GAME.",
    "Let's move through quickly. Nothing good lingers in Deadwind Pass.",
})

-- Eversong Woods --------------------------------------------------------------
Z("Eversong Woods", {
    "Eversong Woods. Beautiful golden trees, elegant spires, and the Dead Scar ruining everything.",
    "The Scourge cut a path through the entire zone. The Dead Scar goes all the way to the Sunwell.",
    "Silvermoon City is just ahead. Or what's left of it. They rebuilt half.",
    "The blood elves are powering everything with stolen magic and spite. Respect.",
}, {
    "The Wretched are blood elves who overdosed on mana. They're everywhere near the ruins.",
    "Falthrien Academy was a school for magisters. Now it's infested with arcane wraiths. Finals week went badly.",
    "The arcane golems still patrol their routes. Nobody told them the Scourge already came through.",
    "Fairbreeze Village is charming. In a 'pretending everything is fine' blood elf kind of way.",
    "The Dead Scar is haunting. You can trace Arthas's path straight through the forest.",
    "Sunsail Anchorage used to be a pleasant dock. Now it's full of Wretched addicts.",
}, {
    "Eversong would be paradise if not for the giant scar of undeath running through it.",
    "The blood elves lost everything and rebuilt. Say what you will about them — they're resilient.",
    "Those trees are actually enchanted to stay golden year-round. Even the foliage is magical.",
    "You can feel the mana deficiency in the air. The whole zone is hungry.",
})

-- Ghostlands ------------------------------------------------------------------
Z("Ghostlands", {
    "The Ghostlands. Where the Dead Scar gets WORSE and the Amani trolls want their land back.",
    "Zul'Aman is right here. An entire Amani troll fortress. They are NOT happy about the blood elves.",
    "Tranquillien is the Forsaken outpost. Blood elves and undead working together. Strange times.",
    "Deatholme is the Scourge's base in the south. Dar'Khan Drathir runs it. Traitor of Quel'Thalas.",
}, {
    "Dar'Khan Drathir betrayed the elves to Arthas. He HELPED destroy the Sunwell. Now he's undead in Deatholme.",
    "The Amani trolls have been fighting elves for thousands of years. This is personal.",
    "Sanctum of the Sun is a blood elf outpost studying the Dead Scar. Brave or foolish. Maybe both.",
    "Windrunner Spire is the ancestral home of the Windrunner family. Sylvanas grew up here. Before... everything.",
    "The ziggurats in the Ghostlands are Scourge structures. They power the undead armies.",
    "An'daroth and An'telas are ruined elf sanctums. The trolls sacked them. History repeats.",
}, {
    "The Ghostlands are where Quel'Thalas stopped being beautiful and started being tragic.",
    "Sylvanas's homeland, now crawling with the Scourge she serves. That's... a lot to process.",
    "At least the blood elves are fighting back. Tranquillien is proof they haven't given up.",
    "Between the Scourge south and the Amani north, the Ghostlands are squeezed from both sides.",
})

-- Isle of Quel'Danas ----------------------------------------------------------
Z("Isle of Quel'Danas", {
    "The Isle of Quel'Danas. Where the Sunwell is being used to summon KIL'JAEDEN. No big deal.",
    "The Shattered Sun Offensive is a joint force of Aldor AND Scryers. They FINALLY agreed on something.",
    "Magisters' Terrace is up there. Kael'thas came back. AGAIN. He won't stay down.",
    "The Sunwell was the source of all blood elf power. Now it's a demon-summoning portal. Upgrade?",
}, {
    "The Shattered Sun is slowly reclaiming the island. Every day they push a little further.",
    "Sun's Reach Harbor is the staging area. Ships from Shattrath bring supplies constantly.",
    "Kael'thas is working with the Burning Legion now. He went from prince to puppet.",
    "The Sunwell Plateau is the last raid. The final confrontation. Kil'jaeden himself.",
    "Smith Hauthaa forges gear for the offensive. The Shattered Sun has the BEST blacksmiths.",
    "The Greengill Coast has enslaved murlocs. Even the MURLOCS can't catch a break on this island.",
}, {
    "This island is where the expansion ends. Everything has been building to the Sunwell.",
    "If Kil'jaeden comes through that portal fully, it's over. For everyone. Everywhere.",
    "The Shattered Sun proved that when things get bad enough, EVERYONE works together. That's something.",
    "I can feel the Sunwell's energy from here. It's... wrong. Twisted. We need to fix this.",
})

---------------------------------------------------------------------------
--  KALIMDOR
---------------------------------------------------------------------------

-- Durotar --------------------------------------------------------------------
Z("Durotar", {
    "Durotar. Named after Durotan, Thrall's father. It's hot, red, and full of scorpids.",
    "Razor Hill is the main town between Sen'jin Village and Orgrimmar. It's got a forge and attitude.",
    "Valley of Trials is where every Horde hero starts. Killing boars and wondering about life choices.",
    "The Echo Isles are off the coast. Darkspear trolls live there, led by Vol'jin.",
}, {
    "Orgrimmar is RIGHT there in the canyon. The Horde capital built by raw determination and iron spikes.",
    "The Burning Blade has a cave up in the hills. Demon-worshipping traitors hiding in the Horde's backyard.",
    "Thunder lizards roam the southern coast. They're basically dinosaurs with an electric problem.",
    "Tiragarde Keep is an Alliance outpost on the shore. Bold of them to build it in DUROTAR.",
    "Kolkar centaurs keep raiding caravans. They've been doing it since Thrall founded the city.",
    "Sen'jin Village is the troll base. Voodoo, fishing, and a really nice ocean view.",
}, {
    "Durotar isn't pretty, but the Horde built a nation here. From nothing. That's impressive.",
    "At least the scorpids are consistent. Always angry, always stabby.",
    "This zone is basically Thrall's vision: harsh land, strong people. Very Horde.",
    "I'd complain about the heat, but I think that's considered weakness here.",
})

-- Mulgore --------------------------------------------------------------------
Z("Mulgore", {
    "Mulgore. The most peaceful zone in all of Azeroth. Just rolling green plains and kodo herds.",
    "Bloodhoof Village is down by the river. Baine Bloodhoof's people. Simple, honest, strong.",
    "Thunder Bluff sits on top of enormous mesas. An entire city on PILLARS of rock. How?",
    "The kodo herds move through the grass here. Gentle giants, every one of them.",
}, {
    "Mulgore is Tauren homeland. They've lived here since before the orcs arrived on Azeroth.",
    "The Venture Company is mining the edges of Mulgore. Goblins don't care about sacred lands.",
    "Bael'dun Digsite has dwarves excavating Tauren territory. The Tauren are NOT happy about it.",
    "Red Cloud Mesa, Bloodhoof Village, the Great Lift... this zone has real history.",
    "The plains here are so quiet you can hear the wind through the grass for miles.",
    "Palemane gnolls live in the caves. They're a nuisance, but nothing compared to the Venture Company.",
}, {
    "Mulgore is proof that not every zone needs to be trying to kill you.",
    "If I could retire anywhere, it'd be Mulgore. Green grass, blue sky, no plague zombies.",
    "The Tauren have the right idea. Live simply, respect the land. Also, be enormous.",
    "I wish more zones were like this. But then there'd be nothing to fight.",
})

-- The Barrens ----------------------------------------------------------------
Z("The Barrens", {
    "The Barrens. Where the quests never end, the zhevra never drop hooves, and the chat is legendary.",
    "Crossroads is the hub of the Barrens. It also gets raided by Alliance constantly. They love it.",
    "Every Horde player has a Barrens story. Most of them involve getting lost for three hours.",
    "Barrens chat is an institution. It's where culture goes to evolve. Or die. Depends on who's talking.",
}, {
    "The zhevra hoof drop rate is a war crime. Those animals clearly have hooves. I can SEE them.",
    "Ratchet is the goblin port on the east coast. Neutral territory where everyone pretends to be civil.",
    "Wailing Caverns is in the south. Druids of the Fang went in sane and came out... not.",
    "The Crossroads is attacked so often the NPCs probably have PTSD. They just respawn and keep going.",
    "The Forgotten Pools are full of Kolkar centaurs. They forgot nothing. They're very angry.",
    "Camp Taurajo is down south. It's a peaceful camp. For now.",
}, {
    "The Barrens would be shorter if zhevra actually dropped their hooves consistently.",
    "I've traveled from the Crossroads to Camp Taurajo and back. Three times. For one quest. ONE.",
    "Chuck Norris jokes in Barrens chat are a rite of passage. An ANNOYING rite of passage.",
    "At least the Barrens are flat. You can see your destination. It's just really, really far away.",
})

ZT("The Barrens", "HUNTER", {
    "A Hunter in the Barrens. {name}, please tell me you've tamed something cool out here.",
    "You know, {name}, the Barrens has some of the most iconic pets. The Savannah Highmane is classic.",
    "Hey {name}, did you come here specifically for Echeyakee? Everyone does.",
}, {
    "I've had my eye on a Savannah Prowler. Sleek, fast, and they match the landscape.",
    "The Barrens is hunter paradise. Raptors, lions, thunder lizards — take your pick.",
    "Echeyakee, the white lion. Every hunter wants one. I waited two hours for that spawn.",
    "Have you seen the deviate raptors in Wailing Caverns? Those colors are... unique.",
}, {
    "A good hunter knows every animal in their zone. I know every animal in the Barrens. There are too many.",
    "If you want a rare pet, the Barrens delivers. If you want zhevra hooves... good luck.",
})

-- Teldrassil -----------------------------------------------------------------
Z("Teldrassil", {
    "Teldrassil. The night elves grew an entire WORLD TREE. It's a tree that IS an island.",
    "Shadowglen is where new night elves wake up. In a tree. On a bigger tree. It's trees all the way down.",
    "Darnassus is built into the branches. An entire capital city in a tree.",
    "The corruption in Teldrassil runs deep. The tree was never blessed properly by the Dragon Aspects.",
}, {
    "Aldrassil is the smaller tree inside the bigger tree. Night elf architecture is just... trees.",
    "The gnarlpine furbolgs have gone feral. Corrupted. The whole zone feels slightly off.",
    "Ban'ethil Barrow Den has sleeping druids. Some of them won't wake up. That's ominous.",
    "The Oracle Glade has a moonwell that's being corrupted. Nothing in Teldrassil is untouched.",
    "Starbreeze Village is overrun by corrupted furbolgs. The night elves keep losing territory on their OWN tree.",
    "Rut'theran Village at the base is the only port. One dock connects this entire tree to the world.",
}, {
    "A world tree that isn't blessed. The night elves rushed this one. You can tell.",
    "Teldrassil is beautiful but haunted by what it SHOULD have been. An imperfect world tree.",
    "At least Darnassus is peaceful. It's the one place on Teldrassil that feels right.",
    "The corruption here is subtle. Not plague-lands obvious. Just... wrong. Creeping.",
})

-- Darkshore ------------------------------------------------------------------
Z("Darkshore", {
    "Darkshore. Ruins of ancient night elf civilization, beached sea creatures, and perpetual twilight.",
    "Auberdine is the main town. A small port with a big job — connecting Teldrassil to the mainland.",
    "There are beached sea creatures on the shore. Giant ones. Dead ones. Nobody knows why.",
    "The Master's Glaive has an Old God connection. The skeleton of a dead servant of the Old Gods. Just lying there.",
}, {
    "The ruins along the coast predate modern night elf civilization. This place is ANCIENT.",
    "Ameth'Aran and Bashal'Aran are two ruined cities. Highborne magic destroyed them from the inside.",
    "The Tower of Althalaxx has a demon infestation. A single tower, but it never ends.",
    "The Cliffspring River is being corrupted upstream. The naga are behind it. Naturally.",
    "Beached sea giants are a Darkshore specialty. Nobody can explain it. The ocean just... delivers them.",
    "There's a cave full of Twilight's Hammer cultists. Old God worshippers in a night elf zone.",
}, {
    "Darkshore has that 'ancient tragedy' vibe. Beautiful and deeply sad.",
    "The night elves have been dealing with these ruins for ten thousand years. That's a long renovation project.",
    "Something is very wrong with the ocean here. I don't think the dead sea creatures are a coincidence.",
    "Between the Old God relics and the Highborne ruins, Darkshore has layers of bad history.",
})

-- Ashenvale -----------------------------------------------------------------
Z("Ashenvale", {
    "Ashenvale. Ancient night elf forest, currently being logged by the Warsong Clan. They're not subtle about it.",
    "Warsong Gulch is the battleground born from this conflict. Horde needs lumber. Elves say no. PvP ensues.",
    "Astranaar is the night elf town in the center. It's beautiful. It also gets raided constantly.",
    "The demons left scars here during the Third War. Satyrs and corrupted wildlife everywhere.",
}, {
    "The Forest Song outpost in the east monitors demon activity. The Burning Legion left a mess.",
    "Warsong Lumber Camp is the Horde's operation. They're chopping down sacred trees. The elves are LIVID.",
    "Satyrs infest Night Song Woods. Former night elves corrupted by the Burning Legion. Tragic.",
    "Splintertree Post is the Horde base. Right in the middle of night elf territory. Bold.",
    "Raynewood Retreat has ancient treant protectors. The forest literally fights back.",
    "The Laughing Sisters near the moonwell are dryads. They're actually quite pleasant.",
}, {
    "Ashenvale is where the Horde-Alliance conflict gets personal. It's a forest war.",
    "Ten thousand years of forest, and the orcs show up with axes. Night elf patience has limits.",
    "At least the parts of Ashenvale that aren't being logged are gorgeous.",
    "The demon corruption and the logging... Ashenvale can't catch a break from ANY direction.",
})

-- Stonetalon Mountains --------------------------------------------------------
Z("Stonetalon Mountains", {
    "Stonetalon Mountains. Harpies, Venture Company, and some really annoyed druids.",
    "Stonetalon Peak has a druid conclave. They're trying to heal the land while everyone else destroys it.",
    "The Charred Vale is exactly what it sounds like. The Burning Legion torched it during the Third War.",
    "Windshear Crag is being strip-mined by the Venture Company. Not a tree left standing.",
}, {
    "The harpies nest in the peaks. They're territorial, loud, and incredibly aggressive.",
    "Webwinder Path is full of spiders. Giant spiders. Web-spanning-the-road giant spiders.",
    "Sun Rock Retreat is the Horde's outpost. Tauren trying to keep the peace. Mostly failing.",
    "The Venture Company doesn't care about the cenarion druids OR the Horde. They just want resources.",
    "The Charred Vale has infernals still burning from years ago. Demon fire doesn't go out.",
    "Mirkfallon Lake is the only pristine spot left. The rest is logged, charred, or infested.",
}, {
    "Stonetalon proves that everyone wants the same land for different reasons, and all of them involve destruction.",
    "The druids are outnumbered by harpies, goblins, and fire. Classic druid luck.",
    "At least the mountains themselves are impressive. Hard to strip-mine a whole mountain. Though the goblins are trying.",
    "I feel bad for the druids here. They chose the worst possible zone to try healing.",
})

-- Desolace -------------------------------------------------------------------
Z("Desolace", {
    "Desolace. The name is not a metaphor. Nothing grows here. Nothing WANTS to grow here.",
    "The centaur clans fight over this wasteland. The Gelkis and Magram hate each other more than they hate us.",
    "The Kodo Graveyard is where kodos come to die. It's as sad as it sounds.",
    "Mannoroc Coven is a demon outpost. Because Desolace's natural despair wasn't enough.",
}, {
    "The centaurs here trace their lineage to Cenarius's cursed son. The whole race is born from tragedy.",
    "Shadowprey Village is a Horde fishing village. Fishing in Desolace. That's commitment.",
    "Nijel's Point is the Alliance outpost, up in the mountains. They have the high ground, literally.",
    "The kodo bones in the graveyard are enormous. These animals are MASSIVE even when alive.",
    "The demons at Mannoroc Coven are summoned from the Burning Legion. Active demon worship.",
    "Ghost Walker Post is a Horde camp in the wastes. 'Ghost Walker' is very accurate for this zone.",
}, {
    "Desolace is where hope goes to dehydrate.",
    "The centaurs have been fighting each other for so long they forgot what they're fighting ABOUT.",
    "If we find anything alive and friendly in Desolace, I'm going to be suspicious.",
    "At least in other zones, the misery has variety. Desolace is consistently, relentlessly bleak.",
})

-- Dustwallow Marsh ------------------------------------------------------------
Z("Dustwallow Marsh", {
    "Dustwallow Marsh. Theramore's home, Onyxia's hiding spot, and mud. Endless, sucking mud.",
    "Theramore is Jaina Proudmoore's city. An island fortress in the swamp. Strategic AND uncomfortable.",
    "Onyxia's Lair is hidden in the southern marsh. A BLACK DRAGON has been nesting here this whole time.",
    "Mudsprocket is the goblin town south of Theramore. Even goblins look defeated here.",
}, {
    "Jaina Proudmoore built Theramore as a peaceful haven. It's surrounded by a hostile swamp. Classic Jaina.",
    "The black dragonkin roam the Wyrmbog. Onyxia's children. They're protective.",
    "The Grimtotem tauren have a camp here. They're the evil Tauren. Yes, those exist.",
    "The Stonemaul ogres used to serve Rexxar. Now they're just sort of... here. In the mud.",
    "The crocolisks in this marsh are absolutely enormous. Nature's perfect killing machines with extra teeth.",
    "Alcaz Island is off the coast. There's supposed to be a prisoner held there. Very mysterious.",
}, {
    "Dustwallow Marsh is proof that some locations are chosen for strategy, not comfort.",
    "Between Onyxia and the Grimtotem, Theramore is surrounded by enemies. Bold location choice.",
    "I've been sinking in mud for a mile. My boots are going to need a funeral.",
    "Say what you want about Jaina — she picked the most defensible swamp possible.",
})

-- Feralas --------------------------------------------------------------------
Z("Feralas", {
    "Feralas. Massive ancient trees, ogres, and Dire Maul — an entire ogre-infested elven city.",
    "The Twin Colossals are two enormous stone pillars. You can see them from MILES away.",
    "Dire Maul is a Highborne ruin full of ogres, demons, and a library. The library is the best part.",
    "Camp Mojache is the Horde outpost. Tauren keeping watch on the ogres. Fun job.",
}, {
    "Dire Maul was once Eldre'Thalas, a Highborne city. Now ogres live in it. Real estate changes.",
    "The Gordunni ogres are everywhere. They've claimed the ruins and most of the forest.",
    "Feathermoon Stronghold is the Alliance base on an island. Night elf fortress, very elegant.",
    "The Sprite Darters are little flying dragon-like creatures. Actually friendly. A rare thing.",
    "The feral scar yetis roam the south. Because feralas needed yetis ON TOP of ogres.",
    "High Wilderness has chimeras. Actual chimeras. Two-headed flying death creatures.",
}, {
    "Feralas is stunning. If you ignore the ogres. Which is hard because they're everywhere and enormous.",
    "Dire Maul's library is worth the trip. The ogres are... the price of admission.",
    "The Twin Colossals must have been carved by ancient magic. Nothing natural is that precise.",
    "I love Feralas. It's like Un'Goro Crater but with ogres instead of dinosaurs. Wait, that might be worse.",
})

-- Thousand Needles -----------------------------------------------------------
Z("Thousand Needles", {
    "Thousand Needles. A canyon full of stone pillars so tall it's like the earth grew teeth.",
    "Freewind Post is built on TOP of one of those pillars. Tauren don't believe in guard rails apparently.",
    "The Shimmering Flats at the south end have a RACE TRACK. Gnomes and goblins racing rocket cars.",
    "Highperch has wyvern nests. Wild wyverns are extremely territorial and extremely fast.",
}, {
    "The Shimmering Flats salt pan is as flat as it gets. Perfect for racing. Or mirages.",
    "Mirage Raceway is genius. Gnomish and goblin engineers competing to build the fastest rocket car.",
    "Freewind Post is only accessible by elevator. A Tauren town on a pillar with NO RAILING. No.",
    "The Grimtotem Clan have agents here too. They intimidate the main elevators.",
    "Galak centaurs patrol the canyons. The centaur problem extends to EVERY zone apparently.",
    "The climate shifts here are wild. Desert canyon transitions to salt flats in a mile.",
}, {
    "Thousand Needles is gorgeous from above. Terrifying from the narrow paths between pillars.",
    "I want to see a race at the Shimmering Flats. Gnomes strapped to rocket engines? Entertainment.",
    "Whoever built Freewind Post was either very brave or had never heard of falling.",
    "This zone would be perfect for flying mounts. Unfortunately, we walk. Between giant stone spires. Fun.",
})

-- Tanaris --------------------------------------------------------------------
Z("Tanaris", {
    "Tanaris. A massive desert with Gadgetzan, the Caverns of Time, and pirates. PIRATES. In a desert.",
    "Gadgetzan is the goblin trade hub. Neutral, chaotic, and surprisingly well-stocked.",
    "The Caverns of Time are HERE. Where the Bronze Dragonflight protects all of TIME ITSELF.",
    "The Wastewander bandits are everywhere. Humans who went feral in the desert. Fashion optional.",
}, {
    "The Caverns of Time entrance is in the south. A DRAGON protects the timeline. From us, usually.",
    "Zul'Farrak is a troll city up in the hills. The stair event is legendary. Legendary and terrifying.",
    "Gadgetzan has everything. Literally. If a goblin can sell it, it's in Gadgetzan.",
    "The Steamwheedle Port watches the coast. Pirates attack it. The goblins counter-attack. Business as usual.",
    "There's a Thistleshrub Valley full of... thistleboars and dew collectors. Desert life finds a way.",
    "The Dunemaul ogres have a camp in the northwest. Desert ogres. Because sand wasn't bad enough.",
}, {
    "Tanaris combines desert survival, time travel, and goblin capitalism. Only in Azeroth.",
    "Gadgetzan is proof that goblins can make money ANYWHERE. Even in a deadly desert.",
    "I'd visit the Caverns of Time but I'm afraid of breaking the timeline by sneezing.",
    "Sand. In my armor. In my hair. In my soul. Tanaris.",
})

-- Un'Goro Crater -------------------------------------------------------------
Z("Un'Goro Crater", {
    "Un'Goro Crater. DINOSAURS. Actual dinosaurs. And crystals, and Titan pylons, and MORE dinosaurs.",
    "Marshal's Refuge is the ONLY safe spot in the crater. Everything outside the camp wants to eat you.",
    "There's a guy named Linken here. With a sword quest. And a boomerang. He seems... familiar.",
    "The power crystals are everywhere. Red, blue, green, yellow — the pylons at the edges activate something.",
}, {
    "The devilsaurs in Un'Goro are the most terrifying creatures on Kalimdor. They CHASE you down.",
    "Titan pylons ring the crater edge. They're ancient technology. Nobody fully understands them.",
    "Lakkari Tar Pits have dinosaur bones in them. And living oozes. The tar is HUNGRY.",
    "Fire Plume Ridge has a volcano. In the center of a dinosaur zone. Maximum danger achieved.",
    "The gorillas in the east are enormous and weirdly intelligent. A-Me 01 is studying them.",
    "Linken's quest chain spans the whole crater. His gear is... oddly iconic. Green hat and everything.",
}, {
    "Un'Goro is the most dangerous and the most AMAZING zone on Kalimdor. Dinosaurs!",
    "I've been chased by three devilsaurs today. They come out of NOWHERE. Giant invisible murder lizards.",
    "The crystals here could power an entire city. Instead they power ancient Titan experiments.",
    "If I die in Un'Goro, at least it'll be to something cool. Like a dinosaur. A really big dinosaur.",
})

-- Silithus -------------------------------------------------------------------
Z("Silithus", {
    "Silithus. Where the silithid hives cover the landscape and the gates of Ahn'Qiraj loom ahead.",
    "The Cenarion Hold is the forward base. Druids and adventurers preparing to face an Old God.",
    "The Gates of Ahn'Qiraj were sealed for a thousand years. Someone rang the Scarab Gong and opened them.",
    "Twilight's Hammer cultists are everywhere. Worshipping C'Thun. An Old God. Great life choice.",
}, {
    "The silithid are insectoid and they hive. Every hive is connected to Ahn'Qiraj somehow.",
    "Cenarion Hold is the last bastion before the bug kingdom. The druids are holding the line.",
    "C'Thun lies beneath Ahn'Qiraj. An Old God. A literal god of chaos hidden under the sand.",
    "The opening of the Gates required a server-wide effort. The War Effort was massive.",
    "The Twilight Camps are full of elementals and cultists. They WANT C'Thun to wake up.",
    "Bronzebeard's Encampment has dwarven archaeologists studying silithid. For SCIENCE.",
}, {
    "Silithus is where you realise the bugs are organized, intelligent, and serving something ancient and evil.",
    "The whole zone is basically a bug army's front yard. And we just walked in.",
    "C'Thun is watching. Through the sand. Through the silithid. Always watching.",
    "This is end-game Azeroth. Giant bugs, Old Gods, and cultists. We've come a long way from kobolds.",
})

-- Azshara --------------------------------------------------------------------
Z("Azshara", {
    "Azshara. Named after Queen Azshara herself. Beautiful, empty, and full of naga.",
    "This zone is GORGEOUS and almost completely abandoned. Nobody comes here. It's eerie.",
    "The ruins along the coast are Highborne. Ten thousand years old. The naga patrol them now.",
    "The blood elves have a camp in the south. Studying magic. In a naga-infested ruin zone. Bold.",
}, {
    "The cliffs overlooking the ocean are stunning. Then you notice the naga on the beach.",
    "Timbermaw Hold is accessible from here. The furbolgs guard the pass to Felwood.",
    "Hydraxian Waterlords have a presence off the coast. Elementals of water opposing Ragnaros.",
    "Duke Hydraxis is out on an island. A literal water lord. He wants Ragnaros dead. Relatable.",
    "The ruins of Eldarath were once a great city. Highborne magic and hubris brought it down.",
    "Those spirit talkers in the hills are studying ley lines. Azshara sits on a magical nexus.",
}, {
    "Azshara is what happens when a zone has incredible design but no practical reason to visit.",
    "The naga are here because it was THEIR homeland. Before the Sundering. Before the ocean.",
    "Queen Azshara is supposedly still alive. Somewhere deep in the ocean. That's terrifying.",
    "I'll say this — Azshara sunsets are the best in Kalimdor. Worth the trip. If the naga don't eat you.",
})

-- Felwood -------------------------------------------------------------------
Z("Felwood", {
    "Felwood. A corrupted forest where every tree, creature, and water source is tainted.",
    "The Burning Legion's corruption runs deep here. The SOIL is evil.",
    "Timbermaw Hold guards the passage between here and Winterspring. Furbolgs as border security.",
    "Jaedenar is a Shadow Council base. Demon worshippers in a corrupted forest. They fit right in.",
}, {
    "Irontree Woods has corrupted treants. Even the TREES have gone wrong in Felwood.",
    "The Timbermaw furbolgs are neutral — earn their trust and they'll let you through their tunnel.",
    "Bloodvenom Post is the Horde outpost. Living in Felwood voluntarily. Brave souls.",
    "Emerald Sanctuary is where druids are trying to purify the forest. Progress is... slow.",
    "Shadow Hold in Jaedenar goes deep underground. The demons have built a fortress in there.",
    "The slimes and oozes are corrupted water elementals. The water itself turned evil.",
}, {
    "Felwood shows what the Burning Legion does to a forest. It's not just death — it's corruption.",
    "You can cleanse the moonwells with Cenarion plant salves. It helps, but the corruption runs so deep.",
    "At least the Timbermaw furbolgs are trying to maintain their sanity. Unlike everything ELSE in Felwood.",
    "I feel sick just being here. The air tastes wrong. The colors are wrong. Everything's wrong.",
})

-- Winterspring ---------------------------------------------------------------
Z("Winterspring", {
    "Winterspring. Permanent winter, frostsabers, and Everlook — a goblin town in a BLIZZARD.",
    "Everlook is the goblin hub up here. They'll do business in ANY weather. Any terrain. Anywhere.",
    "The frostsabers here are legendary. Some hunters spend MONTHS earning a Winterspring Frostsaber mount.",
    "Mazthoril has blue dragonkin. The Blue Dragonflight has a presence in the caves up north.",
}, {
    "The Winterspring Trainers spend weeks helping you bond with a frostsaber cub. WEEKS. Worth it.",
    "Darkwhisper Gorge is in the south — demon territory. Because Winterspring needed SOMETHING corrupted.",
    "Ice Thistle Yetis roam the eastern hills. They're enormous and surprisingly fast for their size.",
    "Starfall Village has night elf refugees. Living in perpetual winter because the alternatives are worse.",
    "The Hot Springs actually exist. Warm water in a frozen zone. The nearest thing to a bath for miles.",
    "Owl beasts patrol the forest. Moonkin. They look goofy. They hit like trucks.",
}, {
    "Winterspring is cold. I know that's obvious, but I need to say it. It's SO cold.",
    "The goblins in Everlook have heated buildings. Everyone else just... suffers.",
    "If I ever earn that frostsaber mount, I'm riding it EVERYWHERE. Even indoors.",
    "At least Winterspring's problems are mostly weather-based. After the Plaguelands, I'll take snow over plague.",
})

-- Moonglade ------------------------------------------------------------------
Z("Moonglade", {
    "Moonglade. The druids' sanctuary. Where nature is actually peaceful for ONCE.",
    "This is where druids gather, train, and commune with nature. It's practically sacred.",
    "Nighthaven is the main settlement. Keepers of the Grove walk around openly here.",
    "Lake Elune'ara is said to be blessed by Elune herself. It's serene.",
}, {
    "Keeper Remulos, son of Cenarius, resides here. A DEMIGOD just hanging out in his grove.",
    "The Lunar Festival brings visitors from across Azeroth. Everyone loves the fireworks.",
    "Moonglade is one of the few places where Horde and Alliance druids meet peacefully.",
    "Omen, the beast of Moonglade, awakens during the Lunar Festival. An enraged demigod. Festive.",
    "The Barrow Dens here are where druids hibernate in the Emerald Dream. For YEARS.",
    "This is genuinely the most peaceful zone in the entire game. Enjoy it while it lasts.",
}, {
    "I could stay in Moonglade forever. It's the only zone that doesn't want to kill me.",
    "The druids have the right idea. Protect one perfect place and defend it from everything.",
    "Moonglade during the Lunar Festival is magical. Literally. Fireworks powered by moonlight.",
    "We should come back here after the Plaguelands. For therapy.",
})

-- Azuremyst Isle -------------------------------------------------------------
Z("Azuremyst Isle", {
    "Azuremyst Isle. Where the draenei crash-landed the Exodar and started rebuilding from scratch.",
    "The Exodar crashed into this island. A SPACESHIP. Crashed. Into an island. The draenei call it home now.",
    "Ammen Vale is where the draenei start their journey. Surrounded by wreckage and broken crystals.",
    "The owlkin here are native to the island. They're curious about the new neighbors.",
}, {
    "The crash scattered exodar crystals across the whole island. They still pulse with energy.",
    "Azure Watch is the first real settlement outside the crash site. Draenei improvising a town.",
    "The blood elves have saboteurs on the island. They followed the draenei through space to finish the job.",
    "Stillpine furbolgs are indigenous. They're friendly, unlike basically every other furbolg in the game.",
    "The moonkin on this island are adapted to the unique ecosystem. Pre-crash, this was untouched wilderness.",
    "Odesyus' Landing has shipwrecked humans. Even Alliance allies have bad luck near this island.",
}, {
    "The draenei traveled through SPACE and crashed on Azeroth. That's the most dramatic entrance possible.",
    "Azuremyst is beautiful in that 'alien crystals mixed with ancient forest' way.",
    "I respect the draenei. Crash-land on a new world, immediately start building. No complaining.",
    "Those exodar crystals are everywhere. I hope they're not radioactive. They LOOK radioactive.",
})

-- Bloodmyst Isle -------------------------------------------------------------
Z("Bloodmyst Isle", {
    "Bloodmyst Isle. The Exodar's crash mutated EVERYTHING here. The soil is red. The animals are wrong.",
    "The crash contaminated this entire island. Corrupted wildlife, red crystals, tainted water.",
    "The blood elves have a major base here — the Vector Coil. They're studying the crash debris for weapons.",
    "Blood Watch is the draenei outpost. They're cleaning up a mess that's literally changing the ecosystem.",
}, {
    "The corruption here is from the Exodar's dimensional engines leaking. Arcane radiation warped the land.",
    "Nazzivus has blood elf operatives summoning demons. On an already-corrupted island. Double evil.",
    "The Wrathscale naga are using the chaos to establish a foothold. Opportunistic as always.",
    "Vindicator's Rest has draenei paladins — the original ones. Ancient warriors of the Light.",
    "The wildlife mutations are getting worse the closer you get to the crash site. Nature is fighting back.",
    "The red crystals pulse with corrupted energy. Touch one and find out. Actually, don't.",
}, {
    "Bloodmyst is what happens when you crash a dimensional spaceship into a pristine island.",
    "The draenei are trying to fix it. Slowly. It took the crash one day to corrupt the island and will take years to heal.",
    "Between the blood elf saboteurs and the naga, Bloodmyst has problems from every direction.",
    "This island is a cautionary tale about dimensional engineering. And bad landings.",
})

-- The Hinterlands -----------------------------------------------------------
Z("The Hinterlands", {
    "The Hinterlands. Where the Wildhammer dwarves ride gryphons and the trolls won't give up.",
    "Aerie Peak is the Wildhammer capital. Dwarves who ride GRYPHONS. The coolest dwarves.",
    "The Revantusk trolls hold the coast. Forest trolls allied with the Horde. They've got a village.",
    "Jintha'Alor is the Vilebranch troll fortress on the hill. It's enormous and full of angry trolls.",
}, {
    "Wildhammer dwarves don't like caves. They prefer open sky and gryphon riding. Respect.",
    "The Altar of Zul has dark magic flowing through it. The trolls are always sacrificing SOMETHING.",
    "Skulk Rock has undead. In the Hinterlands. Because apparently no zone escapes the undead.",
    "The Agol'watha ogres are in the northeast. Even the Hinterlands has ogres. They're everywhere.",
    "Shadra'Alor is a spider-infested troll ruin. Named after Shadra, the spider loa. Charming.",
    "The gryphon roost at Aerie Peak is incredible. Dozens of gryphons nesting on the mountain.",
}, {
    "The Hinterlands have the best dwarves in the game. Sorry, Ironforge. Gryphon riders win.",
    "Jintha'Alor is a whole troll city up on the hill. Getting to the top is a quest in itself.",
    "At least the Wildhammer dwarves are having fun. Gryphon surfing through the mountains.",
    "Trolls, dwarves, ogres, and undead. The Hinterlands have a full party of problems.",
})

---------------------------------------------------------------------------
--  OUTLAND
---------------------------------------------------------------------------

-- Hellfire Peninsula ---------------------------------------------------------
Z("Hellfire Peninsula", {
    "Hellfire Peninsula. Welcome to Outland! Here's a FEL REAVER the size of a building. Good luck!",
    "That Fel Reaver patrols the road and one-shots you. You WILL learn to look behind you.",
    "Honor Hold is the Alliance base. Heroes who've been stranded here since the Second War.",
    "Thrallmar is the Horde's answer. New arrivals reinforcing the sons of Grom Hellscream.",
}, {
    "The Fel Reaver is terrifying because it's SILENT until it's on top of you. A giant metal death machine. Quiet.",
    "The Hellfire Citadel is in the center. The Legion's fortress. Three dungeons and a raid inside.",
    "Expedition Point was abandoned when the demons overran it. Now we're taking it back.",
    "The Path of Glory is paved with BONES. Draenei bones. The Horde marched to the Dark Portal over them.",
    "Doom Lord Kazzak camps in the northeast. He periodically comes out and ruins everyone's day.",
    "The battered Stormwind and Orgrimmar forces were stuck here for YEARS. The Dark Portal was closed behind them.",
}, {
    "My first Fel Reaver kill was the most satisfying moment of my career. Before that, it was just running.",
    "Hellfire is red. Everything is red. The ground, the sky, the rocks. Red.",
    "At least the Dark Portal works both ways now. The original expedition wasn't so lucky.",
    "Welcome to Outland. It only gets weirder from here.",
})

ZT("Hellfire Peninsula", "WARRIOR", {
    "A Warrior in Hellfire. {name}, this zone was MADE for people who like hitting large things.",
    "Hey {name}, the Fel Reaver is that way. Wanna go introduce yourself? No? Smart.",
    "Hellfire has no subtlety, {name}. Just big enemies and bigger explosions. Your kind of place.",
}, {
    "I've been wanting to charge that Fel Reaver since we got here. One day. One day...",
    "The Bonechewer orcs here fight hard. But I fight harder.",
    "This zone respects strength. I can work with that.",
    "Honor Hold's soldiers have been fighting here for twenty years. TWENTY. Now THAT'S endurance.",
}, {
    "Hellfire is a warrior's proving ground. If you can survive here, you can survive anything.",
    "Except the Fel Reaver. Nobody survives that thing at this level.",
})

-- Zangarmarsh ----------------------------------------------------------------
Z("Zangarmarsh", {
    "Zangarmarsh. Giant mushrooms, fungal giants, and the naga draining all the water.",
    "The mushrooms here are the size of BUILDINGS. It's a whole ecosystem built on fungus.",
    "Sporeggar is a village of fungal creatures. Sporelings. They're ADORABLE and terrified.",
    "The naga are draining the marsh through Coilfang Reservoir. Lady Vashj's operation.",
}, {
    "Cenarion Refuge is the druid outpost. They're trying to save the marsh from the naga's draining.",
    "Telredor is the Alliance town. Built on a giant mushroom. Because why not.",
    "Zabra'jin is the Horde base. Also built near giant mushrooms. Zangarmarsh commits to a theme.",
    "Lady Vashj is pumping the water out of the marsh for Serpentshrine Cavern. She's flooding her own lair.",
    "The Spawning Glen has those fungal giants. Massive mushroom creatures that stomp around.",
    "The Dead Mire shows what happens when the naga succeed. The marsh dies. No water, no life.",
}, {
    "Zangarmarsh is proof that Outland can be beautiful. In a weird, mushroomy way.",
    "I'd live in Sporeggar. Those little sporelings are the best neighbors in Outland.",
    "The naga are actively destroying this zone. We should probably stop them.",
    "Giant mushrooms. I've accepted that this is my life now.",
})

-- Terokkar Forest ------------------------------------------------------------
Z("Terokkar Forest", {
    "Terokkar Forest. Home of Shattrath City, the Bone Wastes, and the arakkoa.",
    "The Bone Wastes were once Auchindoun — a massive draenei mausoleum. Then it EXPLODED.",
    "Arakkoa are bird people who practice shadow magic. They're as hostile as they look.",
    "Shattrath City is in the north. The neutral capital where Aldor and Scryers pretend to coexist.",
}, {
    "Auchindoun's explosion created the Bone Wastes. Four dungeons are carved into what's left.",
    "The Shadow Tomb has arakkoa summoning dark powers. Bird people and shadow magic. Lovely combination.",
    "Firewing Point has blood elves siphoning mana from... everything. Typical blood elf behavior.",
    "The Barrier Hills to the west have ogres. Outland ogres. They're BIGGER than Azeroth ogres.",
    "Stonebreaker Hold is the Horde outpost. Right at the edge of the Bone Wastes. Great location.",
    "Allerian Stronghold is the Alliance base. Named after Alleria Windrunner. She's been missing for years.",
}, {
    "Terokkar has the most dramatic landmark — a city-sized crater where a mausoleum used to be.",
    "The arakkoa are fascinating. And evil. Fascinating evil bird wizards.",
    "Shattrath is technically neutral, but the Aldor and Scryers hate each other more than any faction war.",
    "Between the bone wastes, the arakkoa, and the mana-addicted blood elves, Terokkar has something for everyone.",
})

-- Nagrand -------------------------------------------------------------------
Z("Nagrand", {
    "Nagrand. The most beautiful zone in Outland. Green grass, floating islands, and Nesingwary. AGAIN.",
    "Nesingwary moved to OUTLAND specifically to hunt the animals here. The man is relentless.",
    "The floating islands in the sky defy physics. Nobody questions it. It's Outland.",
    "Garadar is the Mag'har orc village. Brown orcs who never drank demon blood. Thrall's ancestors.",
}, {
    "Halaa is a PvP hub in the center. Whoever holds it gets special rewards. It changes hands constantly.",
    "Oshu'gun is a massive crystal mountain. It's actually a crashed naaru vessel. A NAARU SPACESHIP.",
    "The Consortium ethereals are here trading. They see profit opportunities in literally everything.",
    "Telaar is the Alliance outpost. Draenei trying to reclaim their ancient lands.",
    "The clefthoof herds roam the plains like enormous woolly rhinos. Nagrand is basically prehistoric paradise.",
    "Sunspring Lake has water elementals gone berserk. Even in paradise, something has to go wrong.",
}, {
    "If Outland terrifies you, come to Nagrand. It's the vacation zone. With hunting quests.",
    "Nesingwary's kill quests in Nagrand are EXACTLY the same as Stranglethorn. Kill 30 of each. Again.",
    "Those floating islands would be perfect to live on. If you could get up there. And didn't fall off.",
    "The Mag'har orcs are proof that orcs can be noble. Without the demon blood, they're just... people.",
})

-- Blade's Edge Mountains -----------------------------------------------------
Z("Blade's Edge Mountains", {
    "Blade's Edge Mountains. Where every rock formation is sharp enough to cut you and gronn roam wild.",
    "The rock spires here are literally blade-shaped. The zone name is not poetic. It's LITERAL.",
    "Ogri'la is a settlement of ENLIGHTENED ogres. Ogres who became smart. Through crystals.",
    "Gruul the Dragonkiller lives in these mountains. A gronn — like an ogre but bigger. MUCH bigger.",
}, {
    "Sylvanaar is the Alliance base. Blood elves and night elves reluctantly sharing an outpost.",
    "Thunderlord Stronghold is Horde. Named after the Thunderlord orc clan. They're all dead now.",
    "The Bash'ir Landing has ethereal smugglers. Dealing in mana crystals and interdimensional contraband.",
    "Forge Camp: Terror is aptly named. The Burning Legion has a forge camp here. On spikes.",
    "The Raven's Wood is full of corrupted arakkoa. Different arakkoa from Terokkar but equally hostile.",
    "Gruul's sons — the seven gronn — are scattered across the zone. Each one is a mini-boss.",
}, {
    "Blade's Edge is the most geographically hostile zone in Outland. The TERRAIN wants to kill you.",
    "Ogri'la ogres are smarter than most humans I've met. Those apexis crystals are powerful stuff.",
    "Avoid the gronn unless you've got a full group. Those things punt players like footballs.",
    "The blades of stone here aren't ruins — they're just how the mountains GREW. Outland is wild.",
})

-- Netherstorm ----------------------------------------------------------------
Z("Netherstorm", {
    "Netherstorm. The zone that's literally FALLING APART into the Twisting Nether. No big deal.",
    "The eco-domes are all that keeps areas alive. Biodomes in a dying zone. Ethereal engineering.",
    "Tempest Keep floats in the distance. Kael'thas Sunstrider's fortress. A naaru spaceship he hijacked.",
    "Area 52 is the goblin hub. Goblins built a town in a crumbling void-zone. Peak goblin energy.",
}, {
    "The Ethereum are corrupted ethereals. They want to become void lords. Ambitious and terrifying.",
    "Kirin'Var Village has ghosts of Kirin Tor mages. They died when Kael'thas attacked. Still haunting.",
    "Manaforge B'naar drains mana from the land. That's why the zone is DYING. Blood elf greed.",
    "The Stormspire is a massive ethereal trading post. Like a floating mall in the void.",
    "Socrethar's Seat has a corrupted draenei eredar lord. An old ally turned absolute villain.",
    "Eco-Dome Midrealm has dinosaurs. DINOSAURS. In Netherstorm. The ethereals preserved them.",
}, {
    "Netherstorm should not exist. The ground is literally vanishing into the void.",
    "Area 52 goblins don't care that reality is dissolving around them. Business must go on.",
    "Kael'thas took the naaru ship and turned it into a raid. That's some villain ambition.",
    "The fact that anyone LIVES here permanently is a testament to stubbornness over sanity.",
})

-- Shadowmoon Valley ----------------------------------------------------------
Z("Shadowmoon Valley", {
    "Shadowmoon Valley. Illidan's territory. Black Temple is RIGHT THERE. On the cliff. Staring at us.",
    "The Hand of Gul'dan is that massive volcanic structure. Gul'dan's magic literally scarred the earth.",
    "Wildhammer Stronghold and Shadowmoon Village are holding out against Illidan's forces. Barely.",
    "The fel corruption here is the worst in Outland. Green fire, warped land, demon patrols everywhere.",
}, {
    "Black Temple was formerly the Temple of Karabor — the holiest draenei site. Illidan claimed it.",
    "The Netherwing Ledge has captive Netherwing dragons. Enslaved by Dragonmaw orcs for Illidan.",
    "The Altar of Shadows is where warlocks commune with demonic forces. Casually.",
    "Wildhammer Stronghold has some of the toughest troops in Outland. They chose THIS valley. On purpose.",
    "Netherwing drake eggs are on the floating island. If you earn their trust, you get a dragon mount.",
    "The Legion Gateway in the west actively summons demons. A permanent portal to the Burning Legion.",
}, {
    "Shadowmoon Valley is end-game Outland. Everything here can and WILL kill you.",
    "Black Temple on the cliff is the most intimidating raid entrance I've ever seen.",
    "Illidan is in there. The Betrayer. And we're going to knock on his door.",
    "This valley was once beautiful. Draenei records describe it as paradise. Gul'dan ruined it.",
})

ZT("Shadowmoon Valley", "WARLOCK", {
    "A Warlock in Shadowmoon Valley. {name}, this zone is basically your office.",
    "Hey {name}, try not to enjoy the fel corruption TOO much. We're here to fight it.",
    "{name}, I can feel the demonic energy here. You probably feel at home. That's concerning.",
}, {
    "The fel magic here is... potent. I'm not going to pretend I don't feel its pull.",
    "The Altar of Shadows has power I've only read about. I can use it. Carefully.",
    "Other warlocks came here and went mad. I'm smarter than them. Probably.",
    "Illidan uses fel magic too. The difference is I know when to stop. Hopefully.",
}, {
    "This zone tests every warlock. The temptation is real. The power is RIGHT there.",
    "I'll master this place's energy. Not the other way around. That's the plan.",
})

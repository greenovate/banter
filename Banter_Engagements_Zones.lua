local _, ns = ...

local T = ns.engagements.T
local U = ns.engagements.U

--=========================================================================
--  ZONE-AWARE TOPICS: DUNGEON  (context = "dungeon")
--  Fires only inside 5-man instances
--=========================================================================

U({
    "Hey {name}, who do you think DESIGNED this place? Like, architecturally.",
    "{name}, why do dungeons always have candles still lit? Who's MAINTAINING this?",
    "So {name}, does anyone else think it's weird there's food on these tables?",
    "{name}, real talk — the ventilation in here is CRIMINAL.",
}, {
    "Some evil architect with NO sense of exit placement. There's ONE door.",
    "A candle goblin. There's a candle goblin and I will not be taking questions.",
    "Do NOT eat the dungeon food. I made that mistake once. ONCE.",
    "Ventilation? We're underground. The air plan is 'hope for the best.'",
    "Whoever designed this put the boss room FURTHEST from the entrance. They knew what they were doing.",
    "The candles are magic. Everything we can't explain is magic. That's the rule.",
}, {
    "A CANDLE GOBLIN! That's now canon in my head!",
    "You ATE dungeon food?! {name}, WHY?!",
    "One door! ONE! It's almost like they WANT us to fight through!",
    "The air plan is 'hope.' Comforting!",
}, "dungeon")

U({
    "Hey {name}, quick thought — does the loot just APPEAR in the boss's pockets or...?",
    "{name}, do bosses just stand in their rooms ALL DAY waiting for us?",
    "So {name}, how do these mobs REPRODUCE? There's always more next week.",
    "{name}, real question — do the trash mobs know they're trash mobs?",
}, {
    "The loot materializes. From where? Don't ask. It's a loot miracle.",
    "Bosses have a schedule. Monday: menacing. Tuesday: also menacing. Very busy.",
    "They respawn. It's like a really depressing job. Show up, get killed, show up again.",
    "Trash mobs know their role. Some of them have ACCEPTED it. Others are clearly bitter.",
    "I think the loot is always there. The boss is basically a violent piñata.",
    "There's a mob union. They negotiate respawn timers. I heard it from a ghoul.",
}, {
    "A violent PIÑATA?! I will never unsee that!",
    "A MOB UNION?! They negotiate RESPAWN TIMERS?!",
    "Bosses have a MENACING schedule?! That's their whole CAREER?!",
    "Some trash mobs are BITTER about being trash?! I feel BAD now!",
}, "dungeon")

U({
    "Hey {name}, what's the earliest you've ever wanted to leave a dungeon?",
    "{name}, be honest — are you watching your health bar or are you just vibing?",
    "So {name}, if this dungeon had a Yelp review, how many stars?",
    "{name}, is it just me or do the walls feel like they're getting closer?",
}, {
    "I wanted to leave during the loading screen. Then I saw the group comp.",
    "I watch my health bar like a hawk. A very anxious hawk.",
    "Two stars. Decent atmosphere, terrible service, the locals tried to kill us.",
    "Walls getting closer? That's claustrophobia. Very normal. Very dungeon.",
    "Yelp review: 'Would not recommend. Visited once, died three times. No parking.'",
    "Vibing. I'm absolutely vibing. My health bar is someone else's problem.",
}, {
    "Wanted to leave during the LOADING SCREEN! That's a new record!",
    "'No parking' in the Yelp review! ACCURATE though!",
    "Your health bar is SOMEONE ELSE'S problem?! The healer HEARD that!",
    "Two stars?! That's GENEROUS for a place that tries to KILL us!",
}, "dungeon")

U({
    "Hey {name}, does anyone else hear that or is the dungeon just... settling?",
    "{name}, the acoustics in here are INCREDIBLE. Every scream echoes perfectly.",
    "So {name}, ever think about how deep underground we actually are right now?",
    "{name}, this dungeon smells like ambition and regret. Mostly regret.",
}, {
    "I hear things in every dungeon. I've learned to IGNORE them. Mostly.",
    "The acoustics are great for screaming and terrible for whispering. Very on brand.",
    "How deep are we? Deep enough that my ears popped three corridors ago.",
    "Regret is the default dungeon smell. Mixed with torch smoke and bad decisions.",
    "That sound is either the boss or plumbing. Either way, we should move.",
    "Every dungeon has a hum. I think it's the earth itself judging us.",
}, {
    "Your ears POPPED?! We're THAT deep?!",
    "Boss or PLUMBING?! Both are terrifying options!",
    "The earth is JUDGING us?! For WHAT?! We're here to HELP!",
    "Regret and torch smoke. The official dungeon scent.",
}, "dungeon")

--=========================================================================
--  ZONE-AWARE TOPICS: WORLD  (context = "world")
--  Fires only in the open world (not instances or cities)
--=========================================================================

U({
    "Hey {name}, this is nice. Just... out in the open. Fresh air. Nothing trying to kill us.",
    "{name}, when was the last time we just WALKED somewhere? No rushing?",
    "So {name}, do you ever stop and actually LOOK at the scenery out here?",
    "{name}, I swear the sky looks different in every zone. Or maybe that's me.",
}, {
    "Fresh air! No ceiling! I can see the SKY! I forgot what the sky looked like!",
    "We never walk. We SPRINT everywhere like our lives depend on it. Which they do.",
    "I looked at a sunset once. A wolf attacked me. Nature is complicated.",
    "The sky IS different. Something about the light. This zone has CHARACTER.",
    "Walking? Walking is what happens between mobs. It's not a choice, it's a gap.",
    "I appreciate scenery from a distance. Up close, scenery has teeth.",
}, {
    "You FORGOT what the sky looked like?! How long were you in dungeons?!",
    "A wolf attacked you DURING a sunset?! Worst timing ever!",
    "Scenery has TEETH?! That's the most adventurer thing you've ever said!",
    "Sprinting everywhere like our lives depend on it! ACCURATE though!",
}, "world")

U({
    "Hey {name}, do mobs out here have TERRITORIES or do they just wander?",
    "{name}, real question — does this zone feel bigger to you than it should?",
    "So {name}, how many times have you accidentally aggroed something while eating?",
    "{name}, I swear that mob was further away two seconds ago.",
}, {
    "Territories. That bear has been patrolling the same ten feet since I got here.",
    "Every zone is exactly too big for comfort and too small for safety.",
    "Aggroed while eating? Every time. EVERY time. Food attracts violence.",
    "Mobs are drawn to confidence. If you look like you're having a good time, they ATTACK.",
    "That mob IS closer. They can smell quest objectives. It's a sixth sense.",
    "The zone is exactly as big as your patience. And mine is shrinking.",
}, {
    "Ten feet! That bear's patrol is TEN FEET! What a life!",
    "Mobs can smell QUEST OBJECTIVES?! That explains EVERYTHING!",
    "Food attracts VIOLENCE?! Is that why we keep getting jumped?!",
    "Your patience is SHRINKING and so is the zone! Poetic!",
}, "world")

U({
    "Hey {name}, have you noticed how the quest givers never go get stuff THEMSELVES?",
    "{name}, 'kill 10 of those.' Why is it always 10? Who decided 10?",
    "So {name}, do you think these mobs know they're part of someone's quest?",
    "{name}, another collect quest. I can feel my soul leaving my body.",
}, {
    "Quest givers have BAD backs apparently. Every single one. Can't leave the house.",
    "It's always 10. Or 15. Or 'as many as you can.' Which means 10. It's ALWAYS 10.",
    "The mobs know. That's why the drop rate is SO low. They're HIDING the quest items.",
    "Collect quests are a test of character. I have failed that test. Repeatedly.",
    "Quest givers send US because they're smart. Why go yourself when heroes exist?",
    "The number 10 was chosen by someone who has never had to kill 10 of anything.",
}, {
    "Bad backs! EVERY quest giver has a bad back! I buy it!",
    "Mobs HIDING the quest items! The conspiracy is REAL!",
    "The person who chose 10 never killed 10 of ANYTHING! TRUTH!",
    "A test of character! You FAILED and yet here you are, collecting again!",
}, "world")

U({
    "Hey {name}, do you think the flight master judges us for going back and forth?",
    "{name}, honestly — being outdoors beats any dungeon. The loot's worse but the vibes are better.",
    "So {name}, do you have a favorite zone? Like, one you'd actually LIVE in?",
    "{name}, running through {zone} and it just hits different at this time of day.",
}, {
    "The flight master judges EVERYONE. Those eyes have seen things. And routes.",
    "Outdoor vibes are superior. No ceiling dropping on us. No boss music. Just birds.",
    "Live in a zone? Elwynn Forest. Nice trees, safe roads, one wolf every fifty feet. Charming.",
    "This zone hits different because I'm not being CHASED for once. Rare feeling.",
    "Flight masters know more gossip than anyone. They see EVERYONE coming and going.",
    "I'd live in Mulgore. Quiet. Flat. The cows mind their own business.",
}, {
    "One wolf every fifty feet! That's your idea of CHARMING?!",
    "Not being chased for once! That IS rare for us!",
    "Flight masters know ALL the gossip! They're the real information brokers!",
    "The cows mind their own business! Mulgore PR right there!",
}, "world")

--=========================================================================
--  ZONE-AWARE TOPICS: CITY  (context = "city")
--  Fires only in major cities
--=========================================================================

U({
    "Hey {name}, the auction house prices today are CRIMINAL. Who's buying this stuff?",
    "{name}, how long have you been standing in the city doing nothing? Be honest.",
    "So {name}, do you come to the city to be productive or just to people-watch?",
    "{name}, I love the city. No mobs. No quests. Just me and my poor financial decisions.",
}, {
    "Auction house prices? Someone listed linen cloth for THREE gold. LINEN. CLOTH.",
    "I've been standing here for... actually, I don't want to know. Don't tell me.",
    "I come to the city to organize my bags. Three hours later, my bags are the same.",
    "The city is where I make bad purchases and call it 'investing in my character.'",
    "People-watching in the city is peak gameplay. That guy has been jumping for ten minutes.",
    "No mobs, no quests, no responsibility. The city is my vacation.",
}, {
    "THREE gold for LINEN?! Who has that kind of money for LINEN?!",
    "Three hours and your bags are THE SAME?! What did you DO?!",
    "That guy HAS been jumping for ten minutes! Is he okay?!",
    "The city is your VACATION?! You go to a FAKE city for vacation?!",
}, "city")

U({
    "Hey {name}, do you think the bank NPCs judge what we store in there?",
    "{name}, I need to visit the trainer but I'm scared to see how much it costs.",
    "So {name}, mailbox or auction house first? This reveals your personality.",
    "{name}, every time I'm in town I forget what I came here for.",
}, {
    "Bank NPCs see EVERYTHING. My bank is chaos. They smile but their eyes say 'why.'",
    "Trainers charge like they're doing us a FAVOR. It's MY power. I'M learning to use MY power.",
    "Mailbox first. Always. What if there's gold? What if there's GOOD NEWS?",
    "I came to town for repairs. Thirty minutes later I own three new shirts.",
    "Auction house first. The mailbox can wait. Money FIRST, feelings later.",
    "The bank NPC has seen my inventory and has chosen not to comment. Professional.",
}, {
    "Eyes that say WHY! Bank NPCs are silently judging us ALL!",
    "You own three new SHIRTS?! You came for REPAIRS!",
    "Money first, feelings later! The auction house philosophy!",
    "The bank NPC chose NOT TO COMMENT! That's WORSE than judging!",
}, "city")

U({
    "Hey {name}, do you ever just stand on the bridge in town and think about life?",
    "{name}, the amount of people dueling outside the gates right now is concerning.",
    "So {name}, if you could add one thing to this city, what would it be?",
    "{name}, I've been window-shopping at the vendor for twenty minutes.",
}, {
    "I stand on the bridge and think about my life choices. Then I queue for a dungeon.",
    "Dueling culture is WILD. They're out there fighting for NOTHING. Just ego. I respect it.",
    "Add to the city? A bench. I want to SIT. My character has been standing for YEARS.",
    "Window-shopping at the vendor is valid. Sometimes you just need to know what's there.",
    "This city needs better lighting. It's all torches. ONE lantern would change everything.",
    "Twenty minutes at the vendor? You bought something. I can TELL.",
}, {
    "Your character has been STANDING for years! Give them a BENCH!",
    "Fighting for nothing but EGO! Dueling in a nutshell!",
    "ONE lantern! You have strong opinions about city infrastructure!",
    "You CAN tell?! Is it that obvious?! ...it was a cloak.",
}, "city")

--=========================================================================
--  ZONE-AWARE TOPICS: DESERT  (context = "desert")
--  Tanaris, Silithus, Badlands, Thousand Needles, Desolace, etc.
--=========================================================================

U({
    "Hey {name}, sand. Sand EVERYWHERE. I'm finding it in places sand shouldn't be.",
    "{name}, whose idea was it to quest in the desert? Because I have WORDS for them.",
    "So {name}, how is everything here either scorching hot or trying to eat us?",
    "{name}, I would trade everything in my bags for a glass of cold water right now.",
}, {
    "Sand in my boots, sand in my hair, sand in my SOUL. This zone is a punishment.",
    "The desert was MY idea. I'm starting to question all my life choices, actually.",
    "The desert has two moods: burn and bite. There is no third option.",
    "Water? We have mage water. It's wet but it feels... judgy. Desert mage water.",
    "This is what happens when the map says 'contested territory.' It means nobody WANTS it.",
    "The heat isn't the problem. It's the BUGS. Everything here has pincers.",
}, {
    "Sand in your SOUL?! The desert broke you already!",
    "Desert mage water tastes JUDGY?! You're dehydrated AND paranoid!",
    "Nobody WANTS this territory?! Then why are WE here?!",
    "Everything has PINCERS! Desert wildlife is just ANGRY!",
}, "desert")

U({
    "Hey {name}, do you think anything GREEN has ever existed in this zone?",
    "{name}, I swear I saw a mirage. Or it was a mob. Hard to tell in this heat.",
    "So {name}, the locals here — scorpions, vultures, sand elementals. Charming neighbors.",
    "{name}, we've been walking for ten minutes and the scenery hasn't changed.",
}, {
    "Green? I saw a cactus once. It was hostile. Even the PLANTS are angry here.",
    "That was a mob. Mirages don't chase you. Usually.",
    "Scorpions are the friendliest thing here. And they want to KILL us. So.",
    "The scenery: sand, sand, rock, sand, skeleton, more sand. Very varied.",
    "If you see green in this desert, it's either poisonous or a druid having a breakdown.",
    "Ten minutes? It's been ten minutes? Feels like ten YEARS in this heat.",
}, {
    "Even the PLANTS are angry?! Desert ecology is BRUTAL!",
    "'Mirages don't chase you. Usually.' USUALLY?!",
    "A druid having a BREAKDOWN?! Is that how oases form?!",
    "Sand, sand, rock, sand, skeleton. Tourism BOARD material!",
}, "desert")

--=========================================================================
--  ZONE-AWARE TOPICS: FOREST  (context = "forest")
--  Ashenvale, Elwynn, Feralas, Hinterlands, Stranglethorn, etc.
--=========================================================================

U({
    "Hey {name}, has anyone else noticed we've been walking through trees for an HOUR?",
    "{name}, the forest is nice until you realize everything is hiding behind a tree.",
    "So {name}, do you think the trees are watching us? Because I feel watched.",
    "{name}, I keep hearing rustling. It's either wind or our death. 50/50.",
}, {
    "An hour of trees. More trees. Tree with a slightly different leaf. Variety.",
    "EVERYTHING hides behind trees here. Mobs, quest objectives, my will to continue.",
    "Trees watching us? Of course. There are druids here. They ARE the trees.",
    "The rustling is probably just a bird. A very large, aggressive, angry bird.",
    "The forest is beautiful, peaceful, and full of things that want us dead. Classic nature.",
    "I'm not lost. The path just... moved. Forests do that. It's fine.",
}, {
    "Druids ARE the trees?! I'm never leaning on a tree again!",
    "Your WILL TO CONTINUE is hiding behind a tree?! Go find it!",
    "The path MOVED?! Forests don't DO that, {name}!",
    "A very large angry bird. Great. Wonderful. Nature is HEALING.",
}, "forest")

U({
    "Hey {name}, the light coming through these trees is actually kind of beautiful.",
    "{name}, every time I'm in a forest zone I get the urge to be a druid.",
    "So {name}, you ever just LISTEN in a forest? The birds, the wind, the—screaming?",
    "{name}, forests feel ancient. Like this zone remembers things WE'VE forgotten.",
}, {
    "The light IS beautiful. Right up until a spider drops from the canopy. Then less beautiful.",
    "The druid urge in forests is REAL. Then you remember the shapeshifting homework.",
    "I listened once. Heard birds. Then an owl. Then a growl. I stopped listening.",
    "This zone remembers everything. That's why the mobs come back. MEMORY MOBS.",
    "Ancient forests have ancient creatures. Ancient creatures have ancient grudges.",
    "Shapeshifting homework sounds fake but druids study for YEARS. The bear exam alone.",
}, {
    "A spider dropped from the CANOPY?! Right during the pretty moment?!",
    "MEMORY MOBS?! That's terrifying AND poetic!",
    "Ancient grudges! The forest holds a THOUSAND-year grudge!",
    "The BEAR EXAM?! There's a bear EXAM?! What's on it?!",
}, "forest")

--=========================================================================
--  ZONE-AWARE TOPICS: SNOW  (context = "snow")
--  Winterspring, Dun Morogh, Alterac Mountains, etc.
--=========================================================================

U({
    "Hey {name}, I can't feel my toes. Can you feel YOUR toes?",
    "{name}, WHO chose the snow zone? I want a name. And an explanation.",
    "So {name}, does armor come with insulation or are we all just... freezing?",
    "{name}, everything is white. The ground, the sky, my future if frostbite gets me.",
}, {
    "Toes? I stopped monitoring my toes two zones ago. They're on their own.",
    "I chose the snow zone. I thought it would be 'refreshing.' I was WRONG.",
    "Armor insulation? Ha. I'm wearing metal in a blizzard. Every step is a regret.",
    "My future is white because of snow, not optimism. Just to be clear.",
    "The cold builds character. I have PLENTY of character. I want WARMTH.",
    "I think the snow mobs move slower because they're ALSO cold. We're ALL suffering.",
}, {
    "Your toes are ON THEIR OWN?! You ABANDONED your toes!",
    "'Refreshing.' You thought SNOW would be REFRESHING. Incredible.",
    "Metal armor in a BLIZZARD! Every step a REGRET!",
    "Snow mobs are ALSO cold?! Shared suffering with the ENEMY!",
}, "snow")

U({
    "Hey {name}, if a frost mage lives here, do they even notice the cold?",
    "{name}, I just slipped on ice. Don't tell anyone. My dignity is all I have.",
    "So {name}, snow zones are beautiful from a distance. Up close, it's just wet and angry.",
    "{name}, at what point do we admit this zone is actively trying to freeze us to death?",
}, {
    "Frost mages? This is their spa. Regular temperature for THEM. Monsters.",
    "I saw you slip. I will take it to my grave. ...which might be soon if we don't find a fire.",
    "We could NOT tell anyone. Or I could tell EVERYONE. Decisions, decisions.",
    "Snow zones are postcard beautiful. Living here? SURVIVAL beautiful.",
    "This zone crossed from 'chilly' to 'hostile' about fifteen minutes ago.",
    "Frost mages sunbathe in Winterspring. Let that sink in. They SUNBATHE in SNOW.",
}, {
    "Take it to your GRAVE?! Which might be SOON?! That's DARK!",
    "Frost mages SUNBATHE in snow?! That's the most cursed fun fact!",
    "The zone crossed from chilly to HOSTILE! It got a PROMOTION!",
    "Postcard beautiful vs SURVIVAL beautiful! That's the snow zone brand!",
}, "snow")

--=========================================================================
--  ZONE-AWARE TOPICS: COASTAL  (context = "coastal")
--  Stranglethorn coast, Dustwallow, Azshara, Tanaris beach, etc.
--=========================================================================

U({
    "Hey {name}, smell that? That's the ocean. And probably something that died in it.",
    "{name}, I can see the water from here. How long until someone suggests we swim?",
    "So {name}, coastal zones — nice views, sea breeze, murlocs every twelve feet.",
    "{name}, I'd enjoy the beach if it wasn't for the things living ON the beach.",
}, {
    "Ocean smell: 60% refreshing, 40% rotting fish. Classic coast.",
    "I am NOT swimming. Not in armor. The last person who tried is still down there.",
    "Murlocs. The true owners of every coastline. They were here first and they're LOUD about it.",
    "The beach is hostile real estate. Sand crabs, murlocs, naga. Nobody's relaxing.",
    "Swimming in armor — the last intelligent idea NOBODY should EVER have.",
    "I love coastal zones. The sound of waves, the sunset, the mrrgglglglgl of murlocs.",
}, {
    "'Still down there.' You mean they SANK?! In their ARMOR?!",
    "The mrrgglglglgl of murlocs! The AMBIENCE!",
    "Murlocs were here FIRST?! That's their LAND?! Are WE the invaders?!",
    "Hostile real estate! That's the coastal zones SLOGAN!",
}, "coastal")

U({
    "Hey {name}, does anyone else get the urge to just... fish? Right here?",
    "{name}, the waves are nice. Very calming. Perfect for forgetting we have quests to do.",
    "So {name}, if pirates exist, this is EXACTLY where they'd be. And I don't love that.",
    "{name}, I found a shell. It's just a shell. But I'm keeping it.",
}, {
    "Fish? Here? I'd love to. But the fish here probably have TEETH.",
    "The waves are hypnotic. I've been watching them for five minutes. Zero quests completed.",
    "Pirates are ALWAYS in coastal zones. It's a rule. Salt water attracts piracy.",
    "Keep the shell. Every adventurer needs a memento that ISN'T a weapon.",
    "Fishing is the most peaceful activity in a world at war. And the fish don't judge.",
    "If we stop and fish, we'll be here for hours. I know us. We have no discipline.",
}, {
    "Fish with TEETH?! You don't know that! ...but you're probably right!",
    "Zero quests completed! Five minutes of waves! WORTH IT!",
    "Salt water attracts PIRACY! Is that SCIENCE?!",
    "We have NO discipline! True! Start fishing, we'll quest LATER!",
}, "coastal")

--=========================================================================
--  ZONE-AWARE TOPICS: HAUNTED  (context = "haunted")
--  Plaguelands, Duskwood, Tirisfal Glades, Ghostlands, etc.
--=========================================================================

U({
    "Hey {name}, is it just me or did that shadow MOVE?",
    "{name}, this zone gives me the creeps and I don't creep easily.",
    "So {name}, everything here is dead, undead, or about to be dead. Fun category.",
    "{name}, the sky hasn't been a normal color since we entered this zone.",
}, {
    "That shadow moved. I'm NOT crazy. Shadows shouldn't have agendas.",
    "This zone was creepy BEFORE we got here. Our presence just adds more victims.",
    "Dead, undead, or dying. The full spectrum. Very inclusive in the worst way.",
    "The sky is green. Or grey. Or... brown? None of those are good sky colors.",
    "Shadows with agendas. That's this zone's BRAND. And it's WORKING.",
    "The color thing is the plague. The plague ruined colors. Among other things.",
}, {
    "Shadows shouldn't have AGENDAS! Why does this zone have SENTIENT shadows?!",
    "More victims! WE'RE the addition to the victim list?! Comforting!",
    "The plague ruined COLORS! That's the saddest plague fact!",
    "None of those are good sky colors! SKY SHOULD BE BLUE!",
}, "haunted")

U({
    "Hey {name}, how many undead do you think we've seen today? Rough estimate.",
    "{name}, I feel like the ground is... squishy. Is the ground SUPPOSED to be squishy?",
    "So {name}, this place used to be beautiful. Now it's just a horror story with quests.",
    "{name}, every building here is abandoned. And yet somehow NOT empty. Love that.",
}, {
    "Rough estimate? Too many. The number is 'too many.' That's the exact count.",
    "Squishy ground is plague-related. Don't ask. Don't look down. Just keep walking.",
    "This was farmland once. Farms. Cows. Normal sky. Now it's ghouls and green fog.",
    "Abandoned but not empty. That's the haunted zone guarantee. Something's ALWAYS home.",
    "The horror story has quest rewards though, so we keep reading. Classic us.",
    "I've seen more undead than living things today. The ratio is CONCERNING.",
}, {
    "Don't look DOWN?! What's IN the ground?! WHAT'S DOWN THERE?!",
    "Ghouls and green fog! The OPPOSITE of farms and cows!",
    "Something's ALWAYS home! The worst real estate disclosure EVER!",
    "The horror story has rewards! We're doing it for LOOT! Priorities!",
}, "haunted")

--=========================================================================
--  ZONE-AWARE TOPICS: SWAMP  (context = "swamp")
--  Swamp of Sorrows, Dustwallow Marsh, Zangarmarsh, Wetlands, etc.
--=========================================================================

U({
    "Hey {name}, why does this zone smell like that? Serious question. WHY.",
    "{name}, I've been ankle-deep in water for ten minutes. This isn't a zone, it's a puddle.",
    "So {name}, swamps — the zone type nobody REQUESTS but everyone ends up in.",
    "{name}, something just buzzed past my ear. It was the size of a fist.",
}, {
    "Swamp smell is decomposition. Organic matter breaking down. You're smelling NATURE.",
    "Ankle-deep? I'm KNEE-deep. At what point do we call this swimming?",
    "Nobody picks the swamp. The swamp picks YOU. Through quest breadcrumbs. Sneaky.",
    "Fist-sized bugs are normal here. NORMAL. This zone redefined 'normal.'",
    "I stepped on something soft. I don't know what it was. I'm choosing not to know.",
    "Swamps have character. The character is miserable. But it's CONSISTENT.",
}, {
    "You're smelling NATURE?! Nature needs to smell BETTER!",
    "The swamp PICKS you! Through breadcrumbs! Quest design is EVIL!",
    "Fist-sized bugs are NORMAL?! This zone has RUINED the word!",
    "You STEPPED on something soft and CHOSE NOT TO KNOW?! Survival instinct!",
}, "swamp")

U({
    "Hey {name}, do you think anything in this swamp is NOT hostile?",
    "{name}, the fog here is so thick I can barely see my own feet.",
    "So {name}, frogs, snakes, crocolisks — the swamp wildlife placement team went HARD.",
    "{name}, this mud is ruining my gear. Is there an armor cleaning service anywhere?",
}, {
    "Not hostile? The moss, maybe. The moss seems neutral. For now.",
    "Can't see your feet? Honestly, in this swamp, that might be a BLESSING.",
    "The crocolisks are the apex predator here. Everything else is just... appetizers.",
    "Armor cleaning? In a swamp? You're asking the swamp to UNDO itself.",
    "If the moss turns hostile, I'm leaving. That's my LINE. Hostile moss.",
    "My boots have been making sounds no boot should make. We need dry land. SOON.",
}, {
    "The moss is neutral FOR NOW?! You're monitoring the MOSS?!",
    "Asking the swamp to UNDO itself! That's the best description of 'cleaning in a swamp'!",
    "If the MOSS turns hostile! Hostile MOSS is where you draw the line!",
    "Your boots are making SOUNDS?! Sounds like WHAT?! No wait, don't tell me.",
}, "swamp")

--=========================================================================
--  ZONE-AWARE TOPICS: MOUNTAIN  (context = "mountain")
--  Searing Gorge, Burning Steppes, Redridge, Hillsbrad, Arathi, etc.
--=========================================================================

U({
    "Hey {name}, we've been going uphill for twenty minutes. When does the hill END?",
    "{name}, the view from up here is amazing. Would be better without the vertigo.",
    "So {name}, mountain zones — beautiful from below, exhausting from above.",
    "{name}, I think we passed a cliff. I refuse to look down to confirm.",
}, {
    "The hill ends when the mountain begins. And the mountain ends at a bigger mountain.",
    "Don't look down. Classic mountain advice. I looked down. Classic mountain mistake.",
    "Exhausting is generous. My calves have filed a formal complaint.",
    "That cliff is behind us now. Think of it as a one-way scenic route.",
    "Mountain zones reward the stubborn. I am very stubborn. And very out of breath.",
    "The view compensates for the climb. Barely. My legs disagree.",
}, {
    "Mountain begins AFTER the hill?! This is LAYERED suffering!",
    "You LOOKED DOWN?! Classic mistake! And you KNEW it was a mistake!",
    "Your calves filed a COMPLAINT?! In writing?!",
    "One-way scenic route! That's one way to describe a CLIFF!",
}, "mountain")

--=========================================================================
--  ZONE-AWARE TOPICS: UNDERGROUND  (context = "underground")
--  Silithus hives, Un'Goro caves, BRD region, deep cave subzones, etc.
--=========================================================================

U({
    "Hey {name}, anyone else notice there's no sky down here? Just ceiling. Lots of ceiling.",
    "{name}, this is so deep underground I bet the SURFACE forgot about us.",
    "So {name}, underground zones — who decided ADVENTURING should involve spelunking?",
    "{name}, I think my sense of direction died three tunnels ago.",
}, {
    "No sky, no sun, no warmth. Just rocks and the gentle sound of things trying to eat us.",
    "The surface forgot about us the moment we walked in. We're on our own down here.",
    "Spelunking is adventuring's weird cousin. Nobody invites it. It shows up anyway.",
    "Direction? There IS no direction underground. There's forward and wrong. Those are the options.",
    "I'm navigating by echo. And by 'navigating' I mean 'guessing loudly.'",
    "Underground rule: if you can see light, go toward it. Unless the light is fire. Then don't.",
}, {
    "Forward and WRONG! Those are the underground directions!",
    "Guessing LOUDLY?! Is that your navigation method?!",
    "Unless the light is FIRE! Sound advice for underground living!",
    "The surface FORGOT about us?! We're DEEP enough to be forgotten?!",
}, "underground")

--=========================================================================
--  CLASS-SPECIFIC + ZONE: Target topics leveraging environment
--=========================================================================

T("MAGE", {
    "{name}, you're a frost mage and we're out here sweating. Share the cold.",
    "Hey {name}, can you conjure something COLD? I'm dying in this heat.",
    "So {name}, all this sun and you could literally make an ice block. Where's mine?",
    "{name}, a frost mage in the desert. You're either suffering or thriving. Which?",
}, {
    "Share the cold? I AM sharing. You just can't handle artisanal frost.",
    "I could conjure ice but you'd complain about the temperature. You always do.",
    "Make you an ice block? The LAST person I ice-blocked didn't appreciate the artistry.",
    "Desert frost mage? I'm thriving. Everyone ELSE is sweating. I'm at a comfortable 'chilly.'",
    "Artisanal frost. It's a thing. I invented it. Patent pending.",
    "I'm the only comfortable person in this zone and I'm BASKING in it.",
}, {
    "ARTISANAL frost?! You branded your COLD?!",
    "Patent PENDING on frost?! You can't PATENT being cold!",
    "Comfortable CHILLY?! While the rest of us MELT?! Share!",
    "You're BASKING in our suffering?! Frost mages are HEARTLESS!",
}, "desert")

T("DRUID", {
    "{name}, we're in a forest. This is YOUR element. Can you talk to these trees?",
    "Hey {name}, do you feel stronger out here? Like the nature is... powering you up?",
    "{name}, serious question — do these trees have NAMES? Do you know them?",
    "So {name}, druid in a forest. This is like bringing a fish to water.",
}, {
    "Talk to trees? I listen. They're very opinionated about roots and sunlight.",
    "Stronger? The forest is one big cafeteria for nature magic. All-you-can-cast.",
    "These trees have names. I know three of them personally. Gerald is nice.",
    "Fish to water? More like bringing a tree to other trees. It's a REUNION.",
    "The forest powers me up like a charging station. But green. And with birds.",
    "Gerald says hi, by the way. He's the oak on the left. Very polite.",
}, {
    "GERALD?! The tree is named GERALD?! You're on a FIRST-NAME BASIS?!",
    "All-you-can-CAST forest buffet! Only druids get that!",
    "A tree REUNION?! Are they happy to see you?!",
    "Gerald says HI?! Tell Gerald I said hi BACK!",
}, "forest")

T("HUNTER", {
    "Hey {name}, I've seen your pet eyeing everything on the beach. Is it hungry again?",
    "{name}, coastal zone — your pet can probably smell fish from a mile away, right?",
    "So {name}, has your pet ever just... jumped into the water? Mid-quest?",
    "{name}, between the murlocs and the crabs, your pet must think this is a buffet.",
}, {
    "Eyeing the beach? She's ASSESSING threats. ...and potential snacks. Dual purpose.",
    "Smell fish? She can smell a murloc CAMP from two zones away. It's a gift. And a curse.",
    "Jumped into water mid-quest? ONCE. I lost her for forty minutes. She came back wet and smug.",
    "A buffet? This beach IS a buffet. Crabs, fish, murlocs — all protein. She's not wrong.",
    "My pet has excellent taste. She only eats the FRESHEST beach creatures.",
    "Wet and smug. The two emotions of a pet who made their own decisions.",
}, {
    "Dual purpose! Threats AND snacks! Efficient pet!",
    "Wet and SMUG?! Forty minutes of unauthorized swimming!",
    "All PROTEIN?! Your pet evaluates food by MACROS?!",
    "Two zones away! That nose is a WEAPON!",
}, "coastal")

--=========================================================================
--  ZONE-AWARE TOPICS: RAID  (context = "raid")
--  Fires only inside raid instances
--=========================================================================

U({
    "Hey {name}, twenty-five people and somehow we're LESS organized than a five-man.",
    "{name}, real talk — at what point in a raid do you start mentally composing your excuse to leave?",
    "So {name}, who's actually reading the raid leader's instructions? Show of hands.",
    "{name}, I notice we all showed up. That's already a victory.",
}, {
    "Twenty-five people. Three are AFK. Two are in the wrong spec. One is in the wrong RAID.",
    "I compose my excuse at invite time. 'My cat is sick' is always loaded and ready.",
    "I read the first line. Then I saw 'Phase 3 transition' and my brain went on vacation.",
    "Showing up IS the achievement. Everything after this is bonus content.",
    "There's always one person who says 'I know the fight' and then dies to the first mechanic.",
    "My excuse is 'internet issues.' Universal. Unverifiable. Perfect alibi.",
}, {
    "Three AFK, two wrong spec, one wrong RAID?! That's our roster?!",
    "'My cat is sick' — preloaded excuse! PREPARED!",
    "Phase 3 gave your brain a VACATION?! Mine left at Phase 1!",
    "Showing up IS the achievement! Lower the bar, EXCEED the bar!",
}, "raid")

U({
    "Hey {name}, I wonder if the raid boss ever looks at us and thinks 'not these guys again.'",
    "{name}, someone just pulled. Was it you? Was it ANYONE on purpose?",
    "So {name}, what's worse — wiping on trash or wiping on the boss?",
    "{name}, I keep hearing 'one more attempt' and I'm losing track of how many that is.",
}, {
    "The boss DEFINITELY recognizes us. We've been here enough times. We're regulars.",
    "Nobody pulled on purpose. Pulls just HAPPEN in raids. It's spontaneous aggro generation.",
    "Wiping on trash is worse. At least the boss is SUPPOSED to kill us. Trash has no right.",
    "We're on attempt... let me check... actually no. Counting would destroy morale.",
    "I pulled. I'm not admitting it. I'm taking it to my grave. And probably to my next death.",
    "Trash wipes don't count. That's an unwritten rule. It NEVER happened.",
}, {
    "We're REGULARS?! The boss knows us by NAME?!",
    "'Spontaneous aggro generation'! The fanciest way to say 'oops'!",
    "Counting would DESTROY MORALE?! We're THAT deep?!",
    "Trash wipes don't COUNT?! Tell that to my repair bill!",
}, "raid")

U({
    "Hey {name}, forty-minute raid break. What are you ACTUALLY doing?",
    "{name}, do you think the adds know they're just distractions?",
    "So {name}, if this raid were a restaurant, what's our Yelp rating?",
    "{name}, the loot council is about to decide. Are you nervous? I'm nervous.",
}, {
    "Raid break? Bathroom, snacks, existential crisis about my DPS. The holy trinity.",
    "Adds know they're distractions. That's why they're so ANGRY. Imagine being a footnote.",
    "Restaurant rating? One star. The wait is eternal, the service is hostile, and the food kills you.",
    "Nervous about loot? I've been nervous since I ZONED IN. The loot is just the finale.",
    "During breaks I test whether my keyboard works by nervously pressing buttons. It works.",
    "If I don't get loot today I'm writing a strongly worded letter to the loot gods.",
}, {
    "Bathroom, snacks, existential DPS crisis! The HOLY TRINITY of raid breaks!",
    "Adds are angry FOOTNOTES?! That's the saddest mob description ever!",
    "One star! The food KILLS you! Accurate raid restaurant review!",
    "Strongly worded letter to the LOOT GODS! Let me co-sign!",
}, "raid")

U({
    "Hey {name}, in a raid this size, who do you think is secretly AFK?",
    "{name}, I just realized I've been following the person in front of me for ten minutes. No idea where we're going.",
    "So {name}, how many raid consumables did you bring? Be honest. Zero is an answer.",
    "{name}, real question — does anyone know ALL the mechanics or are we all pretending?",
}, {
    "Secretly AFK? At least four people. I can FEEL the AFK energy radiating from the back.",
    "Following someone? Same. If they jump off a cliff, I'm jumping off a cliff. No questions.",
    "Consumables: I brought... hope. And maybe one health potion from three levels ago.",
    "ALL the mechanics? Nobody. We're all reading the tooltip during the pull. Every time.",
    "One health potion from level 42 is basically a lucky charm at this point.",
    "I'm pretending to know mechanics. You're pretending. We're ALL pretending. It's fine.",
}, {
    "You can FEEL the AFK energy?! From the BACK ROW?!",
    "If they JUMP you JUMP?! That's RAID TRUST at its purest!",
    "One health potion from THREE LEVELS AGO! That's a RELIC not a consumable!",
    "We're ALL pretending! The entire raid! Running on VIBES!",
}, "raid")

--=========================================================================
--  ZONE-AWARE TOPICS: BATTLEGROUND  (context = "battleground")
--  Fires only inside PvP battlegrounds
--=========================================================================

U({
    "Hey {name}, remember — the goal is the objective. Not chasing that one guy across the map.",
    "{name}, someone just yelled 'INC' with no location. Helpful.",
    "So {name}, do you have a PvP strategy or is it 'don't die first'?",
    "{name}, this BG is chaos and I'm here for it.",
}, {
    "The objective? I know about the objective. I just got DISTRACTED by revenge.",
    "'INC' with no direction. Classic. Somewhere, something is happening. Good intel.",
    "Strategy: don't die. Phase two: kill the person trying to kill me. Phase three: improvise.",
    "Chaos is THE strategy. If WE don't know what we're doing, the enemy can't predict us.",
    "I got distracted by a rogue. The rogue got distracted by me. We danced. Nobody won.",
    "If we don't know our own plan, we're UNPREDICTABLE. That's basically military genius.",
}, {
    "DISTRACTED by revenge! The most honest BG confession!",
    "'Something is happening somewhere.' INCREDIBLE intelligence report!",
    "Unpredictable because CLUELESS?! That's not genius, that's... actually kind of genius?!",
    "You DANCED with a rogue?! In the middle of a BATTLEGROUND?!",
}, "battleground")

U({
    "Hey {name}, nothing bonds strangers faster than getting camped at the graveyard.",
    "{name}, the scoreboard is just a list of people having different levels of bad days.",
    "So {name}, flag carriers — born heroes or just people who clicked the wrong thing?",
    "{name}, who keeps typing strategies in chat that nobody reads?",
}, {
    "Graveyard camping builds character. And rage. Mostly rage. ALL rage.",
    "Scoreboard: one person is carrying. Two are trying. The rest are sightseeing.",
    "I picked up the flag by accident once. Held it for thirty seconds. Felt like a GOD.",
    "I type strategies. Nobody reads them. I type them anyway. It's a ritual at this point.",
    "The scoreboard is a judgment document. I do NOT look at it. I look at it. I regret it.",
    "Flag carrying by accident is how LEGENDS are born. Reluctant, confused legends.",
}, {
    "Mostly rage! ALL rage! Graveyard camping in a NUTSHELL!",
    "Sightseeing in a BG?! Taking in the SCENIC VIOLENCE?!",
    "Thirty seconds! A GOD for thirty seconds! Then what?! DEATH?!",
    "You type strategies NOBODY reads! The BG philosopher! Unheard but DEDICATED!",
}, "battleground")

--=========================================================================
--  MORE CLASS + ZONE COMBOS
--=========================================================================

-- WARRIOR in snow
T("WARRIOR", {
    "{name}, how does plate armor feel in the snow? I need details.",
    "Hey {name}, your war cry just echoed off three mountains. Impressive or terrifying?",
    "{name}, I notice you're still charging into things even on ice. How.",
    "So {name}, warrior in the snow — do you just generate heat through RAGE?",
}, {
    "Plate in snow? Imagine wearing a freezer. FROM THE INSIDE. That's the experience.",
    "War cry echo? That's FREE intimidation. Three mountains, three times the fear.",
    "Charging on ice: skill, balance, and absolutely zero self-preservation instinct.",
    "Rage generates heat. FACT. I haven't been cold since level 10. I've been FURIOUS.",
    "I'm basically a walking icicle with a sword. The sword is also cold. Everything is cold.",
    "The ice doesn't slow me down. It slows everything ELSE. I am the immovable object.",
}, {
    "A FREEZER from the INSIDE! Plate armor winter wear!",
    "You haven't been COLD since level 10?! Rage-heated warrior!",
    "Zero self-preservation! That's not a strategy, that's a LIFESTYLE!",
    "Walking icicle WITH A SWORD! The coldest warrior fantasy!",
}, "snow")

-- PRIEST in haunted zone
T("PRIEST", {
    "{name}, haunted zone. Undead everywhere. This is literally YOUR job description.",
    "Hey {name}, does the Light work better in creepy places or is it the same everywhere?",
    "{name}, I feel safer having a priest in a zone like this. Don't let that go to your head.",
    "So {name}, when undead see a priest, do they run or is that just wishful thinking?",
}, {
    "MY job description: 'Stand in dark place, glow threateningly.' That's the resume.",
    "The Light works BETTER here. It's like... the darkness gives it contrast. Very dramatic.",
    "You SHOULD feel safer. I'm basically a walking nightlight in a haunted house.",
    "Undead see me and they HESITATE. That's not running. But hesitation is a START.",
    "Haunted zones are my office. Plague, undead, cursed ground — just another Tuesday.",
    "Drama is half of being a priest. The other half is actual healing. The drama half is better.",
}, {
    "Glow THREATENINGLY! That's a REAL skill!",
    "A walking NIGHTLIGHT! In a haunted house! I need you in EVERY dark zone!",
    "Undead HESITATE when they see you?! That's RESPECT! ...or confusion!",
    "Just another TUESDAY?! Haunted zones are your ROUTINE?!",
}, "haunted")

-- WARLOCK in haunted zone
T("WARLOCK", {
    "{name}, this zone is crawling with undead and demons. You're... home?",
    "Hey {name}, when you walk through a haunted zone, does anything here try to recruit you?",
    "{name}, I notice you look WAY too comfortable in this cursed wasteland.",
    "So {name}, warlock in a plague zone — do they mistake you for management?",
}, {
    "Home? I wouldn't say HOME. But the vibe is... familiar. Like visiting an old school.",
    "Recruit me? The undead send LinkedIn requests. I politely decline. Usually.",
    "Comfortable? The corruption here is amateur. I've seen worse in my BASEMENT.",
    "Management? I get nods from things that should be trying to kill us. It's... useful.",
    "Plague zones are to warlocks what gardens are to druids. We just... understand the energy.",
    "My demon feels RIGHT AT HOME here. He hasn't complained once. That's a first.",
}, {
    "LINKEDIN requests from the UNDEAD?! What's the job title?!",
    "Amateur corruption! Your BASEMENT is worse?! What's in your basement?!",
    "NODS from undead?! They think you're UPPER MANAGEMENT!",
    "Your demon HASN'T COMPLAINED?! This zone is his VACATION!",
}, "haunted")

-- ROGUE in city
T("ROGUE", {
    "{name}, we're in a city. How many pockets have you picked since we got here? Honest.",
    "Hey {name}, does a rogue in a city feel like a kid in a candy store?",
    "{name}, I notice you keep eyeing the alleyways. Professional habit?",
    "So {name}, city rogue — do you know shortcuts I don't? Secret passages?",
}, {
    "Pockets? None. Today. That I'll ADMIT to. In present company.",
    "Candy store? More like an open buffet. So many marks. So little time. Hypothetically.",
    "The alleyways? I'm assessing escape routes. A rogue without an exit plan is a dead rogue.",
    "Secret passages? Every city has them. I know four in this one alone. I'll tell you... never.",
    "A rogue in a city is invisible. You're only seeing me because I'm ALLOWING it.",
    "I know things about this city that would make the guards nervous. That's not a threat. It's a fact.",
}, {
    "None that you'll ADMIT TO?! In PRESENT COMPANY?! What about ABSENT company?!",
    "You're ALLOWING us to see you?! Rogue hospitality!",
    "FOUR secret passages! And you'll tell us NEVER! Helpful!",
    "Make the GUARDS nervous?! What do you KNOW?!",
}, "city")

-- PALADIN in haunted zone
T("PALADIN", {
    "{name}, haunted zone. Undead. Plague. You're literally glowing. We can see you from SPACE.",
    "Hey {name}, does the Light get... brighter in cursed places? You seem extra shiny.",
    "{name}, watching a paladin walk through plague territory is like watching a lighthouse in a storm.",
    "So {name}, do you feel PERSONALLY offended by undead? Like, on a spiritual level?",
}, {
    "Glowing? Of COURSE I'm glowing. The Light turns up to ELEVEN in places like this.",
    "Extra shiny? The darker the zone, the brighter I get. It's not a choice. It's a CALLING.",
    "Lighthouse in a storm — that's the best compliment I've gotten all week. I'm framing that.",
    "Personally offended by undead? ABSOLUTELY. They are an AFFRONT to everything I believe.",
    "The Light didn't send me here by accident. This is a MISSION. A righteous, glowing MISSION.",
    "I don't get brighter on purpose. The Light just REACTS to undead like I react to bad manners.",
}, {
    "The Light turns up to ELEVEN?! You're a walking BEACON!",
    "A glowing MISSION?! You're framing the lighthouse compliment?! Peak paladin!",
    "The Light REACTS to undead like you react to bad MANNERS?! DIVINE irritation!",
    "An AFFRONT! Undead are a personal AFFRONT! The passion!",
}, "haunted")

-- SHAMAN in mountain zone
T("SHAMAN", {
    "{name}, we're in the mountains. The earth element must be SCREAMING at you up here.",
    "Hey {name}, does being up high make the wind element... louder?",
    "{name}, mountain zone. Rocks everywhere. You must be in elemental heaven.",
    "So {name}, shaman on a mountain top — can you feel the earth better up here?",
}, {
    "Earth is VERY loud up here. Every boulder has an OPINION. They will NOT shut up.",
    "Wind is louder? Wind is DEAFENING. At this altitude, wind thinks it's the BOSS.",
    "Elemental heaven? Earth is happy. Wind is ecstatic. Fire is bored. Water is lost.",
    "I can feel the earth so well up here that I know what it had for breakfast. Granite.",
    "Every rock is a conversation. Some are interesting. Most are just 'I've been here forever.'",
    "The mountain itself is one big earth elemental having a NAP. Don't wake it.",
}, {
    "Boulders have OPINIONS?! What do ROCKS think about?!",
    "Wind thinks it's the BOSS?! At this altitude?! It might be!",
    "Earth had GRANITE for breakfast! Elemental dietary habits!",
    "The mountain is NAPPING?! We're walking on a SLEEPING elemental?!",
}, "mountain")

-- MAGE in snow zone
T("MAGE", {
    "{name}, we're freezing out here and you're a FIRE mage. Fireball something. Warm us up.",
    "Hey {name}, in a snow zone, are you basically a space heater with legs?",
    "{name}, everyone's cold and you could literally conjure a hot beverage. Do it.",
    "So {name}, in a blizzard — does your fire magic keep you warm or is that not how it works?",
}, {
    "Fire mage in snow? I'm the most popular person in any winter zone. People ORBIT me.",
    "Space heater? I prefer 'mobile combustion specialist.' But yes. I'm warm. VERY warm.",
    "Conjure a hot beverage? I can conjure FIRE. But sure, let me make you a LATTE.",
    "My fire magic keeps me warm, dry, and smug. The smug part isn't the magic. That's just me.",
    "In a blizzard, I'm the only one with dry robes. That's not magic. That's fire MAINTENANCE.",
    "People only like fire mages in winter. In summer they tell me to stand over THERE.",
}, {
    "People ORBIT you for warmth?! You're a CAMPFIRE with opinions!",
    "'Mobile combustion specialist'! That's on your BUSINESS CARD?!",
    "A LATTE?! You can conjure a LATTE?! Wait, can you actually do that?!",
    "Summer: stand over THERE! Winter: stand over HERE! Fire mage SEASONALITY!",
}, "snow")

-- WARRIOR in desert
T("WARRIOR", {
    "{name}, plate armor in the desert. How are you not a cooked lobster right now?",
    "Hey {name}, sand in plate armor. That's gotta grind. Literally.",
    "{name}, does your armor get hot enough to cook on? Serious question.",
    "So {name}, warrior in the desert — do you sweat more from the heat or the rage?",
}, {
    "Cooked? I'm MARINATING. The armor is an oven. I am the main course. This is fine.",
    "Sand in plate? Every joint SCREAMS with every step. It's like the desert is grinding me for XP.",
    "Cook on my armor? I've fried an egg on my shoulder plate. Not on purpose. It just happened.",
    "Sweat: 40% heat, 60% rage. The rage sweat is hotter. Science hasn't explained it yet.",
    "I am a walking pressure cooker. The desert just raised the temperature. The rage raised it more.",
    "Fried an egg. By ACCIDENT. My armor hit 400 degrees. Breakfast of champions.",
}, {
    "You're MARINATING?! In your own ARMOR?! Like a STEW?!",
    "The desert is grinding you for XP! That's the most warrior way to describe CHAFING!",
    "You fried an EGG on your SHOULDER?! Accidental cooking!",
    "Rage sweat is HOTTER?! Science CAN'T explain warrior biology!",
}, "desert")

-- DRUID in swamp
T("DRUID", {
    "{name}, we're in a swamp. As a nature expert, is this... healthy nature or sick nature?",
    "Hey {name}, can you talk to the... frogs? Or is that beneath you?",
    "{name}, druid in a swamp — does nature magic work better with MORE nature? Even gross nature?",
    "So {name}, does this swamp feel... alive to you? Like, MORE alive than it should?",
}, {
    "Healthy? This nature is... expressive. It's not sick. It's just having a BAD century.",
    "Talk to frogs? I can. They're surprisingly philosophical. Also very, very loud.",
    "More nature means more power. Even swamp nature. Especially swamp nature. It's CONCENTRATED.",
    "This swamp is VERY alive. Everything is growing, decaying, and growing again. Circle of WET life.",
    "Frogs have opinions on EVERYTHING. Politics. Weather. Bugs. Mostly bugs.",
    "Swamp druid magic is powerful and smelly. The power makes up for the smell. Mostly.",
}, {
    "A bad CENTURY?! This nature needs THERAPY!",
    "Frogs are PHILOSOPHICAL?! About WHAT?! What do frogs think about?!",
    "Circle of WET life! The swamp version of the circle of life!",
    "Powerful AND smelly! Swamp magic's trade-off!",
}, "swamp")

-- HUNTER in forest
T("HUNTER", {
    "{name}, forest zone. Your pet must be THRIVING out here.",
    "Hey {name}, in a forest do you and your pet just... know where everything is?",
    "{name}, this is literally your natural habitat. How many things can you track right now?",
    "So {name}, hunter in the forest — do the animals here know you're one of them?",
}, {
    "Thriving? She disappeared for ten minutes and came back with three squirrel friends. THRIVING.",
    "Know where everything is? My pet does. I follow her. She's the GPS. I'm the luggage.",
    "How many things can I track? Twelve. Right now. Three are birds. One is... I don't want to know.",
    "One of them? The animals ACCEPT me. The deer trust me. The wolves RESPECT me. The squirrels judge.",
    "My pet found a clearing and REFUSED to leave. She declared it home. I had to negotiate.",
    "The squirrels are the most judgmental. They watch from above. Silently. Evaluating.",
}, {
    "Three SQUIRREL friends?! In TEN minutes?! Your pet is SOCIALIZING!",
    "You're the LUGGAGE?! Your pet is the GPS and you're the CARRY-ON?!",
    "Squirrels JUDGE from above?! Silent evaluation! Terrifying!",
    "She declared it HOME?! You had to NEGOTIATE with your PET about leaving?!",
}, "forest")

-- WARLOCK in desert
T("WARLOCK", {
    "{name}, desert zone. Fire magic. This must feel like a vacation for you.",
    "Hey {name}, your demon seems... comfortable in the heat. Should I be concerned?",
    "{name}, between the scorching sun and your fire spells, you're basically redundant out here.",
    "So {name}, do warlocks sunburn or does the fel magic handle UV protection?",
}, {
    "Vacation? The desert is just a big summoning circle with sand. I feel PRODUCTIVE here.",
    "My demon loves the heat. He's SUNBATHING. I've never seen him this relaxed. It's unsettling.",
    "Redundant? I add STYLE to the burning. The sun does it for free. I do it with FLAIR.",
    "Sunburn? Fel magic is SPF 9000. Side effects include green skin. Worth it.",
    "A sunbathing demon. That's not in any summoning manual. I'm documenting this.",
    "The desert doesn't intimidate me. I've been to the Twisting Nether. THIS is a mild Tuesday.",
}, {
    "A big summoning circle with SAND! That's your vacation spot?!",
    "Your demon is SUNBATHING?! Relaxed demon is UNSETTLING!",
    "SPF 9000! With GREEN SKIN side effects! That's NOT sunscreen!",
    "A mild TUESDAY?! After the Twisting Nether?! What IS your scale?!",
}, "desert")

-- PALADIN in desert
T("PALADIN", {
    "{name}, plate armor in the desert and you're STILL wearing the full set. Commitment.",
    "Hey {name}, does the Light provide sun protection or are paladins just... durable?",
    "{name}, you're shining so bright in this sun that I can see you from two zones away.",
    "So {name}, holy warrior in the desert — do you feel like you're on a crusade?",
}, {
    "Full armor in the desert? Standards don't take VACATIONS. Neither does plate.",
    "Sun protection? The Light is SPF: Holy. It protects from EVERYTHING. Especially doubt.",
    "Shining? The sun reflects off my armor. I'm basically a mobile lighthouse. You're welcome.",
    "A crusade? Every day is a crusade. Today's crusade just happens to include sand in my boots.",
    "SPF: Holy protects from sun, undead, bad vibes, AND fashion mistakes.",
    "Sand in my boots, sand in my armor, Light in my heart. I'll endure. I ALWAYS endure.",
}, {
    "Standards don't take VACATIONS! Peak paladin discipline!",
    "SPF: HOLY! Protects from bad VIBES! I need that sunscreen!",
    "Mobile LIGHTHOUSE! In the desert! Everyone can see you SHINING!",
    "Sand everywhere but Light in your HEART! That's INSPIRATIONAL and also SANDY!",
}, "desert")

-- PRIEST in snow 
T("PRIEST", {
    "{name}, does the Light keep you warm or are you as cold as the rest of us?",
    "Hey {name}, casting holy spells in a blizzard — does the glow keep the frostbite out?",
    "{name}, I notice you're the only person NOT complaining about the cold. How.",
    "So {name}, shadow priest in the snow — dark magic in a white landscape. Very dramatic.",
}, {
    "Warm? The Light provides spiritual warmth. Physical warmth? That's a COAT. I need a coat.",
    "The glow helps visibility. Warmth? Not so much. My fingers are numb. Healing is harder numb.",
    "Not complaining? I'm complaining INTERNALLY. Priests suffer in SILENCE. It's what we do.",
    "Shadow in snow IS dramatic. The contrast is excellent. My aesthetic has never been BETTER.",
    "Spiritual warmth is NOT physical warmth. My SOUL is warm. My TOES are dying.",
    "Suffering in silence is half the priest job. The other half is suffering out loud during raids.",
}, {
    "Spiritual warmth but cold TOES?! The Light needs a HEATING feature!",
    "Suffering in SILENCE! The priest way! NOBLE and FREEZING!",
    "Shadow aesthetic in snow?! Best CONTRAST you've ever had?! Priorities!",
    "Healing is harder NUMB! That's a medical concern {name}!",
}, "snow")

-- ROGUE in haunted zone
T("ROGUE", {
    "{name}, haunted zone. Everything is dark and creepy. So... business as usual for you?",
    "Hey {name}, in a zone this dark, stealth must be TRIVIALLY easy.",
    "{name}, do rogues feel at home in creepy places or is that a stereotype?",
    "So {name}, shadows and darkness everywhere — is this YOUR element?",
}, {
    "Business as usual? I've been in STEALTH since we entered this zone. You JUST noticed?",
    "Easy stealth? I could vanish in broad daylight HERE. The zone WANTS me hidden.",
    "Stereotype? Rogues feel at home in shadows because shadows are SAFE. Creepy is just ambiance.",
    "My element? Every shadow is a hiding spot. Every corner is an advantage. I LOVE this zone.",
    "I've been invisible for the last twenty minutes. I revealed myself because you seemed lonely.",
    "The shadows here have texture. Depth. Character. I'm taking NOTES.",
}, {
    "You've been in stealth this WHOLE TIME?! How long were you just WATCHING us?!",
    "The zone WANTS you hidden?! The darkness is HELPING you?!",
    "Taking NOTES on shadows?! Shadow CONNOISSEUR!",
    "You revealed yourself because we seemed LONELY?! Rogue SYMPATHY!",
}, "haunted")

-- SHAMAN in coastal zone
T("SHAMAN", {
    "{name}, coastal zone. Water element must be going CRAZY right now.",
    "Hey {name}, can you hear the water element over the actual ocean? That's a lot of water.",
    "{name}, shaman near the sea — does the water just... call to you?",
    "So {name}, between the waves and the water element, who's louder?",
}, {
    "Water is ECSTATIC. She hasn't stopped talking since we got here. 'My people! My domain!'",
    "Hear water over the ocean? The ocean IS the water element's living room. It's PERSONAL here.",
    "The water calls to me. Also the fish. The fish are less eloquent but very enthusiastic.",
    "Water element vs waves? The element is louder. She's SHOWING OFF for the ocean. It's embarrassing.",
    "Do you know what a water elemental does near the sea? EVERYTHING. She's doing EVERYTHING.",
    "The fish are enthusiastic? They splash. Repeatedly. I think that's fish for 'welcome.'",
}, {
    "Water element said 'MY PEOPLE'?! She found her FAMILY!",
    "SHOWING OFF for the ocean?! Your element has an EGO!",
    "The fish are saying WELCOME?! Through SPLASHING?! That's adorable!",
    "The ocean is the water element's LIVING ROOM?! We're in her HOUSE!",
}, "coastal")

-- HUNTER in snow
T("HUNTER", {
    "{name}, how's your pet handling the cold? Better than us?",
    "Hey {name}, tracking in snow must be EASY. Everything leaves footprints.",
    "{name}, your pet just tried to eat a snowball. Thought you should know.",
    "So {name}, hunter in the snow — the perfect tracking conditions, right?",
}, {
    "My pet? She grew a winter coat. In twenty minutes. Adaptive biology. She's fine. I'm NOT.",
    "Tracking in snow? Child's play. Everything leaves prints. Even the wind. Don't ask.",
    "She ate HOW many snowballs? That's not food, that's compressed water! She has NO filter!",
    "Perfect tracking? Almost TOO easy. The challenge is gone. I miss the jungle.",
    "Winter coat in twenty minutes. Meanwhile I've been shivering for an hour. She's SMUG about it.",
    "Even the wind leaves tracks in snow. No I won't explain. Hunter secrets.",
}, {
    "Winter coat in TWENTY MINUTES?! Your pet adapts faster than we do!",
    "Even the WIND leaves tracks?! Hunter SECRETS?! Tell me MORE!",
    "She's SMUG about the coat?! While you SHIVER?! Rude pet!",
    "She ate SNOWBALLS?! Thought they were FOOD?! Bless her!",
}, "snow")

--=========================================================================
--  MORE UNIVERSAL TOPICS: Thicker environment coverage
--=========================================================================

-- Extra mountain
U({
    "Hey {name}, who put a quest objective on top of a MOUNTAIN? Who?",
    "{name}, the altitude is getting to me. Or the mobs. Hard to tell which is worse.",
    "So {name}, mountain zones — where falling off is a bigger threat than any mob.",
    "{name}, I've discovered that going downhill is just as terrifying as going up.",
}, {
    "Quest designers who put objectives on mountains have never CLIMBED a mountain.",
    "The altitude or the mobs? Yes. Both. Simultaneously. This zone hates vertical beings.",
    "Falling off IS the real boss here. The mobs are just the OPENING ACT.",
    "Downhill: slide, bounce, panic, land. Gravity is not our friend. Gravity is NO ONE'S friend.",
    "There's a special place in game design for people who put quest items near cliff edges.",
    "I tried to take a shortcut down. The shortcut was a cliff. I am not a smart adventurer.",
}, {
    "Gravity is no one's FRIEND! The mountain zone MOTTO!",
    "Shortcut was a CLIFF! That's not a shortcut, that's a DEATH WISH!",
    "The OPENING ACT?! Mobs are just the warm-up before GRAVITY?!",
    "Quest items near CLIFF EDGES! Intentional cruelty by DESIGN!",
}, "mountain")

-- Extra underground
U({
    "Hey {name}, I just saw something moving in the dark. I'm choosing to believe it was a rat.",
    "{name}, underground zones make me appreciate the surface. And sunlight. And BREATHING.",
    "So {name}, does anyone else feel like the tunnel is getting narrower or is that just claustrophobia?",
    "{name}, I can hear water dripping. Just dripping. Endlessly. It's FINE.",
}, {
    "Rat. Definitely a rat. NOT a cave spider. I refuse to believe in cave spiders right now.",
    "Sunlight is a PRIVILEGE and I didn't appreciate it until we entered this hole in the ground.",
    "Narrower? The walls ARE getting closer. Or I'm getting bigger. One of these is scarier.",
    "Dripping water. Somewhere. For eternity. This is what being haunted SOUNDS like.",
    "Cave spiders don't exist. I'm telling myself that. It's working. Mostly.",
    "We're so deep underground that 'up' is theoretical. A concept. A HOPE.",
}, {
    "Cave spiders DON'T EXIST?! They absolutely DO! Why would you SAY that here?!",
    "Sunlight is a PRIVILEGE! We took it for GRANTED!",
    "'Up' is THEORETICAL?! We've gone too deep! TOO DEEP!",
    "Being haunted SOUNDS like dripping water! The AMBIENCE of horror!",
}, "underground")

-- Extra dungeon
U({
    "Hey {name}, fun fact: we've been in here long enough that people outside have forgotten us.",
    "{name}, you know what never gets old? The same three mob types for the entire dungeon.",
    "So {name}, which is worse — the dungeon that's too long or the dungeon that's too hard?",
    "{name}, I bet the mobs at the entrance have already respawned. We're TRAPPED.",
}, {
    "Forgotten? Our guildies are already replacing us in their hearts. We're old news.",
    "Same three mobs? You forgot the palette-swap version with MORE health. That's mob type FOUR.",
    "Too long. Always too long. At least 'too hard' ends quickly. 'Too long' is a life sentence.",
    "Respawned at the entrance? Great. We can't go forward. Can't go back. We LIVE here now.",
    "We live here now. The dungeon is our home. I call the room with the brazier.",
    "Palette-swap mobs are an insult. 'Here's the same guy but BLUE.' So creative.",
}, {
    "We LIVE here now?! Calling ROOMS?! It's been ONE hour!",
    "Same guy but BLUE! Mob design EXPOSED!",
    "A LIFE SENTENCE! 'Too long' dungeon is actual IMPRISONMENT!",
    "They ALREADY replaced us?! In their HEARTS?! We've been gone twenty minutes!",
}, "dungeon")

-- Extra world
U({
    "Hey {name}, I just realized we've been walking for fifteen minutes with no quest objective in sight.",
    "{name}, the world is so BIG and we've explored maybe... two percent of it?",
    "So {name}, have you ever stopped questing and just... gone for a walk? No agenda?",
    "{name}, I love how the world goes on whether we're here or not. The mobs don't care about us.",
}, {
    "Fifteen minutes of walking? That's not lost. That's DISCOVERY. I discovered... nothing. Yet.",
    "Two percent? Optimistic. I've been to three zones and they all look familiar from above.",
    "Walk with no agenda? Once. Found a hidden cave. Got attacked by spiders. Never again.",
    "The mobs don't care about us specifically. We're just another Tuesday to them.",
    "Discovery of nothing is still discovery. I now know where nothing IS. That's data.",
    "Hidden caves always have spiders. ALWAYS. It's a universal constant.",
}, {
    "You discovered NOTHING! And you're PROUD of it!",
    "Hidden caves ALWAYS have spiders! The UNIVERSAL CONSTANT!",
    "We're just another TUESDAY to mobs! We're not SPECIAL to them?!",
    "Two percent and it all looks the SAME?! Have we been going in CIRCLES?!",
}, "world")

-- Extra city
U({
    "Hey {name}, I've been running between the mailbox and the auction house for forty minutes.",
    "{name}, cities are the only place where I'm in MORE danger from my own decisions than from mobs.",
    "So {name}, who's the busiest NPC in this city? My vote: the repair vendor.",
    "{name}, I just accidentally bought something I can't return. City life is BRUTAL.",
}, {
    "Mailbox, auction house, bank, repeat. That's the city rotation. Has been since day one.",
    "My decisions in cities: impulse buys, wrong enchants, accidentally sold my weapon. DANGEROUS.",
    "Busiest NPC? The auctioneer. They process HUNDREDS of bad decisions per hour.",
    "Can't return it? Welcome to the city economy. All sales are final. All regrets are eternal.",
    "I sold my WEAPON once. My main weapon. Bought it back for triple. City prices are EXTORTION.",
    "The city rotation: mail, auction, bank, repair, question life choices. Every. Single. Visit.",
}, {
    "Sold your WEAPON?! And bought it back for TRIPLE?! City economics!",
    "All sales FINAL, all regrets ETERNAL! The city MOTTO!",
    "Impulse buys AND wrong enchants?! City is more dangerous than DUNGEONS!",
    "Question life choices! The final stop in the city ROTATION!",
}, "city")

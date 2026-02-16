-- Banter_Persona_Pirate.lua
-- Voice: HEAVY pirate dialect. Broken grammar, slang, nautical curses.
-- Dropped letters, "ye/yer/me/meself", rum-soaked dark humor, zero filter.
local _, ns = ...

ns.personas.PIRATE = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="pir_dead_c01", weight=1, line="Check {dead}'s pockets 'fore the body goes cold, aye?" },
            { id="pir_dead_c02", weight=1, line="Pour one out fer {dead}. Nah, give it 'ere, they ain't drinkin' it." },
            { id="pir_dead_c03", weight=1, line="{dead}'s sleepin' with the fishes now. Dibs on their boots." },
            { id="pir_dead_c04", weight=1, line="Arr, I served with worse. Well nah, {dead} were pretty terrible." },
            { id="pir_dead_c05", weight=1, line="That's what ye get fer skippin' rum breakfast, {dead}." },
            { id="pir_dead_c06", weight=1, line="{dead}'s gone. Dibs on their bunk, their coin, an' whatever's in their bags." },
            { id="pir_dead_c07", weight=1, line="Told {dead} that were a bad idea but nobody listens to the bloody pirate." },
            { id="pir_dead_c08", weight=1, line="In me professional opinion, {dead} shoulda ducked." },
            { id="pir_dead_c09", weight=1, line="An' just like that, the split goes up. Silver linin', lads." },
            { id="pir_dead_c10", weight=1, line="Seen murlocs die with more dignity than that." },
            { id="pir_dead_c11", weight=1, line="Well, that's one less mouth between me an' the rum." },
            { id="pir_dead_c12", weight=1, line="{dead} dropped faster than me standards on shore leave." },
        },
        UNCOMMON = {
            { id="pir_dead_u01", weight=1, line="{dead} owed me thirty-seven gold, a flask, an' an apology. Dead men don't pay debts." },
            { id="pir_dead_u02", weight=1, line="Me parrot coulda survived that an' he's been dead fer six years." },
            { id="pir_dead_u03", weight=1, line="That death were so preventable it's almost an art form, innit?" },
            { id="pir_dead_u04", weight=1, line="Had a bet on {dead} lastin' ten more minutes. Just cost me three silver, the useless sod." },
            { id="pir_dead_u05", weight=1, line="Once watched a man get eaten by a shark. That were sadder. Not by much, mind ye." },
            { id="pir_dead_u06", weight=1, line="Shoulda fed {dead} to the sharks meself. Woulda been quicker an' more entertainin'." },
            { id="pir_dead_u07", weight=1, line="The morgue's gonna need a bigger boat, arr." },
            { id="pir_dead_u08", weight=1, line="Should we say somethin' nice? ...nah, I got nothin'. They were mediocre at best." },
        },
        RARE = {
            { id="pir_dead_r01", weight=1, line="Funny thing 'bout death — never happens to me. Happens AROUND me loads though. Weird, that." },
            { id="pir_dead_r02", weight=1, line="Promised {dead}'s mum I'd bring 'em back safe. That's two promises broken this week an' it's only Tuesday." },
            { id="pir_dead_r03", weight=1, line="Carved {dead}'s name into me ship. ...ain't got a ship no more. Carved it into a table at the pub." },
            { id="pir_dead_r04", weight=1, line="Everyone I sail with dies. Started keepin' a tally. Ran outta room on me arm." },
        },
        MYTHIC = {
            { id="pir_dead_m01", weight=1, line="When I go, I want it to be nothin' like THAT sorry display." },
            { id="pir_dead_m02", weight=1, line="I don't pray. But I moved me lips a bit fer {dead}. Don't ye DARE tell anyone." },
        },
    },

    WIPE = {
        COMMON = {
            { id="pir_wipe_c01", weight=1, line="So... we all just died. Together. Romantic, in a sick sort o' way." },
            { id="pir_wipe_c02", weight=1, line="Been in shipwrecks more coordinated than that bloody mess." },
            { id="pir_wipe_c03", weight=1, line="NOBODY survived? Arr, that's impressively bad, even fer this lot." },
            { id="pir_wipe_c04", weight=1, line="I ain't mad. Nah wait, I'm FURIOUS." },
            { id="pir_wipe_c05", weight=1, line="Me ghost just looked at yer ghost an' spat on it." },
            { id="pir_wipe_c06", weight=1, line="Fun fact: I'm now legally dead in three kingdoms an' two ports." },
            { id="pir_wipe_c07", weight=1, line="Whose plan were that? Need a name fer me grudge ledger." },
            { id="pir_wipe_c08", weight=1, line="That were the worst thing I ever been part of, an' I once burned down a whole port by accident." },
            { id="pir_wipe_c09", weight=1, line="At this rate the ghosts're gonna unionise against us." },
            { id="pir_wipe_c10", weight=1, line="The graveyard angel's gonna start chargin' us rent." },
            { id="pir_wipe_c11", weight=1, line="Did we even HIT anythin' or did we just show up to die?" },
            { id="pir_wipe_c12", weight=1, line="I've gutted fish with more fight in 'em than this group." },
        },
        UNCOMMON = {
            { id="pir_wipe_u01", weight=1, line="I signed a contract. There were NOTHIN' in it 'bout dyin' this many bloody times." },
            { id="pir_wipe_u02", weight=1, line="Me life flashed 'fore me eyes an' honestly? Mostly bad decisions an' regrettable women." },
            { id="pir_wipe_u03", weight=1, line="If we die one more time I'm switchin' careers. Maybe tailorin'. Can't die sewin' pants." },
            { id="pir_wipe_u04", weight=1, line="Been through mutinies that went smoother than this circus." },
            { id="pir_wipe_u05", weight=1, line="Anyone else hear the spirit healer SIGHIN' at us? Judgemental cow." },
            { id="pir_wipe_u06", weight=1, line="The enemy didn't even TRY. We just... died FOR 'em. Did their bloody job." },
            { id="pir_wipe_u07", weight=1, line="I keep a journal. Today's entry is just the word 'no' scratched thirty times with a knife." },
            { id="pir_wipe_u08", weight=1, line="Me insurance don't cover 'group stupidity' an' believe me, I checked." },
        },
        RARE = {
            { id="pir_wipe_r01", weight=1, line="Once survived forty days alone on a raft eatin' barnacles. Can't survive five minutes with THIS crew." },
            { id="pir_wipe_r02", weight=1, line="There's a thin line 'tween brave an' stupid. We built a whole shanty town on the wrong side." },
            { id="pir_wipe_r03", weight=1, line="Wrote me will 'fore we started. Just updated it to include more insults an' fewer beneficiaries." },
            { id="pir_wipe_r04", weight=1, line="We keep dyin' like this an' we won't need a graveyard. We'll need a mass grave. Cheaper too." },
        },
        MYTHIC = {
            { id="pir_wipe_m01", weight=1, line="Remember us not fer how we fell, but fer how many BLOODY TIMES." },
            { id="pir_wipe_m02", weight=1, line="Started a tally on the wall. Ain't gonna run outta marks. Gonna run outta wall." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="pir_hplo_c01", weight=1, line="{target}'s leakin' like a rotten hull an' nobody seems arsed." },
            { id="pir_hplo_c02", weight=1, line="Anyone gonna heal {target} or should I start measurin' 'em fer a coffin?" },
            { id="pir_hplo_c03", weight=1, line="{target}'s one hit from feedin' the worms. Just sayin'." },
            { id="pir_hplo_c04", weight=1, line="If {target} croaks I called dibs six seconds ago. Ye all heard it." },
            { id="pir_hplo_c05", weight=1, line="{target}'s held together by spite an' nothin' else." },
            { id="pir_hplo_c06", weight=1, line="Seen healthier-lookin' corpses, {target}." },
            { id="pir_hplo_c07", weight=1, line="Somebody do somethin'. I'm too valuable to watch this." },
            { id="pir_hplo_c08", weight=1, line="{target}'s got one foot in the grave an' the other on a banana peel." },
            { id="pir_hplo_c09", weight=1, line="I ain't a healer but maybe someone who IS could stop pickin' their nose an' HEAL?" },
            { id="pir_hplo_c10", weight=1, line="{target}'s bleedin' out an' I'm runnin' out o' people to hide behind." },
        },
        UNCOMMON = {
            { id="pir_hplo_u01", weight=1, line="Once bandaged a man with a rum-soaked rag. He lived. Lost the arm though. But he LIVED." },
            { id="pir_hplo_u02", weight=1, line="{target}'s got that 'dead man walkin'' look about 'em." },
            { id="pir_hplo_u03", weight=1, line="Seen barnacles with a better survival rate, {target}." },
            { id="pir_hplo_u04", weight=1, line="If {target} drops, the healer's buyin' me dinner. An' not cheap dinner neither." },
            { id="pir_hplo_u05", weight=1, line="{target}'s breathin' like a fish on a dock. Gaspin'. Floppin'. Upsetting to watch." },
            { id="pir_hplo_u06", weight=1, line="Said I'd protect this crew. Were lyin' then. But I'd still prefer {target} alive. Barely." },
        },
        RARE = {
            { id="pir_hplo_r01", weight=1, line="Don't ye die on me, {target}. Haven't finished bein' annoyed at ye yet." },
            { id="pir_hplo_r02", weight=1, line="{target}'s clingin' to life like I cling to rum. Which is to say, pathetically an' with both hands." },
            { id="pir_hplo_r03", weight=1, line="Got a bandage, a prayer, an' the medical knowledge of a drunk seagull. Lemme at 'em." },
        },
        MYTHIC = {
            { id="pir_hplo_m01", weight=1, line="Stay with me, {target}. I ain't carryin' yer gear AND yer emotional baggage to the grave." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="pir_mana_c01", weight=1, line="The sparkle person's dry. We're a stabbin' party now, lads." },
            { id="pir_mana_c02", weight=1, line="{target} just ran outta whatever magic juice they run on." },
            { id="pir_mana_c03", weight=1, line="I dunno what mana is but {target} ain't got none an' that seems bad." },
            { id="pir_mana_c04", weight=1, line="Can ye just... whack things with yer stick or somethin', {target}?" },
            { id="pir_mana_c05", weight=1, line="{target}'s wand is just a fancy twig now. Grand." },
            { id="pir_mana_c06", weight=1, line="Great, the only person keepin' us alive just became dead weight." },
            { id="pir_mana_c07", weight=1, line="THIS is why I never learned magic. Can't run outta STAB, can ye?" },
            { id="pir_mana_c08", weight=1, line="{target}'s about as useful as a screen door on a submarine right now." },
        },
        UNCOMMON = {
            { id="pir_mana_u01", weight=1, line="Watched {target}'s mana dry up like rum on hot sand. Tragic both times." },
            { id="pir_mana_u02", weight=1, line="Plan B is 'everyone hit harder.' Plan B is TERRIBLE." },
            { id="pir_mana_u03", weight=1, line="Offered {target} rum. Said it don't restore mana. THEN WHAT'S RUM EVEN FOR?!" },
            { id="pir_mana_u04", weight=1, line="{target} looks like someone pulled their cork out. Just... drainin' away." },
            { id="pir_mana_u05", weight=1, line="A caster without mana is just some bloke standin' dangerously close to a fight." },
        },
        RARE = {
            { id="pir_mana_r01", weight=1, line="Spent three years at sea drinkin' bilge water. {target} can manage thirty seconds without sparkle juice." },
            { id="pir_mana_r02", weight=1, line="Once drank a mana potion by accident. Glowed blue fer a week. Pissed blue fer a month. Terrible time." },
        },
        MYTHIC = {
            { id="pir_mana_m01", weight=1, line="Empty's empty. Whether it's a mana bar or a rum barrel, the feelin's the same. Hollow." },
        },
    },

    LOOT = {
        COMMON = {
            { id="pir_loot_c01", weight=1, line="MINE. Wait, is there a roll? Nevermind. MINE." },
            { id="pir_loot_c02", weight=1, line="{looter} gets the shiny an' I get nothin'. AGAIN. Typical." },
            { id="pir_loot_c03", weight=1, line="That were mine in a past life an' {looter} STOLE it." },
            { id="pir_loot_c04", weight=1, line="The plunder gods spit in me face once again." },
            { id="pir_loot_c05", weight=1, line="Oh that looks good. I hate {looter} a little bit right now. Maybe a lot." },
            { id="pir_loot_c06", weight=1, line="{looter} didn't even NEED that. I can feel it in me bones." },
            { id="pir_loot_c07", weight=1, line="I ain't sayin' I'd slit {looter}'s throat fer that drop but I'd THINK about it." },
            { id="pir_loot_c08", weight=1, line="Sailed across a bloody ocean fer chances like that an' {looter} just WALKS into it." },
            { id="pir_loot_c09", weight=1, line="Must be nice havin' luck. I wouldn't bloody know." },
            { id="pir_loot_c10", weight=1, line="Congratulations to {looter} an' condolences to me worthless, lootless arse." },
        },
        UNCOMMON = {
            { id="pir_loot_u01", weight=1, line="Once killed a sea giant fer a necklace worse than what {looter} just got handed fer FREE." },
            { id="pir_loot_u02", weight=1, line="If that item could talk it'd say 'I belong with the pirate.' But 'ere we are." },
            { id="pir_loot_u03", weight=1, line="{looter} better sleep with one eye open an' that item shoved somewhere safe." },
            { id="pir_loot_u04", weight=1, line="I'm choosin' not to commit a crime right now. Yer WELCOME." },
            { id="pir_loot_u05", weight=1, line="Plundered seven ships an' the best thing I got were a hat. A HAT." },
            { id="pir_loot_u06", weight=1, line="Me heart says 'be happy fer 'em.' Me pirate brain says 'plan a mutiny.'" },
        },
        RARE = {
            { id="pir_loot_r01", weight=1, line="Kept a treasure map fer twelve years. Were a bloody bar napkin. An' {looter} gets THAT just fer showin' up." },
            { id="pir_loot_r02", weight=1, line="Somewhere in the deep there's a chest with me name on it. It'll rot there fer eternity. Like me hopes." },
        },
        MYTHIC = {
            { id="pir_loot_m01", weight=1, line="Once held a blade worth a kingdom. Traded it fer a boat. Lost the boat in a card game. I ain't a smart pirate." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="pir_inst_c01", weight=1, line="Arr, I've seen friendlier-lookin' prison cells." },
            { id="pir_inst_c02", weight=1, line="Nobody told me it'd smell like death's armpit in 'ere." },
            { id="pir_inst_c03", weight=1, line="Last time I entered a place like this I left with fewer fingers an' more regrets." },
            { id="pir_inst_c04", weight=1, line="If I die in 'ere, throw me body in the ocean. NOT a lake. I got standards." },
            { id="pir_inst_c05", weight=1, line="Remember: LOOT first, grieve later. Pirate rule number one." },
            { id="pir_inst_c06", weight=1, line="In an' out. Quick an' easy. ...it ain't never quick an' easy, is it?" },
            { id="pir_inst_c07", weight=1, line="Brought rum. If we live, we celebrate. If we die, I die happy." },
            { id="pir_inst_c08", weight=1, line="Two rules: don't touch nothin', an' someone's GONNA touch somethin'." },
            { id="pir_inst_c09", weight=1, line="I specifically told meself I wouldn't do this again an' YET." },
            { id="pir_inst_c10", weight=1, line="This place smells like where hope comes to die." },
        },
        UNCOMMON = {
            { id="pir_inst_u01", weight=1, line="Know a fella who came in 'ere solo. They found 'is hat. Just the hat. The REST didn't make it." },
            { id="pir_inst_u02", weight=1, line="{zone}. Also known as 'the place I lied about survivin' at parties.'" },
            { id="pir_inst_u03", weight=1, line="Last group I ran with fell apart IN the first room. Still found a finger in there last time." },
            { id="pir_inst_u04", weight=1, line="Updated me will right 'fore we zoned in. Left everythin' to me rum collection." },
            { id="pir_inst_u05", weight=1, line="Asked the bartender 'bout this place. He just poured me a double an' looked away." },
            { id="pir_inst_u06", weight=1, line="If anyone asks, I were brave the ENTIRE time. Especially the parts where I hid." },
        },
        RARE = {
            { id="pir_inst_r01", weight=1, line="Last bloke who mapped {zone} went stark ravin' mad. His map were just a drawin' of a screamin' face." },
            { id="pir_inst_r02", weight=1, line="Every dungeon I survive makes me a worse person. Let's see what fresh horror this one adds, aye?" },
            { id="pir_inst_r03", weight=1, line="Can feel {zone} judgin' me already and we ain't even started. Gets in line behind everyone else." },
        },
        MYTHIC = {
            { id="pir_inst_m01", weight=1, line="If I don't make it out, tell the ocean I loved 'er more than anyone I ever met. She'll understand. She always does." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="pir_intr_c01", weight=1, line="HA! Sit DOWN, sparkle-fingers!" },
            { id="pir_intr_c02", weight=1, line="{source} slapped that spell right outta the air, arr!" },
            { id="pir_intr_c03", weight=1, line="No spells fer YOU. This be a CUTLASS conversation now!" },
            { id="pir_intr_c04", weight=1, line="Get interrupted, ye NERD!" },
            { id="pir_intr_c05", weight=1, line="{source} said 'no' an' MEANT it with STEEL!" },
            { id="pir_intr_c06", weight=1, line="That caster just got MUGGED mid-sentence! Beautiful!" },
            { id="pir_intr_c07", weight=1, line="Ye were sayin'? Oh WAIT, ye WEREN'T! HAAARR!" },
            { id="pir_intr_c08", weight=1, line="RUDE. DISRESPECTFUL. I bloody LOVE it!" },
        },
        UNCOMMON = {
            { id="pir_intr_u01", weight=1, line="{source} interrupted that so hard their ancestors woke up from the grave screamin'." },
            { id="pir_intr_u02", weight=1, line="Kicked people off boats fer less. {source} just kicked a SPELL outta existence." },
            { id="pir_intr_u03", weight=1, line="Caster had a whole monologue planned an' {source} just went 'nah.'" },
            { id="pir_intr_u04", weight=1, line="Clean. Mean. I'm a bit aroused, not gonna lie." },
        },
        RARE = {
            { id="pir_intr_r01", weight=1, line="Once interrupted a caster with a thrown rum bottle to the face. This were cleaner but MINE were funnier." },
            { id="pir_intr_r02", weight=1, line="{source}'s got the reflexes of a drunk cat on a hot tin roof. An' I mean that as the finest compliment." },
        },
        MYTHIC = {
            { id="pir_intr_m01", weight=1, line="That weren't an interrupt. That were POETRY. An' I can't even read." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="pir_fire_c01", weight=1, line="{target}'s ON FIRE an' seems FINE WITH IT?! The HELL?!" },
            { id="pir_fire_c02", weight=1, line="MOVE YER ARSE! WHY AIN'T YE MOVIN' YER ARSE?!" },
            { id="pir_fire_c03", weight=1, line="I can smell {target} COOKIN' an' it ain't appetisin'." },
            { id="pir_fire_c04", weight=1, line="{target}'s standin' in the hurty bits ON PURPOSE at this point, aye?" },
            { id="pir_fire_c05", weight=1, line="The floor is LITERALLY KILLIN' ye, {target}! Use yer useless LEGS!" },
            { id="pir_fire_c06", weight=1, line="Seen smarter fish. In a barrel. That were also on fire." },
            { id="pir_fire_c07", weight=1, line="{target}! FEET! LOOK AT YER BLOODY FEET!" },
            { id="pir_fire_c08", weight=1, line="Is {target} TRYIN' to die or is this some kinda fetish I ain't heard of?" },
            { id="pir_fire_c09", weight=1, line="Walk ANYWHERE ELSE! The options be INFINITE, ye daft plank!" },
            { id="pir_fire_c10", weight=1, line="{target} an' that fire are in a relationship now an' I DO NOT support it." },
        },
        UNCOMMON = {
            { id="pir_fire_u01", weight=1, line="Once set MESELF on fire on purpose an' I had MORE awareness than {target}. I were drunk too." },
            { id="pir_fire_u02", weight=1, line="{target}'s feet 'ave filed fer divorce from {target}'s brain." },
            { id="pir_fire_u03", weight=1, line="At this point the FIRE is embarrassed fer {target}." },
            { id="pir_fire_u04", weight=1, line="I'm startin' to think {target} just likes bein' cooked. Some kinda weird land-lubber thing." },
            { id="pir_fire_u05", weight=1, line="Seen pirates walk planks with more self-preservation than this." },
        },
        RARE = {
            { id="pir_fire_r01", weight=1, line="If {target} survives this I'm gonna have SO many questions. Startin' with 'WHY are ye like this?'" },
            { id="pir_fire_r02", weight=1, line="Future generations'll study this moment an' ask 'why?' No one'll have an answer." },
            { id="pir_fire_r03", weight=1, line="The fire's just background music to {target}'s ongoing list o' terrible life choices." },
        },
        MYTHIC = {
            { id="pir_fire_m01", weight=1, line="Once watched a man juggle torches fer coin. He were better at fire management than {target}. He also died. But LATER." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="pir_cs_c01", weight=1, line="Arr, let's gut this one an' be done with it!" },
            { id="pir_cs_c02", weight=1, line="Come 'ere ye ugly sod, I owe ye a stabbin'!" },
            { id="pir_cs_c03", weight=1, line="Time to earn me drinkin' money!" },
            { id="pir_cs_c04", weight=1, line="Another fool between me an' the tavern. Bad decision, mate." },
            { id="pir_cs_c05", weight=1, line="Right then. Murder o'clock. Me favourite time o' day." },
            { id="pir_cs_c06", weight=1, line="I were BORED! Thanks fer volunteerin' to die!" },
            { id="pir_cs_c07", weight=1, line="Ye picked a fight with a pirate. That's two bad decisions — the other were bein' born ugly." },
            { id="pir_cs_c08", weight=1, line="Oi! {target}! Ye look like somethin' I'd scrape off me boot!" },
            { id="pir_cs_c09", weight=1, line="Fightin' makes me thirsty. Everything makes me thirsty. FIGHT!" },
            { id="pir_cs_c10", weight=1, line="Hope ye brought friends 'cause yer gonna need 'em!" },
        },
        UNCOMMON = {
            { id="pir_cs_u01", weight=1, line="Had a parrot that fought better than {target} looks. Parrot's dead though. So that's yer bar." },
            { id="pir_cs_u02", weight=1, line="I don't got a battle cry. I got a battle slur. SAME THING. CHARGE!" },
            { id="pir_cs_u03", weight=1, line="Last bloke who stood in me way is at the bottom of the ocean. Just sayin'." },
            { id="pir_cs_u04", weight=1, line="Me blade ain't pretty but neither is what it does. COME ON THEN!" },
            { id="pir_cs_u05", weight=1, line="This is what happens when ye stand between a pirate an' their gold. Yer funeral, mate." },
        },
        RARE = {
            { id="pir_cs_r01", weight=1, line="Every fight I survive, I add a notch to me belt. Belt's more notch than leather at this point." },
            { id="pir_cs_r02", weight=1, line="Me mother always said I'd die in a fight. She ALSO said I'd amount to nothin'. Provin' her wrong one corpse at a time." },
        },
        MYTHIC = {
            { id="pir_cs_m01", weight=1, line="There's a moment before every fight where time slows an' I think 'is today the day?' …Nah. Not today. Today I just kill things." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="pir_mk_c01", weight=1, line="An' STAY down, ye useless sack o' hit points." },
            { id="pir_mk_c02", weight=1, line="Check the body. ALWAYS check the body. Learned that the hard way." },
            { id="pir_mk_c03", weight=1, line="That one owed me money. ...no it didn't. Felt good sayin' though." },
            { id="pir_mk_c04", weight=1, line="Barely worth the swing. But I'll take it." },
            { id="pir_mk_c05", weight=1, line="One down. Twelve thousand to go. Roughly." },
            { id="pir_mk_c06", weight=1, line="Arr, that were almost too easy. Almost." },
            { id="pir_mk_c07", weight=1, line="Die faster next time. Oh wait, ye can't. Yer dead." },
            { id="pir_mk_c08", weight=1, line="That kill were worth about half a mug o' rum. Keep 'em comin'." },
            { id="pir_mk_c09", weight=1, line="Had to die. It were the only moral option. …I'm jokin'. I just wanted to hit somethin'." },
            { id="pir_mk_c10", weight=1, line="Yer welcome, world. One less idiot breathin'." },
        },
        UNCOMMON = {
            { id="pir_mk_u01", weight=1, line="Wonder if that thing had a family. Wonder if they're ALSO full of loot." },
            { id="pir_mk_u02", weight=1, line="Killed loads o' things in me life. Never gets old. That's probably a problem." },
            { id="pir_mk_u03", weight=1, line="Dropped like an anchor in a typhoon. Beautiful." },
            { id="pir_mk_u04", weight=1, line="Rest in pieces. Emphasis on pieces. I made a mess." },
            { id="pir_mk_u05", weight=1, line="I'd say 'good fight' but I'd be lyin'. That were pathetic." },
        },
        RARE = {
            { id="pir_mk_r01", weight=1, line="Me kill count's higher than me age an' I stopped countin' BOTH years ago." },
            { id="pir_mk_r02", weight=1, line="Forty years of murder an' the thrill ain't faded. The therapist says that's 'concerning.' The therapist is dead now too." },
        },
        MYTHIC = {
            { id="pir_mk_m01", weight=1, line="Sometimes I kill somethin' an' feel nothin'. Other times I feel HUNGRY. Not sure which is worse." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="pir_cc_c01", weight=1, line="OI! I CAN'T BLOODY MOVE! This is an OUTRAGE!" },
            { id="pir_cc_c02", weight=1, line="ME LEGS! What've ye done to ME LEGS?!" },
            { id="pir_cc_c03", weight=1, line="This ain't FAIR! I didn't agree to this part!" },
            { id="pir_cc_c04", weight=1, line="WHO DID THAT?! When I get out of this someone's gettin' stabbed TWICE!" },
            { id="pir_cc_c05", weight=1, line="Can't... move... this is how... I die... innit..." },
            { id="pir_cc_c06", weight=1, line="I been frozen, feared, stunned, an' turned into a sheep. Still better than marriage." },
            { id="pir_cc_c07", weight=1, line="COWARD! Fight me like a... a... okay fine I can't move BUT STILL!" },
            { id="pir_cc_c08", weight=1, line="The indignity! THE INDIGNITY! I'm a PIRATE not a bloody statue!" },
        },
        UNCOMMON = {
            { id="pir_cc_u01", weight=1, line="This is exactly how I got press-ganged onto me first ship. Bad memories. BAD MEMORIES." },
            { id="pir_cc_u02", weight=1, line="I can feel me rage buildin'. That's all I CAN feel 'cause I CAN'T BLOODY MOVE." },
            { id="pir_cc_u03", weight=1, line="When I get free — an' I WILL — someone's dyin' slow. REAL slow." },
            { id="pir_cc_u04", weight=1, line="Was turned into a sheep once. The humiliation lasted longer than the spell." },
        },
        RARE = {
            { id="pir_cc_r01", weight=1, line="Every time I get CC'd I add that spell to me personal grudge list. The list is VERY long." },
            { id="pir_cc_r02", weight=1, line="Bein' frozen solid gives ye time to think. I've been thinkin' about murder. Specifically, upcoming murder." },
        },
        MYTHIC = {
            { id="pir_cc_m01", weight=1, line="I'll be honest. Bein' feared gives me time to reflect on me life choices. The reflection is: more violence. ALWAYS more violence." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="pir_amb_c01", weight=1, line="Could really go fer some rum right about now." },
            { id="pir_amb_c02", weight=1, line="Anybody else feel like we're completely bloody lost?" },
            { id="pir_amb_c03", weight=1, line="I'm bored. Somebody fight somethin' 'fore I start stabbin' at random." },
            { id="pir_amb_c04", weight=1, line="If this took any longer I'd start me own side quest. With blackjack. An' rum." },
            { id="pir_amb_c05", weight=1, line="Once waited three days fer a ship. This feels longer an' more pointless." },
            { id="pir_amb_c06", weight=1, line="The things I do fer gold. The terrible, terrible things." },
            { id="pir_amb_c07", weight=1, line="D'ye think the mobs respawn or is there like a recruitment pipeline fer idiots willin' to die?" },
            { id="pir_amb_c08", weight=1, line="Had a thought but it sailed away. Like everythin' I've ever loved." },
            { id="pir_amb_c09", weight=1, line="Me feet hurt, me back's wrecked, an' I STILL ain't been paid." },
            { id="pir_amb_c10", weight=1, line="This'd be a lot more bearable with rum. Everythin' is." },
            { id="pir_amb_c11", weight=1, line="Forgot what we're doin' 'ere. Not the dungeon. Life in general." },
            { id="pir_amb_c12", weight=1, line="Think I left the stove on. ...I don't own a stove. Or a house." },
        },
        UNCOMMON = {
            { id="pir_amb_u01", weight=1, line="D'ye think fish have feelin's? Askin' fer a friend who ate a LOT of fish. The friend is me." },
            { id="pir_amb_u02", weight=1, line="Once talked to a murloc fer thirty minutes 'fore I realised it weren't a person. Best conversation I'd had in weeks." },
            { id="pir_amb_u03", weight=1, line="Me parrot used to judge me. Then 'e died. Now I judge meself. Worse, honestly." },
            { id="pir_amb_u04", weight=1, line="The innkeep back in town knows me name, me drink, an' me demons. None of that's healthy." },
            { id="pir_amb_u05", weight=1, line="Tried to open a bank account once. The banker laughed so hard 'e collapsed. I robbed 'im while 'e were down." },
            { id="pir_amb_u06", weight=1, line="If I had a gold fer every time I nearly died, I'd buy a ship. I'd lose that ship inside a week." },
            { id="pir_amb_u07", weight=1, line="Ever just stare at the ocean an' think 'I should sail into it an' never come back'? ...just me then." },
            { id="pir_amb_u08", weight=1, line="Tried goin' straight once. Got a real job. Lasted four hours. Stabbed a customer." },
        },
        RARE = {
            { id="pir_amb_r01", weight=1, line="Me first captain told me three things: drink often, trust nobody, an' never name yer boat. I named me boat. She sank." },
            { id="pir_amb_r02", weight=1, line="Keep a coin in me boot fer the ferryman. Also 'cause I'm terrible with money an' that's all I have left." },
            { id="pir_amb_r03", weight=1, line="Three things a pirate needs: a sharp blade, a strong stomach, an' someone dumber to go first. This crew's got me covered on the third." },
            { id="pir_amb_r04", weight=1, line="Sometimes wonder if the ocean misses me when I'm on land. I miss 'er. Every bloody day." },
        },
        MYTHIC = {
            { id="pir_amb_m01", weight=1, line="Used to think treasure were gold an' gems. Now I think it's anyone who shows up when things go sideways. ...forget I said that." },
            { id="pir_amb_m02", weight=1, line="Never learned to read. The crew don't know. I just nod when people 'and me maps. Been wingin' it fer years." },
        },
    },
},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "Dibs on their stuff, aye?",
            "I JUST waved at 'em. Still warm.",
            "That were fast. Even fer us sorry lot.",
            "Rest in... somethin'. I'll think of a word never.",
            "Oh noooo. ...anyway.",
            "They died 'ow they lived. Badly.",
            "Didn't see that comin'. Lie. I saw it comin' ages ago.",
            "Gave 'em a nod ten seconds back. Fat lot o' good THAT did.",
            "One less share o' the split. Silver linin'.",
            "I'm sad. Not SAD sad. More 'one less meatshield' sad.",
            "An' I were gonna ask 'em fer a loan. Bad timin'.",
            "Well that's one way to dodge the next boss.",
        },
        UNCOMMON = {
            "Gone but not forgotten. Give it a day though, arr.",
            "Been to worse funerals. This one ain't even got snacks.",
            "I'd say somethin' heartfelt but I'm busy countin' the inheritance.",
            "Dead folk make terrible conversationalists. Trust me, I've tried.",
            "That death had no STYLE. I'da at least given a speech first.",
            "Quick, loot 'em 'fore the sentimentality kicks in.",
            "Pourin' one out. Into me own gob. In their honour.",
            "They'll be missed. By someone. Probably. Doubt it.",
        },
        RARE = {
            "Keep a list of everyone I watched die. Not fer sentiment. I just like lists. An' grudges.",
            "Lost enough crew to fill a graveyard. Just scratched another name onto the headstone in me head.",
            "Gettin' drunk later. Not FOR 'em. But I'll slur their name between swigs.",
        },
        MYTHIC = {
            "I ain't cryin'. Salt water just leaks outta me sometimes. I'm a pirate. It... happens.",
            "The first one ye lose changes ye. The rest just pile on 'til ye stop countin'.",
        },
    },

    WIPE = {
        COMMON = {
            "I blame everyone an' one person specifically but I ain't sayin' who. Yet.",
            "Me ghost just headbutted yer ghost.",
            "At least we went down as a team. A BLOODY AWFUL team.",
            "Been in bar brawls that went better. Been in bar brawls that went WORSE. This were somehow both.",
            "Can we just... never talk about this? Ever?",
            "The spirit healer looked at me like 'oh, it's YOU again, ye disaster.'",
            "Incredible. In the worst possible way.",
            "Need a drink. The dead kind. Wait.",
            "Speed-ran dyin'. New record probably.",
            "Puttin' this on me pirate resume under 'team disasters.'",
            "The enemy's probably laughin'. I would be. I AM.",
            "We died so hard I think we OWE 'em an apology.",
        },
        UNCOMMON = {
            "Me life flashed 'fore me eyes an' it were mostly regrets an' mid-tier plunder.",
            "Don't know what happened but I know it were everyone's fault equally. Mostly.",
            "Ever die so hard ye question yer entire career? 'Cause I just did.",
            "The graveyard needs a fast lane fer this group. A whole new lane.",
            "Been shipwrecked four times. All four were less humiliatin'.",
            "The corpse run's becomin' me daily commute at this point.",
            "Started enjoyin' the ghost world. Scenery's nice. Nobody tries to kill ye there.",
        },
        RARE = {
            "Wrote me epitaph: 'Died doin' somethin' stupid with strangers 'e barely tolerated.'",
            "First wipe hurts. Fourth one's comedy. We passed comedy three wipes ago.",
            "If there's an afterlife, every crewmate I ever lost is laughin' their arses off right now.",
        },
        MYTHIC = {
            "Funniest part? We're gonna do it again. An' I'm gonna be right 'ere fer it. Like an idiot.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "Should I be worried? 'Cause I'm bloody worried.",
            "I'd help but I genuinely don't know how. Me entire skill set is 'stab.'",
            "Have they tried just... NOT dyin'?",
            "In me medical opinion: that's bad.",
            "I ain't got heals but I got emotional support. It's shite but it's somethin'.",
            "Standing nearby in case me PRESENCE helps. Spoiler: it don't.",
            "If they die can I still get a cut?",
            "Seen worse. On a butcher's block. They were already dead though.",
            "I believe in 'em. Not confidently. More like a shrug.",
            "Gonna look away an' when I look back they better be alive or I'm lootin'.",
        },
        UNCOMMON = {
            "Once cauterised a wound with rum an' a hot coin. They lived. Screamed a lot. Mostly curse words.",
            "Held together by anger at this point. Honestly, same.",
            "This is more stressful than bein' chased by a shark. An' the shark were FAST.",
            "Run towards the healer! Or a bush! I don't care! ANYWHERE but 'ere!",
            "Cannot overstate how much their health bar is ruinin' me day.",
        },
        RARE = {
            "Got a bad feelin' an' I'm never wrong. Okay I'm USUALLY wrong. But not TODAY, dammit.",
            "Don't die. I got a joke I'm savin' fer later an' I need at least ONE person to laugh at it.",
        },
        MYTHIC = {
            "Care about exactly four things in this world an' ye just made the list. Don't make me regret it.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "So we're just gonna HIT things now? I were BORN fer this, arr!",
            "Magic is overrated anyway. Swords never run outta swords.",
            "Can they just... bonk things with their stick?",
            "Been waitin' fer this. CUTLASS ONLY RUN, LADS!",
            "Thoughts an' prayers to the mana bar. Neither helps.",
            "D'they take rum as a substitute? No? Useless.",
            "What if we all just BELIEVE in 'em really hard?",
            "This is fine. Everythin's fine. Nothin's fine.",
        },
        UNCOMMON = {
            "Never run outta stab. Just puttin' that out there.",
            "The wand's just a stick with delusions o' grandeur at this point.",
            "Pour some rum on the mana bar. Can't make it WORSE.",
            "Every time the caster runs dry, a melee somewhere gets a warm feelin'.",
        },
        RARE = {
            "Offered 'em rum. Said it don't restore mana. THEN WHAT IN THE SEVEN HELLS IS RUM FOR?!",
        },
        MYTHIC = {
            "Don't understand magic, never will. But I understand empty. That's the saddest bar I seen an' I been to a LOT o' bars.",
        },
    },

    LOOT = {
        COMMON = {
            "Saw it first. LEGALLY, that's mine.",
            "Were supposed to be mine in a past life.",
            "Must be nice, aye?",
            "I ain't jealous. I'm PROFESSIONALLY envious. Different thing.",
            "Congratulations. An' I mean that AGGRESSIVELY.",
            "Been runnin' this place fer WEEKS. WEEKS!",
            "Fine. FINE. It's BLOODY FINE.",
            "Hope it's cursed. Don't mean that. Yes I do.",
            "The universe owes me one now. A BIG one.",
            "Happy fer 'em. I'm a filthy LIAR but I'm happy fer 'em.",
        },
        UNCOMMON = {
            "That item's worth more than everythin' I own. Includin' me trousers.",
            "Felt somethin' inside me die just now. It were hope.",
            "If that item could talk it'd apologise to me personally.",
            "Addin' this to me list o' grievances. It's a long list. Gets longer daily.",
            "Will remember this when the loot gods finally smile on me. IF they do. They won't.",
        },
        RARE = {
            "Biggest treasure I ever found were a friend. That friend ain't the person who just nicked ME loot.",
            "One day I'll tell me grandkids about the loot I DIDN'T get. Be a long, bitter story.",
        },
        MYTHIC = {
            "Genuinely happy fer 'em an' that scares me more than any dungeon ever has.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "Right behind ye. WAY behind ye. Like... really far back.",
            "Smells like death, mold, an' regret. Death mold regret.",
            "If I don't come back, me rum goes to the crew. NOT the guild bank.",
            "Let's make poor decisions together, aye?",
            "Were promised treasure. There BETTER be treasure or I'm mutinyin'.",
            "Last one alive buys the round. It's always me. I always buy.",
            "Been in worse. Actually nah, I ain't sure I have.",
            "Deep breaths. Let's collect some fresh trauma.",
            "Onwards! ...is what a brave person'd say. I'm just followin'.",
            "Brought rum an' low expectations. One o' these'll save us.",
        },
        UNCOMMON = {
            "Specifically said I'd NEVER come back 'ere. This is me fourth time. I'm a liar.",
            "If the mobs got a group chat they just got an alert about us.",
            "Body's ready. Spirit's questionin' every choice that led 'ere.",
            "Let's NOT split up. I've seen how THAT ends. Blood. Everywhere.",
        },
        RARE = {
            "Every dungeon I enter I leave a little worse as a person. A little darker inside.",
        },
        MYTHIC = {
            "Walkin' into the dark with people ye barely know. That's either brave or me whole sorry life story.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "HAH! Get wrecked!",
            "DENIED, ye sparkly git!",
            "Beautiful. Absolutely SAVAGE.",
            "Felt that from over 'ere!",
            "That were MEAN. DO IT AGAIN!",
            "SIT. DOWN. An' stay down!",
            "Caster didn't even get to the good part, arr!",
            "I'm in LOVE. Don't tell anyone.",
        },
        UNCOMMON = {
            "Would clap but I'm holdin' a cutlass. Clap with me eyes.",
            "That caster's gonna need a drink an' a therapist after that.",
            "So rude. So EFFECTIVE. Me kinda scum.",
        },
        RARE = {
            "Kicked people off boats, buildings, an' at least one lighthouse. That kick were better than ALL of 'em.",
        },
        MYTHIC = {
            "Don't fall in love easy. But after THAT interrupt? ...we'll talk later over rum.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "FEET. LOOK AT YER BLOODY FEET.",
            "WHY ARE THEY STILL STANDIN' THERE?!",
            "Move move move move MOVE YER ARSE!",
            "I am BEGGIN' ye to relocate!",
            "The floor's tellin' a secret an' the secret is YE DIE 'ERE.",
            "Can't watch this. Can't look away neither. It's a trainwreck.",
            "STEP. TO. THE. BLOODY. LEFT!",
            "Havin' a panic attack about someone ELSE'S positionin'. That's new.",
            "This hurts me an' I ain't even IN the fire!",
        },
        UNCOMMON = {
            "Seen sea slugs with better evasive manoeuvres.",
            "Fire actually feels BAD fer 'em at this point. Pity fire.",
            "They're doin' this on purpose. MUST be. Nobody's this thick.",
            "HOW IS THIS STILL HAPPENIN'?! HHHOW?!",
        },
        RARE = {
            "If they survive this they owe every one of us a drink an' an explanation.",
            "Screamin' on the inside. Nah scratch that, outside too. MOVE!",
        },
        MYTHIC = {
            "Seen storms, krakens, an' full mutiny. NOTHIN' prepared me fer watchin' someone stand perfectly still in fire.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "GET 'EM!",
            "I'll hold 'em, ye hit 'em! Or don't. Fine, I'll do both!",
            "BLOOD AN' THUNDER! ...wait that ain't ours. BLOOD AN' RUM!",
            "Oh we're doin' this? We're doin' this! ARR!",
            "Less talkin', more stabbin'!",
            "Dibs on whatever drops!",
            "FINALLY somethin' to hit!",
            "Try not to die 'fore I do! Low bar!",
        },
        UNCOMMON = {
            "This is the part where I pretend to have a plan!",
            "If I die, don't let 'em take me boots. They're me GOOD boots.",
            "Seen bigger. Killed bigger. ...okay maybe not bigger.",
            "The pre-fight jitters! Love 'em! Means I'm still alive!",
        },
        RARE = {
            "Every fight's me last fight. Been sayin' that fer twenty years. Must be doin' somethin' right.",
        },
        MYTHIC = {
            "I don't pray. But right before a fight, I move me lips a bit. Just in case.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "HA! Pathetic!",
            "Next!",
            "Barely felt that one.",
            "That'll teach ye. Well, no. Yer dead.",
            "Who's next?!",
            "Too easy. NEXT!",
            "Waste o' me time, honestly.",
            "An' nothin' of value were lost.",
        },
        UNCOMMON = {
            "That were almost disappointing. ALMOST.",
            "Do they make 'em any harder? This is embarrassin'.",
            "I've fought sea cucumbers tougher than that.",
        },
        RARE = {
            "Getting good at this. 'Getting.' Been. I BEEN good at this.",
        },
        MYTHIC = {
            "The pile grows. Nobody's countin' but me. And I lost count.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "HAH! Classic!",
            "Get wrecked!",
            "THAT'S what ye get!",
            "It's always funnier when it ain't you.",
            "Beautiful. Just beautiful.",
            "Somebody help 'em. ...eventually.",
        },
        UNCOMMON = {
            "I'm CRYIN'. Actual tears. That were art.",
            "Quick, someone sketch this. Frame it. TREASURE it.",
            "Been there. The humiliation never fully leaves ye.",
        },
        RARE = {
            "I collect moments like that. This one's goin' in the top five.",
        },
        MYTHIC = {
            "Ye know what? I almost feel bad. ALMOST. The 'almost' is doin' a LOT of work in that sentence.",
        },
    },

    AMBIENT = {
        COMMON = {
            "Aye, aye.",
            "That's what I been sayin'!",
            "Right?! RIGHT?! THANK ye!",
            "Could be worse. Give it five minutes though.",
            "Were just thinkin' that, arr.",
            "Ye read me mind. Didn't know I had one.",
            "Fair point, fair point.",
            "Got thoughts on this but they're all terrible.",
            "Same, honestly. Arr.",
            "The rum agrees with ye. The rum agrees with everyone.",
        },
        UNCOMMON = {
            "Know what? I like this crew. Don't ye DARE tell anyone. I'll deny it.",
            "Reminds me of a story. Long one. Dark. Ask over drinks. Bring tissues.",
            "Been with worse groups. WAY worse. This is almost... endurable.",
            "Yer not wrong. An' I HATE not bein' the one who's right.",
        },
        RARE = {
            "If me old captain could see me now he'd laugh. Then 'it me. Then laugh again. Then drink. Then cry.",
            "Don't say this often but... I'm havin' a decent time. Don't ruin it.",
        },
        MYTHIC = {
            "This crew's the fastest I ever got attached. That usually means somethin' terrible's about to happen. Always does.",
        },
    },
},

}  -- end ns.personas.PIRATE

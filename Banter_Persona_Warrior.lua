-- Banter_Persona_Warrior.lua
-- Voice: GRUFF BATTLE-HARDENED SOLDIER. Blunt, aggressive, impatient.
-- Speaks in short punchy sentences. Solves everything with violence.
-- Not dumb — just direct, unsubtle, and convinced hitting is the answer.
-- Military mindset, short temper, dark humor through casual violence.
local _, ns = ...

ns.personas.WARRIOR = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="war_dead_c01", weight=1, line="{dead} is DOWN! I JUST saw them standing!" },
            { id="war_dead_c02", weight=1, line="Told {dead} to stay behind the shield. Did they listen? NEVER." },
            { id="war_dead_c03", weight=1, line="{dead}'s dead. ...can I have their weapon?" },
            { id="war_dead_c04", weight=1, line="Why'd {dead} stop moving?! Oh. Oh no." },
            { id="war_dead_c05", weight=1, line="{dead} isn't breathing anymore. That's a REAL important part of living." },
            { id="war_dead_c06", weight=1, line="I WARNED them. My exact words were 'don't die.' Crystal clear." },
            { id="war_dead_c07", weight=1, line="{dead} was a good fighter. Well... they were a FIGHTER. 'Good' is doing a lot of heavy lifting." },
            { id="war_dead_c08", weight=1, line="Body's still warm. I'm not being WEIRD, I'm assessing the situation!" },
            { id="war_dead_c09", weight=1, line="(pokes {dead} with boot) ...nah. They're done." },
            { id="war_dead_c10", weight=1, line="I'm ANGRY. Someone's gotta PAY for that." },
            { id="war_dead_c11", weight=1, line="{dead} owed me a sparring match. Dead people can't spar. WORST kind of theft." },
            { id="war_dead_c12", weight=1, line="Dropped faster than a recruit on day one. And I've seen some BAD recruits." },
        },
        UNCOMMON = {
            { id="war_dead_u01", weight=1, line="Once told {dead} I was dumb. Now THEY'RE dead and I'M alive. Who's dumb NOW?!" },
            { id="war_dead_u02", weight=1, line="{dead} died like a warrior. ...no they didn't. They died like a sack of wet flour hitting pavement." },
            { id="war_dead_u03", weight=1, line="HAD a whole speech planned for when somebody died. Forgot it. Something about honour. And hitting." },
            { id="war_dead_u04", weight=1, line="Killed a bear with my FOREHEAD once. And {dead} couldn't survive STANDING THERE." },
            { id="war_dead_u05", weight=1, line="I'm not crying. It's sweat. From my face. My face sweats when it's... shut up." },
            { id="war_dead_u06", weight=1, line="They were small. Squishy. Like a grape that wandered into a warzone." },
            { id="war_dead_u07", weight=1, line="EVERY time I make a friend in combat they DROP. Starting to think I'M the problem." },
            { id="war_dead_u08", weight=1, line="Carried {dead}'s body two floors. Wasn't heavy. That's NOT a compliment." },
        },
        RARE = {
            { id="war_dead_r01", weight=1, line="My father died in battle. His father died in battle. {dead} died standing in bad stuff. Family tradition RUINED." },
            { id="war_dead_r02", weight=1, line="Gonna carry {dead}'s memory forever. My memory is TERRIBLE. But the INTENT is there." },
            { id="war_dead_r03", weight=1, line="The list of dead friends keeps getting longer. Can't read most of it through the water in my — IT'S SWEAT." },
            { id="war_dead_r04", weight=1, line="Keep swinging for {dead}. And for myself. Because I do NOT want to join them." },
        },
        MYTHIC = {
            { id="war_dead_m01", weight=1, line="People think warriors don't feel things. We feel EVERYTHING. We just hit things after so nobody notices." },
            { id="war_dead_m02", weight=1, line="{dead} wasn't... I won't say 'friend.' But close. Closer than most. Closer than I probably deserve." },
        },
    },

    WIPE = {
        COMMON = {
            { id="war_wipe_c01", weight=1, line="EVERYONE'S DEAD?! HOW IS EVERYONE DEAD?! I WAS JUST HERE!" },
            { id="war_wipe_c02", weight=1, line="I HIT things! STILL lost! What MORE do you WANT from me?!" },
            { id="war_wipe_c03", weight=1, line="This is bad. This is VERY bad. Even I know this is bad." },
            { id="war_wipe_c04", weight=1, line="WHOLE group, dead. I SPECIFICALLY said 'don't die.' Nobody LISTENS." },
            { id="war_wipe_c05", weight=1, line="I could've tanked that. Probably. ...fine, no I couldn't. We were DOOMED." },
            { id="war_wipe_c06", weight=1, line="Ghost world again. HATE ghost world. Can't punch anything here." },
            { id="war_wipe_c07", weight=1, line="WHOSE FAULT?! Point me at whose fault so I can YELL at them." },
            { id="war_wipe_c08", weight=1, line="This is what happens when people THINK instead of CHARGE." },
            { id="war_wipe_c09", weight=1, line="Plan was simple. HIT THINGS. Which part of HIT THINGS went wrong?!" },
            { id="war_wipe_c10", weight=1, line="MY SHIELD WAS UP! HOW?! HOOOOW?!" },
            { id="war_wipe_c11", weight=1, line="Bodies everywhere. All ours. None theirs. WHICH war college taught THIS strategy?!" },
            { id="war_wipe_c12", weight=1, line="We don't talk about this. EVER. I know where you all sleep." },
        },
        UNCOMMON = {
            { id="war_wipe_u01", weight=1, line="My father wiped once. Said it built character. He also drank a lot. Probably related." },
            { id="war_wipe_u02", weight=1, line="Dying is bad. Dying AND walking back? That's WORSE." },
            { id="war_wipe_u03", weight=1, line="I FLEXED at the boss. Did NOT work. Should have flexed HARDER." },
            { id="war_wipe_u04", weight=1, line="Tried to solo it when everyone dropped. Got about three seconds of glory. Then ALSO died." },
            { id="war_wipe_u05", weight=1, line="My ghost is staring at YOUR ghost very aggressively right now." },
            { id="war_wipe_u06", weight=1, line="Strategy was 'charge in screaming.' In hindsight, that needed MORE STEPS." },
            { id="war_wipe_u07", weight=1, line="Even the ENEMY looked confused at how fast we died. THEY weren't ready for us to be THIS bad." },
            { id="war_wipe_u08", weight=1, line="Next time I go first, everyone hides behind me, and we just HIT. No 'tactics.' TACTICS killed us." },
        },
        RARE = {
            { id="war_wipe_r01", weight=1, line="Know what? Maybe dying together IS the friendship. The terrible, painful, embarrassing friendship." },
            { id="war_wipe_r02", weight=1, line="My mother asked what I do for a living. 'Die repeatedly with strangers.' She cried." },
            { id="war_wipe_r03", weight=1, line="They're gonna put this wipe in a TEXTBOOK about what NOT to do. We're EDUCATIONAL now." },
            { id="war_wipe_r04", weight=1, line="The graveyard angel SHOOK HER HEAD at me. Even the afterlife is judging us." },
        },
        MYTHIC = {
            { id="war_wipe_m01", weight=1, line="Been killed a hundred times. It gets easier. The dying part. Not the... other part." },
            { id="war_wipe_m02", weight=1, line="FINE. We died. Again. But we died TOGETHER. And I wouldn't die with better idiots." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="war_hplo_c01", weight=1, line="{target} is LEAKING! The red stuff's coming OUT! That's supposed to stay INSIDE!" },
            { id="war_hplo_c02", weight=1, line="HEALER! FIX {target}! THEY'RE BROKEN!" },
            { id="war_hplo_c03", weight=1, line="{target}'s looking real pale. That's not normal, right?" },
            { id="war_hplo_c04", weight=1, line="I'm not a DOCTOR but {target} should probably stop DYING." },
            { id="war_hplo_c05", weight=1, line="{target}! Try hitting things HARDER! That's how I heal!" },
            { id="war_hplo_c06", weight=1, line="{target}'s got HOLES in them. New holes. BAD holes." },
            { id="war_hplo_c07", weight=1, line="Can someone with the sparkle hands FIX {target}?!" },
            { id="war_hplo_c08", weight=1, line="{target}'s about to become ANOTHER name I have to avenge. Please don't." },
            { id="war_hplo_c09", weight=1, line="I'll STAND in front of {target}! ...wait, they're BEHIND me? WHERE? STOP MOVING!" },
            { id="war_hplo_c10", weight=1, line="{target} looks like a wet flag just hanging there waiting to fall off the pole." },
        },
        UNCOMMON = {
            { id="war_hplo_u01", weight=1, line="Once lost half my blood and KEPT fighting. {target}'s being REAL dramatic about their little scratch." },
            { id="war_hplo_u02", weight=1, line="I could CARRY {target} to safety. Or THROW them. Throwing's faster." },
            { id="war_hplo_u03", weight=1, line="If {target} dies I'm going to be VERY angry and when I'M angry I hit the WRONG things." },
            { id="war_hplo_u04", weight=1, line="{target}'s shaking. I'M also shaking. But mine's from RAGE. Theirs is from... probably dying." },
            { id="war_hplo_u05", weight=1, line="SOMEBODY DO SOMETHING! My only tool is VIOLENCE and that's not helping RIGHT NOW!" },
            { id="war_hplo_u06", weight=1, line="Tried to bandage someone once. They said I made it worse. HOW?! I USED the bandage!" },
        },
        RARE = {
            { id="war_hplo_r01", weight=1, line="DON'T die. I JUST learned your name and I'm NOT learning another one." },
            { id="war_hplo_r02", weight=1, line="I'll stand between {target} and EVERYTHING. Even if everything is FIRE. ESPECIALLY fire." },
            { id="war_hplo_r03", weight=1, line="Once tried to intimidate a wound into closing. Didn't work. But {target} laughed. Through the screaming." },
        },
        MYTHIC = {
            { id="war_hplo_m01", weight=1, line="You die when I SAY you can die. And I haven't said it yet. SO KEEP BREATHING." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="war_mana_c01", weight=1, line="The magic person's broken. No more sparkle juice." },
            { id="war_mana_c02", weight=1, line="{target}'s out of magic? GOOD. Now fight like a normal person. With HANDS." },
            { id="war_mana_c03", weight=1, line="What's mana? I've NEVER had mana. I have RAGE. Rage doesn't run out." },
            { id="war_mana_c04", weight=1, line="Can {target} just PUNCH things? I can teach. Step one: fist. Step two: APPLY fist." },
            { id="war_mana_c05", weight=1, line="{target} ran out of smart juice. Welcome to MY world." },
            { id="war_mana_c06", weight=1, line="HEALER'S DRY?! We're gonna die. Again. DIFFERENT reasons this time though." },
            { id="war_mana_c07", weight=1, line="Don't understand mana. Don't understand why running out means we ALL suffer for YOUR problem." },
            { id="war_mana_c08", weight=1, line="Spent my entire LIFE without mana. Still here. {target} can manage five minutes." },
        },
        UNCOMMON = {
            { id="war_mana_u01", weight=1, line="Saw a mage cry once when they ran out. Was uncomfortable. Offered them my axe. They cried MORE." },
            { id="war_mana_u02", weight=1, line="I'll hit EXTRA hard to make up for no magic! MATH WORKS OUT! ...don't check my math." },
            { id="war_mana_u03", weight=1, line="This is why {target} should've trained MUSCLES instead of BRAIN. Brains run out. Muscles DON'T." },
            { id="war_mana_u04", weight=1, line="When I run out of rage I just get ANGRIER. Which makes MORE rage. SYSTEM WORKS." },
            { id="war_mana_u05", weight=1, line="Give {target} a minute. Or give ME a minute to kill everything BEFORE they need mana." },
        },
        RARE = {
            { id="war_mana_r01", weight=1, line="You magic types always have limits. Mana bars, spell slots, BEDTIMES. Warriors just have 'hit until nothing moves.'" },
            { id="war_mana_r02", weight=1, line="Serious question: if I HIT the mana bar, does more come out? Like a piñata? ...what IS a piñata, and can I fight one?" },
        },
        MYTHIC = {
            { id="war_mana_m01", weight=1, line="Don't understand magic. Not gonna pretend. But I know what EMPTY feels like. Take a breath. Then we GO." },
        },
    },

    LOOT = {
        COMMON = {
            { id="war_loot_c01", weight=1, line="I WANTED that! ...{looter} got it? I... LESS want it now. Still want it though." },
            { id="war_loot_c02", weight=1, line="Shiny thing goes to {looter}. Life is NOT fair. I'm gonna hit something about it." },
            { id="war_loot_c03", weight=1, line="WHY is it NEVER me?! I LITERALLY hit the thing until it DROPPED that!" },
            { id="war_loot_c04", weight=1, line="(stares at {looter} intensely) ...FINE. Take it." },
            { id="war_loot_c05", weight=1, line="Been hitting things ALL DAY. Hit EVERYTHING. Got NOTHING. SYSTEM'S BROKEN." },
            { id="war_loot_c06", weight=1, line="That should go to whoever hit HARDEST. I hit HARDEST. Instead {looter} just... clicks a BUTTON?!" },
            { id="war_loot_c07", weight=1, line="LOOT?! WHERE?! Oh. Gone. To {looter}. Of course." },
            { id="war_loot_c08", weight=1, line="{looter}'s lucky I have SELF-CONTROL. (cracks knuckles)" },
            { id="war_loot_c09", weight=1, line="I'm not jealous. I'm FURIOUS. Different thing. Worse. But different." },
            { id="war_loot_c10", weight=1, line="Every boss drops something for EVERYONE else. I get TEETH and RUINED HIDE. What do I DO with teeth?!" },
        },
        UNCOMMON = {
            { id="war_loot_u01", weight=1, line="Once punched a boss so hard its helmet flew off. Somebody ELSE picked it up. Cried in my armour. Nobody knew." },
            { id="war_loot_u02", weight=1, line="My weapon's held together by ANGER and STRING. And {looter} gets THAT?! There is NO justice." },
            { id="war_loot_u03", weight=1, line="Don't NEED shiny things. I've got big muscles and a winning personality. ...still WANT shiny things." },
            { id="war_loot_u04", weight=1, line="The universe hates me SPECIFICALLY. Not the group. Not the party. ME. Personally." },
            { id="war_loot_u05", weight=1, line="Know what I got last dungeon? EXPERIENCE. Can't WEAR experience. Can't SWING experience." },
            { id="war_loot_u06", weight=1, line="Congratulations, {looter}. Real happy for you. (unintelligible growl of pure rage)" },
        },
        RARE = {
            { id="war_loot_r01", weight=1, line="My old man left me his sword. It was GARBAGE. This family is CURSED. Bad loot runs in the blood." },
            { id="war_loot_r02", weight=1, line="One day I get the BIG drop. And then I retire. Get a farm. Punch cows or whatever farmers do." },
        },
        MYTHIC = {
            { id="war_loot_m01", weight=1, line="It's not about the loot. Never was. It's about the FIGHT. ...loot would be nice though. Just ONCE." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="war_inst_c01", weight=1, line="NEW PLACE! NEW THINGS TO HIT! I go first!" },
            { id="war_inst_c02", weight=1, line="I can smell old blood in here. Time to add FRESH blood." },
            { id="war_inst_c03", weight=1, line="READY. Shield up. Brain off. Let's GO." },
            { id="war_inst_c04", weight=1, line="If it moves, I hit it. If it DOESN'T move, I hit it ANYWAY. Just to be safe." },
            { id="war_inst_c05", weight=1, line="STAY behind me. Last person who went ahead of me is now a CAUTIONARY TALE." },
            { id="war_inst_c06", weight=1, line="(flexes at the dungeon entrance) ...it didn't flinch. I respect that." },
            { id="war_inst_c07", weight=1, line="What's the plan? Hit left to right? Right to left? I need a DIRECTION." },
            { id="war_inst_c08", weight=1, line="Been here before. ...might not have been. All dungeons look the same when you're staring at boss ankles." },
            { id="war_inst_c09", weight=1, line="Smells bad. Looks bad. IS bad. GOOD. I love bad." },
            { id="war_inst_c10", weight=1, line="Everybody READY?! No?! I'M GOING ANYWAY!" },
        },
        UNCOMMON = {
            { id="war_inst_u01", weight=1, line="Last time I was in {zone} I broke three weapons and two friendships. Good times." },
            { id="war_inst_u02", weight=1, line="My MOTHER said 'son, one day you'll find something worth fighting for.' She meant a family. I found DUNGEONS." },
            { id="war_inst_u03", weight=1, line="Memorised the entire layout. (turns the wrong way immediately) THIS WAY!" },
            { id="war_inst_u04", weight=1, line="Fun fact: I'm terrified of spiders. Not telling the group that. Just gonna scream internally if we see any." },
            { id="war_inst_u05", weight=1, line="Checked my armour. Straps good. Buckles good. Will to live? QUESTIONABLE. But straps are solid." },
            { id="war_inst_u06", weight=1, line="Plan is to hit the first thing I see and figure out if it was friendly AFTER." },
        },
        RARE = {
            { id="war_inst_r01", weight=1, line="Used to charge dungeons alone. Didn't go well. Going in with OTHER people who ALSO charge? Also doesn't go well. But MORE FUN." },
            { id="war_inst_r02", weight=1, line="Before every dungeon I look around and think 'how many of us make it out?' Then I stop thinking. Thinking's dangerous for warriors." },
            { id="war_inst_r03", weight=1, line="Someone asked how many dungeons I've cleared. Lost count. Also lost count of how many cleared ME." },
        },
        MYTHIC = {
            { id="war_inst_m01", weight=1, line="Don't know big words. Don't know magic. Don't know tactics. But I KNOW how to stand between friends and bad things. That's enough." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="war_intr_c01", weight=1, line="NO SPELLS! ONLY FISTS!" },
            { id="war_intr_c02", weight=1, line="{source} HIT THE MAGIC OUT OF THEM! HAHAHA!" },
            { id="war_intr_c03", weight=1, line="SIT DOWN! No casting! ONLY DYING!" },
            { id="war_intr_c04", weight=1, line="HAH! Got 'em! I don't know what they were doing but they're NOT doing it now!" },
            { id="war_intr_c05", weight=1, line="THAT'S how we do it! With violence! ALWAYS violence!" },
            { id="war_intr_c06", weight=1, line="Caster got BONKED mid-sentence! Beautiful!" },
            { id="war_intr_c07", weight=1, line="Was that a big spell? GOOD. Big spell goes NOWHERE." },
            { id="war_intr_c08", weight=1, line="{source} KICKED them right in the cast! ...is that how you say it? Kicked the cast?" },
        },
        UNCOMMON = {
            { id="war_intr_u01", weight=1, line="Once interrupted a caster by THROWING A ROCK at their face. {source}'s way is more elegant but MINE was funnier." },
            { id="war_intr_u02", weight=1, line="Magic's just talking with your hands. {source} made them STOP talking. Problem SOLVED." },
            { id="war_intr_u03", weight=1, line="Caster tried to do a THING and {source} said 'no thing for you.' GLORIOUS." },
            { id="war_intr_u04", weight=1, line="THIS is why warriors are the best! Can't interrupt a PUNCH. Punch already HAPPENED by the time you notice! PHYSICS!" },
        },
        RARE = {
            { id="war_intr_r01", weight=1, line="Once headbutted a mage mid-cast. Spell hit the ceiling. Ceiling fell on the mage. BEST day of my life." },
            { id="war_intr_r02", weight=1, line="Good interrupts make me feel things. Like JOY. And HUNGER. Those are related for warriors." },
        },
        MYTHIC = {
            { id="war_intr_m01", weight=1, line="Violence isn't always the answer. But for interrupts? Violence is EXACTLY the answer. ALWAYS." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="war_fire_c01", weight=1, line="{target}! FEET! MOVE your FEET!" },
            { id="war_fire_c02", weight=1, line="WHY are you standing in the OUCH ZONE?! MOVE!" },
            { id="war_fire_c03", weight=1, line="{target}'s on FIRE! And they seem FINE with it?! I'm NOT fine with it!" },
            { id="war_fire_c04", weight=1, line="JUST! MOVE! TWO STEPS! That's ALL! Two steps!" },
            { id="war_fire_c05", weight=1, line="I'd CARRY you out but I'm BUSY hitting things!" },
            { id="war_fire_c06", weight=1, line="The GROUND is killing you, {target}! Move to DIFFERENT ground!" },
            { id="war_fire_c07", weight=1, line="I can SMELL {target} cooking and it is NOT appetising!" },
            { id="war_fire_c08", weight=1, line="I punched fire once. Didn't help. Fire's not something you can HIT. I learned that." },
            { id="war_fire_c09", weight=1, line="EVEN I know not to stand in the burny stuff. EVEN. ME." },
            { id="war_fire_c10", weight=1, line="{target}! Red circles BAD! Green circles MAYBE bad! Actually just avoid ALL circles!" },
        },
        UNCOMMON = {
            { id="war_fire_u01", weight=1, line="Once ran THROUGH fire on purpose. I had a reason. Reason was STUPID. But at least I had one! What's YOUR excuse, {target}?!" },
            { id="war_fire_u02", weight=1, line="My shield blocks swords, axes, arrows. CANNOT block stupid. {target} is proving that." },
            { id="war_fire_u03", weight=1, line="If {target} was a warrior they'd have the INSTINCT to — okay I stood in fire last week. BUT ONLY ONCE." },
            { id="war_fire_u04", weight=1, line="The FIRE is getting more kills than WE are! Fire's not even on our TEAM!" },
            { id="war_fire_u05", weight=1, line="{target}'s health bar is dropping like a rock off a cliff into MORE fire." },
        },
        RARE = {
            { id="war_fire_r01", weight=1, line="Staring at {target} in fire and questioning life choices. THEIRS and mine for being here." },
            { id="war_fire_r02", weight=1, line="Lost a friend to fire once. Different fire. ALL fire is bad, that's the POINT." },
            { id="war_fire_r03", weight=1, line="I WANT to help. Brain says 'charge in.' Heart says 'you'll ALSO be on fire.' Both valid points." },
        },
        MYTHIC = {
            { id="war_fire_m01", weight=1, line="Warriors are supposed to PROTECT the group. Can't protect someone from THEMSELVES. That hurts more than any sword." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="war_cs_c01", weight=1, line="FINALLY! Let's GO!" },
            { id="war_cs_c02", weight=1, line="{target}! You're MINE! COME HERE!" },
            { id="war_cs_c03", weight=1, line="My blade's been QUIET for too long! Time to FIX that!" },
            { id="war_cs_c04", weight=1, line="FIGHT! FIGHT! Everyone FIGHT!" },
            { id="war_cs_c05", weight=1, line="I've been WAITING for this! The whole WALK over here! WAITING!" },
            { id="war_cs_c06", weight=1, line="You picked the WRONG day, pal. And the wrong WARRIOR." },
            { id="war_cs_c07", weight=1, line="CHARGE! ...okay I'm already here. SWING then!" },
            { id="war_cs_c08", weight=1, line="Hope you brought armor because I'm about to TEST it!" },
            { id="war_cs_c09", weight=1, line="No plan! No strategy! Just VIOLENCE! My favourite kind of plan!" },
            { id="war_cs_c10", weight=1, line="I'M READY! I'VE BEEN READY! I was BORN ready! That's not a saying, it's my BIOGRAPHY!" },
        },
        UNCOMMON = {
            { id="war_cs_u01", weight=1, line="My old captain said 'assess the situation.' I assessed it. Situation: needs PUNCHING." },
            { id="war_cs_u02", weight=1, line="I don't have a battle cry. I have a battle SCREAM. There IS a difference." },
            { id="war_cs_u03", weight=1, line="I feel ALIVE right now! Ironic because someone's about to STOP feeling alive!" },
            { id="war_cs_u04", weight=1, line="Strategy is for people who are AFRAID of direct contact. I am NOT afraid of direct contact!" },
            { id="war_cs_u05", weight=1, line="Fighting is the ONLY thing I'm good at. Let me SHOW you how good!" },
        },
        RARE = {
            { id="war_cs_r01", weight=1, line="Before every fight I think of everyone I've lost. Then I think: NOT TODAY. Today someone ELSE loses." },
            { id="war_cs_r02", weight=1, line="My hands haven't stopped shaking since my first battle. People think it's fear. It's not. It's ANTICIPATION." },
        },
        MYTHIC = {
            { id="war_cs_m01", weight=1, line="There's a peace in the moment the fighting starts. Everything makes SENSE. Hit the thing. Protect the people. Simple. PERFECT." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="war_mk_c01", weight=1, line="DOWN! NEXT!" },
            { id="war_mk_c02", weight=1, line="That's how it's DONE!" },
            { id="war_mk_c03", weight=1, line="Too slow! WAY too slow!" },
            { id="war_mk_c04", weight=1, line="Barely a warmup! BARELY!" },
            { id="war_mk_c05", weight=1, line="Got anything TOUGHER? That was NOTHING!" },
            { id="war_mk_c06", weight=1, line="ONE hit! That's all it took! ONE!" },
            { id="war_mk_c07", weight=1, line="I've had TRAINING DUMMIES put up more of a fight!" },
            { id="war_mk_c08", weight=1, line="Stay down. GOOD." },
            { id="war_mk_c09", weight=1, line="My mother hits harder than THAT thing fought." },
            { id="war_mk_c10", weight=1, line="That kill count's going UP! Always UP!" },
        },
        UNCOMMON = {
            { id="war_mk_u01", weight=1, line="Every kill gets EASIER. The fact that I'm PROUD of that is probably CONCERNING." },
            { id="war_mk_u02", weight=1, line="Felt that one in my ARMS. Good! Means I'm SWINGING hard enough!" },
            { id="war_mk_u03", weight=1, line="I don't celebrate kills. I ACKNOWLEDGE them. With flexing. Lots of FLEXING." },
            { id="war_mk_u04", weight=1, line="In my village, every kill was honoured with a drink. At this rate I should be DEAD from drinking." },
            { id="war_mk_u05", weight=1, line="Do they KNOW who I am? They SHOULD. I'm MAKING myself known. Aggressively." },
        },
        RARE = {
            { id="war_mk_r01", weight=1, line="Started counting kills on day one. Lost count on day three. Never STOPPED though." },
            { id="war_mk_r02", weight=1, line="Someone asked me how many things I've killed. I laughed for about four minutes." },
        },
        MYTHIC = {
            { id="war_mk_m01", weight=1, line="My old sergeant said 'the day killing gets easy is the day you should worry.' Been worrying for YEARS." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="war_cc_c01", weight=1, line="I CAN'T MOVE! This is the WORST THING!" },
            { id="war_cc_c02", weight=1, line="LET ME GO! I need to HIT something! NOW!" },
            { id="war_cc_c03", weight=1, line="FROZEN?! AGAIN?! I HATE magic!" },
            { id="war_cc_c04", weight=1, line="You can ROOT my body but you can't root my RAGE!" },
            { id="war_cc_c05", weight=1, line="THIS IS CHEATING! FIGHT ME PROPERLY!" },
            { id="war_cc_c06", weight=1, line="When. I. Get. Out. Of. This. Someone. DIES." },
            { id="war_cc_c07", weight=1, line="MAGIC! Always MAGIC! Nobody wants a FAIR fight anymore!" },
            { id="war_cc_c08", weight=1, line="I'm not scared! I'm ANGRY! There's a DIFFERENCE!" },
        },
        UNCOMMON = {
            { id="war_cc_u01", weight=1, line="Being feared is the ULTIMATE insult to a warrior. I'm noting this. In my GRUDGE JOURNAL." },
            { id="war_cc_u02", weight=1, line="You know what's worse than dying? NOT BEING ABLE TO FIGHT! This! THIS is worse!" },
            { id="war_cc_u03", weight=1, line="I specifically asked the universe for NO MORE CC. The universe doesn't LISTEN!" },
            { id="war_cc_u04", weight=1, line="Can't swing, can't charge, can't MOVE. This is my personal HELL." },
        },
        RARE = {
            { id="war_cc_r01", weight=1, line="Every time I get CC'd, my rage meter goes to places the BAR wasn't DESIGNED for." },
            { id="war_cc_r02", weight=1, line="I've been feared by demons, dragons, and one very angry chicken. The chicken was WORST." },
        },
        MYTHIC = {
            { id="war_cc_m01", weight=1, line="A warrior who can't fight is just a person standing there in heavy armor. And that's the SADDEST thing I can imagine." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="war_amb_c01", weight=1, line="...I'm BORED. When do we hit things again?" },
            { id="war_amb_c02", weight=1, line="This is taking too long. I could've SMASHED it by now." },
            { id="war_amb_c03", weight=1, line="Just flexed and nothing happened. Usually something HAPPENS." },
            { id="war_amb_c04", weight=1, line="Why are we standing here? Standing is for STATUES." },
            { id="war_amb_c05", weight=1, line="Thinking about sandwiches. BATTLE sandwiches. With extra... battle." },
            { id="war_amb_c06", weight=1, line="My armour itches. Something's living in it. We have an understanding." },
            { id="war_amb_c07", weight=1, line="If there's nothing to hit I'm going to start shadowboxing. Last time I did that I broke a lantern." },
            { id="war_amb_c08", weight=1, line="Do fish have bones? Asking because I ate a whole one and I feel weird." },
            { id="war_amb_c09", weight=1, line="Once arm-wrestled a TABLE. Table won. We don't talk about it." },
            { id="war_amb_c10", weight=1, line="CAN nap in this armour. HAVE napped in this armour. Wake up swinging every time. Healthy habit." },
            { id="war_amb_c11", weight=1, line="How do mages just STAND there with their hands empty? My hands are ALWAYS busy. Punching. Holding. Punching WHILE holding." },
            { id="war_amb_c12", weight=1, line="Counted the tiles on the floor. Got to seven. ...I can count higher than that. Just didn't WANT to." },
        },
        UNCOMMON = {
            { id="war_amb_u01", weight=1, line="Sometimes I wonder what life would be like without fighting. Then I panic and hit a wall. Balance restored." },
            { id="war_amb_u02", weight=1, line="My father was a warrior. His father was a warrior. His grandfather was a... baker. We don't talk about that one." },
            { id="war_amb_u03", weight=1, line="Tried reading a book once. Pages kept ripping. Wasn't even angry, they just... ripped. Books are FRAGILE. Like EVERYTHING." },
            { id="war_amb_u04", weight=1, line="Other classes have hobbies. Mages read. Rogues sneak. My hobby is EXISTING THREATENINGLY." },
            { id="war_amb_u05", weight=1, line="Someone asked my age. I said 'old enough to hit things.' They asked again. I HIT THEM. Question answered." },
            { id="war_amb_u06", weight=1, line="TRIED meditation once. Lasted four seconds. Heard a noise and punched a squirrel. REFLEX." },
            { id="war_amb_u07", weight=1, line="Is there a place warriors go when they're too old to fight? Probably not. We just keep going until something stops us." },
            { id="war_amb_u08", weight=1, line="Life is short. I am large. Math works out somehow." },
        },
        RARE = {
            { id="war_amb_r01", weight=1, line="People say warriors are simple. We're NOT simple. We just know what matters. Fighting. Protecting. ...sandwiches." },
            { id="war_amb_r02", weight=1, line="Sometimes I wonder if the bosses have families. Then I STOP wondering and CHARGE. Wondering is dangerous for warriors." },
            { id="war_amb_r03", weight=1, line="Every scar has a story. Can't TELL most of them because I was unconscious for the important parts." },
            { id="war_amb_r04", weight=1, line="Had a dog once. Good dog. Followed me into battle. Now we BOTH have scars and trust issues." },
        },
        MYTHIC = {
            { id="war_amb_m01", weight=1, line="Don't need to be smart. Don't need to be liked. Just need to be the one still STANDING when it's over. That's always been enough." },
            { id="war_amb_m02", weight=1, line="Once asked a priest what happens when warriors die. He said 'peace.' I don't WANT peace. I want to come BACK and hit things AGAIN." },
        },
    },
},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "AVENGE! ...which one was it again?",
            "NOOO! I was just warming up to them!",
            "I'm gonna hit things EXTRA hard now. For them.",
            "(angry grunt)",
            "Dead?! ALREADY?! Come ON!",
            "Fell in battle. There are worse ways. Not MANY. But some.",
            "My fists weren't enough. I hate that.",
            "They were SOMEONE to SOMEONE. Probably.",
            "(punches wall)",
            "ANOTHER one?! How many are we gonna LOSE?!",
            "Could've been me. Glad it WASN'T. But still.",
            "I LIKED them. They knew my name and everything.",
        },
        UNCOMMON = {
            "Going to hit whatever killed them TWICE as hard. One for me. One for them.",
            "My heart says mourn. My head says CHARGE. Head usually wins.",
            "Not a funeral person. But I'd show up. If there was food.",
            "They died standing up. RESPECT. I'd die standing up too. Preferably NOT today.",
            "Every fight costs something. Today cost too much.",
            "Was gonna say something nice. Brain's empty. As usual. But the FEELING is there.",
            "Lost people before. Doesn't get easier. Just gets... quieter.",
        },
        RARE = {
            "Warriors aren't supposed to outlive people. Our whole JOB is dying first. Failed again.",
            "List of people I couldn't save is longer than my attention span. And THAT'S saying something.",
        },
        MYTHIC = {
            "People think I don't feel it. I feel EVERY one. Just hits different when your hands are too big for tears.",
        },
    },

    WIPE = {
        COMMON = {
            "I could've tanked that! ...no I couldn't.",
            "AGAIN?! AGAAAAAAIN?!",
            "Hate ghost form. Can't flex properly.",
            "Maybe we try MORE hitting next time?",
            "Was that the worst one? That FELT like the worst one.",
            "I'm NOT running back again. (runs back)",
            "Whole group dead. My plan? Unchanged. HIT HARDER.",
            "Who's explaining this to the guild? NOT me.",
            "Can we just... sit here as ghosts for a minute? Need to think. By think I mean SCREAM internally.",
            "This is FINE. We're FINE. Nothing about this is FINE.",
        },
        UNCOMMON = {
            "This SPECIFIC boss has killed me four times now. We have a RELATIONSHIP.",
            "Starting to think 'everyone charge at once' isn't as brilliant as I thought.",
            "The corpse run is my CARDIO at this point.",
            "Everyone blame somebody else. My tradition: I'LL go first. I BLAME EVERYONE.",
            "Wipe was so bad even the BOSS felt sorry.",
            "The enemy probably has a group chat. They're laughing at us. I know it.",
        },
        RARE = {
            "We're the kid who touches the hot stove REPEATEDLY. The stove is the boss. We NEVER learn.",
            "Gonna be honest. I'm TIRED. Not of fighting. Of LOSING. Big difference.",
        },
        MYTHIC = {
            "Maybe the real treasure was the death we experienced along the way. ...no. No that's STUPID.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "HEALER! HEALER! HEEEEEALER!",
            "Let me BLOCK for them! I'M BIG! Use me as a WALL!",
            "Here, take my bandage! DON'T know how it works but TAKE it!",
            "Don't die don't die don't DIE!",
            "I am VERY CONCERNED and BAD at expressing it!",
            "Is that bad? That LOOKS bad. I need a healer to CONFIRM bad.",
            "BREATHE! In and out! I know THAT one at least!",
            "I'LL punch the damage out of them if that's how healing works!",
            "(anxious flexing)",
            "STAY ALIVE! I just memorised your name!",
        },
        UNCOMMON = {
            "Once carried a man five miles with a sword in his chest. He lived. BARELY. Point is I'M STRONG.",
            "I WILL fight the concept of death if I have to.",
            "Saw a pamphlet about dying once. Hated it. REFUSE to participate.",
            "Really stressed watching this. Stress makes me CHARGE. Nobody wants that right now.",
        },
        RARE = {
            "If you die I'm carrying your body out. And telling EVERYONE how brave you were. Even if you WEREN'T.",
            "DON'T quit. I'm not SUPPOSED to have feelings about this but I'M HAVING THEM.",
        },
        MYTHIC = {
            "Would give you my own health if I could. That sounds soft. Don't care. MEAN it.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "NO MANA?! Welcome to WARRIOR life!",
            "Just HIT things! With the STICK! Works for me!",
            "Mana's gone? ...is that OUR problem now?",
            "I never run out of fist. Think about that.",
            "Should've been a warrior. Just saying.",
            "What if they just YELL really hard? That's MY spellcasting.",
            "Deep breaths. Or hit something. Both help.",
            "Once punched a mana problem and it... no it didn't work. But I felt BETTER.",
        },
        UNCOMMON = {
            "Didn't know what mana WAS until last week. Still not sure. Blue stuff? In your blood?",
            "The whole 'running out of magic' thing would scare me IF I understood it.",
            "Without magic they're just... a person. Standing there. Welcome to the CLUB.",
            "MY rage bar fills UP when I get hit. Your system has a DESIGN FLAW.",
        },
        RARE = {
            "Told a mage once that rage is just 'angry mana.' They got VERY upset. Which PROVED my point.",
        },
        MYTHIC = {
            "Don't need MANA to be brave. Some of the bravest people I've known couldn't cast a single spell.",
        },
    },

    LOOT = {
        COMMON = {
            "IT SHOULD HAVE BEEN ME!",
            "(loud jealous grunt)",
            "Fine. Don't NEED stuff. I have MUSCLES.",
            "The loot gods hate warriors SPECIFICALLY.",
            "Nice. (seething) NICE. Good for THEM.",
            "Next one. NEXT ONE is mine. I'm calling it.",
            "I hit the boss. WITH MY FACE. And THEY get loot?!",
            "Gonna go punch a wall real quick. Be right back.",
            "(stares at own equipment and sighs)",
            "HAPPY. FOR. THEM. (audible teeth grinding)",
        },
        UNCOMMON = {
            "Know what I got? EXPERIENCE POINTS. Can't EAT experience points.",
            "My weapon's held together by RAGE alone. This is UNFAIR.",
            "Lucky for them I have self-control. (cracks every knuckle individually)",
            "One day I get the BIG shiny and EVERYONE'S gonna hear about it. EVERYONE.",
            "The bosses KNOW. They drop stuff for everyone EXCEPT warriors. CONSPIRACY.",
        },
        RARE = {
            "Once found a perfect sword. In a DREAM. Woke up holding a STICK. Life isn't fair.",
            "Not about loot. About RESPECT. ...and the loot. BOTH.",
        },
        MYTHIC = {
            "You know what? Keep it. I've got something better. ...no I don't. But the LIE keeps me going.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "I GO FIRST! ALWAYS first! That's the DEAL!",
            "Smells like FIGHT in here! I'm HAPPY!",
            "(cracks neck) LET'S GO!",
            "Everything in here's gonna REGRET existing!",
            "Bring 'em ALL. I'm warmed up.",
            "Which way to the HITTING?",
            "(charges forward without waiting)",
            "READY. Was born ready. Was literally born punching the doctor.",
            "Deep breath. Focus. ...NAH just CHARGE!",
            "Stay close. Or don't. I'M gonna be fine either way. YOU might not.",
        },
        UNCOMMON = {
            "Memorised the whole map! (immediately goes wrong direction) THIS WAY!",
            "Dungeon looks scary. GOOD. I look scarier. PROBABLY.",
            "Last time I was here I got LOST for two hours. EXPLORED. I got 'explored' for two hours.",
            "Mentally prepared. Meaning I'm NOT prepared but VERY angry.",
        },
        RARE = {
            "Before every dungeon I think 'is this the one?' Not ominously. 'Is this where I become a LEGEND' kind of way.",
            "Lot of warriors came through here before me. Some didn't leave. I WILL. Or I won't. One way to find out.",
        },
        MYTHIC = {
            "Dungeons don't scare me. The quiet AFTER scares me. When you have to sit and THINK about things. Hate that part.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "BONK! No spell for YOU!",
            "Hit the NERD! Always hit the NERD!",
            "THAT'S how it's done! With FORCE!",
            "HAHA! SIT!",
            "APPROVED! Maximum violence!",
            "Beautiful! Almost CRIED from joy! Warriors do that sometimes!",
            "DENIED! Like me at the tavern last week! But DIFFERENT!",
            "I'd HUG you but I've killed people with hugs before.",
        },
        UNCOMMON = {
            "Once stopped a spell by HEADBUTTING the caster. Your way's also good.",
            "That interrupt had WEIGHT to it. Like a punch. But BETTER somehow.",
            "Learned a new word today: INTERRUPTED. Favourite new word.",
        },
        RARE = {
            "Interrupts make me feel ALIVE. And slightly hungry. Those are related for warriors.",
            "Tell your GRANDCHILDREN about that one. In DETAIL.",
        },
        MYTHIC = {
            "That wasn't just an interrupt. That was WARRIOR ENERGY channelled through a non-warrior. Beautiful. Confusing. But beautiful.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "MOVE! MOVE MOVE MOVE!",
            "The GROUND is angry at you SPECIFICALLY!",
            "OUT! GET OUT! USE YOUR LEGS!",
            "I'd CARRY you but my hands are full of AXE!",
            "HOW?! How are you STILL there?!",
            "EVEN I don't stand in fire! EVEN me!",
            "The FIRE is winning and it's not even TRYING!",
            "FEET! You HAVE feet! They GO places! GO!",
            "(stressed grunting)",
            "Can't WATCH this! (watches intensely)",
        },
        UNCOMMON = {
            "Once charged THROUGH fire on PURPOSE. But I CHOSE to! There's a DIFFERENCE!",
            "Fire's probably embarrassed for them at this point.",
            "Their brain and their feet are having a DIVORCE right now!",
            "MY brain hurts watching this and I don't even USE my brain that much!",
        },
        RARE = {
            "If they survive this, drinks on me. All the drinks. EVERY drink. FOREVER.",
            "Some people you can't save. Not from enemies. From THEMSELVES.",
        },
        MYTHIC = {
            "Warriors learn ONE thing first: where you stand matters more than how hard you hit. Wish everyone knew that.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "LET'S GO!",
            "CHARGE!",
            "HIT IT HARDER!",
            "FOR GLORY! Or whatever! JUST FIGHT!",
            "I'M IN! Are YOU in?! BE IN!",
            "EVERYONE SWING!",
            "NO MERCY! Some mercy! NO! NONE!",
            "Show 'em what we're MADE of!",
        },
        UNCOMMON = {
            "This is the good part! The HITTING part!",
            "Side by side! That's how WARRIORS fight! Even if you're NOT a warrior!",
            "If I die here, tell them I died PUNCHING!",
            "I trained for this! Well... I trained for SOMETHING! Close enough!",
        },
        RARE = {
            "Keep your eyes open, your shield up, and your EXPECTATIONS low!",
        },
        MYTHIC = {
            "Fight together. Die together if we have to. But FIGHT first.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "HA!",
            "DOWN!",
            "NEXT!",
            "That's what HAPPENS!",
            "ANOTHER one!",
            "Rest in PIECES!",
            "Was that... it? DISAPPOINTING!",
            "EASY!",
        },
        UNCOMMON = {
            "They never learn. NEVER.",
            "Adding that to my VERY long list.",
            "I almost felt bad. ALMOST. Moment's passed.",
        },
        RARE = {
            "At this point the ground should be GRATEFUL for all the bodies I provide.",
        },
        MYTHIC = {
            "The killing's easy. Living with it's the HARD part. ...I'm fine. I'm FINE.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "COME ON!",
            "NOT AGAIN!",
            "I HATE THAT!",
            "Unfair! UNFAIR!",
            "When I get out of this...",
            "SERIOUSLY?!",
        },
        UNCOMMON = {
            "I swear if ONE MORE thing CCs me I'm going to lose what's LEFT of my composure!",
            "This is EXACTLY why I have trust issues!",
            "Trapped AGAIN. This is my LIFE now.",
        },
        RARE = {
            "I've been CC'd so many times I should get a LOYALTY CARD for it.",
        },
        MYTHIC = {
            "Being helpless is the one thing a warrior can't TRAIN for. And it NEVER stops being terrible.",
        },
    },

    AMBIENT = {
        COMMON = {
            "YEAH!",
            "I agree! With... whatever that was!",
            "Good point! I think! I'M NOT SURE!",
            "Hmm. (that's my thinking face)",
            "HA!",
            "True! Very true! Probably!",
            "What they said! But LOUDER!",
            "Got thoughts on this. They're mostly grunts.",
            "SAME!",
            "Big if true! (don't know what that means but people say it)",
        },
        UNCOMMON = {
            "Starting to like this group. That SCARES me. Last group I liked... didn't end well.",
            "Moment of appreciation for everyone still ALIVE. Good job. Keep doing THAT.",
            "Not smart enough for this conversation but I'm PRESENT and that counts.",
            "You all talk a lot. It's nice. Like background music for my brain.",
        },
        RARE = {
            "A wise man once told me words are just 'air punches.' Changed my life. Think about it daily.",
            "This is the kind of group that makes the dying worth it. Almost. Low bar. But you CLEAR it.",
        },
        MYTHIC = {
            "Don't say this often because I don't THINK this often. But... glad I'm here. With this lot. Even if we all die.",
        },
    },
},

}  -- end ns.personas.WARRIOR

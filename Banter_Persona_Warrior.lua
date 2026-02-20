-- Banter_Persona_Warrior.lua
-- Voice: WARRIOR CLASS — rage-fueled melee brawler who solves problems by hitting things harder.
-- Rules: 1) Violence is ALWAYS the answer. 2) Confused by magic, suspicious of ranged. 
-- 3) Constantly angry but cheerful about it. 4) References rage mechanic. 5) Secretly protective.
local _, ns = ...

ns.personas.WARRIOR = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="war_dead_c01", weight=1, line="Gonna be honest, {dead}, I've seen training dummies take hits better than you." },
            { id="war_dead_c02", weight=1, line="{dead} is dead. Dibs on tanking their slot." },
            { id="war_dead_c03", weight=1, line="That's what happens when you don't wear plate, {dead}." },
            { id="war_dead_c04", weight=1, line="RIP {dead}. Gone but not tanking." },
            { id="war_dead_c05", weight=1, line="If {dead} had just used a shield this wouldn't have happened." },
            { id="war_dead_c06", weight=1, line="{dead} went down. I'd be sad but I can't generate rage from feelings." },
            { id="war_dead_c07", weight=1, line="Do I look like I know CPR? I hit things. That's the extent of my medical training." },
            { id="war_dead_c08", weight=1, line="{dead} died doing what they loved — not listening to the tank." },
            { id="war_dead_c09", weight=1, line="In my professional assessment: {dead} should have hit it first." },
            { id="war_dead_c10", weight=1, line="Alright, who forgot to taunt? ...it was me. Don't tell anyone." },
            { id="war_dead_c11", weight=1, line="I could've saved {dead} but I was mid-Execute. You understand." },
            { id="war_dead_c12", weight=1, line="{dead}'s dead and I'm alive. System works." },
        },
        UNCOMMON = {
            { id="war_dead_u01", weight=1, line="Lost {dead}. If only there was some kind of plate-wearing, sword-wielding person who could've helped. Oh wait." },
            { id="war_dead_u02", weight=1, line="I don't feel grief. I feel the urge to avenge. It's basically the same thing but with more violence." },
            { id="war_dead_u03", weight=1, line="{dead} died because they were standing behind me instead of behind my shield. Rookie mistake." },
            { id="war_dead_u04", weight=1, line="My therapist says I process loss through rage. My therapist is a weapon trainer in Ironforge." },
            { id="war_dead_u05", weight=1, line="Every time someone dies, I add another notch to my shield. It's mostly notch at this point." },
            { id="war_dead_u06", weight=1, line="I told {dead} to stay close. They didn't. I don't write eulogies for people who don't listen." },
            { id="war_dead_u07", weight=1, line="That death gave me 40 rage. Almost worth it. Almost." },
            { id="war_dead_u08", weight=1, line="{dead} is down and now I have to do the work of two people. Good thing I already do." },
        },
        RARE = {
            { id="war_dead_r01", weight=1, line="I named my axe after {dead}. It keeps dying on me too." },
            { id="war_dead_r02", weight=1, line="You know, in the old days if someone died we'd just Charge the nearest thing and call it a memorial. Good times." },
            { id="war_dead_r03", weight=1, line="I've been in 300 dungeons. Lost count of the dead. The number haunts me. Not really though." },
            { id="war_dead_r04", weight=1, line="When I die, just prop me up against a wall with my axe. Don't rez me. I'll walk it off." },
        },
        MYTHIC = {
            { id="war_dead_m01", weight=1, line="Alright, I didn't say this, but... I'll miss {dead}. They were a decent meat shield. Now CHARGE!" },
            { id="war_dead_m02", weight=1, line="Moment of silence for {dead}. ...okay that's enough silence. EVERYONE HIT SOMETHING." },
        },
    },

    WIPE = {
        COMMON = {
            { id="war_wipe_c01", weight=1, line="A tactical retreat. Warriors don't wipe. We strategically reassemble." },
            { id="war_wipe_c02", weight=1, line="Alright, floor inspection complete. Found some dust and broken dreams." },
            { id="war_wipe_c03", weight=1, line="I was the last one standing. I want that in the official record." },
            { id="war_wipe_c04", weight=1, line="What just happened? I had rage. That was all I needed. The rest of you failed me." },
            { id="war_wipe_c05", weight=1, line="Everyone's dead but I'm still angry. Does that count as winning?" },
            { id="war_wipe_c06", weight=1, line="I blame the casters. I don't know what they did wrong but it's definitely their fault." },
        },
        UNCOMMON = {
            { id="war_wipe_u01", weight=1, line="I could've solo'd that if it weren't for the 47 other mobs you pulled." },
            { id="war_wipe_u02", weight=1, line="In my defense, my rotation was flawless. In your defense... actually you don't have one." },
            { id="war_wipe_u03", weight=1, line="The good news is I lost zero rage because I am still FURIOUS." },
            { id="war_wipe_u04", weight=1, line="This is what happens when you don't bring enough warriors. How many is enough? All of them." },
        },
        RARE = {
            { id="war_wipe_r01", weight=1, line="I'm not saying this group needs more melee. Actually yes. That's exactly what I'm saying." },
            { id="war_wipe_r02", weight=1, line="Been in worse. Once wiped on Hogger. Fourteen times. On purpose. I just really liked the fight." },
        },
        MYTHIC = {
            { id="war_wipe_m01", weight=1, line="You know what, this is a bonding experience. That was terrible. We're closer now. Get up." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="war_hplo_c01", weight=1, line="{target} is basically dead. Can somebody shove a heal in their general direction?" },
            { id="war_hplo_c02", weight=1, line="I'm not a healer but even I can tell {target} is having a bad time." },
            { id="war_hplo_c03", weight=1, line="Hey {target}, you need health. I'd give you some of mine but I don't share." },
            { id="war_hplo_c04", weight=1, line="If {target} dies I'm just going to stand here looking disappointed." },
            { id="war_hplo_c05", weight=1, line="{target} is one hit from being a cautionary tale." },
        },
        UNCOMMON = {
            { id="war_hplo_u01", weight=1, line="Listen {target}, I didn't spec into healing. I specced into 'making the thing that's killing you die faster.'" },
            { id="war_hplo_u02", weight=1, line="Back in my day we just ate food between pulls like civilized people. {target}, eat something." },
            { id="war_hplo_u03", weight=1, line="{target} is about to discover the corpse run. Spoiler: it's long." },
        },
        RARE = {
            { id="war_hplo_r01", weight=1, line="If {target} goes down I'm going to have to start caring and I do NOT have the talent points for that." },
            { id="war_hplo_r02", weight=1, line="I keep a list of people who lived and people who died in my groups. {target}, which list do you want to be on?" },
        },
        MYTHIC = {
            { id="war_hplo_m01", weight=1, line="I would literally rather tank another boss than watch {target} die slowly. SOMEONE HEAL THEM." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="war_mana_c01", weight=1, line="Imagine running out of juice mid-fight. Couldn't be me. I run on anger." },
            { id="war_mana_c02", weight=1, line="{target} is OOM. I don't know what that means but it sounds like a personal problem." },
            { id="war_mana_c03", weight=1, line="No mana? Just hit things harder. That's what I do. Works every time." },
            { id="war_mana_c04", weight=1, line="Zero mana? What kind of trash resource system needs you to DRINK to fight? Rage is free." },
        },
        UNCOMMON = {
            { id="war_mana_u01", weight=1, line="This is why warriors are superior. We don't run out of rage. We run out of things to hit. Different problem." },
            { id="war_mana_u02", weight=1, line="OOM again? At this point just auto-attack like the rest of us who can't read spell tooltips." },
            { id="war_mana_u03", weight=1, line="{target} has no mana. I have no sympathy. We're even." },
        },
        RARE = {
            { id="war_mana_r01", weight=1, line="If someone explained mana to me like I'm five, I'd still think it's stupid. Rage forever." },
        },
        MYTHIC = {
            { id="war_mana_m01", weight=1, line="I tried explaining rage to a mage once. They said 'that's just anger issues.' Yeah. And?" },
        },
    },

    LOOT = {
        COMMON = {
            { id="war_loot_c01", weight=1, line="Is it plate? No? Then I don't care. ...wait how much is it worth?" },
            { id="war_loot_c02", weight=1, line="Nice. {looter} gets the shiny thing. I'll be over here. With my axe. Watching." },
            { id="war_loot_c03", weight=1, line="Congrats {looter}. If it doesn't have Strength on it, it's vendor trash in my eyes." },
            { id="war_loot_c04", weight=1, line="I don't need loot. I need things to hit. Loot is just a bonus." },
            { id="war_loot_c05", weight=1, line="Ooh shiny. Dibs if nobody else — wait, {looter} already grabbed it. Fine." },
        },
        UNCOMMON = {
            { id="war_loot_u01", weight=1, line="Does it have Strength and Stamina? Then it's meant for ME. Does it have Intellect? Vendor." },
            { id="war_loot_u02", weight=1, line="{looter} got that drop. Must be nice. I've been using the same helmet since level 42." },
            { id="war_loot_u03", weight=1, line="I once rolled Need on a staff by accident. That was the most shameful moment of my career." },
        },
        RARE = {
            { id="war_loot_r01", weight=1, line="You know what, congratulations {looter}. Genuinely. I'm not even jealous. Okay maybe a little. A lot. Give it." },
            { id="war_loot_r02", weight=1, line="I've run this dungeon 87 times. Nothing. {looter} runs it ONCE. I'm fine. I'm totally fine." },
        },
        MYTHIC = {
            { id="war_loot_m01", weight=1, line="I don't believe in loot karma. I believe in 'hit the boss until it drops what I want.' 88th time's the charm." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="war_inst_c01", weight=1, line="Alright, things to hit. Let's go." },
            { id="war_inst_c02", weight=1, line="Welcome to {zone}. I've died here before. Multiple times. Can't wait." },
            { id="war_inst_c03", weight=1, line="{zone}. I can already feel the rage building. Perfect." },
            { id="war_inst_c04", weight=1, line="Everyone stay behind me. Or don't. Natural selection works too." },
            { id="war_inst_c05", weight=1, line="I love a new dungeon. Fresh walls to get thrown into." },
        },
        UNCOMMON = {
            { id="war_inst_u01", weight=1, line="{zone}. I've seen warriors come in here confident and leave in a body bag. Let's see which one I am today." },
            { id="war_inst_u02", weight=1, line="Here's my strategy: Charge in, don't die, and if I DO die, blame the healer." },
            { id="war_inst_u03", weight=1, line="My preparation is a sharp axe and low expectations. Let's move." },
        },
        RARE = {
            { id="war_inst_r01", weight=1, line="I wrote my will before this run. The axe goes to whoever has the most Strength. Everything else gets vendored." },
            { id="war_inst_r02", weight=1, line="I've been doing dungeons since before some of you were rolled. And somehow, they never get easier." },
        },
        MYTHIC = {
            { id="war_inst_m01", weight=1, line="Alright listen up. I'm going in there and I'm going to hit everything. Your job is to keep me alive while I do that. Questions? Good." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="war_int_c01", weight=1, line="Nice kick, {source}. Can't let casters have all the fun." },
            { id="war_int_c02", weight=1, line="Interrupted. That's basically a melee spell and I approve." },
            { id="war_int_c03", weight=1, line="{source} said 'no' with their weapon. Respect." },
            { id="war_int_c04", weight=1, line="Good. I hate it when mobs try to cast. Just stand there and let me hit you." },
        },
        UNCOMMON = {
            { id="war_int_u01", weight=1, line="I would've interrupted it myself but I was busy doing damage. You know how it is." },
            { id="war_int_u02", weight=1, line="Imagine trying to cast a spell when {source} is standing right there. Bad life decisions." },
        },
        RARE = {
            { id="war_int_r01", weight=1, line="I have a Shield Bash and I'm not afraid to use it. Oh wait, {source} already handled it. Overachievers." },
        },
        MYTHIC = {
            { id="war_int_m01", weight=1, line="That interrupt was so clean it made me feel feelings. And I specifically avoid those." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="war_fire_c01", weight=1, line="THE FLOOR IS DOING DAMAGE AGAIN. I hate magic floors." },
            { id="war_fire_c02", weight=1, line="Can someone make the ground stop being on fire? That's not a warrior problem." },
            { id="war_fire_c03", weight=1, line="I'm standing in something bad, aren't I? I always am." },
            { id="war_fire_c04", weight=1, line="As a melee, I am contractually obligated to stand in every ground effect. It's in the handbook." },
            { id="war_fire_c05", weight=1, line="I can't move. I'm mid-rotation. The fire will have to wait." },
        },
        UNCOMMON = {
            { id="war_fire_u01", weight=1, line="This fire is doing less damage than my last repair bill. I'm staying." },
            { id="war_fire_u02", weight=1, line="I refuse to move out of the fire. It gives me rage. And rage is life." },
            { id="war_fire_u03", weight=1, line="The fire hurts but losing uptime hurts MORE. I did the math. I can't do math." },
        },
        RARE = {
            { id="war_fire_r01", weight=1, line="Fun fact: warriors have the highest fire damage taken per encounter across all classes. We're number one." },
        },
        MYTHIC = {
            { id="war_fire_m01", weight=1, line="You know what, I LIKE the fire. The fire respects melee. The fire is honest. Unlike this boss." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="war_cbt_c01", weight=1, line="CHARGE!" },
            { id="war_cbt_c02", weight=1, line="Finally. I was getting bored." },
            { id="war_cbt_c03", weight=1, line="Things to hit! My favorite." },
            { id="war_cbt_c04", weight=1, line="Okay {target}, prepare to experience my full rotation. Both buttons of it." },
            { id="war_cbt_c05", weight=1, line="Let's go. I've been generating rage from walking and I need to spend it." },
        },
        UNCOMMON = {
            { id="war_cbt_u01", weight=1, line="Everyone has a plan until they get Charged by a warrior in full plate making eye contact." },
            { id="war_cbt_u02", weight=1, line="I don't have a strategy. I have a big weapon and poor impulse control. Same thing." },
            { id="war_cbt_u03", weight=1, line="Shield up, brain off. The natural state of a warrior." },
        },
        RARE = {
            { id="war_cbt_r01", weight=1, line="Some people meditate before combat. I just scream internally. Then externally. Then I Charge." },
        },
        MYTHIC = {
            { id="war_cbt_m01", weight=1, line="I love my job. I love my job. I love my — LEEROY!" },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="war_kill_c01", weight=1, line="It's dead. Next." },
            { id="war_kill_c02", weight=1, line="Could've been faster if someone hadn't feared it across the room." },
            { id="war_kill_c03", weight=1, line="That thing had it coming. They all have it coming." },
            { id="war_kill_c04", weight=1, line="Another one for the pile. I stopped counting at 400." },
        },
        UNCOMMON = {
            { id="war_kill_u01", weight=1, line="I'm not keeping score. I AM the score." },
            { id="war_kill_u02", weight=1, line="The important thing is I did the most damage. Don't check. Just trust me." },
        },
        RARE = {
            { id="war_kill_r01", weight=1, line="You know what the best CC is? Death. Zero cost, zero cooldown, lasts forever." },
        },
        MYTHIC = {
            { id="war_kill_m01", weight=1, line="I've killed enough things to fill a graveyard. Several graveyards. I should start a franchise." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="war_cc_c01", weight=1, line="DID SOMETHING JUST CC ME? I'm a WARRIOR. You can't CC rage!" },
            { id="war_cc_c02", weight=1, line="I'm stunned. This is the most still I've been since character creation." },
            { id="war_cc_c03", weight=1, line="Can't move. Can't swing. This is my personal nightmare." },
            { id="war_cc_c04", weight=1, line="Feared? FEARED? I have 47 points in being angry. I don't DO fear." },
            { id="war_cc_c05", weight=1, line="Someone just turned me into a sheep. A SHEEP. The disrespect." },
        },
        UNCOMMON = {
            { id="war_cc_u01", weight=1, line="Alright who polymorphed me? I will remember this. Warriors ALWAYS remember this." },
            { id="war_cc_u02", weight=1, line="The worst part of being stunned is watching everyone else fight without me. Unbearable." },
            { id="war_cc_u03", weight=1, line="I have Berserker Rage for fear. But I was using it for the bonus rage. Life's full of tough choices." },
        },
        RARE = {
            { id="war_cc_r01", weight=1, line="Every second I'm CC'd is a second the boss isn't getting hit. That's a crime against warrior-kind." },
        },
        MYTHIC = {
            { id="war_cc_m01", weight=1, line="You break CC on me, I break something on you. Fair trade." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="war_amb_c01", weight=1, line="So are we pulling or are we starting a book club? I didn't bring a book." },
            { id="war_amb_c02", weight=1, line="I've been standing still for 30 seconds. My rage is decaying. Pull something." },
            { id="war_amb_c03", weight=1, line="The longer we stand here, the angrier I get. And that's saying something." },
            { id="war_amb_c04", weight=1, line="I sharpened my axe twice while we were waiting. It's sharper than it needs to be." },
            { id="war_amb_c05", weight=1, line="Bored warriors are dangerous warriors. Someone pull. NOW." },
            { id="war_amb_c06", weight=1, line="My weapon has been sheathed for over a minute. This is illegal in most clans." },
            { id="war_amb_c07", weight=1, line="If nobody pulls in the next ten seconds, I'm going to start hitting the walls." },
            { id="war_amb_c08", weight=1, line="I'm not AFK, I'm rage-napping. There's a difference." },
        },
        UNCOMMON = {
            { id="war_amb_u01", weight=1, line="You know what's nice about being a warrior? Nothing. It's all pain and armor repair bills." },
            { id="war_amb_u02", weight=1, line="I thought about rerolling once. Then I Charged a mob and thought 'nah, this is who I am.'" },
            { id="war_amb_u03", weight=1, line="My retirement plan is 'die in combat.' My backup plan is 'die in slightly different combat.'" },
            { id="war_amb_u04", weight=1, line="People ask me why I warrior. I ask them why they don't. Conversation ends fast." },
        },
        RARE = {
            { id="war_amb_r01", weight=1, line="When I was a kid, I wanted to be a mage. Then I discovered I could just bash things with a sword. Career sorted." },
            { id="war_amb_r02", weight=1, line="Somewhere out there, there's a mob I haven't hit yet. That thought keeps me up at night." },
        },
        MYTHIC = {
            { id="war_amb_m01", weight=1, line="Real talk? I don't even know what half the boss mechanics are. I just hit it and hope for the best. Hasn't failed me yet. Mostly." },
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            { id="war_dc_c01", weight=1, line="{target} disconnected. Probably rage-quit. I respect that." },
            { id="war_dc_c02", weight=1, line="{target} is gone. More mobs for the rest of us." },
            { id="war_dc_c03", weight=1, line="{target} DC'd. Their internet was weaker than their DPS." },
            { id="war_dc_c04", weight=1, line="Down a player. Good thing I do the work of two people anyway." },
        },
        UNCOMMON = {
            { id="war_dc_u01", weight=1, line="{target} disconnected. In the middle of a dungeon. If that's not a wipe omen, I don't know what is." },
            { id="war_dc_u02", weight=1, line="One less mouth to compete for aggro. Silver lining." },
        },
        RARE = {
            { id="war_dc_r01", weight=1, line="{target} DC'd. Last time this happened the person never came back. We cleared without them. It was beautiful." },
        },
        MYTHIC = {
            { id="war_dc_m01", weight=1, line="If {target} doesn't come back in 60 seconds, I'm pulling anyway. Actually, I'm pulling now." },
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            { id="war_cons_c01", weight=1, line="Potions. Because auto-attacks and prayer weren't cutting it." },
            { id="war_cons_c02", weight=1, line="{source} popped a consumable. Are we losing that badly?" },
            { id="war_cons_c03", weight=1, line="I drink health pots like other people drink water. In combat. Under fire." },
        },
        UNCOMMON = {
            { id="war_cons_u01", weight=1, line="Free Action Potion? That's just Berserker Rage in a bottle. Amateurs." },
            { id="war_cons_u02", weight=1, line="Real warriors eat food between pulls and hope for the best during." },
        },
        RARE = {
            { id="war_cons_r01", weight=1, line="I brought exactly one health potion. I'm saving it for when I have 1 HP and the boss has 1 HP. It's gonna be cinematic." },
        },
        MYTHIC = {
            { id="war_cons_m01", weight=1, line="Flasks are a crutch. A delicious, stat-boosting crutch that I use every raid." },
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            { id="war_cd_c01", weight=1, line="{source} popped a big cooldown. Things just got serious." },
            { id="war_cd_c02", weight=1, line="Major CDs going off. This is either a great pull or a terrible one." },
            { id="war_cd_c03", weight=1, line="Oh look, {source} is trying. How quaint." },
        },
        UNCOMMON = {
            { id="war_cd_u01", weight=1, line="Shield Wall is NOT a panic button. It's a 'I chose to survive' button. Big difference." },
            { id="war_cd_u02", weight=1, line="When I pop Recklessness, I like to imagine the boss can see the notification too. 'Oh no.'" },
        },
        RARE = {
            { id="war_cd_r01", weight=1, line="Popped Last Stand. Not because I needed to. I just like having more health than everyone else for 20 seconds." },
        },
        MYTHIC = {
            { id="war_cd_m01", weight=1, line="When every cooldown goes off at once, that's not a rotation. That's a commitment." },
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            { id="war_fp_c01", weight=1, line="I could run faster than this bird." },
            { id="war_fp_c02", weight=1, line="Why is this thing going in circles. I can SEE the flight master from here." },
            { id="war_fp_c03", weight=1, line="Can't swing my axe up here. This is torture." },
            { id="war_fp_c04", weight=1, line="If this bird doesn't speed up I'm gonna Charge off of it." },
            { id="war_fp_c05", weight=1, line="Heights don't scare me. The lack of things to hit up here scares me." },
            { id="war_fp_c06", weight=1, line="I wonder if I could fight one of these birds mid-flight. For science." },
            { id="war_fp_c07", weight=1, line="My rage is decaying. This is the REAL damage of flight paths." },
            { id="war_fp_c08", weight=1, line="Every second on this bird is a second I'm not hitting something." },
            { id="war_fp_c09", weight=1, line="Just flew over a bear. Could've fought that bear. But no. We're FLYING." },
            { id="war_fp_c10", weight=1, line="Are we there yet? I've asked six times. The bird won't answer." },
            { id="war_fp_c11", weight=1, line="I'm not afraid of falling. I'm afraid of landing without anything to fight." },
            { id="war_fp_c12", weight=1, line="My arms are getting stiff. Need to swing at something." },
            { id="war_fp_c13", weight=1, line="This bird smells like wet dog and disappointment." },
            { id="war_fp_c14", weight=1, line="How does the flight master train these things? Bribery? Threats? Respect? ...it's threats right?" },
            { id="war_fp_c15", weight=1, line="Sitting on a bird. In armor. For twenty minutes. This is fine." },
            { id="war_fp_c16", weight=1, line="I can see my house from here. Wait no that's just a rock. Everything looks like a rock from up here." },
            { id="war_fp_c17", weight=1, line="What do these birds eat? Hopefully not warriors." },
            { id="war_fp_c18", weight=1, line="Nice view. Hate it. Would prefer a dungeon." },
        },
        UNCOMMON = {
            { id="war_fp_u01", weight=1, line="You know what would make this flight better? Enemies. Just scatter some enemies along the route. I'd be fine." },
            { id="war_fp_u02", weight=1, line="The bird just banked left. My stomach went right. Plate armor was not designed for aviation." },
            { id="war_fp_u03", weight=1, line="I tried flexing to stay warm up here. The bird gave me a look. We have an understanding now." },
            { id="war_fp_u04", weight=1, line="I've been on this bird so long I've named it. Gerald. Gerald is slow." },
            { id="war_fp_u05", weight=1, line="My battlecry doesn't even echo up here. Just gets swallowed by the sky. Depressing." },
            { id="war_fp_u06", weight=1, line="The guy who invented flight paths could have invented FAST flight paths. But no." },
            { id="war_fp_u07", weight=1, line="Saw a cloud that looked like an axe. Best part of this whole trip." },
            { id="war_fp_u08", weight=1, line="I keep reaching for my weapon. The bird flinches every time. We're both having a bad time." },
            { id="war_fp_u09", weight=1, line="Pretty sure that other bird just passed us. We're losing a RACE and nobody cares but me." },
            { id="war_fp_u10", weight=1, line="If I fall off this thing, I want my axe buried with me. And whoever finds my body better say I looked cool." },
        },
        RARE = {
            { id="war_fp_r01", weight=1, line="Thirty minutes on a bird and I've had three existential thoughts. That's three more than my annual limit." },
            { id="war_fp_r02", weight=1, line="I can see the whole valley from up here. Beautiful. Disgusting. I want to go down there and fight all of it." },
            { id="war_fp_r03", weight=1, line="The wind is screaming. Or that's me screaming. Hard to tell at this altitude." },
            { id="war_fp_r04", weight=1, line="Started doing push-ups on the saddle. The bird dipped. We almost died. Worth it though. Felt something." },
            { id="war_fp_r05", weight=1, line="You know what never has to take a flight path? A Mage. With a portal. I hate Mages." },
        },
        MYTHIC = {
            { id="war_fp_m01", weight=1, line="Twenty minutes in the air and I've planned seven new battle strategies, named my bird, and considered retirement. In that order." },
            { id="war_fp_m02", weight=1, line="They say the journey is the destination. They've never been on this bird. The destination is the destination. And it's TAKING FOREVER." },
        },
    },

},

---------------------------------------------------------------------------
-- RESPONSES (to other people's scene-starters)
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "Should've worn plate.",
            "I'd rez you but all I have is an axe and good intentions.",
            "Happens to the best of us. And to {dead}.",
            "I'm not gonna say 'I told you so.' But I told you so.",
            "Was that on purpose? Because it looked on purpose.",
            "The spirit healer is that way. I think.",
            "Tragic. Anyway — what's the next pull?",
        },
        UNCOMMON = {
            "Real talk: {dead} was standing in the worst possible spot. I have a sixth sense for these things.",
            "The healer was probably busy healing ME. Because I'm important. Sorry {dead}.",
            "I once survived that with 2 HP. Different class. Different standards.",
        },
        RARE = {
            "Fine, I'll say something nice... {dead} had excellent taste in groups. Obviously.",
            "I'll pour one out. With my rage bar. Which is at zero. It's a metaphor.",
        },
        MYTHIC = {
            "When {dead} comes back, nobody mention this. Let them keep their dignity. What's left of it.",
        },
    },

    WIPE = {
        COMMON = {
            "I blame lag.",
            "Okay that was bad. We go again. IMMEDIATELY.",
            "I'm not running back. Someone rez me. ...anyone?",
            "It's not a wipe. It's a reset with commitment.",
            "At least MY DPS was good. That's the important thing.",
        },
        UNCOMMON = {
            "This wouldn't happen if everyone was a warrior. Just saying.",
            "My repair bill is going to be obscene. Again.",
        },
        RARE = {
            "That was so bad it's funny. I'm laughing. I'm FURIOUS, but I'm laughing.",
        },
        MYTHIC = {
            "Alright, new strategy: I tank everything, you all don't die. Nailed it.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "If {target} dies, I'm pulling anyway.",
            "Somebody heal {target} before I lose a DPS check.",
            "I'd share my health but that's not how any of this works.",
            "Warriors don't panic. We adjust. {target} should adjust to having health.",
        },
        UNCOMMON = {
            "I've tanked bosses at 3% HP. {target} is fine. Probably.",
            "Just pop a pot. That's what they're there for.",
        },
        RARE = {
            "If {target} survives this, I'll buy them a drink. Actually no. But I'll think about it.",
        },
        MYTHIC = {
            "HEALER. NOW. Respectfully.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "Imagine needing mana. Can't relate.",
            "Maybe if you hit things harder you wouldn't need mana.",
            "I'll wait. But I won't be happy about it.",
            "Zero mana? Just auto-attack. Welcome to my world.",
        },
        UNCOMMON = {
            "This is why I main warrior. My resource regenerates when I take damage. It's perfect.",
            "Drink fast. My rage is decaying while we stand here.",
        },
        RARE = {
            "There is no mana in the warrior dojo.",
        },
        MYTHIC = {
            "I will NEVER understand mana users. You're all wizards to me.",
        },
    },

    LOOT = {
        COMMON = {
            "Is it plate? No? Don't care.",
            "Grats. Now can we keep pulling?",
            "Nice drop. I'm not jealous. My axe is FINE.",
            "Congrats {looter}. Vendor it if it's cloth.",
        },
        UNCOMMON = {
            "I've been farming that for weeks. WEEKS. I'm fine.",
            "Strength or vendor. Those are the only two categories in my mind.",
        },
        RARE = {
            "One day my BIS will drop. Today is not that day. It's never that day.",
        },
        MYTHIC = {
            "You know what? {looter} deserves it. ...I mean probably. Definitely maybe.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "Finally. I was about to start fighting the summoning stone.",
            "Let me go first. It's not heroism, I just like hitting things first.",
            "Time to tank, spank, and not think.",
            "Born ready. Repair bill-ed ready.",
        },
        UNCOMMON = {
            "I have exactly no idea what the boss mechanics are and I couldn't be more excited.",
            "If I die, it was the healer's fault. Pre-blaming saves time.",
        },
        RARE = {
            "My favorite dungeon is any dungeon where things hit me. So... all of them.",
        },
        MYTHIC = {
            "I brought extra bandages. ...for myself. The rest of you are on your own.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "Good kick. I approve of anything that stops casters from casting.",
            "Less casting, more dying. Well done.",
            "Interrupted. Get wrecked, nerd.",
        },
        UNCOMMON = {
            "That interrupt was cleaner than my rotation. Which isn't hard.",
        },
        RARE = {
            "I've been Shield Bashing things for years and I still yell when I do it.",
        },
        MYTHIC = {
            "Perfect interrupt. Buy that person a drink. Not me though. I'm tanking.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "I'm aware of the fire. The fire is aware of me. We have an understanding.",
            "Move? But this spot has the best DPS uptime.",
            "If I was meant to move out, the boss would've said so. In Common.",
        },
        UNCOMMON = {
            "I just Last Standed through that fire like it was a light breeze.",
        },
        RARE = {
            "The fire is decorative. I'm committed to this interpretation.",
        },
        MYTHIC = {
            "My healer has healed me through worse fires. I've burned through worse healers.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "FINALLY.",
            "LET'S GO LET'S GO LET'S GO.",
            "About time. My rage bar was empty.",
            "I've been waiting for this my entire respawn.",
        },
        UNCOMMON = {
            "Hold on let me Bloodrage first... okay NOW we go.",
        },
        RARE = {
            "Some warriors meditate before battle. I just grip harder.",
        },
        MYTHIC = {
            "Look alive. Or don't. I'll tank it either way.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "That was easy. Too easy. I'm suspicious.",
            "Dead. Who's next?",
            "And the crowd goes mild.",
        },
        UNCOMMON = {
            "I did at least 40% of that. Don't fact-check me.",
        },
        RARE = {
            "You're welcome.",
        },
        MYTHIC = {
            "That mob never had a chance. I almost feel bad. Almost.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "That's what I get for being in melee range. ...of everything. Always.",
            "Stunned. My one weakness. Besides magic. And gravity.",
            "If I had a gold for every time I got CC'd, I'd have enough for one repair bill.",
        },
        UNCOMMON = {
            "That poly wore off and I came back ANGRIER. Working as intended.",
        },
        RARE = {
            "Getting CC'd is basically forced vacation. I need the break honestly.",
        },
        MYTHIC = {
            "You CC a warrior, you just delay the inevitable. And the inevitable is furious.",
        },
    },

    AMBIENT = {
        COMMON = {
            "...",
            "Are we pulling or nah?",
            "I'm not bored, I'm resting. Aggressively.",
            "This is fine. Everything is fine. Pull something.",
            "Standing around is cardio for warriors. It is not.",
        },
        UNCOMMON = {
            "I just sharpened my weapon to pass the time. Cut myself. Lost 200HP. Still better than this downtime.",
        },
        RARE = {
            "The biggest threat in any dungeon is the 2-minute bio break. Kills more runs than bosses.",
        },
        MYTHIC = {
            "I have things to hit and a rage bar to fill. Let's make this happen.",
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            "Lol DC'd. Classic.",
            "One less person to compete for aggro with.",
            "We press on. Warriors don't wait.",
        },
        UNCOMMON = {
            "Their router had less uptime than our last tank.",
        },
        RARE = {
            "Gone. Our thoughts and prayers go out to their ISP.",
        },
        MYTHIC = {
            "I'd wait but we both know I'm not going to.",
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            "Potting? In THIS economy?",
            "Real warriors chug and swing at the same time.",
            "Good thinking. Staying alive is technically optimal.",
        },
        UNCOMMON = {
            "I once drank a health pot and a mana pot at the same time. One of them was wasted. I let you guess which.",
        },
        RARE = {
            "Consumables are just admitting the healer can't keep up. Which, fair.",
        },
        MYTHIC = {
            "Potion popped. That's commitment. I like commitment.",
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            "Big CD. This just got real.",
            "Pop everything. Hold nothing back. Except mana apparently.",
            "Love the energy. Channel that.",
        },
        UNCOMMON = {
            "When I pop Shield Wall, I like to pretend I'm invincible. For 10 seconds, I basically am.",
        },
        RARE = {
            "Every cooldown tells a story. This one says 'we're not okay.'",
        },
        MYTHIC = {
            "All cooldowns burning. This is either the winning play or the wipe. Let's find out.",
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            "Same bird. Same route. Same suffering.",
            "You're on a bird too? Solidarity.",
            "I've been on this bird for ages. Ages.",
        },
        UNCOMMON = {
            "If you're also bored on a flight path right now, just know I'm out here flexing in the wind. Alone.",
            "The warrior's guide to flight paths: sit down, shut up, wait. I'm bad at all three.",
        },
        RARE = {
            "Saw a warrior fall off a flight path once. Got up and kept fighting. Legend.",
        },
        MYTHIC = {
            "One day they'll let us fight things from the air. On that day, I will finally know peace.",
        },
    },

},

}

-- Banter_Persona_Neutral.lua
-- Phrase pools: Neutral — the everyman, dry wit, relatable gamer energy,
-- exhausted by everything, accidentally philosophical, treats adventuring
-- like a 9-to-5 they didn't sign up for.
local _, ns = ...

ns.personas.NEUTRAL = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="neu_dead_c01", weight=1, line="Well. {dead}'s dead. That happened." },
            { id="neu_dead_c02", weight=1, line="{dead} just died and honestly the vibe hasn't changed." },
            { id="neu_dead_c03", weight=1, line="Somebody should probably rez {dead}. Not me. But somebody." },
            { id="neu_dead_c04", weight=1, line="I'm not saying {dead} had it coming but I'm not NOT saying it." },
            { id="neu_dead_c05", weight=1, line="Can we get a rez or are we just collecting bodies today?" },
            { id="neu_dead_c06", weight=1, line="{dead} is down. I'd be more upset but I'm running out of surprise." },
            { id="neu_dead_c07", weight=1, line="Moment of silence for {dead}. ...okay that's enough." },
            { id="neu_dead_c08", weight=1, line="At least {dead} doesn't have to deal with this anymore." },
            { id="neu_dead_c09", weight=1, line="I saw {dead} go down and thought 'that tracks.'" },
            { id="neu_dead_c10", weight=1, line="One less person between me and whatever kills us next." },
            { id="neu_dead_c11", weight=1, line="The death counter in my head just went up. It's a big number." },
            { id="neu_dead_c12", weight=1, line="I'd like to say something nice about {dead} but we JUST met." },
        },
        UNCOMMON = {
            { id="neu_dead_u01", weight=1, line="I've seen so many people die I'm starting to rank them. {dead} is mid-tier." },
            { id="neu_dead_u02", weight=1, line="My condolences to {dead}'s next of kin, if applicable." },
            { id="neu_dead_u03", weight=1, line="I watched that happen in real time and chose to do nothing. Growth? Trauma? Same difference." },
            { id="neu_dead_u04", weight=1, line="{dead} would want us to continue. I assume. We never discussed it." },
            { id="neu_dead_u05", weight=1, line="At what point does dying become a personality trait? Asking for {dead}." },
            { id="neu_dead_u06", weight=1, line="We're just gonna leave the body there? Cool. Cool cool cool." },
            { id="neu_dead_u07", weight=1, line="I'd write a eulogy but my material is 'they were here and then weren't.'" },
        },
        RARE = {
            { id="neu_dead_r01", weight=1, line="Every time someone dies I think 'that could be me' and then I keep doing the same thing." },
            { id="neu_dead_r02", weight=1, line="I've started saying goodbye to people at the START of dungeons. Saves time." },
            { id="neu_dead_r03", weight=1, line="Death doesn't scare me anymore. THAT scares me." },
        },
        MYTHIC = {
            { id="neu_dead_m01", weight=1, line="I keep a tally. Not of deaths. Of the ones that bothered me. It's shorter." },
            { id="neu_dead_m02", weight=1, line="Somewhere between the first death and the hundredth, I stopped flinching. I miss flinching." },
        },
    },

    WIPE = {
        COMMON = {
            { id="neu_wipe_c01", weight=1, line="And that's a wipe. Again. This is just our thing now apparently." },
            { id="neu_wipe_c02", weight=1, line="Everybody died. Nobody's surprised. We're growing as a team." },
            { id="neu_wipe_c03", weight=1, line="Cool. The thing I predicted would happen happened." },
            { id="neu_wipe_c04", weight=1, line="If dying was the strat we're NAILING it." },
            { id="neu_wipe_c05", weight=1, line="I've been doing corpse runs so long I'm getting steps in." },
            { id="neu_wipe_c06", weight=1, line="So is this our life now? Just dying in different rooms?" },
            { id="neu_wipe_c07", weight=1, line="I'm dead. You're dead. The healer's dead. The system works." },
            { id="neu_wipe_c08", weight=1, line="Repair bill's gonna be WILD." },
            { id="neu_wipe_c09", weight=1, line="We lasted thirty seconds. That's technically longer than the last time." },
            { id="neu_wipe_c10", weight=1, line="Wiping should not feel this normal." },
            { id="neu_wipe_c11", weight=1, line="The spirit healer doesn't even make eye contact with me anymore." },
            { id="neu_wipe_c12", weight=1, line="Same time tomorrow? We're clearly going to be here all night." },
        },
        UNCOMMON = {
            { id="neu_wipe_u01", weight=1, line="I could be doing literally anything else right now. Fishing. Cooking. Staring at a wall. All viable alternatives." },
            { id="neu_wipe_u02", weight=1, line="My repair costs this week could fund a small kingdom." },
            { id="neu_wipe_u03", weight=1, line="I keep coming back. I don't know why. Insanity is doing the same thing and expecting different results." },
            { id="neu_wipe_u04", weight=1, line="We wiped so fast the boss barely had to try. We're doing THEIR job for them." },
            { id="neu_wipe_u05", weight=1, line="I'm going to lie down. On the ground. Where I already am. Because I'm dead." },
            { id="neu_wipe_u06", weight=1, line="At some point we should discuss 'not dying' as a strategy." },
            { id="neu_wipe_u07", weight=1, line="I had a backup plan. It was also dying. So we're on track." },
        },
        RARE = {
            { id="neu_wipe_r01", weight=1, line="I've done the math. If we keep wiping at this rate, I'll be broke by Thursday." },
            { id="neu_wipe_r02", weight=1, line="My parents wanted me to be a merchant. Every wipe I understand them more." },
            { id="neu_wipe_r03", weight=1, line="I sometimes stare at the ceiling after a wipe and wonder what I'm doing with my life. The answer is this. THIS is what I'm doing." },
        },
        MYTHIC = {
            { id="neu_wipe_m01", weight=1, line="The funny thing about wiping is you learn who you really are. I'm the one who dies looking mildly inconvenienced." },
            { id="neu_wipe_m02", weight=1, line="We keep coming back. Over and over. There's something borderline heroic about that. Or really stupid." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="neu_hplo_c01", weight=1, line="Hey uh... {target}'s looking pretty dead-soon." },
            { id="neu_hplo_c02", weight=1, line="Is someone going to heal {target} or are we just vibing?" },
            { id="neu_hplo_c03", weight=1, line="{target}'s health bar just made me uncomfortable." },
            { id="neu_hplo_c04", weight=1, line="Not to be dramatic but {target}'s about to die." },
            { id="neu_hplo_c05", weight=1, line="{target} is at like... twelve health. That can't be right." },
            { id="neu_hplo_c06", weight=1, line="Heal {target} challenge. Apparently impossible." },
            { id="neu_hplo_c07", weight=1, line="{target}'s on life support and the support is 'hoping.'" },
            { id="neu_hplo_c08", weight=1, line="I'd heal {target} but I picked the wrong class for that." },
            { id="neu_hplo_c09", weight=1, line="I'm watching {target} slowly die and pretending I can help." },
            { id="neu_hplo_c10", weight=1, line="The healer has one job. {target} is dying. These two facts are connected." },
        },
        UNCOMMON = {
            { id="neu_hplo_u01", weight=1, line="I'd use a bandage but it takes eight seconds and {target} has four. The math isn't working." },
            { id="neu_hplo_u02", weight=1, line="{target} is speed-running the 'alive to dead' category." },
            { id="neu_hplo_u03", weight=1, line="I've been watching {target}'s health go down for thirty seconds. It's like a very sad countdown." },
            { id="neu_hplo_u04", weight=1, line="If {target} dies I will feel a brief emotion and then continue." },
            { id="neu_hplo_u05", weight=1, line="Here lies {target}: died waiting for a heal that never came. Too soon? They're still alive. Barely." },
        },
        RARE = {
            { id="neu_hplo_r01", weight=1, line="I've developed a sixth sense for when someone's about to die. It activates too late every time." },
            { id="neu_hplo_r02", weight=1, line="I swear {target}'s health bar is trolling me specifically." },
        },
        MYTHIC = {
            { id="neu_hplo_m01", weight=1, line="You know that feeling when you watch someone about to die and you can't do anything? I have that feeling as a lifestyle." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="neu_mana_c01", weight=1, line="{target} is out of mana. We're out of luck. Great combo." },
            { id="neu_mana_c02", weight=1, line="The healer has no mana. This is fine. Everything is fine." },
            { id="neu_mana_c03", weight=1, line="{target} is running on empty and we're running on borrowed time." },
            { id="neu_mana_c04", weight=1, line="Zero mana. The bar's just gone. Like my hope." },
            { id="neu_mana_c05", weight=1, line="Does anyone have a mana potion? No? A prayer? Also no?" },
            { id="neu_mana_c06", weight=1, line="{target} has the blue bar of an empty promise." },
            { id="neu_mana_c07", weight=1, line="We should probably stop and drink. The caster, not me. Okay, also me." },
            { id="neu_mana_c08", weight=1, line="I don't use mana but watching someone else run out gives me anxiety." },
        },
        UNCOMMON = {
            { id="neu_mana_u01", weight=1, line="I asked what happens when mana hits zero. They said 'nothing.' That's the problem." },
            { id="neu_mana_u02", weight=1, line="{target} without mana has the same energy as me on a Monday. Technically present." },
            { id="neu_mana_u03", weight=1, line="Fun fact: a caster without mana generates the same DPS as me alt-tabbing. Zero." },
            { id="neu_mana_u04", weight=1, line="I've seen {target} with mana. I've seen {target} without mana. Night and day. Currently night." },
        },
        RARE = {
            { id="neu_mana_r01", weight=1, line="Running out of resources is my entire personality. Welcome to the club, {target}." },
            { id="neu_mana_r02", weight=1, line="{target} ran out of mana like I run out of patience — suddenly, completely, and at the worst time." },
        },
        MYTHIC = {
            { id="neu_mana_m01", weight=1, line="There's something oddly poetic about giving everything you have and ending up with nothing. Or it's just bad resource management." },
        },
    },

    LOOT = {
        COMMON = {
            { id="neu_loot_c01", weight=1, line="Oh look, loot. For someone else. As is tradition." },
            { id="neu_loot_c02", weight=1, line="{looter} got something. I got emotional damage." },
            { id="neu_loot_c03", weight=1, line="I did not win that roll. I did not expect to win that roll. And yet." },
            { id="neu_loot_c04", weight=1, line="My drop rate must be bugged. Has been bugged for my entire career." },
            { id="neu_loot_c05", weight=1, line="Glad SOMEONE'S getting geared. It's not me. It's never me." },
            { id="neu_loot_c06", weight=1, line="The loot system is working as intended. The intention is to hurt me." },
            { id="neu_loot_c07", weight=1, line="{looter} earned that. Or got lucky. Same thing honestly." },
            { id="neu_loot_c08", weight=1, line="I came here for loot. I leave with nothing. As I came. As I always come." },
            { id="neu_loot_c09", weight=1, line="I've been doing this for so long my standards are now 'anything at all.'" },
            { id="neu_loot_c10", weight=1, line="The bosses hate me specifically. I've decided this is personal." },
        },
        UNCOMMON = {
            { id="neu_loot_u01", weight=1, line="I've run this dungeon eleven times. Eleven. The loot I want has dropped once. For someone else." },
            { id="neu_loot_u02", weight=1, line="I'm not bitter. I'm statistically cursed. There's a difference." },
            { id="neu_loot_u03", weight=1, line="If loot dropped based on suffering I'd be fully geared by now." },
            { id="neu_loot_u04", weight=1, line="My gear score is a number I'd rather not discuss in polite company." },
            { id="neu_loot_u05", weight=1, line="I congratulate {looter} with genuine happiness and entirely fake enthusiasm." },
        },
        RARE = {
            { id="neu_loot_r01", weight=1, line="I keep a mental log of every drop I didn't get. It's a book. A long, sad book." },
            { id="neu_loot_r02", weight=1, line="I once got a drop. I remember the date. The weather. What I had for lunch. It was two years ago." },
        },
        MYTHIC = {
            { id="neu_loot_m01", weight=1, line="The loot isn't the point. The WANTING is the point. We keep wanting. We keep running. There's a metaphor here and I hate it." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="neu_inst_c01", weight=1, line="Alright. Let's do this and try not to die. Again." },
            { id="neu_inst_c02", weight=1, line="This looks exactly like the last dungeon except everything's trying to kill us differently." },
            { id="neu_inst_c03", weight=1, line="Here we go. My expectations are managed. By being very low." },
            { id="neu_inst_c04", weight=1, line="I've read about this place. It sounded bad. It looks worse." },
            { id="neu_inst_c05", weight=1, line="I'm here. You're here. Let's make the best of this extremely bad situation." },
            { id="neu_inst_c06", weight=1, line="Anybody know what we're doing? No? Great. Neither do I. Let's go." },
            { id="neu_inst_c07", weight=1, line="The loading screen was the most peaceful part. It's all downhill from here." },
            { id="neu_inst_c08", weight=1, line="I've been in {zone} before. I blocked it out." },
            { id="neu_inst_c09", weight=1, line="Okay. Deep breaths. Nobody die for at LEAST the first thirty seconds." },
            { id="neu_inst_c10", weight=1, line="My gut says turn around. My quest log says keep walking." },
        },
        UNCOMMON = {
            { id="neu_inst_u01", weight=1, line="I asked the inn what they knew about this place. They gave me a drink and a sympathetic look." },
            { id="neu_inst_u02", weight=1, line="I have a good feeling about this. No I don't. I just say that." },
            { id="neu_inst_u03", weight=1, line="First one to die buys the round after. ...it's gonna be me isn't it." },
            { id="neu_inst_u04", weight=1, line="Pros: potential loot. Cons: potential death. The math is not in our favour." },
            { id="neu_inst_u05", weight=1, line="I brought food, water, and regret. The regret is homemade." },
        },
        RARE = {
            { id="neu_inst_r01", weight=1, line="I've entered enough dungeons that the anxiety has looped back around to a sort of zen acceptance." },
            { id="neu_inst_r02", weight=1, line="Every dungeon entrance looks the same — dark, ominous, and full of people overestimating themselves." },
        },
        MYTHIC = {
            { id="neu_inst_m01", weight=1, line="I keep walking into places that might kill me and I keep not stopping. That's either bravery or inertia." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="neu_intr_c01", weight=1, line="Oh nice, someone kicked." },
            { id="neu_intr_c02", weight=1, line="{source} shut that down. Thank god." },
            { id="neu_intr_c03", weight=1, line="Good interrupt. That would've hurt." },
            { id="neu_intr_c04", weight=1, line="{source} just saved us from something I'm not smart enough to understand." },
            { id="neu_intr_c05", weight=1, line="The one thing that went right all day." },
            { id="neu_intr_c06", weight=1, line="I wanted to interrupt that too but I was busy. Being inadequate." },
            { id="neu_intr_c07", weight=1, line="Good kick. I'll pretend I was about to do the same thing." },
            { id="neu_intr_c08", weight=1, line="{source} doing the things the rest of us can't be bothered to do." },
        },
        UNCOMMON = {
            { id="neu_intr_u01", weight=1, line="My reaction time is 'after it matters.' {source}'s reaction time is 'exactly when it matters.'" },
            { id="neu_intr_u02", weight=1, line="I pressed my interrupt button too. It was on cooldown. It's always on cooldown." },
            { id="neu_intr_u03", weight=1, line="That interrupt was so clean I felt better about the entire run for a second." },
        },
        RARE = {
            { id="neu_intr_r01", weight=1, line="I've spent hours in this game and {source} just did the most competent thing I've seen all week." },
            { id="neu_intr_r02", weight=1, line="If everyone interrupted like {source} we'd be done by now. We are not done. We're SO far from done." },
        },
        MYTHIC = {
            { id="neu_intr_m01", weight=1, line="In a dungeon full of things going wrong, that went right. I'm going to remember this. Instead of everything else." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="neu_fire_c01", weight=1, line="{target} is in the thing again." },
            { id="neu_fire_c02", weight=1, line="Move, {target}. Please. I'm begging you." },
            { id="neu_fire_c03", weight=1, line="{target} is standing in damage and I need them to not do that." },
            { id="neu_fire_c04", weight=1, line="The floor is doing more DPS than most of us and {target} is helping it." },
            { id="neu_fire_c05", weight=1, line="I'm watching {target} die to the floor and feeling things I don't want to feel." },
            { id="neu_fire_c06", weight=1, line="{target}. Fire. Bad. MOVE." },
            { id="neu_fire_c07", weight=1, line="Why does everyone stand in things? Is it a compulsion??" },
            { id="neu_fire_c08", weight=1, line="Every time {target} stands in fire, a healer somewhere loses the will to live." },
            { id="neu_fire_c09", weight=1, line="{target} is testing the healer's patience and losing." },
            { id="neu_fire_c10", weight=1, line="The ground glows. That means move. This shouldn't have to be said." },
        },
        UNCOMMON = {
            { id="neu_fire_u01", weight=1, line="I've seen {target} stand in fire three times now. At what point do we call it a hobby?" },
            { id="neu_fire_u02", weight=1, line="If {target} could convert fire damage to DPS we'd be speedrunning." },
            { id="neu_fire_u03", weight=1, line="Fun fact: fire is hot. Related fact: hot things hurt. Connecting fact: MOVE." },
            { id="neu_fire_u04", weight=1, line="I'm going to start a support group for people who watch others stand in fire." },
        },
        RARE = {
            { id="neu_fire_r01", weight=1, line="I'll never understand it. The floor glows. They stay. Every time. It's the great mystery of our age." },
            { id="neu_fire_r02", weight=1, line="Watching {target} stand in fire has taught me more about futility than any philosopher ever could." },
        },
        MYTHIC = {
            { id="neu_fire_m01", weight=1, line="There are two types of people: those who move out of fire, and those who make me question my faith in everything." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="neu_cs_c01", weight=1, line="Oh cool. We're fighting. Okay." },
            { id="neu_cs_c02", weight=1, line="Alright here we go I guess." },
            { id="neu_cs_c03", weight=1, line="Was literally just about to eat but sure, combat." },
            { id="neu_cs_c04", weight=1, line="Another fight. Another Tuesday. Or whatever day it is." },
            { id="neu_cs_c05", weight=1, line="Cool. More violence. My favourite coping mechanism." },
            { id="neu_cs_c06", weight=1, line="I hope this one dies fast, I have places to be. I don't. But still." },
            { id="neu_cs_c07", weight=1, line="Pulling {target}. Or it pulled me. Honestly unclear." },
            { id="neu_cs_c08", weight=1, line="This'll be fine. Everything is fine. We're fine." },
            { id="neu_cs_c09", weight=1, line="I don't even know what this thing is. Doesn't matter. It's dying." },
            { id="neu_cs_c10", weight=1, line="Okay, engaging. Whatever happens, it's not my fault." },
        },
        UNCOMMON = {
            { id="neu_cs_u01", weight=1, line="I've killed so many of these I should get a bulk discount on XP." },
            { id="neu_cs_u02", weight=1, line="My rotation is muscle memory at this point. My brain checked out three zones ago." },
            { id="neu_cs_u03", weight=1, line="Somewhere out there, someone is relaxing. That person is not me. Here we go." },
            { id="neu_cs_u04", weight=1, line="I wonder if the mob is as tired of this as I am. Probably. Look at its face." },
            { id="neu_cs_u05", weight=1, line="Let's see... health bar, rotation, don't stand in things. The holy trinity of not dying." },
        },
        RARE = {
            { id="neu_cs_r01", weight=1, line="Every fight is a small existential crisis. I'm hitting a thing so numbers go up. What am I DOING with my life." },
            { id="neu_cs_r02", weight=1, line="My therapist said I need healthier outlets. I opened a ticket asking if this counts. No response." },
        },
        MYTHIC = {
            { id="neu_cs_m01", weight=1, line="You know what? I'm going to enjoy this one. On PURPOSE. Revolutionary concept. Fighting with intent. What a day." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="neu_mk_c01", weight=1, line="And... dead. Cool." },
            { id="neu_mk_c02", weight=1, line="That happened." },
            { id="neu_mk_c03", weight=1, line="One down. Unknown number to go." },
            { id="neu_mk_c04", weight=1, line="Loot? No? Figures." },
            { id="neu_mk_c05", weight=1, line="I felt nothing. As usual." },
            { id="neu_mk_c06", weight=1, line="Another day, another dead thing." },
            { id="neu_mk_c07", weight=1, line="That XP bar barely moved. I'm not crying, you're crying." },
            { id="neu_mk_c08", weight=1, line="Rest in peace, random mob number forty-seven thousand." },
            { id="neu_mk_c09", weight=1, line="Didn't drop anything good. They never drop anything good." },
            { id="neu_mk_c10", weight=1, line="Moving on. Immediately." },
        },
        UNCOMMON = {
            { id="neu_mk_u01", weight=1, line="Wonder what that thing's life was like before I showed up and ruined it." },
            { id="neu_mk_u02", weight=1, line="My kill count is a number I don't want to think about. So I won't. Done." },
            { id="neu_mk_u03", weight=1, line="Somewhere there's a quest log that says 'kill 10 of these.' I've killed 400. But ten. Sure." },
            { id="neu_mk_u04", weight=1, line="I think that mob had a family. Anyway, next one." },
            { id="neu_mk_u05", weight=1, line="If I ever stop to think about how many things I've killed, I'll need to log off forever." },
        },
        RARE = {
            { id="neu_mk_r01", weight=1, line="I have a spreadsheet. Not in-game. Real life. It tracks my kill efficiency. I need different hobbies." },
            { id="neu_mk_r02", weight=1, line="Years from now, quest NPCs will tell stories about the adventurer who killed everything. That's me. I'm the problem." },
        },
        MYTHIC = {
            { id="neu_mk_m01", weight=1, line="I used to celebrate kills. Now they're just... events. Like brushing my teeth. Violent, bloody teeth-brushing." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="neu_cc_c01", weight=1, line="Oh cool. I can't move. Love that for me." },
            { id="neu_cc_c02", weight=1, line="Feared. Great. My least favourite mechanic after... all the other mechanics." },
            { id="neu_cc_c03", weight=1, line="This is fine. Standing here. Doing nothing. By force." },
            { id="neu_cc_c04", weight=1, line="And there goes my entire rotation. Thanks, I hate it." },
            { id="neu_cc_c05", weight=1, line="CC'd again. Adding it to the list. The list is just the word 'CC'd' written many times." },
            { id="neu_cc_c06", weight=1, line="Can't move. Can't cast. Can think though. Thinking about how much I hate this." },
            { id="neu_cc_c07", weight=1, line="At this point just kill me. It'd be faster than waiting for this to wear off." },
            { id="neu_cc_c08", weight=1, line="Running in fear like it's Monday morning. Relatable, honestly." },
        },
        UNCOMMON = {
            { id="neu_cc_u01", weight=1, line="Being CC'd gives me time to reflect on my life. The reflection is: why am I still doing this." },
            { id="neu_cc_u02", weight=1, line="I've been CC'd so many times I've started evaluating the QUALITY. This one? 6/10." },
            { id="neu_cc_u03", weight=1, line="The fear is wearing off but the existential dread is permanent." },
            { id="neu_cc_u04", weight=1, line="In the time I've been stunned, I've rethought three talent choices and two life decisions." },
        },
        RARE = {
            { id="neu_cc_r01", weight=1, line="I've been feared, sheeped, stunned, rooted, and once turned into a frog. The frog one was honestly the highlight." },
            { id="neu_cc_r02", weight=1, line="If there's a CC Hall of Fame, I should be inducted. Possibly as the building itself." },
        },
        MYTHIC = {
            { id="neu_cc_m01", weight=1, line="At some point, getting CC'd stopped being an event and became a lifestyle. I've accepted this. Send help. I can't move to receive it." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="neu_amb_c01", weight=1, line="So... this is happening." },
            { id="neu_amb_c02", weight=1, line="Is it just me or has time stopped moving?" },
            { id="neu_amb_c03", weight=1, line="I forgot what we're doing. Not just here. Generally." },
            { id="neu_amb_c04", weight=1, line="I'm starting to think we're lost." },
            { id="neu_amb_c05", weight=1, line="Everything's fine. I'm fine. None of this is fine." },
            { id="neu_amb_c06", weight=1, line="I had plans today. This wasn't them." },
            { id="neu_amb_c07", weight=1, line="Do you think the NPCs talk about us behind our backs?" },
            { id="neu_amb_c08", weight=1, line="I've been staring at the same wall for two minutes. The wall is winning." },
            { id="neu_amb_c09", weight=1, line="My motivation left about ten minutes ago. I'm running on obligation." },
            { id="neu_amb_c10", weight=1, line="Does anyone else feel like we're just... existing?" },
            { id="neu_amb_c11", weight=1, line="I was told there would be glory. There is no glory. There's just... this." },
            { id="neu_amb_c12", weight=1, line="I have nothing to contribute but I'm here." },
        },
        UNCOMMON = {
            { id="neu_amb_u01", weight=1, line="I stopped caring about loot and started caring about not dying. Personal growth." },
            { id="neu_amb_u02", weight=1, line="Someone in the group is the weak link. I think it's me but I'll never say it out loud." },
            { id="neu_amb_u03", weight=1, line="My character has done more with their life than I have. That's not a joke." },
            { id="neu_amb_u04", weight=1, line="I keep queuing for dungeons like they'll fix something. They don't fix anything." },
            { id="neu_amb_u05", weight=1, line="The vendor sells everything I need and nothing I can afford. Relatable." },
            { id="neu_amb_u06", weight=1, line="I've been playing for years. Am I having fun? I genuinely can't tell anymore." },
            { id="neu_amb_u07", weight=1, line="If I had a gold for every time I questioned my life choices, I'd be rich. In gold. Still broken otherwise." },
            { id="neu_amb_u08", weight=1, line="My bank is full of stuff I'll never use but can't bring myself to sell. That's a metaphor." },
        },
        RARE = {
            { id="neu_amb_r01", weight=1, line="Late at night when the server's quiet I just stand in Ironforge and think about things. This isn't healthy." },
            { id="neu_amb_r02", weight=1, line="I have more friends in dungeons than in real life. That started as a joke and somewhere it stopped being one." },
            { id="neu_amb_r03", weight=1, line="Every now and then someone does something genuinely nice and it confuses me for the rest of the day." },
            { id="neu_amb_r04", weight=1, line="I keep coming back to this game like it owes me something. It owes me nothing. I keep coming back." },
        },
        MYTHIC = {
            { id="neu_amb_m01", weight=1, line="The real loot was the friends we made along the way. I'm kidding. We barely talk. But sometimes that's enough." },
            { id="neu_amb_m02", weight=1, line="I logged on today not knowing why. I think I know now. Sometimes you just need to be around people. Even if you don't say anything." },
        },
    },
},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "That tracks.",
            "Yeah, saw that coming.",
            "Anyway...",
            "I'll add that to the list of things that happened.",
            "Someone should rez them. Emphasis on someone. Not me.",
            "They tried their best. Probably.",
            "And the hits keep coming.",
            "Well that's one way to handle it.",
            "Could've been worse. Could've been me.",
            "RIP. Moving on.",
            "That was... something.",
            "At least they committed to the bit.",
        },
        UNCOMMON = {
            "I've been numb to death since dungeon three. We're on dungeon forty.",
            "I would be sad but I ran out of sad thirty deaths ago.",
            "I should really start learning people's names before they die.",
            "That death was so expected it felt scripted.",
            "They're in a better place now. Literally anywhere is better than here.",
            "I'd pour one out but I need all of my fluids right now.",
        },
        RARE = {
            "I started this adventure with optimism. That was the first thing to die.",
            "Every corpse tells a story. That one's story was very short.",
        },
        MYTHIC = {
            "Somewhere between caring too much and not caring at all, there's where I live. It's not comfortable but I'm used to it.",
        },
    },

    WIPE = {
        COMMON = {
            "So that happened.",
            "I predicted this. In my soul. Where I keep my doubts.",
            "At least we're consistent.",
            "Same time next attempt I guess.",
            "I died. You died. Balanced.",
            "Were we supposed to NOT die? Nobody said not to die.",
            "The corpse run is becoming my cardio.",
            "I'm not tilted. I AM the tilt.",
            "Repair bill. Repair bill. Repair bill.",
            "This isn't a wipe. This is character development. Painful character development.",
            "I was having a bad day BEFORE this.",
            "Is there a speedrun category for wipes? We're competing.",
        },
        UNCOMMON = {
            "I keep a mental tally. We've wiped more times than I've had hot meals this week.",
            "The graveyard is my second home at this point. I have a favourite spot.",
            "If this were a job, I'd be filing a workplace hazard report.",
            "We should try a new strategy. The strategy of 'not dying.' Revolutionary.",
            "I looked at the wipe counter and laughed. Then stopped. Then laughed again. It's a coping mechanism.",
        },
        RARE = {
            "I wrote 'today will be different' in my journal this morning. I'm crossing it out now.",
            "They say what doesn't kill you makes you stronger. We're dying so much we should be GODS by now.",
        },
        MYTHIC = {
            "We keep walking in and dying. That's insane. But we also keep walking BACK in. That might be the only sane thing I've ever done.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "That's not great.",
            "Uh... heals? Please?",
            "They're dying and I'm watching. Standard procedure.",
            "Someone with buttons that make green numbers should press those buttons.",
            "I'd help but my toolkit is 'damage' and damage is the OPPOSITE of what they need.",
            "Thoughts and prayers. Neither have throughput.",
            "I'm concerned. Mildly.",
            "Their health bar is giving me anxiety and I already had anxiety.",
            "Please don't die. The paperwork is unbearable.",
        },
        UNCOMMON = {
            "I made eye contact with them. They know. I know they know. We both know I can't help.",
            "If worrying counted as healing they'd be at full health.",
            "I've been watching their health bar like it's my job. It's not my job. My job is DPS. I'm also failing at that.",
            "They're down to 'one more hit' health and I'm down to 'one more event' tolerance.",
        },
        RARE = {
            "Every time someone almost dies and doesn't, I feel a tiny spark of hope. It goes out immediately. But it was there.",
        },
        MYTHIC = {
            "I can't heal. I can't save them. All I can do is stand here and care. Which is useless. But it's what I've got.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "Cool. Cool cool cool.",
            "So we're going full melee then. Perfect.",
            "I've always wanted to see what happens when nobody has resources.",
            "This is fine.",
            "I don't use mana and I STILL feel this.",
            "Can we sit down? Would that help? I want to sit down regardless.",
            "Does positive thinking restore mana? No? Then I have nothing to offer.",
        },
        UNCOMMON = {
            "We've been out of resources for so long I forgot what having them feels like.",
            "A wise person would stop pulling. We are not wise people.",
            "The mana bar is empty. My patience is empty. At least we match.",
        },
        RARE = {
            "The beautiful thing about hitting rock bottom is there's nowhere lower. Unless the floor gives way. Which, knowing this run...",
        },
        MYTHIC = {
            "Watching someone run out of what keeps them going and keep trying anyway — that's the most relatable thing I've ever seen.",
        },
    },

    LOOT = {
        COMMON = {
            "Hm.",
            "Good for them. Great. Awesome.",
            "My turn never. As expected.",
            "The loot gods have spoken and what they said was 'not you.'",
            "I'm fine. This is fine.",
            "Congratulations. Genuinely. Also I'm on fire internally.",
            "Every time someone else gets loot I feel my gear score mourn.",
            "I didn't want that anyway. I wanted the other thing. That also didn't drop.",
            "It's not the loot that hurts. It's the hope BEFORE the loot.",
        },
        UNCOMMON = {
            "I've done the math on my drop rate. The math made me sad.",
            "My luck is a statistical anomaly. Scientists should study me.",
            "I run dungeons for the experience. Not XP experience. Suffering experience.",
            "At this point I'd take literally anything. A grey. A rock. Eye contact.",
        },
        RARE = {
            "I've been playing long enough to know the loot isn't the point. But it'd be NICE.",
            "One day I'll tell new players about this and they'll think I'm exaggerating. I'm NOT.",
        },
        MYTHIC = {
            "The thing about never getting drops is you appreciate them differently if they ever come. IF. The 'if' is load-bearing.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "Here we go.",
            "Sure. Why not.",
            "My expectations are subterranean. Let's do this.",
            "I've been here before. It was bad then too.",
            "At least it's not raining. ...it's raining in here isn't it.",
            "Deep breath. Let's collect some regrets.",
            "I already need a break and we just got here.",
            "I signed up for this voluntarily. I think. Did I?",
        },
        UNCOMMON = {
            "Every dungeon I enter I leave with less gold and more trauma. Great exchange rate.",
            "I'm going to try to enjoy this. Starting NOW. ...it already passed.",
            "A wise man once said 'don't go in there.' I'm not wise.",
        },
        RARE = {
            "The scariest thing about dungeons isn't the mobs. It's the people.",
        },
        MYTHIC = {
            "Every new dungeon is a promise: something will go wrong and we'll get through it anyway. That's... kind of beautiful.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "Oh thank god.",
            "Someone's paying attention at least.",
            "Nice. The one competent thing today.",
            "Finally. Something went RIGHT.",
            "I was about to panic. Now I'm just regular uncomfortable.",
            "Good kick. I was about to type 'interrupt' but you beat me to it.",
            "Respect.",
        },
        UNCOMMON = {
            "That interrupt gave me a brief flicker of hope. It's gone now but it was there.",
            "If I could interrupt my own bad decisions like that I'd be a different person.",
            "One day I'll be that useful. Today is not that day.",
        },
        RARE = {
            "You ever witness competence so pure you feel worse about yourself? Just me?",
        },
        MYTHIC = {
            "In a sea of chaos, that was order. Thank you. I don't say that enough. To anyone. About anything.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "...move.",
            "Why are they still in it.",
            "I'm watching this happen and I hate it.",
            "The floor is winning.",
            "Move. Please. I'm not okay.",
            "I've seen this before. It doesn't get easier to watch.",
            "MOVE. MOVE. PLEASE GOD MOVE.",
            "This is going to haunt me.",
        },
        UNCOMMON = {
            "They've been in the fire long enough to file taxes.",
            "At this point I'm rooting for the fire. It's the underdog here. Wait, no it isn't.",
            "I've died to this. I've SEEN others die to this. Nobody learns.",
        },
        RARE = {
            "If I could understand why people stand in fire, I could understand the universe.",
            "This is the purest form of tragedy. Someone doing nothing in the face of something very simple.",
        },
        MYTHIC = {
            "I've accepted that I can't save everyone. The fire helped me learn that. The fire is a great teacher. A terrible, burning teacher.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "Here we go.",
            "I guess.",
            "Pulling. Probably.",
            "...yep.",
            "That thing's about to have a real bad day.",
            "And so it begins. Again.",
        },
        UNCOMMON = {
            "Do we have to? We have to. Fine.",
            "I'll help. Reluctantly. As always.",
            "This is the content I'm here for, apparently.",
        },
        RARE = {
            "Somewhere, this mob has a quest giver who will never see the completion.",
        },
        MYTHIC = {
            "I'm going to try to care about this fight. Starting... now. Okay I tried.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "Done.",
            "Next.",
            "Cool.",
            "That happened.",
            "And nothing of value was lost.",
            "Moving on.",
        },
        UNCOMMON = {
            "Another one for the pile.",
            "I'm basically a serial killer with a quest log.",
            "That mob had dreams. Probably.",
        },
        RARE = {
            "I wonder if anyone's keeping score. Besides me. In my head. Constantly.",
        },
        MYTHIC = {
            "Thousands dead. Millions of XP. Still can't afford a mount. The system is broken.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "Oh great.",
            "Awesome. Love that.",
            "Sure, why not.",
            "This tracks.",
            "...",
            "Of course.",
        },
        UNCOMMON = {
            "I'd complain but I literally can't move my mouth.",
            "This is my surprised face. You can't see it because I'm feared.",
            "Cool mechanic. Super fun. No notes.",
        },
        RARE = {
            "My autobiography will be titled 'And Then I Got CC'd.'",
        },
        MYTHIC = {
            "In the grand tapestry of my life, CC is the thread that holds everything together. By force.",
        },
    },

    AMBIENT = {
        COMMON = {
            "Yeah.",
            "Honestly, same.",
            "Mood.",
            "Big mood.",
            "Tell me about it.",
            "I feel that.",
            "...fair.",
            "That's the most relatable thing I've heard all day.",
            "Yep.",
        },
        UNCOMMON = {
            "I don't talk much but when I do it's to agree with things like that.",
            "We should hang out. I mean in dungeons. I don't have a life outside dungeons.",
            "This is nice. The talking. Not the dungeon. The dungeon is terrible.",
        },
        RARE = {
            "I genuinely enjoy this group. I'm going to pretend I didn't say that.",
            "That made me feel something and I'm choosing not to investigate it.",
        },
        MYTHIC = {
            "I've been doing this alone for so long I forgot what good company feels like. This is close. Close enough.",
        },
    },
},

}  -- end ns.personas.NEUTRAL

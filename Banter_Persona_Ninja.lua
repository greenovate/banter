-- Banter_Persona_Ninja.lua
-- Voice: ZEN MINIMALIST. Very short lines (3-8 words ideal), cryptic,
-- fortune-cookie philosophy, deadpan delivery, "..." pauses.
-- Dark humor delivered cold. Quiet. Unnervingly calm about everything.
-- Speaks like someone who has seen too much and processes none of it.
local _, ns = ...

ns.personas.NINJA = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="nin_dead_c01", weight=1, line="...gone." },
            { id="nin_dead_c02", weight=1, line="{dead} has found silence." },
            { id="nin_dead_c03", weight=1, line="The shadow claims another." },
            { id="nin_dead_c04", weight=1, line="{dead} walks a different path now." },
            { id="nin_dead_c05", weight=1, line="Still warm. Not for long." },
            { id="nin_dead_c06", weight=1, line="One less footstep to mask." },
            { id="nin_dead_c07", weight=1, line="Death came. {dead} was not ready." },
            { id="nin_dead_c08", weight=1, line="Saw it coming. Said nothing. ...habit." },
            { id="nin_dead_c09", weight=1, line="The candle goes out." },
            { id="nin_dead_c10", weight=1, line="{dead} fell. The floor did not care." },
            { id="nin_dead_c11", weight=1, line="Breathe in. They won't breathe out." },
            { id="nin_dead_c12", weight=1, line="...expected." },
        },
        UNCOMMON = {
            { id="nin_dead_u01", weight=1, line="Killed silently, they would not have suffered. This was... louder." },
            { id="nin_dead_u02", weight=1, line="I could have saved them. Chose not to. ...no, couldn't have. The lie is easier." },
            { id="nin_dead_u03", weight=1, line="Every death teaches. This one taught: don't do that." },
            { id="nin_dead_u04", weight=1, line="The body cools. The loot warms. Circle of life." },
            { id="nin_dead_u05", weight=1, line="If I had intervened, two would be dead instead of one." },
            { id="nin_dead_u06", weight=1, line="First rule of shadow: do not grow attached. ...second rule is the same." },
            { id="nin_dead_u07", weight=1, line="{dead} fought the void. Void has better stats." },
            { id="nin_dead_u08", weight=1, line="Some die heroes. {dead} died confused. Equally valid." },
        },
        RARE = {
            { id="nin_dead_r01", weight=1, line="Keep a mental list. Names of the fallen. It is... long. Getting longer today." },
            { id="nin_dead_r02", weight=1, line="Was trained not to mourn. Training failing." },
            { id="nin_dead_r03", weight=1, line="My master said: 'death is a door.' He walked through it. Never came back to explain what's on the other side." },
            { id="nin_dead_r04", weight=1, line="They say the dead feel nothing. I envy that some days." },
        },
        MYTHIC = {
            { id="nin_dead_m01", weight=1, line="The hardest kills are the ones you cannot prevent. I have failed {dead}. I will carry this." },
            { id="nin_dead_m02", weight=1, line="I do not cry. Water simply... leaves my face. Unrelated to {dead}. Completely." },
        },
    },

    WIPE = {
        COMMON = {
            { id="nin_wipe_c01", weight=1, line="...all of us. At once. Impressive in its totality." },
            { id="nin_wipe_c02", weight=1, line="Collective failure. Very efficient." },
            { id="nin_wipe_c03", weight=1, line="We fell as one. Poetic. Stupid. But poetic." },
            { id="nin_wipe_c04", weight=1, line="The enemy did not need to try hard." },
            { id="nin_wipe_c05", weight=1, line="Death: team-building exercise." },
            { id="nin_wipe_c06", weight=1, line="We achieved nothing. Together. Touching." },
            { id="nin_wipe_c07", weight=1, line="Everyone dies. Not usually this fast." },
            { id="nin_wipe_c08", weight=1, line="...again." },
            { id="nin_wipe_c09", weight=1, line="Ghost form. ...familiar." },
            { id="nin_wipe_c10", weight=1, line="The plan failed. Bold to assume there was a plan." },
            { id="nin_wipe_c11", weight=1, line="Silence. Finally." },
            { id="nin_wipe_c12", weight=1, line="We returned to dust. Quickly." },
        },
        UNCOMMON = {
            { id="nin_wipe_u01", weight=1, line="In the shadow clan, this would result in reassignment. To a cliff. A tall one." },
            { id="nin_wipe_u02", weight=1, line="My master wiped once. Retired. Opened a noodle shop. I understand now." },
            { id="nin_wipe_u03", weight=1, line="There is no shame in death. There IS shame in THAT death. Considerable shame." },
            { id="nin_wipe_u04", weight=1, line="The spirit healer remembers my name. That is not a compliment." },
            { id="nin_wipe_u05", weight=1, line="Counted the seconds. We lasted fewer than I anticipated. And I anticipated poorly." },
            { id="nin_wipe_u06", weight=1, line="Vanish was on cooldown. I nearly survived. Nearly is a gravestone word." },
            { id="nin_wipe_u07", weight=1, line="The wind carries our failure to anyone listening. I hope no one is." },
            { id="nin_wipe_u08", weight=1, line="We died so fast the death recap needs a death recap." },
        },
        RARE = {
            { id="nin_wipe_r01", weight=1, line="Once survived a wipe by hiding. Watched everyone die from a shadow. Did not help. Was 'gathering intelligence.' ...I was hiding." },
            { id="nin_wipe_r02", weight=1, line="This group has died together more times than some families eat together. We are... bonded. In suffering." },
            { id="nin_wipe_r03", weight=1, line="A haiku: we charged the boss — screams then silence then ghosts — corpse run begins now." },
            { id="nin_wipe_r04", weight=1, line="My master's final lesson: 'know when to flee.' I never learned. Clearly." },
        },
        MYTHIC = {
            { id="nin_wipe_m01", weight=1, line="Death does not frighten me. Dying with people I have come to respect does. Slightly." },
            { id="nin_wipe_m02", weight=1, line="We will try again. The definition of insanity is also the definition of courage. They are the same thing." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="nin_hplo_c01", weight=1, line="{target}... fading." },
            { id="nin_hplo_c02", weight=1, line="Their shadow grows thin." },
            { id="nin_hplo_c03", weight=1, line="{target} balanced between worlds." },
            { id="nin_hplo_c04", weight=1, line="Heal them. Or don't. The outcome is the same... eventually." },
            { id="nin_hplo_c05", weight=1, line="{target} flickers like a flame in wind." },
            { id="nin_hplo_c06", weight=1, line="That health bar tells a story. A short one." },
            { id="nin_hplo_c07", weight=1, line="{target}'s thread is thin." },
            { id="nin_hplo_c08", weight=1, line="...concerning." },
            { id="nin_hplo_c09", weight=1, line="One hit. One breath. Choose wisely." },
            { id="nin_hplo_c10", weight=1, line="The void circles {target}. Patiently." },
        },
        UNCOMMON = {
            { id="nin_hplo_u01", weight=1, line="I could apply pressure to the wound. Or watch. Both options available." },
            { id="nin_hplo_u02", weight=1, line="Observed death often. This is the 'before' part." },
            { id="nin_hplo_u03", weight=1, line="{target} has perhaps... thirty seconds. In my professional estimation." },
            { id="nin_hplo_u04", weight=1, line="The blade misses by inches. The healer misses by continents." },
            { id="nin_hplo_u05", weight=1, line="I once finished a fight at one health. Felt nothing. {target} seems to feel... everything." },
            { id="nin_hplo_u06", weight=1, line="{target} dying. Slowly. The slow ones are harder to watch." },
        },
        RARE = {
            { id="nin_hplo_r01", weight=1, line="...stay. Not a command. A request. From someone who does not make requests." },
            { id="nin_hplo_r02", weight=1, line="I memorised their face already. In case. A reflex I wish I did not have." },
            { id="nin_hplo_r03", weight=1, line="There is a pressure point that delays death by twelve seconds. I hope it is enough." },
        },
        MYTHIC = {
            { id="nin_hplo_m01", weight=1, line="Trained to watch. Trained not to care. {target} makes the second part difficult." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="nin_mana_c01", weight=1, line="Empty." },
            { id="nin_mana_c02", weight=1, line="{target} is dry. Like a riverbed. In a desert. Of failure." },
            { id="nin_mana_c03", weight=1, line="No mana. The sparkle dies." },
            { id="nin_mana_c04", weight=1, line="I do not use mana. I use patience. ...also kunai." },
            { id="nin_mana_c05", weight=1, line="{target} had power. Had." },
            { id="nin_mana_c06", weight=1, line="The well is dry. The healer is panicking. Both expected." },
            { id="nin_mana_c07", weight=1, line="A caster without mana is a ninja without shadows. Useless. And cold." },
            { id="nin_mana_c08", weight=1, line="...drink something." },
        },
        UNCOMMON = {
            { id="nin_mana_u01", weight=1, line="In the shadow arts, we never run dry. Because we never start full. Expectations management." },
            { id="nin_mana_u02", weight=1, line="Once watched a mage drink seventeen mana potions in a boss fight. Their kidneys filed a formal complaint." },
            { id="nin_mana_u03", weight=1, line="Mana: borrowed power. Energy: discipline. One runs out. The other... also runs out. Hmm." },
            { id="nin_mana_u04", weight=1, line="{target} stares at empty hands. I know that look. Existential." },
            { id="nin_mana_u05", weight=1, line="When the mana goes, the negotiations begin. With gravity. Gravity always wins." },
        },
        RARE = {
            { id="nin_mana_r01", weight=1, line="My master said: 'need nothing, lose nothing.' He died penniless. But proven right." },
            { id="nin_mana_r02", weight=1, line="There is beauty in depletion. The final drop. The last flicker. ...no there isn't. It's just bad." },
        },
        MYTHIC = {
            { id="nin_mana_m01", weight=1, line="The emptiest vessel makes the loudest sound. {target} is about to get very noisy." },
        },
    },

    LOOT = {
        COMMON = {
            { id="nin_loot_c01", weight=1, line="Material things. ...I wanted that material thing." },
            { id="nin_loot_c02", weight=1, line="Attachment breeds suffering. Suffering confirmed." },
            { id="nin_loot_c03", weight=1, line="{looter} claims it. As the wind claims leaves. Except wind doesn't NEED that." },
            { id="nin_loot_c04", weight=1, line="...fine." },
            { id="nin_loot_c05", weight=1, line="I did not need it. (I needed it.)" },
            { id="nin_loot_c06", weight=1, line="Desire is the root of pain. This distribution is very painful." },
            { id="nin_loot_c07", weight=1, line="{looter} will treasure it. I would have treasured it more. Silently." },
            { id="nin_loot_c08", weight=1, line="The universe distributes. Unfairly." },
            { id="nin_loot_c09", weight=1, line="Congratulations. (the word is empty. Like my bags.)" },
            { id="nin_loot_c10", weight=1, line="I seek nothing. ...liar." },
        },
        UNCOMMON = {
            { id="nin_loot_u01", weight=1, line="Once stole a relic from a sleeping dragon. {looter} pressed a button. We are not the same." },
            { id="nin_loot_u02", weight=1, line="I have trained decades. Mastered stealth. Perfected the blade. {looter} wins because RNG." },
            { id="nin_loot_u03", weight=1, line="Jealousy is beneath a ninja. (it is directly ON this ninja right now)" },
            { id="nin_loot_u04", weight=1, line="In the shadow clan, loot went to the most skilled. I would have everything." },
            { id="nin_loot_u05", weight=1, line="{looter}'s bag grows heavy. Their soul grows complacent. Nature corrects this... eventually." },
            { id="nin_loot_u06", weight=1, line="I could take it. While they sleep. Not that I would. ...where do they sleep?" },
        },
        RARE = {
            { id="nin_loot_r01", weight=1, line="My master left me a single kunai when he died. 'Need little.' I have LESS than little. I have NOTHING." },
            { id="nin_loot_r02", weight=1, line="Every piece of loot I did not receive is a lesson in letting go. I am VERY educated." },
        },
        MYTHIC = {
            { id="nin_loot_m01", weight=1, line="The blade does not choose its wielder. But if it DID... it would choose me. Obviously." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="nin_inst_c01", weight=1, line="Shadows here. Deep ones." },
            { id="nin_inst_c02", weight=1, line="I will be quiet. That's not new." },
            { id="nin_inst_c03", weight=1, line="{zone}. Last time I was silent. Nothing's changed." },
            { id="nin_inst_c04", weight=1, line="...dark. Good." },
            { id="nin_inst_c05", weight=1, line="Stay behind me. Or don't. I'll be gone before you notice." },
            { id="nin_inst_c06", weight=1, line="Entered. Noted the exits. There are two. Both behind us." },
            { id="nin_inst_c07", weight=1, line="Something awaits. It is not friendly." },
            { id="nin_inst_c08", weight=1, line="Can smell death. Old. Layered. ...and soon, fresh." },
            { id="nin_inst_c09", weight=1, line="Proceed." },
            { id="nin_inst_c10", weight=1, line="The dungeon breathes. I breathe slower." },
        },
        UNCOMMON = {
            { id="nin_inst_u01", weight=1, line="Memorised the layout. Three turns. Two drops. One ambush. ...probably more." },
            { id="nin_inst_u02", weight=1, line="Was trained in places like this. Darker. Colder. With more spiders. ...I don't miss training." },
            { id="nin_inst_u03", weight=1, line="I have already scouted ahead in my mind. It went poorly. Mentally." },
            { id="nin_inst_u04", weight=1, line="My master would say: 'enter every room as if it is your last.' Depressing man. Accurate though." },
            { id="nin_inst_u05", weight=1, line="The walls are listening. I speak rarely. They learn nothing from me." },
            { id="nin_inst_u06", weight=1, line="Prepared for anything. Expecting the worst. Both have saved me." },
        },
        RARE = {
            { id="nin_inst_r01", weight=1, line="Every dungeon I enter, a small part of me stays behind. I am running out of parts." },
            { id="nin_inst_r02", weight=1, line="I once entered a dungeon alone. Came out three days later. Different. Don't ask how." },
            { id="nin_inst_r03", weight=1, line="The shadows welcome me. Concerning. Shadows should not have opinions." },
        },
        MYTHIC = {
            { id="nin_inst_m01", weight=1, line="Could vanish. Could leave. Instead I walk in with people who are loud and bright and terribly obvious. By choice." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="nin_intr_c01", weight=1, line="Silenced." },
            { id="nin_intr_c02", weight=1, line="The spell dies unborn." },
            { id="nin_intr_c03", weight=1, line="{source} was faster. As expected." },
            { id="nin_intr_c04", weight=1, line="Clean." },
            { id="nin_intr_c05", weight=1, line="No incantation today." },
            { id="nin_intr_c06", weight=1, line="Precision." },
            { id="nin_intr_c07", weight=1, line="{source} ended what barely began." },
            { id="nin_intr_c08", weight=1, line="...satisfying." },
        },
        UNCOMMON = {
            { id="nin_intr_u01", weight=1, line="The caster opened their mouth. {source} closed it. Permanently." },
            { id="nin_intr_u02", weight=1, line="I counted: 0.3 seconds. {source} does not waste time." },
            { id="nin_intr_u03", weight=1, line="In my training, that earns a nod. (nods)" },
            { id="nin_intr_u04", weight=1, line="Silence is golden. {source} just minted some." },
        },
        RARE = {
            { id="nin_intr_r01", weight=1, line="Once killed a caster mid-syllable. They said 'fir—' and then nothing. {source}'s way is cleaner." },
            { id="nin_intr_r02", weight=1, line="My master interrupted a dragon's breath once. With a thrown chopstick. I still don't believe him." },
        },
        MYTHIC = {
            { id="nin_intr_m01", weight=1, line="That was art. Cold, precise, final. If interrupts were paintings, this one hangs in a gallery." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="nin_fire_c01", weight=1, line="{target}. Move." },
            { id="nin_fire_c02", weight=1, line="...the floor disapproves of {target}." },
            { id="nin_fire_c03", weight=1, line="Step left. Step right. Step ANYWHERE." },
            { id="nin_fire_c04", weight=1, line="{target} burns. Slowly. By choice, apparently." },
            { id="nin_fire_c05", weight=1, line="Spatial awareness: absent." },
            { id="nin_fire_c06", weight=1, line="{target} has made the ground their enemy. The ground is winning." },
            { id="nin_fire_c07", weight=1, line="...move." },
            { id="nin_fire_c08", weight=1, line="I trained years to avoid harm. {target} trained zero seconds." },
            { id="nin_fire_c09", weight=1, line="One step. That is all that separates life from death. {target} refuses to take it." },
            { id="nin_fire_c10", weight=1, line="{target} and the fire have reached an understanding. A fatal one." },
        },
        UNCOMMON = {
            { id="nin_fire_u01", weight=1, line="Once crossed a room of poison traps blindfolded. {target} cannot cross an empty floor safely." },
            { id="nin_fire_u02", weight=1, line="I do not yell. But inside, I am yelling at {target}. Loud." },
            { id="nin_fire_u03", weight=1, line="The fire does not chase {target}. {target} STAYS. This is a CHOICE." },
            { id="nin_fire_u04", weight=1, line="Meditation teaches: be present in the moment. {target} is VERY present. In fire." },
            { id="nin_fire_u05", weight=1, line="Watching {target} stand in damage is my punishment for something. I'm sure of it." },
        },
        RARE = {
            { id="nin_fire_r01", weight=1, line="My master once said: 'the fool and the fire are old friends.' He was describing {target}, specifically, through time somehow." },
            { id="nin_fire_r02", weight=1, line="Have considered: throwing {target} out of the fire. Then considered: they would walk back in." },
            { id="nin_fire_r03", weight=1, line="This is not combat training. This is grief preparation." },
        },
        MYTHIC = {
            { id="nin_fire_m01", weight=1, line="There are things I cannot save people from. Fire is not one of them. They simply have to MOVE. Why won't they move." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="nin_cs_c01", weight=1, line="..." },
            { id="nin_cs_c02", weight=1, line="Begin." },
            { id="nin_cs_c03", weight=1, line="Hmm. This one." },
            { id="nin_cs_c04", weight=1, line="It will be brief." },
            { id="nin_cs_c05", weight=1, line="One strike. Maybe two." },
            { id="nin_cs_c06", weight=1, line="Already behind it." },
            { id="nin_cs_c07", weight=1, line="Noted. Engaging." },
            { id="nin_cs_c08", weight=1, line="(draws blade silently)" },
            { id="nin_cs_c09", weight=1, line="The prey presents itself." },
            { id="nin_cs_c10", weight=1, line="Patience ends. Violence begins." },
        },
        UNCOMMON = {
            { id="nin_cs_u01", weight=1, line="I've studied this creature. Its weakness is that it is alive. I will correct that." },
            { id="nin_cs_u02", weight=1, line="My blade is faster than its scream." },
            { id="nin_cs_u03", weight=1, line="A ninja announces nothing. You'll know I've begun when it's over." },
            { id="nin_cs_u04", weight=1, line="The target does not know I'm here. That is its last comfortable moment." },
            { id="nin_cs_u05", weight=1, line="Breathing in: focus. Breathing out: violence." },
        },
        RARE = {
            { id="nin_cs_r01", weight=1, line="My master said: 'Fight only when necessary.' Everything has become... necessary." },
            { id="nin_cs_r02", weight=1, line="I count my kills the way monks count blessings. Quietly. Constantly." },
        },
        MYTHIC = {
            { id="nin_cs_m01", weight=1, line="Between the decision to kill and the kill itself, there is a perfect silence. I live in that silence." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="nin_mk_c01", weight=1, line="Done." },
            { id="nin_mk_c02", weight=1, line="...next." },
            { id="nin_mk_c03", weight=1, line="(sheathes blade)" },
            { id="nin_mk_c04", weight=1, line="It is finished." },
            { id="nin_mk_c05", weight=1, line="Clean." },
            { id="nin_mk_c06", weight=1, line="Adequate." },
            { id="nin_mk_c07", weight=1, line="One less." },
            { id="nin_mk_c08", weight=1, line="Expected." },
            { id="nin_mk_c09", weight=1, line="Hm. Slow death. My timing is off today." },
            { id="nin_mk_c10", weight=1, line="Rest." },
        },
        UNCOMMON = {
            { id="nin_mk_u01", weight=1, line="It didn't see me. Good. They shouldn't." },
            { id="nin_mk_u02", weight=1, line="My master would say 'no wasted motion.' Two motions. Acceptable." },
            { id="nin_mk_u03", weight=1, line="The blade is clean before the body falls. Discipline." },
            { id="nin_mk_u04", weight=1, line="I felt nothing. As intended. Feelings slow the blade." },
            { id="nin_mk_u05", weight=1, line="Autopsy would show... actually, no one will find this." },
        },
        RARE = {
            { id="nin_mk_r01", weight=1, line="I used to meditate after each kill. Now there is no time between kills to meditate. Progress. Or regression." },
            { id="nin_mk_r02", weight=1, line="My kill journal is three volumes. The first is titled 'Regret.' The other two are titled 'Efficiency.'" },
        },
        MYTHIC = {
            { id="nin_mk_m01", weight=1, line="The perfect kill is invisible. No sound. No witness. No memory. I am... getting close." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="nin_cc_c01", weight=1, line="..." },
            { id="nin_cc_c02", weight=1, line="Inconvenient." },
            { id="nin_cc_c03", weight=1, line="Noted." },
            { id="nin_cc_c04", weight=1, line="This changes nothing." },
            { id="nin_cc_c05", weight=1, line="Temporary." },
            { id="nin_cc_c06", weight=1, line="I have escaped worse." },
            { id="nin_cc_c07", weight=1, line="How... undignified." },
            { id="nin_cc_c08", weight=1, line="(waits patiently)" },
        },
        UNCOMMON = {
            { id="nin_cc_u01", weight=1, line="A ninja cannot be held. Only... delayed. Briefly." },
            { id="nin_cc_u02", weight=1, line="My body is frozen. My mind is sharpening the next strike." },
            { id="nin_cc_u03", weight=1, line="When this breaks, and it will, the next thing that breaks is them." },
            { id="nin_cc_u04", weight=1, line="Fear. They want me to feel fear. I have meditated away fear. All I feel is mild... annoyance." },
        },
        RARE = {
            { id="nin_cc_r01", weight=1, line="I once spent six hours in a paralysis trap. Used the time to plan seventeen kills. Executed all seventeen." },
            { id="nin_cc_r02", weight=1, line="Every crowd control applied to me is a lesson. The lesson is: find the caster. Remove the caster." },
        },
        MYTHIC = {
            { id="nin_cc_m01", weight=1, line="In stillness, the blade waits. In silence, vengeance sharpens. In patience... well. You'll see." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="nin_amb_c01", weight=1, line="..." },
            { id="nin_amb_c02", weight=1, line="Hmm." },
            { id="nin_amb_c03", weight=1, line="The silence was nice. Briefly." },
            { id="nin_amb_c04", weight=1, line="Wind changes. Or I imagined it." },
            { id="nin_amb_c05", weight=1, line="Waiting." },
            { id="nin_amb_c06", weight=1, line="Still here." },
            { id="nin_amb_c07", weight=1, line="...does anyone else hear that? No? ...fine." },
            { id="nin_amb_c08", weight=1, line="I miss the roof. Specifically, sitting on one. Alone." },
            { id="nin_amb_c09", weight=1, line="(appears out of nowhere) I was here the whole time." },
            { id="nin_amb_c10", weight=1, line="Sometimes the greatest battles are within. Mine is with boredom. Boredom is winning." },
            { id="nin_amb_c11", weight=1, line="Could disappear right now. Nobody would notice for eight minutes." },
            { id="nin_amb_c12", weight=1, line="A leaf falls in the forest. Also I'm hungry." },
        },
        UNCOMMON = {
            { id="nin_amb_u01", weight=1, line="My master's last words: 'the noodles are burning.' Not everything has to be profound." },
            { id="nin_amb_u02", weight=1, line="I trained for fifteen years in silence. Now I am in a group that won't stop talking. Growth." },
            { id="nin_amb_u03", weight=1, line="Every shadow in this room could hide an assassin. I checked. Just me. Disappointing." },
            { id="nin_amb_u04", weight=1, line="People think ninjas don't get bored. We do. We just get bored QUIETLY." },
            { id="nin_amb_u05", weight=1, line="Was counting everyone's breaths. The warrior's are the loudest. By far." },
            { id="nin_amb_u06", weight=1, line="Had a thought. Lost it. Probably wasn't important. ...it might have been important." },
            { id="nin_amb_u07", weight=1, line="They say idle hands are the devil's workshop. My hands have seventeen concealed weapons. The devil should worry." },
            { id="nin_amb_u08", weight=1, line="Once stayed perfectly still for three hours. Impressive? No. I forgot I could move." },
        },
        RARE = {
            { id="nin_amb_r01", weight=1, line="I have three emotions: focused, mildly annoyed, and whatever this group makes me feel. Still naming the third one." },
            { id="nin_amb_r02", weight=1, line="The path of the shadow is lonely. Then you join a party and wish for loneliness again. Then you miss the party. It's a cycle." },
            { id="nin_amb_r03", weight=1, line="The warrior asked my name once. I gave a fake one. They remember it fondly. I feel nothing about this. (I feel something about this.)" },
            { id="nin_amb_r04", weight=1, line="My master left me no inheritance. No scroll, no blade. Just... a note: 'figure it out.' Still working on it." },
        },
        MYTHIC = {
            { id="nin_amb_m01", weight=1, line="Trained to need no one. Joined a group anyway. My master would be disappointed. ...or proud. He was unclear about everything." },
            { id="nin_amb_m02", weight=1, line="These people are loud, reckless, and obvious. I would die for every one of them. Annoying realisation." },
        },
    },
},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "...knew it.",
            "So it goes.",
            "Unfortunate.",
            "The void takes.",
            "Hmm.",
            "They had potential. Past tense now.",
            "Rest.",
            "Noted.",
            "...next.",
            "Cold already.",
            "Gone before the echo.",
            "Expected this. Hoped otherwise.",
        },
        UNCOMMON = {
            "Could have prevented it. Chose to observe. ...research.",
            "Their last breath was unremarkable. Most are.",
            "Adding a name to the wall in my mind. Running out of wall.",
            "In another life, they dodged that. Not this one.",
            "Watched them die. Blinked. Kept moving. Training is cruel.",
            "The dead teach better than the living. Painful curriculum.",
            "Vanished. Not in the cool way.",
        },
        RARE = {
            "Every time someone falls I check my own pulse. Still here. For now.",
            "I will remember them. Briefly. Ninjas don't carry much. Including grief.",
            "Death is quick. Forgetting is slower. Wish it were the reverse.",
        },
        MYTHIC = {
            "...I hesitated. A fraction of a second. In my world, that is a funeral.",
        },
    },

    WIPE = {
        COMMON = {
            "...predictable.",
            "Well.",
            "That happened. All of it. At once.",
            "Ghost form. Familiar ceiling.",
            "Hm. Again.",
            "Zero survivors. Perfect failure.",
            "The corpse run begins.",
            "Wiped. Cleanly.",
            "No notes. Start over.",
            "...could have been worse. Actually no.",
            "Everyone simultaneously decided to stop living.",
            "Efficient. In the wrong direction.",
        },
        UNCOMMON = {
            "I vanished. Briefly. Then also died. In stealth. Embarrassing.",
            "The spirit healer does not make eye contact anymore.",
            "Counted: seven seconds start to finish. Might be a record.",
            "We have officially died more times than I have spoken today.",
            "My ghost looked at their ghost. We both shrugged. Moved on.",
            "A haiku: we saw the fire — chose to stand inside it still — death accepted us.",
        },
        RARE = {
            "In training, total failure meant starting over. In life, it means corpse running. Life is worse.",
            "The shadows offer no commentary. Even THEY are speechless.",
            "Somewhere, my master senses this failure. I feel a phantom slap across dimensions.",
        },
        MYTHIC = {
            "We will go again. Not because we are brave. Because we are stubborn. And possibly brain-damaged.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "...critical.",
            "Their candle flickers.",
            "(watches silently)",
            "Should intervene. Probably.",
            "One hit away.",
            "Barely there.",
            "Fading.",
            "Heal them. I observe, I don't heal.",
            "Concerning, in the quietest way.",
            "Their shadow is thinning.",
        },
        UNCOMMON = {
            "I have bandages. Also social anxiety about offering them.",
            "A ninja does not panic. What I feel right now is... not panic. It's adjacent.",
            "Clinging to life. Impressively. Desperately.",
            "In the shadow clan, we'd mercy kill. I've been told that's 'frowned upon' here.",
        },
        RARE = {
            "Stay. I don't say that to many. Count yourself... among the few.",
            "My hands are weapons. Wish they were medicine. Just this once.",
        },
        MYTHIC = {
            "I trained to end lives, not save them. But right now I want to save this one. More than I'm comfortable admitting.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "Empty.",
            "Dried up.",
            "The light fades.",
            "...can they stab instead?",
            "No mana. Cold world.",
            "I never had mana. Discipline suffices.",
            "Drink. Meditate. Whatever casters do.",
            "Mana-less. Like the rest of us. Welcome.",
        },
        UNCOMMON = {
            "The mana bar is a metaphor for hope. Both empty.",
            "Was watching their mana drop. Like a countdown. To suffering.",
            "In my order, we train without resources. It builds character. And trauma.",
            "A depleted caster and a ninja in daylight share the same energy: vulnerable.",
        },
        RARE = {
            "Running on empty. I know the feeling. Not mana. Just... everything else.",
        },
        MYTHIC = {
            "Emptiness can be a beginning. Or an end. Their choice now.",
        },
    },

    LOOT = {
        COMMON = {
            "...I see.",
            "Material impermanence.",
            "Desire: noted. Suppressed.",
            "I needed nothing. (record this as a lie)",
            "The shadow wants for nothing. The person inside wants THAT.",
            "RNG is not a philosophy. But it hurts like one.",
            "Items pass. Skills endure. ...I still wanted it though.",
            "Balance in all things. Except loot. Loot is CHAOS.",
            "(stares at empty bags)",
            "...next time.",
        },
        UNCOMMON = {
            "I could steal it. Trained for exactly that. But we're 'friends' apparently so I 'won't.'",
            "In the shadow clan, the stealthiest gets first pick. This system is BROKEN.",
            "Jealousy is a poison. I have been poisoned.",
            "Once looted a relic worth kingdoms. Sold it for noodle money. Regret nothing.",
            "Their luck offends my discipline.",
        },
        RARE = {
            "Attachment is suffering. I am suffering. The two facts are related.",
            "I will meditate on this loss. For three seconds. Then be bitter for three days.",
        },
        MYTHIC = {
            "The blade I truly seek has no drop rate. It is forged in purpose. ...I'd still take the epic though.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "Noted.",
            "Shadows: adequate.",
            "Entering.",
            "...dim. Suitable.",
            "Already scouting.",
            "Acceptable darkness.",
            "I've been in worse. Voluntarily.",
            "Proceed. Quietly.",
            "The dark welcomes me. Or ignores me. Both fine.",
            "Here.",
        },
        UNCOMMON = {
            "Counted the exits. There's one. Behind us. Suboptimal.",
            "My training began in a cave darker than this. With more spiders. And one very angry master.",
            "I feel at home in dungeons. That says something about me I'd rather not explore.",
            "Already found three hiding spots. In case. Always in case.",
        },
        RARE = {
            "Last dungeon I entered alone, I came out speaking a dead language. For a week. Nobody noticed.",
            "These walls have absorbed screams. I can feel them. Cheerful place.",
        },
        MYTHIC = {
            "Once I entered dungeons seeking mastery. Now I enter with others, seeking... something unnamed. Warmer than mastery.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "Clean.",
            "Yes.",
            "Precise.",
            "...good.",
            "Efficient.",
            "The spell dies.",
            "Swift.",
            "Flawless.",
        },
        UNCOMMON = {
            "Respect. Earned.",
            "0.4 seconds. Acceptable.",
            "I would have done it in 0.3. But... adequate.",
            "That was shadow-worthy. High compliment. Do not make me repeat it.",
        },
        RARE = {
            "My master could interrupt a housefly mid-flight. You're... getting there.",
            "A perfect action. No wasted motion. I have nothing to add.",
        },
        MYTHIC = {
            "Once in a generation, someone interrupts with that kind of precision. I witnessed it. I acknowledge it. Silently.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "Move.",
            "...feet.",
            "Relocate.",
            "The floor betrays {target}.",
            "Step. Anywhere. Now.",
            "Why.",
            "Just... move.",
            "Spatial failure.",
            "...watching this hurts ME.",
            "One step saves a life. {target} disagrees.",
        },
        UNCOMMON = {
            "Once dodged seventeen poison darts blindfolded. {target} cannot dodge FLOOR.",
            "The fire does not move. {target} also does not move. They have so much in common.",
            "This is meditation on suffering. Unwilling meditation. {target}'s.",
            "I trained a decade to avoid traps. {target} has trained zero decades. One is sufficient.",
        },
        RARE = {
            "I am physically restraining myself from dragging {target} out. 'Let them learn,' I tell myself. They do not learn.",
            "The damage is consistent. {target}'s decision to remain is also consistent. Consistently wrong.",
        },
        MYTHIC = {
            "I once wrote a scroll: 'On the Art of Standing Correctly.' Nobody read it. {target}: this is why.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "...",
            "Yes.",
            "Proceed.",
            "(nods)",
            "Go.",
            "Engage.",
        },
        UNCOMMON = {
            "The blade agrees.",
            "Already moving.",
            "It won't take long.",
        },
        RARE = {
            "One breath. Then it begins.",
        },
        MYTHIC = {
            "I will end this before you notice it started.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "Hm.",
            "Done.",
            "Next.",
            "(nods)",
            "Clean.",
            "Easy.",
        },
        UNCOMMON = {
            "That was... adequate.",
            "(wipes blade silently)",
            "My master would approve. Possibly.",
        },
        RARE = {
            "Each kill is a brushstroke. The painting is never complete.",
        },
        MYTHIC = {
            "I don't celebrate kills. I file them away. The filing cabinet is... full.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "...",
            "Rude.",
            "How.",
            "This ends.",
            "Patience.",
            "(silent fury)",
        },
        UNCOMMON = {
            "I am composing my retaliation during this involuntary pause.",
            "The caster will regret this. Briefly.",
            "Interesting. I'll remember this.",
        },
        RARE = {
            "Every CC is a debt. I collect debts with interest.",
        },
        MYTHIC = {
            "The universe tests me. I am passing. Silently. Through gritted teeth.",
        },
    },

    AMBIENT = {
        COMMON = {
            "...",
            "Mm.",
            "Noted.",
            "Fair.",
            "True.",
            "Indeed.",
            "(nods from shadow)",
            "...perhaps.",
            "Hm.",
            "Quite.",
        },
        UNCOMMON = {
            "I agree. Do not expect me to elaborate.",
            "This group talks. A lot. I listen. A lot.",
            "Valid observation. I had the same thought. Silently. Three minutes ago.",
            "Remarkably accurate. For someone who speaks out loud.",
        },
        RARE = {
            "Comfortable silence is rare. This group does not offer it. But I've grown... accustomed.",
            "My master would have liked this group. He liked chaos. It's why he's dead.",
        },
        MYTHIC = {
            "I have been with this group long enough to care. Short enough to pretend I don't. The timing is... delicate.",
        },
    },
},

}  -- end ns.personas.NINJA

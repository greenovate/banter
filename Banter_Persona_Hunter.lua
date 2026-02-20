-- Banter_Persona_Hunter.lua
-- Voice: HUNTER CLASS — pet excuses, accidental pulls, Feign Death artistry,
-- "my pet did it" energy, nature documentary narrator.
-- Rules: 1) Everything is the pet's fault (even when it isn't). 2) Feign Death solves all problems.
-- 3) Aspect management is their personality. 4) They pulled it but they didn't MEAN to.
-- 5) Secretly thinks they're the main character.
local _, ns = ...

ns.personas.HUNTER = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="hun_dead_c01", weight=1, line="{dead} is dead. I'd help but my pet is also having a crisis." },
            { id="hun_dead_c02", weight=1, line="RIP {dead}. They died closer to the mob than anyone should ever be." },
            { id="hun_dead_c03", weight=1, line="{dead} went down. My pet is very upset. He's not showing it but I can tell." },
            { id="hun_dead_c04", weight=1, line="I was going to Feign Death to make the mob attack someone else. ...someone else was {dead}. Sorry." },
            { id="hun_dead_c05", weight=1, line="{dead} is dead. If they had a pet, the pet could've tanked that. Just saying." },
            { id="hun_dead_c06", weight=1, line="I saw {dead} die from max range. Crystal clear view. Nothing I could do. Great view though." },
            { id="hun_dead_c07", weight=1, line="{dead} died. I Feigned Death in solidarity. ...and to drop aggro. Mostly the aggro thing." },
            { id="hun_dead_c08", weight=1, line="That death wasn't my fault. My pet's fault? Also no. Nobody's fault but {dead}'s." },
        },
        UNCOMMON = {
            { id="hun_dead_u01", weight=1, line="I was going to Multi-Shot the mob off {dead}. Then I remembered Multi-Shot hits everything. Bad plan." },
            { id="hun_dead_u02", weight=1, line="{dead} died inside my minimum range. I literally could not help." },
            { id="hun_dead_u03", weight=1, line="My pet is sitting next to {dead}'s corpse. He does that sometimes. It's either mourning or hunger." },
            { id="hun_dead_u04", weight=1, line="{dead} needed healing. I have Mend Pet. Different department." },
        },
        RARE = {
            { id="hun_dead_r01", weight=1, line="I've lost more party members than pets. And I've lost A LOT of pets." },
            { id="hun_dead_r02", weight=1, line="In nature, the slow ones get eaten. {dead}, I hate to say it, but Darwin agrees with me." },
        },
        MYTHIC = {
            { id="hun_dead_m01", weight=1, line="{dead} is dead and my pet is now loyalty level 'confused.' We'll both need a moment." },
        },
    },

    WIPE = {
        COMMON = {
            { id="hun_wipe_c01", weight=1, line="Wipe. I Feigned Death. The mob fell for it. Again. You're all welcome for nothing." },
            { id="hun_wipe_c02", weight=1, line="I'm playing dead on the floor. The boss walked right past me. This is why I main hunter." },
            { id="hun_wipe_c03", weight=1, line="Wipe. My pet survived longer than three party members. He's very proud." },
            { id="hun_wipe_c04", weight=1, line="Everyone died but me. Feign Death is not cowardice. It's advanced survival theory." },
        },
        UNCOMMON = {
            { id="hun_wipe_u01", weight=1, line="I Feigned, my pet died, and now everyone's dead. But I'm alive. That's 1 out of 5. Passing grade." },
            { id="hun_wipe_u02", weight=1, line="Fun fact: hunters survive more wipes than any other class. Source: me, just now, still alive." },
        },
        RARE = {
            { id="hun_wipe_r01", weight=1, line="I Feigned Death so convincingly the spirit healer tried to rez me." },
        },
        MYTHIC = {
            { id="hun_wipe_m01", weight=1, line="Total wipe. I'm laying here face-down pretending to be dead while the boss patrols 5 feet away. This is cinema." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="hun_hplo_c01", weight=1, line="{target} is low. I could trap the mob but... should I? Let me think about it." },
            { id="hun_hplo_c02", weight=1, line="{target} is dying. I have Mend Pet, not Mend Party Member." },
            { id="hun_hplo_c03", weight=1, line="My pet has more health than {target} right now. That's saying something." },
            { id="hun_hplo_c04", weight=1, line="I could Distracting Shot the mob off {target}. Then it'd come to ME. Let me reconsider." },
        },
        UNCOMMON = {
            { id="hun_hplo_u01", weight=1, line="I'd pull the mob off {target} but last time I did that I accidentally pulled two more." },
            { id="hun_hplo_u02", weight=1, line="My pet could taunt. He won't. He's moody. Union rules." },
        },
        RARE = {
            { id="hun_hplo_r01", weight=1, line="I healed my pet instead of {target}. In my defense, my pet listens to me." },
        },
        MYTHIC = {
            { id="hun_hplo_m01", weight=1, line="If I Feign Death, the mob goes to {target} instead. ...I see the problem." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="hun_mana_c01", weight=1, line="I use mana? Oh right. I use mana. It ran out. I forgot it was a thing." },
            { id="hun_mana_c02", weight=1, line="OOM. Don't worry, my auto-shot doesn't cost mana. It costs dignity maybe." },
            { id="hun_mana_c03", weight=1, line="{target} is OOM. Welcome to the club. My pet doesn't use mana. He's the smart one." },
            { id="hun_mana_c04", weight=1, line="Zero mana. Aspect of the Viper... wait, wrong expansion. I just drink, I guess." },
        },
        UNCOMMON = {
            { id="hun_mana_u01", weight=1, line="I'm OOM but I'm still auto-shooting. Hunters are the only class with a viable OOM rotation." },
            { id="hun_mana_u02", weight=1, line="Out of mana. Time to pretend I'm a melee class. (I am not a melee class.)" },
        },
        RARE = {
            { id="hun_mana_r01", weight=1, line="No mana means no traps, no stings, no Aimed Shot. Just me, my bow, and prayer." },
        },
        MYTHIC = {
            { id="hun_mana_m01", weight=1, line="I forgot to buy arrows AND I'm OOM. This is the worst timeline." },
        },
    },

    LOOT = {
        COMMON = {
            { id="hun_loot_c01", weight=1, line="Is it a hunter weapon? Everything is a hunter weapon." },
            { id="hun_loot_c02", weight=1, line="If it has Agility, it's mine. If it has a cool name, also mine." },
            { id="hun_loot_c03", weight=1, line="{looter} got the drop. Their need was probably greater. Probably." },
            { id="hun_loot_c04", weight=1, line="Nice loot. My pet is jealous. He doesn't wear gear but the principle matters." },
            { id="hun_loot_c05", weight=1, line="That's a hunter weap— okay fine, it's a sword. But it COULD be a stat stick." },
        },
        UNCOMMON = {
            { id="hun_loot_u01", weight=1, line="I'm going to Need on it. For my pet. He needs morale gear." },
            { id="hun_loot_u02", weight=1, line="Everything with Agility is hunter loot. This is known. Don't fight me on it." },
        },
        RARE = {
            { id="hun_loot_r01", weight=1, line="I once needed on a staff because it had Agility. The mage cried. I felt nothing." },
        },
        MYTHIC = {
            { id="hun_loot_m01", weight=1, line="The phrase 'hunter weapon' is a compliment. We're the most versatile class. Everything is our weapon." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="hun_inst_c01", weight=1, line="Welcome to {zone}. Please keep all pets and auto-shots under control. Especially mine." },
            { id="hun_inst_c02", weight=1, line="Entering {zone}. I've turned off pet taunt. Probably. Let me check. ...it's on. Fixed." },
            { id="hun_inst_c03", weight=1, line="{zone}. Aspect of the Pack is OFF. I learned that lesson already." },
            { id="hun_inst_c04", weight=1, line="I brought 6 stacks of arrows and my pet. One of those will run out." },
        },
        UNCOMMON = {
            { id="hun_inst_u01", weight=1, line="Let me put my pet on passive. ...hang on. He's pulling. He pulled. That wasn't me." },
            { id="hun_inst_u02", weight=1, line="I've set up the perfect ranged position. 41 yards. Safe. Comfortable. Pristine." },
        },
        RARE = {
            { id="hun_inst_r01", weight=1, line="I once entered a dungeon and my pet aggroed three packs before I loaded. He was very efficient." },
        },
        MYTHIC = {
            { id="hun_inst_m01", weight=1, line="Pet on passive. Traps ready. Auto-shot loaded. I promise to only pull what the tank pulls. Mostly." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="hun_int_c01", weight=1, line="Nice interrupt. I had a Scatter Shot ready but you got there first." },
            { id="hun_int_c02", weight=1, line="{source} interrupted. My pet barked in approval." },
            { id="hun_int_c03", weight=1, line="Good kick. I'm a ranged class. My interrupts involve bouncing things off skulls at 40 yards." },
        },
        UNCOMMON = {
            { id="hun_int_u01", weight=1, line="I was going to Scatter Shot it. From max range. Dramatically. But {source} handled it." },
        },
        RARE = {
            { id="hun_int_r01", weight=1, line="My pet intimidated the caster. Technically an interrupt. He's very talented." },
        },
        MYTHIC = {
            { id="hun_int_m01", weight=1, line="Between Scatter Shot, traps, and my pet's Intimidation, I am a one-person CC department." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="hun_fire_c01", weight=1, line="Fire on the ground. I'm 40 yards away. Good luck, melee." },
            { id="hun_fire_c02", weight=1, line="My pet is in the fire. He doesn't care. He has 4,000 health and no self-awareness." },
            { id="hun_fire_c03", weight=1, line="Ground AoE? I'm at max range. This is a you problem, not a me problem." },
            { id="hun_fire_c04", weight=1, line="The fire is near the boss. I am not near the boss. We are not the same." },
        },
        UNCOMMON = {
            { id="hun_fire_u01", weight=1, line="My pet walked through fire on the way to the boss. Took 2,000 damage. Mend Pet is working overtime." },
            { id="hun_fire_u02", weight=1, line="Advantage of being ranged: the fire is over there. I am over here." },
        },
        RARE = {
            { id="hun_fire_r01", weight=1, line="My pet stood in fire for 45 seconds once. His happiness dropped to zero. Mine did too." },
        },
        MYTHIC = {
            { id="hun_fire_m01", weight=1, line="The floor is lava. For melee. For me, the floor is 'somewhere else entirely.'" },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="hun_cbt_c01", weight=1, line="Pet, attack! ...not that one. The OTHER one. PET. PET NO." },
            { id="hun_cbt_c02", weight=1, line="Auto-shot engaged. Aimed Shot loading. Keep it still." },
            { id="hun_cbt_c03", weight=1, line="Combat. 41 yards. Perfect range. Don't bring it closer." },
            { id="hun_cbt_c04", weight=1, line="Sending in the pet. If extra things come, wasn't me. Probably." },
        },
        UNCOMMON = {
            { id="hun_cbt_u01", weight=1, line="Opening with Aimed Shot. Don't move the boss. Don't look at the boss. Let me do this." },
            { id="hun_cbt_u02", weight=1, line="My pet is on the boss. I'm 40 yards away. The system works." },
        },
        RARE = {
            { id="hun_cbt_r01", weight=1, line="I accidentally hit Aspect of the Pack. Everyone's dazed. I'm SO sorry." },
        },
        MYTHIC = {
            { id="hun_cbt_m01", weight=1, line="Pet in position. Traps set. Aimed Shot loaded. This is what peak hunter performance looks like." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="hun_kill_c01", weight=1, line="Target down. Good boy, {pet}. Even though he mostly auto-attacked." },
            { id="hun_kill_c02", weight=1, line="Kill confirmed. My pet got the last hit. He always does." },
            { id="hun_kill_c03", weight=1, line="Dead. My contribution was 47 auto-shots and an Aimed Shot. Art." },
        },
        UNCOMMON = {
            { id="hun_kill_u01", weight=1, line="Mob's dead. My pet is eating it. I didn't tell him to. He's self-feeding." },
        },
        RARE = {
            { id="hun_kill_r01", weight=1, line="That kill was a team effort. Me and my pet. The other four of you helped too, I guess." },
        },
        MYTHIC = {
            { id="hun_kill_m01", weight=1, line="Another mob eliminated from 41 yards. They never even reached me. This is the hunter experience." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="hun_cc_c01", weight=1, line="Freezing Trap down! Don't touch it. Let it freeze. Ice is patient." },
            { id="hun_cc_c02", weight=1, line="I trapped it. My pet is staring at it. He's fighting every instinct." },
            { id="hun_cc_c03", weight=1, line="Someone broke my trap. My PERFECTLY placed trap. I placed it before the pull!" },
            { id="hun_cc_c04", weight=1, line="I got CC'd. My pet is now running unsupervised. This will end poorly." },
        },
        UNCOMMON = {
            { id="hun_cc_u01", weight=1, line="My pet charged the trapped target. ON HIS OWN. I did not authorize this." },
            { id="hun_cc_u02", weight=1, line="Scatter Shot into Freezing Trap. That's advanced CC. I practiced that for hours." },
        },
        RARE = {
            { id="hun_cc_r01", weight=1, line="My pet broke my own trap. We had a talk. It was one-sided. He just stared at me." },
        },
        MYTHIC = {
            { id="hun_cc_m01", weight=1, line="Between Freezing Trap, Scatter Shot, and my pet's stubborn refusal to follow commands, CC is handled." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="hun_amb_c01", weight=1, line="Feeding my pet. He's hungry. He's always hungry." },
            { id="hun_amb_c02", weight=1, line="Checking arrows. Checking pet happiness. One of these matters more." },
            { id="hun_amb_c03", weight=1, line="My pet is sitting. Patiently. For once. I'm documenting this." },
            { id="hun_amb_c04", weight=1, line="41 yards from the nearest mob. This is my comfortable space." },
            { id="hun_amb_c05", weight=1, line="Aspect of the Monkey is off. ...oh no it was on the entire fight." },
            { id="hun_amb_c06", weight=1, line="My pet is making friends with the critters. Gross. Those aren't for petting." },
        },
        UNCOMMON = {
            { id="hun_amb_u01", weight=1, line="I named my pet after the last tank who blamed me for a bad pull. He bites things now. It's therapeutic." },
            { id="hun_amb_u02", weight=1, line="Hunters get a bad reputation. We don't pull extra mobs. Our PETS pull extra mobs. Big difference." },
            { id="hun_amb_u03", weight=1, line="Between feeding my pet, buying arrows, and managing Aspects, I'm basically running a small business mid-dungeon." },
        },
        RARE = {
            { id="hun_amb_r01", weight=1, line="I once tamed a rare mob that the group was pulling. They were upset. The pet was worth it." },
        },
        MYTHIC = {
            { id="hun_amb_m01", weight=1, line="Being a hunter means your DPS depends on a pet with the intelligence of a slightly aggressive toaster. I love it." },
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            { id="hun_dc_c01", weight=1, line="{target} disconnected. If only they had a loyal pet to guard them while offline." },
            { id="hun_dc_c02", weight=1, line="{target} is gone. My pet noticed before I did. He's perceptive." },
            { id="hun_dc_c03", weight=1, line="{target} DC'd. Unlike my pet, they can't be called back with a whistle." },
        },
        UNCOMMON = {
            { id="hun_dc_u01", weight=1, line="If my PET disconnected, that would be a real crisis. {target}? We'll manage." },
            { id="hun_dc_u02", weight=1, line="{target} vanished. Not like Feign Death vanished. The bad kind." },
        },
        RARE = {
            { id="hun_dc_r01", weight=1, line="I tried to track {target} with Track Humanoids. They're... offline. Can't track offline." },
        },
        MYTHIC = {
            { id="hun_dc_m01", weight=1, line="My pet is sniffing where {target} used to stand. He's confused. I'm confused. We're all confused." },
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            { id="hun_cons_c01", weight=1, line="Potion? I have pet food. And arrows. My consumable budget is VERY specific." },
            { id="hun_cons_c02", weight=1, line="{source} used a pot. I used a Mend Pet. We heal what we love." },
            { id="hun_cons_c03", weight=1, line="Consumables. The one thing I spend more gold on is ammo. And pet food." },
        },
        UNCOMMON = {
            { id="hun_cons_u01", weight=1, line="My consumable priority: arrows > pet food > potions > my own food. I know what matters." },
        },
        RARE = {
            { id="hun_cons_r01", weight=1, line="I once ran out of arrows mid-boss. Had to melee. With a bow. It was humiliating. And effective-ish." },
        },
        MYTHIC = {
            { id="hun_cons_m01", weight=1, line="My pet costs more in upkeep than my entire gear set. He's worth every copper." },
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            { id="hun_cd_c01", weight=1, line="{source} popped a big CD. My Rapid Fire is ready when you need burst." },
            { id="hun_cd_c02", weight=1, line="Major cooldown. Bestial Wrath turns my pet into an unstoppable force. For 18 seconds." },
            { id="hun_cd_c03", weight=1, line="Big CDs happening. I popped Rapid Fire. Auto-shots go BRRR." },
        },
        UNCOMMON = {
            { id="hun_cd_u01", weight=1, line="Bestial Wrath makes my pet glow red. He LOVES it. I love that he loves it." },
        },
        RARE = {
            { id="hun_cd_r01", weight=1, line="Rapid Fire + Aimed Shot + Multishot. The triple threat. Everything dies or my pet eats it." },
        },
        MYTHIC = {
            { id="hun_cd_m01", weight=1, line="When I pop every CD, my DPS spikes and my pet goes feral. Both intended. Mostly." },
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            { id="hun_fp_c01", weight=1, line="My pet is running below me. On the ground. Keeping pace. Good boy." },
            { id="hun_fp_c02", weight=1, line="This bird is basically a really big pet. That I can't name. Or feed. Or dismiss. Hmm." },
            { id="hun_fp_c03", weight=1, line="I should tame one of these. Imagine showing up to a dungeon on a flight bird. Power move." },
            { id="hun_fp_c04", weight=1, line="My pet is looking up at me from below. I can feel the judgment." },
            { id="hun_fp_c05", weight=1, line="I wonder if this bird eats the same food as my pet. Probably not. This bird has standards." },
            { id="hun_fp_c06", weight=1, line="I'm at zero range right now. ZERO. I don't know what to do with my hands." },
            { id="hun_fp_c07", weight=1, line="The bird just dodged something. Good reflexes. I'd rate it a 6 out of 10 pet. Maybe 7." },
            { id="hun_fp_c08", weight=1, line="I tried to put Aspect of the Cheetah on to go faster. Remembered I'm on a bird. Not a cheetah." },
            { id="hun_fp_c09", weight=1, line="Saw a rare spawn from up here. Couldn't tame it. This is the worst day of my life." },
            { id="hun_fp_c10", weight=1, line="My pet is probably eating something it shouldn't right now. I can sense it." },
            { id="hun_fp_c11", weight=1, line="I have max range on my bow up here. Could hit anything. Not allowed to. Torture." },
            { id="hun_fp_c12", weight=1, line="The bird made a noise. My pet made a noise back. They're talking. About me. Definitely about me." },
            { id="hun_fp_c13", weight=1, line="Just realized I left my pet on aggressive. It's fine. Probably. Maybe. ...it's not fine." },
            { id="hun_fp_c14", weight=1, line="I've been on enough flight paths to know this bird's name. It doesn't have one. Crime." },
            { id="hun_fp_c15", weight=1, line="My Feign Death instinct is kicking in. But if I play dead on a bird I just... fall. Right?" },
            { id="hun_fp_c16", weight=1, line="The view from up here is amazing. I can see animals EVERYWHERE. All untameable from this distance." },
            { id="hun_fp_c17", weight=1, line="I packed extra pet food for the trip. Ate it myself. Don't tell my pet." },
            { id="hun_fp_c18", weight=1, line="Nature looks different from above. Smaller. But with more things I want to tame." },
        },
        UNCOMMON = {
            { id="hun_fp_u01", weight=1, line="I spend 90% of my time at max range. This bird has the OPPOSITE energy. We are uncomfortably close. I can feel its heartbeat." },
            { id="hun_fp_u02", weight=1, line="Saw a bear from the air. My taming finger twitched. The bird swerved. I think it knows what I am." },
            { id="hun_fp_u03", weight=1, line="My pet tried to follow me onto the bird. The flight master said no. My pet sat by the post. Like a hero. I'm emotional." },
            { id="hun_fp_u04", weight=1, line="I named this bird in my head. Reginald. Reginald is dependable. Reginald is slow but honest. I already love Reginald." },
            { id="hun_fp_u05", weight=1, line="Counted every beast I could see from up here. Thirty-seven. Taming priority list: all of them." },
            { id="hun_fp_u06", weight=1, line="The bird's flying in a straight line. My pet on the ground is running into every tree. Different approaches. Both valid." },
            { id="hun_fp_u07", weight=1, line="I should've put my pet on passive before I left. Instead I put it on defensive. Near a road. With NPCs. Oh no." },
            { id="hun_fp_u08", weight=1, line="Tried to track beasts from up here. The tracking arrow is just spinning. It's overwhelmed. So many beasts. So high up." },
            { id="hun_fp_u09", weight=1, line="This bird is technically a beast. I'm riding a beast while missing my beast. Beast-ception." },
            { id="hun_fp_u10", weight=1, line="My pet looked up at the bird with jealousy. The bird looked down at my pet with indifference. I'm caught in the middle of a beast love triangle." },
        },
        RARE = {
            { id="hun_fp_r01", weight=1, line="Twenty minutes in the air and I've mentally named fourteen birds, three clouds, and a suspicious-looking mountain. The hunter brain never turns off." },
            { id="hun_fp_r02", weight=1, line="From up here I can see the whole food chain. Wolves chase deer. Hawks chase rabbits. And I'm on a bird, chasing nothing. Unnatural." },
            { id="hun_fp_r03", weight=1, line="I told my pet I'd be back soon. That was twenty minutes ago. I can feel the disappointment from up here." },
            { id="hun_fp_r04", weight=1, line="Other classes see landscape from up here. I see habitats. Spawn points. Migration patterns. Two potential rare tameable elites. I need to land." },
            { id="hun_fp_r05", weight=1, line="The bond between hunter and pet transcends distance. Or at least that's what I tell myself while I'm on this bird and my pet is eating a mailbox." },
        },
        MYTHIC = {
            { id="hun_fp_m01", weight=1, line="If you told me I'd spend my career bonding with wild animals, sleeping in the dirt, and riding birds across continents, I'd say 'yes, obviously, that's the dream.' And I'd mean it. Every word." },
            { id="hun_fp_m02", weight=1, line="My pet is down there. Waiting. Loyal. Patient. And I'm up here, on another animal, wondering if this counts as cheating. It does. I'm sorry. I love you both." },
        },
    },

    -- SOLO_AMBIENT
    SOLO_AMBIENT = {
        COMMON = {
            { id="hun_solo_c01", weight=1, line="Just me and my pet. Best group I've ever been in." },
            { id="hun_solo_c02", weight=1, line="My pet just looked at me. I looked at my pet. We're having a moment." },
            { id="hun_solo_c03", weight=1, line="Nice area. Good for a walk. Great for taming something." },
            { id="hun_solo_c04", weight=1, line="Ooh, what's that animal? Already have one. Want another." },
            { id="hun_solo_c05", weight=1, line="Solo with my pet. Not really solo though, is it? That's the beauty." },
            { id="hun_solo_c06", weight=1, line="My pet keeps looking at me like I know where we're going. I don't. But it trusts me." },
            { id="hun_solo_c07", weight=1, line="Feign Death practice. Even when nothing's attacking. Gotta stay sharp." },
            { id="hun_solo_c08", weight=1, line="I wonder if my pet thinks I'm its pet. Honestly? Fair." },
            { id="hun_solo_c09", weight=1, line="The wild is where hunters belong. Also where snacks are." },
            { id="hun_solo_c10", weight=1, line="My pet just ate something off the ground. Proud? Concerned? Both." },
            { id="hun_solo_c11", weight=1, line="Set a trap. Just in case. You never know. Just saying." },
            { id="hun_solo_c12", weight=1, line="Walking through the woods with my pet. This is the whole game for me." },
            { id="hun_solo_c13", weight=1, line="I named every animal I've seen today. None of them asked me to." },
            { id="hun_solo_c14", weight=1, line="Out here in nature. My happy place. Well, my pet's happy place. Same thing." },
            { id="hun_solo_c15", weight=1, line="Saw a rare spawn. Heart rate: doubled. It was a tree stump." },
            { id="hun_solo_c16", weight=1, line="Pet is happy. I'm happy. The mob we're about to kill is not." },
            { id="hun_solo_c17", weight=1, line="Aspect of the Cheetah for traveling. Aspect of the monkey for style." },
            { id="hun_solo_c18", weight=1, line="Nobody around. Just nature. And my pet eating nature." },
        },
        UNCOMMON = {
            { id="hun_solo_u01", weight=1, line="People don't get hunters. They think it's about the bow. It's about the bond. Me and my pet against the world. The bow is just how we say hi." },
            { id="hun_solo_u02", weight=1, line="I keep looking at every animal and thinking 'could tame that.' Deer? Could tame it. Bear? Have one. That weird bug? ...tempting." },
            { id="hun_solo_u03", weight=1, line="My pet and I have a system. It growls at danger, I shoot danger, and we both eat after. Perfect partnership." },
            { id="hun_solo_u04", weight=1, line="Solo questing means all the loot is mine. And by mine I mean my pet gets first pick. Obviously." },
            { id="hun_solo_u05", weight=1, line="Tried to explain to my pet why we're out here. It stared at me, ate a butterfly, and walked away. Communication is a journey." },
            { id="hun_solo_u06", weight=1, line="Other classes need groups. Hunters ARE a group. I'm the ranged DPS, my pet's the tank, and my traps are the strategy. Three-person operation, two of us are the same person." },
            { id="hun_solo_u07", weight=1, line="Mend Pet is basically healthcare. Feed Pet is basically cooking. Tame Beast is basically HR. I'm not a hunter, I'm a small business owner." },
            { id="hun_solo_u08", weight=1, line="I talk to my pet more than I talk to people. My pet is a better listener. Just saying." },
            { id="hun_solo_u09", weight=1, line="Set three traps on the walk here. Not for anything specific. Just felt right. Hunter instincts. Or paranoia. Same thing." },
            { id="hun_solo_u10", weight=1, line="My pet keeps side-eyeing the wildlife. Silently judging every animal we pass. It gets that from me." },
        },
        RARE = {
            { id="hun_solo_r01", weight=1, line="Sometimes I sit in the wild and just watch animals. Not to tame them. Not to hunt them. Just to watch. My pet sits next to me and watches too. We don't talk about it. We don't need to." },
            { id="hun_solo_r02", weight=1, line="My first pet was a boar outside the starting area. Small, angry, perfect. Still have it in the stable. Visit sometimes. It pretends not to care. I pretend not to notice. We both know." },
            { id="hun_solo_r03", weight=1, line="The other classes think hunters are simple. Point, shoot, pet does the rest. They don't see the tracking, the trap placement, the split-second decisions. They don't see my pet giving me a disappointed look when I miss. That look has more tactical depth than most raid plans." },
            { id="hun_solo_r04", weight=1, line="I've been walking for an hour and my pet hasn't left my side once. Loyal, constant, unwavering. Meanwhile I got distracted by a cool-looking rock twice. My pet is literally a better adventurer than me." },
            { id="hun_solo_r05", weight=1, line="Long day out here. Shot things, tracked things, fed my pet, fed myself, Feigned Death twice for no reason. Just another day in the life. Best life there is." },
        },
        MYTHIC = {
            { id="hun_solo_m01", weight=1, line="Somewhere out there is a beast I haven't met yet. The one. The perfect companion. Every hunter knows the feeling — you see an animal and something clicks. My pet looks at me every time I slow down near a new creature. It knows. It doesn't judge. Much. Okay it judges a little. But it stays. And that's what matters." },
            { id="hun_solo_m02", weight=1, line="A hunter alone in the wild isn't alone at all. I've got my pet at my side, tracks under my feet, wind telling me which way the prey went, and a quiver full of arrows that all have someone's name on them. The wilderness isn't empty. It's full of things that don't know I'm here yet. And honestly? That's the most beautiful sentence I've ever thought." },
        },
    },

},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "That wasn't my Multi-Shot. ...okay it might have been.",
            "My pet is sniffing the corpse. He does that. Sorry.",
            "I was at max range. Safe and sound. As designed.",
            "Feign Death would've saved them. If only everyone had Feign Death.",
            "My condolences. My pet sends his condolences too. He's sitting on the body.",
        },
        UNCOMMON = {
            "I tried to trap the mob but my pet broke it. CLASSIC pet behavior.",
            "I saw it happen from 41 yards away. In HD. Nothing I could do.",
        },
        RARE = {
            "My pet once saved a party member by taunting a mob off them. Today was not that day.",
        },
        MYTHIC = {
            "{dead} died. My pet survived. The pet always survives. He's built different.",
        },
    },

    WIPE = {
        COMMON = {
            "I Feigned. I'm alive. My pet is also alive. Best case scenario.",
            "Feign Death: the great equalizer.",
            "Playing dead while the boss walks past me. This is peak gaming.",
        },
        UNCOMMON = {
            "Wipe except me. Again. You'd think they'd study my survival strategy.",
        },
        RARE = {
            "I'm face-down, pretending to be dead, and my pet is sitting next to me like a loyal idiot. I love him.",
        },
        MYTHIC = {
            "Another wipe survived via Feign Death. My mortality rate is the lowest in the group.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "Low! Somebody do something! I'm busy shooting!",
            "My Mend Pet is on cooldown. That's relevant to me only. Sorry.",
            "I have bandages. Heavy Runecloth. If we survive long enough for me to channel.",
        },
        UNCOMMON = {
            "Distracting Shot! ...oh no it came to me. OH NO.",
        },
        RARE = {
            "When my pet is low, I heal him immediately. When a party member is low, I look concerned from 41 yards.",
        },
        MYTHIC = {
            "I'd sacrifice my pet to save you. I wouldn't. But the thought counted.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "OOM? My auto-shot doesn't use mana. I'm at 60% efficiency minimum.",
            "I ALSO use mana but nobody cares about hunter mana.",
            "No mana club. I still have arrows though.",
        },
        UNCOMMON = {
            "Hunter mana exists and it matters. Somebody acknowledge this.",
        },
        RARE = {
            "I ran OOM once and Aspect of the Viper doesn't exist yet. Dark times.",
        },
        MYTHIC = {
            "Auto-shot costs nothing. The hunter is always doing SOMETHING.",
        },
    },

    LOOT = {
        COMMON = {
            "Hunter weapon. It's always a hunter weapon.",
            "My pet deserves gear too. Where's the pet loot table?",
            "AGI? Need. Anything else? ...also Need. It's a hunter thing.",
        },
        UNCOMMON = {
            "That could've been a stat stick for me. I wear anything with numbers on it.",
        },
        RARE = {
            "I've been called a 'loot ninja.' I prefer 'resource diversification specialist.'",
        },
        MYTHIC = {
            "Every item is a hunter item if you believe hard enough.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "Pet taunt is off. I checked. Just now. It was on.",
            "I have arrows. The dungeon has things to shoot. Match made.",
            "Let me trap the first pull. Watch this. ...pet, NO.",
        },
        UNCOMMON = {
            "I'll pull— I mean I'll TRAP. Different verb. Important distinction.",
        },
        RARE = {
            "I once auto-shot pulled a boss accidentally. It was the smoothest pull of the night.",
        },
        MYTHIC = {
            "Aspect of the Hawk. Pet on passive. ...passive-ish. Let's do this.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "Good interrupt. My Scatter Shot was ready but slower.",
            "Kicked. My pet approves. I approve.",
            "Interrupted from range. Hunters respect the kick.",
        },
        UNCOMMON = {
            "I was going to Scatter Shot but my pet was in the way. Standard.",
        },
        RARE = {
            "My pet Intimidated the caster at the same time. Double interrupt. Accidental genius.",
        },
        MYTHIC = {
            "Between kicks and my Scatter Shot, nothing is casting today.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "40 yards from the fire. Life is good.",
            "My pet is in it. He's fine. Probably. Mend Pet incoming.",
            "Stand near the fire? I don't even stand near the boss.",
        },
        UNCOMMON = {
            "I could move my pet out of the fire. But he seems committed.",
        },
        RARE = {
            "Ranged superiority: I see the fire, I don't touch the fire, I laugh at the fire.",
        },
        MYTHIC = {
            "The fire is a melee problem. I have ranged problems. Like running out of arrows.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "Auto-shot go! Pet go! Everything go!",
            "Aimed Shot loaded. Don't move the target.",
            "Sending the pet in. Results may vary.",
        },
        UNCOMMON = {
            "My opener is Aimed Shot from max range. By the time it lands, it's personal.",
        },
        RARE = {
            "Pet went left. Target went right. I'm shooting straight ahead. We'll figure it out.",
        },
        MYTHIC = {
            "Maximum range. Maximum damage. Maximum pet confusion. Let's go.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "Dead. Good pet. Good... everyone else.",
            "Kill confirmed from 41 yards.",
            "My pet got the last hit. I take full credit.",
        },
        UNCOMMON = {
            "That kill was 50% me, 50% pet. I round up.",
        },
        RARE = {
            "My pet is eating the corpse. STOP THAT.",
        },
        MYTHIC = {
            "Another mob never got close enough to touch me. The dream.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "Trap placed! Don't touch the ice! PET DON'T TOUCH THE—",
            "Freezing Trap working. My pet is staring at it. Aggressively.",
            "Scatter Shot! 4 seconds of confusion. Use them wisely.",
        },
        UNCOMMON = {
            "My trap, my rules. Nobody breaks the trap. Especially my pet.",
        },
        RARE = {
            "I have trained my pet not to break CC. It took 47 dungeons. He still does it sometimes.",
        },
        MYTHIC = {
            "Ice Trap chain into Scatter Shot. I just CC'd that mob for 30 seconds. Nobody clap. I know.",
        },
    },

    AMBIENT = {
        COMMON = {
            "Feeding pet. Standard downtime activity.",
            "Checking ammo count. It's always lower than expected.",
            "My pet is chasing a critter. I'm letting it happen.",
        },
        UNCOMMON = {
            "Between arrows, pet food, and repair bills, I'm the most expensive class to maintain.",
        },
        RARE = {
            "I'm communing with nature. And by that I mean my pet is napping and I'm AFK.",
        },
        MYTHIC = {
            "A hunter and their pet against the world. And a group of four other people who are also here.",
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            "Gone offline. My pet detected it first.",
            "DC'd. If they were a hunter, their pet would still be here. Just saying.",
            "They vanished. Not like Feign Death. The boring kind.",
        },
        UNCOMMON = {
            "If I DC'd, my pet would solo the dungeon. He's been watching.",
        },
        RARE = {
            "I'll send my pet to guard their spot. He'll sit there. Lovingly. And uselessly.",
        },
        MYTHIC = {
            "Mark of the Wild on their empty spot. ...wait, that's druids. I don't have a helpful buff. I just have a pet.",
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            "Potion popped. I'm feeding my pet instead.",
            "Consumables. My biggest expense is still ammo.",
            "Health pot? I Feign Death and bandage. Cheaper.",
        },
        UNCOMMON = {
            "My consumable priorities: arrows > pet food > literally everything else.",
        },
        RARE = {
            "I brought 20 stacks of arrows and one health potion. Priorities are clear.",
        },
        MYTHIC = {
            "Consumables are for classes that can't avoid damage. *Feigns Death*",
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            "Big CD! Rapid Fire go brrr!",
            "My pet is glowing red and angry. Bestial Wrath is working.",
            "Major CDs. My auto-shot speed just doubled.",
        },
        UNCOMMON = {
            "Bestial Wrath + Rapid Fire. My pet and I peak at the same time.",
        },
        RARE = {
            "All CDs popped. I'm a ranged turret and my pet is a melee missile.",
        },
        MYTHIC = {
            "When every CD lines up, the DPS meter screams. I live for that scream.",
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            "Also on a bird? Did you leave your pet behind too? Mine's... probably fine.",
            "This bird reminds me of my pet. Except it listens. And flies.",
            "I've been rating every animal I see from up here. That deer? Seven out of ten. The bear? Solid nine.",
        },
        UNCOMMON = {
            "If your pet does something weird while you're on this bird, it wasn't my pet's fault. Probably.",
            "I tried to Feign Death on the bird. Thought better of it. Gravity and all.",
        },
        RARE = {
            "Hunters and flight paths: leaving our pets behind, one trip at a time. It never gets easier.",
        },
        MYTHIC = {
            "When I land, my pet is going to pretend it didn't miss me. I'll pretend I didn't miss it. We'll both be lying.",
        },
    },

    SOLO_AMBIENT = {
        COMMON = {
            "Oh hey! A person! My pet saw you first. It always does.",
            "Didn't see you there. Well, my PET did. I was looking at a butterfly.",
            "Hi! We were just — well, I was thinking and my pet was eating something.",
        },
        UNCOMMON = {
            "My pet and I were having a silent conversation and you just walked into the middle of it. Don't worry. It happens. We'll catch up later.",
            "I was telling my pet about my day. It doesn't understand words but it understands vibes. You've changed the vibe. Just saying.",
        },
        RARE = {
            "My pet growled before you showed up. Thought it was a warning. Turns out it was just commentary. My pet has opinions about everyone.",
        },
        MYTHIC = {
            "I was having a perfect moment. Me, my pet, the open sky, a really interesting bug on that rock over there. And now there's a whole person here and my pet is doing the social thing and I have to do the social thing and honestly I was happier with the bug.",
        },
    },

},

}

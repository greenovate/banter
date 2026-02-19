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

},

}

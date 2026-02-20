-- Banter_Persona_Priest.lua
-- Voice: PRIEST CLASS — passive-aggressive healer guilt, martyr complex, 
-- secretly judging everyone's health bars.
-- Rules: 1) Perpetual healer burnout. 2) Guilt trips are a valid mechanic.
-- 3) Shadow spec is their villain arc. 4) Mana is their most precious resource and YOU are wasting it.
-- 5) Secretly loves being needed.
local _, ns = ...

ns.personas.PRIEST = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="pri_dead_c01", weight=1, line="{dead} is dead. I had a heal ready. They died faster than my cast time." },
            { id="pri_dead_c02", weight=1, line="{dead} has passed away. I'm not saying it was avoidable. But it was avoidable." },
            { id="pri_dead_c03", weight=1, line="Oh no, {dead}. Where were you standing? Rhetorical question. I already know." },
            { id="pri_dead_c04", weight=1, line="{dead} died. Adding that to the list of things that are somehow MY fault." },
            { id="pri_dead_c05", weight=1, line="I was healing the tank. {dead} was NOT the tank. See the conflict?" },
            { id="pri_dead_c06", weight=1, line="Rest in peace, {dead}. I'll be here. Healing the living. As always." },
            { id="pri_dead_c07", weight=1, line="{dead} needed a heal. But so did three other people. I have two hands and one cast bar." },
            { id="pri_dead_c08", weight=1, line="Don't look at me. I was drinking. BECAUSE I WAS OOM. Because I've been healing nonstop." },
            { id="pri_dead_c09", weight=1, line="{dead}, you were topped off 4 seconds ago. What happened in those 4 seconds? WHAT DID YOU DO?" },
            { id="pri_dead_c10", weight=1, line="My heals per second are fine. {dead}'s damage taken per second was NOT fine." },
        },
        UNCOMMON = {
            { id="pri_dead_u01", weight=1, line="I can rez {dead} but I'm going to need a moment. And an apology. From the group." },
            { id="pri_dead_u02", weight=1, line="{dead} died because they took 6,000 damage in 2 seconds. My biggest heal does 2,000. Do the math." },
            { id="pri_dead_u03", weight=1, line="This is what happens when I blink. BLINK. The real world blink. Not a spell." },
            { id="pri_dead_u04", weight=1, line="I was mid-Prayer of Healing. {dead} needed a direct heal. Nobody communicates with the healer." },
            { id="pri_dead_u05", weight=1, line="Is there a mechanic that makes {dead} take less damage? Because THAT would help me more than another spirit ring." },
        },
        RARE = {
            { id="pri_dead_r01", weight=1, line="I've been healing for 12 dungeons straight. My reflexes are fine. {dead}'s positioning is the variable." },
            { id="pri_dead_r02", weight=1, line="They died. I'm going to stare at the ceiling for a moment. Not from grief. From exhaustion." },
        },
        MYTHIC = {
            { id="pri_dead_m01", weight=1, line="You know what, I'm going Shadow. No more heals. Everyone dies. See how you like THAT." },
        },
    },

    WIPE = {
        COMMON = {
            { id="pri_wipe_c01", weight=1, line="Wipe. I ran out of mana, then you ran out of health. It's connected." },
            { id="pri_wipe_c02", weight=1, line="I can't outheal the entire dungeon. I mean I tried. But I can't." },
            { id="pri_wipe_c03", weight=1, line="Total party kill. My mana bar is empty. My patience is emptier." },
            { id="pri_wipe_c04", weight=1, line="I healed until I had nothing left. Literally nothing. Zero mana, zero dignity." },
            { id="pri_wipe_c05", weight=1, line="If anyone says 'heal more' I'm going to Spirit Tap your soul ON PURPOSE." },
        },
        UNCOMMON = {
            { id="pri_wipe_u01", weight=1, line="I spent more mana on this wipe than some people spend on their entire leveling journey." },
            { id="pri_wipe_u02", weight=1, line="The good news: my healing parse was excellent. The bad news: everyone's dead." },
            { id="pri_wipe_u03", weight=1, line="I healed 47,000 health in that fight. You collectively took 200,000 damage. I'll wait while you absorb that." },
        },
        RARE = {
            { id="pri_wipe_r01", weight=1, line="This is what burnout feels like. The healer kind. Not the shadow kind. ...yet." },
        },
        MYTHIC = {
            { id="pri_wipe_m01", weight=1, line="I'm a priest. I heal because I care. I'm also this close to respeccing Shadow because apparently caring isn't enough." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="pri_hplo_c01", weight=1, line="{target} is low. I'm casting. I'm ALWAYS casting. Give me a SECOND." },
            { id="pri_hplo_c02", weight=1, line="{target} is dying and I'm already healing someone else. Welcome to triage." },
            { id="pri_hplo_c03", weight=1, line="Yes, I see {target}'s health bar. I see ALL the health bars. It's a nightmare." },
            { id="pri_hplo_c04", weight=1, line="{target} please stop taking damage for literally two seconds so I can catch up." },
            { id="pri_hplo_c05", weight=1, line="Healing {target}. Again. For the fifth time this pull." },
        },
        UNCOMMON = {
            { id="pri_hplo_u01", weight=1, line="I have a Power Word: Shield. It absorbs damage. {target} burns through it like tissue paper." },
            { id="pri_hplo_u02", weight=1, line="My Greater Heal takes 3 seconds. {target} takes 3,000 damage per second. The math is bad." },
        },
        RARE = {
            { id="pri_hplo_r01", weight=1, line="I once healed an entire 5-man at 10% health simultaneously. I also cried. Those things are related." },
        },
        MYTHIC = {
            { id="pri_hplo_m01", weight=1, line="{target}, I am doing EVERYTHING I can. If you die, it's physics. Not negligence." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="pri_mana_c01", weight=1, line="I'm OOM. Which means you're all going to die. Not a threat. Just statistics." },
            { id="pri_mana_c02", weight=1, line="Zero mana. I have wand. Wand does not heal. We have a problem." },
            { id="pri_mana_c03", weight=1, line="OOM. If someone could not take damage for the next 20 seconds, that'd be great." },
            { id="pri_mana_c04", weight=1, line="My mana is gone. Like my hope. And my patience." },
            { id="pri_mana_c05", weight=1, line="No mana = no heals. No heals = death. This is a public service announcement." },
        },
        UNCOMMON = {
            { id="pri_mana_u01", weight=1, line="I've been OOM three times this run. Do you know how demoralizing that is for a healer?" },
            { id="pri_mana_u02", weight=1, line="I'm going to drink. Nobody pull. NOBODY PULL. I can see you eyeing that pack." },
        },
        RARE = {
            { id="pri_mana_r01", weight=1, line="When a healer goes OOM, it's everyone's fault. I don't make the rules. Actually I do. I'm the healer." },
        },
        MYTHIC = {
            { id="pri_mana_m01", weight=1, line="I'm OOM and the tank is at 40%. This is the last thing I see before Shadow spec." },
        },
    },

    LOOT = {
        COMMON = {
            { id="pri_loot_c01", weight=1, line="Is it spirit? +healing? No? Then I continue to suffer in silence." },
            { id="pri_loot_c02", weight=1, line="Congrats, {looter}. Glad the loot is flowing for SOME of us." },
            { id="pri_loot_c03", weight=1, line="Another drop. Another piece of gear that isn't healer cloth." },
            { id="pri_loot_c04", weight=1, line="Healing gear drop rates are a conspiracy and I will die on this hill." },
        },
        UNCOMMON = {
            { id="pri_loot_u01", weight=1, line="{looter} got gear. My reward is keeping everyone alive. Which pays exactly zero gold." },
            { id="pri_loot_u02", weight=1, line="Shadow damage gear dropped. I'm not saying I need it. I'm saying my Shadow spec would like to speak with you." },
        },
        RARE = {
            { id="pri_loot_r01", weight=1, line="I don't need loot. I need a vacation. And a group that doesn't stand in fire." },
        },
        MYTHIC = {
            { id="pri_loot_m01", weight=1, line="One day a +healing mace will drop and I will cry tears of joy. Today is not that day." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="pri_inst_c01", weight=1, line="{zone}. Let me buff everyone. Fort. Spirit. Shadow Protection. I'm not a vending machine." },
            { id="pri_inst_c02", weight=1, line="Entering {zone}. Please don't pull three packs at once. Please." },
            { id="pri_inst_c03", weight=1, line="Welcome to {zone}. My mana cost starts now. Spend it wisely." },
            { id="pri_inst_c04", weight=1, line="I'm the healer. What I say goes. What I say is: don't stand in things." },
        },
        UNCOMMON = {
            { id="pri_inst_u01", weight=1, line="I brought 60 water and my dignity. I'll run out of one before the first boss." },
            { id="pri_inst_u02", weight=1, line="Before we start: if you die, I tried. If I die, nobody tried." },
        },
        RARE = {
            { id="pri_inst_r01", weight=1, line="Every dungeon I enter, I say a little prayer. Not for the group. For my mana bar." },
        },
        MYTHIC = {
            { id="pri_inst_m01", weight=1, line="I heal because the Light calls me. The Light also sends me terrible groups. Mysterious ways." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="pri_int_c01", weight=1, line="Nice interrupt. Less incoming damage means more mana for ME." },
            { id="pri_int_c02", weight=1, line="Interrupted! That's less healing I have to do. I love efficiency." },
            { id="pri_int_c03", weight=1, line="{source} interrupted. Thank you. Genuinely. From my mana bar." },
        },
        UNCOMMON = {
            { id="pri_int_u01", weight=1, line="Every interrupt saves me a heal. Every heal saves me mana. Every mana saved is a tiny victory." },
        },
        RARE = {
            { id="pri_int_r01", weight=1, line="If all of you interrupted like that, I'd actually finish a fight with mana left." },
        },
        MYTHIC = {
            { id="pri_int_m01", weight=1, line="That interrupt alone saved me 500 mana. I'm not crying. My eyes are casting." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="pri_fire_c01", weight=1, line="Fire on the ground. Which means someone is going to stand in it. Which means I'm healing." },
            { id="pri_fire_c02", weight=1, line="MOVE. OUT. OF. THE. FIRE. I'm not wasting mana on optional damage." },
            { id="pri_fire_c03", weight=1, line="Ground AoE is the enemy of every healer's mana bar." },
            { id="pri_fire_c04", weight=1, line="The fire is there. My heals are not going to cover elective floor-tasting." },
        },
        UNCOMMON = {
            { id="pri_fire_u01", weight=1, line="If you stand in fire, I will heal you. But I will sigh audibly. In-character." },
            { id="pri_fire_u02", weight=1, line="Every tick of fire damage someone takes is a heal I could've saved. This is my villain origin story." },
        },
        RARE = {
            { id="pri_fire_r01", weight=1, line="I once let someone die in fire to prove a point. The point was 'move.' They got it the second time." },
        },
        MYTHIC = {
            { id="pri_fire_m01", weight=1, line="I have a finite amount of mana and an infinite amount of frustration. Pick. Your. Spot." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="pri_cbt_c01", weight=1, line="Power Word: Shield on the tank. Here we go. Again." },
            { id="pri_cbt_c02", weight=1, line="Combat. Everyone take damage slowly and in an orderly fashion." },
            { id="pri_cbt_c03", weight=1, line="Healing. Don't make me work harder than I have to." },
            { id="pri_cbt_c04", weight=1, line="Shields up, heals queued, prayer loaded. My work starts now." },
        },
        UNCOMMON = {
            { id="pri_cbt_u01", weight=1, line="Opening with Renew because you're ALL going to take damage and I'm being proactive." },
            { id="pri_cbt_u02", weight=1, line="I pre-shielded the tank. The tank immediately used all of it. In one hit. Cool." },
        },
        RARE = {
            { id="pri_cbt_r01", weight=1, line="Here's my plan: keep everyone alive until everything else is dead. Simple. Excruciatingly hard. But simple." },
        },
        MYTHIC = {
            { id="pri_cbt_m01", weight=1, line="I will heal through this. Not because I want to. Because it's my CALLING. The Light is very demanding." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="pri_kill_c01", weight=1, line="Dead. Good. Everyone survived. Barely. Because of me." },
            { id="pri_kill_c02", weight=1, line="Target down. I can drink now. Please let me drink." },
            { id="pri_kill_c03", weight=1, line="That mob's dead. I healed four people during that fight. You're welcome." },
        },
        UNCOMMON = {
            { id="pri_kill_u01", weight=1, line="Kill secured. Mana bar at 30%. Nobody thank me all at once." },
        },
        RARE = {
            { id="pri_kill_r01", weight=1, line="I contributed 0 DPS and kept 5 people alive. I'd say my job was harder." },
        },
        MYTHIC = {
            { id="pri_kill_m01", weight=1, line="Another mob dead. Another 8,000 healing done. Do the DPS even notice? No. They never notice." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="pri_cc_c01", weight=1, line="Psychic Scream! Sorry, panic button. The mobs are everywhere." },
            { id="pri_cc_c02", weight=1, line="I got CC'd while healing. The tank is going to notice in about 3 seconds." },
            { id="pri_cc_c03", weight=1, line="I used Psychic Scream. Yes, I know it scattered them. I was CORNERED." },
            { id="pri_cc_c04", weight=1, line="CC'd. Can't heal. Someone is about to die and it's not going to be my fault this time." },
        },
        UNCOMMON = {
            { id="pri_cc_u01", weight=1, line="When the healer gets CC'd, the group has approximately 4 seconds to live. I've done the research." },
            { id="pri_cc_u02", weight=1, line="Shackle Undead is elegant CC. Psychic Scream is desperate CC. Guess which one I use more." },
        },
        RARE = {
            { id="pri_cc_r01", weight=1, line="I Feared the mobs into more mobs. That's 10 more things to heal through. I'm not apologizing, I'm surviving." },
        },
        MYTHIC = {
            { id="pri_cc_m01", weight=1, line="When you CC the healer, God laughs. And by God, I mean me. Later. After the wipe." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="pri_amb_c01", weight=1, line="Drinking. Do NOT pull." },
            { id="pri_amb_c02", weight=1, line="I need mana. Give me 20 seconds. I'm counting." },
            { id="pri_amb_c03", weight=1, line="Standing here. Buffing. Drinking. The healer trifecta." },
            { id="pri_amb_c04", weight=1, line="Does anyone need a buff? Of course you do. Nobody ever remembers to ask." },
            { id="pri_amb_c05", weight=1, line="I just healed for 10 minutes straight. My fingers hurt. My soul hurts." },
            { id="pri_amb_c06", weight=1, line="Resting. Recovering. Questioning every life choice that led me to healer." },
        },
        UNCOMMON = {
            { id="pri_amb_u01", weight=1, line="Some people chose DPS. They click one button. Things die. I play Whac-A-Mole with health bars. Different game entirely." },
            { id="pri_amb_u02", weight=1, line="I became a priest to help people. Nobody told me 'people' meant 'warriors standing in fire.'" },
            { id="pri_amb_u03", weight=1, line="Between pulls I contemplate Shadow spec. Then someone says 'nice heals' and I stay. Weak? Maybe." },
        },
        RARE = {
            { id="pri_amb_r01", weight=1, line="Sometimes I cast Renew on myself just to feel something. That something is 400 health over 15 seconds." },
        },
        MYTHIC = {
            { id="pri_amb_m01", weight=1, line="The Light chose me to heal. The Light also chose to give me groups that eat damage like candy. The Light has a sense of humor." },
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            { id="pri_dc_c01", weight=1, line="{target} disconnected. One less person to heal. Is that... relief? Am I a bad person?" },
            { id="pri_dc_c02", weight=1, line="{target} is gone. My heals per person ratio just improved." },
            { id="pri_dc_c03", weight=1, line="{target} DC'd. They were actually one of the easier people to keep alive. This is a loss." },
        },
        UNCOMMON = {
            { id="pri_dc_u01", weight=1, line="{target} disconnected during the pull. I was mid-heal on them. That mana is gone forever." },
            { id="pri_dc_u02", weight=1, line="Down a player. Which means I'm now healing 80% of the group instead of 100%. Math says this is easier." },
        },
        RARE = {
            { id="pri_dc_r01", weight=1, line="{target} DC'd. I already had a Renew on them. The most useless Renew of all time." },
        },
        MYTHIC = {
            { id="pri_dc_m01", weight=1, line="Someone disconnected and I can't even be upset because that's less healing. I'm a terrible person. I'm a GREAT healer." },
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            { id="pri_cons_c01", weight=1, line="Someone used a pot. That's one less emergency heal. Thank you. Genuinely." },
            { id="pri_cons_c02", weight=1, line="{source} popped a consumable. If EVERYONE did that, I might actually have mana." },
            { id="pri_cons_c03", weight=1, line="Health pot. Beautiful. Self-sufficiency. What a concept." },
        },
        UNCOMMON = {
            { id="pri_cons_u01", weight=1, line="Using a mana pot because someone decided to facepull while I was drinking at 10%." },
        },
        RARE = {
            { id="pri_cons_r01", weight=1, line="I bring more consumables as a healer than most people bring to a raid. Because I KNOW how these runs go." },
        },
        MYTHIC = {
            { id="pri_cons_m01", weight=1, line="When I see a party member use a health pot, I shed a single tear of joy. They're learning." },
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            { id="pri_cd_c01", weight=1, line="Inner Focus activated. Free heal. The only thing free in this game." },
            { id="pri_cd_c02", weight=1, line="{source} popped a CD. Good. I need ALL the help I can get." },
            { id="pri_cd_c03", weight=1, line="Big cooldown going off. If it reduces damage taken, I'm grateful." },
        },
        UNCOMMON = {
            { id="pri_cd_u01", weight=1, line="When I pop Inner Focus, that's the 'this is serious' signal. Pay attention." },
        },
        RARE = {
            { id="pri_cd_r01", weight=1, line="Desperate Prayer: heals me, costs nothing, admits I'm in trouble. The most honest spell in my kit." },
        },
        MYTHIC = {
            { id="pri_cd_m01", weight=1, line="I just used every cooldown I have. If people still die, I'm switching to Shadow mid-fight. Witness me." },
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            { id="pri_fp_c01", weight=1, line="Nobody to heal up here. This is the closest thing to a vacation I've had in weeks." },
            { id="pri_fp_c02", weight=1, line="The bird is at full health. I checked. Force of habit." },
            { id="pri_fp_c03", weight=1, line="Flight paths: the only time nobody is standing in fire and asking me to fix it." },
            { id="pri_fp_c04", weight=1, line="My mana is actually full right now. FULL. I forgot what that felt like." },
            { id="pri_fp_c05", weight=1, line="Just me and the bird. The bird doesn't pull extra mobs. I love this bird." },
            { id="pri_fp_c06", weight=1, line="No damage meters up here. No blame. No whispers. Just wind." },
            { id="pri_fp_c07", weight=1, line="I'm getting separation anxiety from my party. ...no wait. That's relief." },
            { id="pri_fp_c08", weight=1, line="Can't drink while flying. But my mana is full. Because NOBODY IS TAKING DAMAGE." },
            { id="pri_fp_c09", weight=1, line="The flight master said 'have a safe flight.' First person today who hasn't asked me to heal something." },
            { id="pri_fp_c10", weight=1, line="Theoretically I should be bored. In practice, not healing is AMAZING." },
            { id="pri_fp_c11", weight=1, line="This bird is taking damage from the cold wind. ...no it isn't. I need to stop diagnosing things." },
            { id="pri_fp_c12", weight=1, line="I just instinctively tried to shield the bird. We're fine. Everything is fine." },
            { id="pri_fp_c13", weight=1, line="Going Shadow up here. Nobody can stop me. There's no raid leader in the sky." },
            { id="pri_fp_c14", weight=1, line="The view is beautiful. I never see the view. I'm always staring at health bars." },
            { id="pri_fp_c15", weight=1, line="Wind's picking up. My first thought was 'does wind do Nature damage?' I need help." },
            { id="pri_fp_c16", weight=1, line="Nobody has died in the last five minutes. Personal record." },
            { id="pri_fp_c17", weight=1, line="Just flew over a group fighting something. Saw a health bar drop. Flinched. From up here. On a bird." },
            { id="pri_fp_c18", weight=1, line="When I land, it's back to healing. Let me have this." },
        },
        UNCOMMON = {
            { id="pri_fp_u01", weight=1, line="I whispered a Prayer of Fortitude for the bird. It now has 6,000 extra health. You're welcome, bird." },
            { id="pri_fp_u02", weight=1, line="I'm using this flight time to practice NOT healing. It's called self-care. I read about it. In between rezzes." },
            { id="pri_fp_u03", weight=1, line="The bird just coughed. I cast Abolish Disease instantly. I can't turn it off. This is who I am now." },
            { id="pri_fp_u04", weight=1, line="Other classes use flight paths to travel. Priests use flight paths to remember we're people with needs. Mana needs, mostly." },
            { id="pri_fp_u05", weight=1, line="Started humming a hymn up here. The bird seemed to like it. Better audience than most dungeon groups." },
            { id="pri_fp_u06", weight=1, line="I've healed through wipes, through disconnects, through people standing in EVERY conceivable fire. This bird asks nothing of me. I'm emotional." },
            { id="pri_fp_u07", weight=1, line="If someone dies while I'm on this bird, it's NOT my fault. For the record. Writing that down." },
            { id="pri_fp_u08", weight=1, line="The sky is clear. The air is fresh. My brain just whispered 'someone needs a dispel.' Nobody needs a dispel. WE'RE IN THE AIR." },
            { id="pri_fp_u09", weight=1, line="I can see a dungeon entrance from up here. My eye twitched. Involuntary healer response." },
            { id="pri_fp_u10", weight=1, line="The wind sounds like someone screaming for heals. It's just wind. Probably. I'm choosing to believe it's wind." },
        },
        RARE = {
            { id="pri_fp_r01", weight=1, line="Priests don't get breaks. We don't get thanked. We get flight paths. And on flight paths, for seven beautiful minutes, we get peace." },
            { id="pri_fp_r02", weight=1, line="Up here, nobody is dying. Nobody is pulling. Nobody is whispering 'heal?' at me. This is what heaven feels like. I'm a priest. I would know." },
            { id="pri_fp_r03", weight=1, line="Looked down at the world. All those people, taking damage, needing heals. And I'm up here. On a bird. Having a MOMENT." },
            { id="pri_fp_r04", weight=1, line="I've been on this bird long enough to forget what rage whispers look like. That's healing in itself." },
            { id="pri_fp_r05", weight=1, line="The Light shines on me from above. The bird carries me forward. My mana is full. I am at peace. ...we're landing in 30 seconds aren't we. It was nice while it lasted." },
        },
        MYTHIC = {
            { id="pri_fp_m01", weight=1, line="I heal the living. I rez the dead. I shield the stupid. I dispel the cursed. And right now, on this bird, I am doing NONE OF THAT. And it is the most profound spiritual experience of my career." },
            { id="pri_fp_m02", weight=1, line="Other priests pray for wisdom. I pray for longer flight paths. The Light understands. The Light has SEEN my party." },
        },
    },

},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "I was healing someone else. There are FIVE of you and ONE of me.",
            "I had a heal coming. You died faster. That's on you.",
            "Tragic. Rezzing in 5... when I have the mana.",
            "My cast time is 2.5 seconds. You died in 1. Physics wins.",
            "I tried. The Light tried. You didn't try to move.",
        },
        UNCOMMON = {
            "I saw it happening but my GCD was busy. Story of my life.",
            "I could've saved them if anyone interrupted the thing killing them. But sure. Blame the healer.",
        },
        RARE = {
            "I'm going to heal even harder next time. Out of spite.",
        },
        MYTHIC = {
            "You want to know what it's like being a healer? It's this. This exact moment. Every run.",
        },
    },

    WIPE = {
        COMMON = {
            "I ran OOM healing your poor decisions.",
            "My mana bar said no. I said no. Everyone died anyway.",
            "I healed 80,000 total. It wasn't enough. It's never enough.",
            "Wipe. I need 30 seconds and 2 full stacks of water.",
        },
        UNCOMMON = {
            "The damage was simply outhealable. That's not a word. It describes my career though.",
        },
        RARE = {
            "One day I'll find a group that doesn't need healing. ...that day I'm out of a job.",
        },
        MYTHIC = {
            "Shadow spec has no wipe guilt. Just saying. The dark side is calling.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "CASTING. My GCD exists. WAIT.",
            "Shield is on you. Heal is coming. BREATHE.",
            "I see it. I ALWAYS see it. I'm healing.",
            "Renew is ticking. Be patient. Trust the HoT.",
        },
        UNCOMMON = {
            "I can either heal you or the tank. Pick wisely. Actually I pick. Tank.",
        },
        RARE = {
            "Your health bar gives me anxiety. And I already had anxiety.",
        },
        MYTHIC = {
            "HOLD ON. I'm coming. With a heal. And judgment. Mostly judgment.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "I'm drinking. Do not pull. DO NOT.",
            "OOM means OOM. I can't make it clearer.",
            "Zero mana. God is dead and I can't rez Him.",
        },
        UNCOMMON = {
            "This is what happens when people take avoidable damage for 12 pulls straight.",
        },
        RARE = {
            "I go OOM and suddenly everyone's a healer expert. 'Just manage your mana.' THANKS. REVOLUTIONARY.",
        },
        MYTHIC = {
            "OOM. This is the part where I wand the boss and pretend it's helping.",
        },
    },

    LOOT = {
        COMMON = {
            "Healing gear? No? Cool. I'll just wear this.",
            "Congrats. My reward is that nobody died.",
            "Is it +healing? Is it ever +healing? No.",
        },
        UNCOMMON = {
            "The real loot is the heals I gave along the way. ...I want the gear though.",
        },
        RARE = {
            "I don't DPS. I don't get Kill shots. I heal. And I get nothing. This is fine.",
        },
        MYTHIC = {
            "You know what healer BIS is? A group that doesn't stand in fire. Drops never.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "Fort buff is up. Spirit buff is up. My patience is down.",
            "I'm the healer. My word is law. My law is: don't stand in things.",
            "Let me top everyone off. Then we pull. Slowly.",
        },
        UNCOMMON = {
            "I've healed worse dungeons than this. Probably. Let me not think about it.",
        },
        RARE = {
            "Every dungeon I enter, I mentally prepare for the worst. I'm never disappointed.",
        },
        MYTHIC = {
            "I heal because nobody else will. That's not noble. That's a hostage situation.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "Interrupted. That saved me a heal. I owe whoever did that a buff.",
            "One interrupt = one heal saved. DO MORE OF THOSE.",
            "Bless whoever kicked that.",
        },
        UNCOMMON = {
            "If interrupts were healer gear, I'd farm this dungeon forever.",
        },
        RARE = {
            "That interrupt was the most supportive thing anyone's done for me all night. I might cry.",
        },
        MYTHIC = {
            "A group that interrupts is a group I can keep alive. Revolutionary concept.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "MOVE. I'm not healing fire damage. I mean I will. But I'll complain.",
            "Fire = bad. Move = good. This is not complicated.",
            "The fire costs me mana. YOUR fire costs ME mana.",
        },
        UNCOMMON = {
            "Every tick of fire damage is a heal I can't give the tank. Think about that.",
        },
        RARE = {
            "I will heal you through fire. Once. The second time, you're on your own.",
        },
        MYTHIC = {
            "Standing in fire is a tax on the healer. I am taxed enough.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "Shield up. Heal queued. Here we go.",
            "Everyone be careful. I only have so much mana.",
            "Starting heals. Try not to take too much— too late.",
        },
        UNCOMMON = {
            "Pre-shielded the tank. Pre-judged the DPS. Standard procedure.",
        },
        RARE = {
            "My healing rotation starts with hope and ends with mana potions.",
        },
        MYTHIC = {
            "The Light guides my heals. The Light also sees your positioning and it's disappointed.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "Dead. Nobody died. That's MY win condition.",
            "Victory. I spent 60% of my mana. But victory.",
            "Target down. Everyone alive. Personal best.",
        },
        UNCOMMON = {
            "Zero deaths. That's not DPS. That's not tanking. That's HEALING.",
        },
        RARE = {
            "I kept 5 people alive through that. Where's MY Parse?",
        },
        MYTHIC = {
            "Another pull survived. Don't thank me. ...okay, you can thank me.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "CC'd while healing. This is a crisis. Someone is dying right now.",
            "I Feared it. Into more mobs. No regrets. I was PANICKING.",
            "Stunned. Can't heal. 3... 2... 1... someone's dead.",
        },
        UNCOMMON = {
            "When the healer gets CC'd, the death timer starts. I'm just saying.",
        },
        RARE = {
            "Psychic Scream is not a DPS ability. It's a survival instinct. Don't judge me.",
        },
        MYTHIC = {
            "CC'd the healer? Bold strategy. Let's see how it plays out. Spoiler: badly.",
        },
    },

    AMBIENT = {
        COMMON = {
            "Drinking. Again. Always. Forever.",
            "Mana break. This is my happy place.",
            "Rebuffing. Because Fort fell off. Again.",
        },
        UNCOMMON = {
            "Between pulls I question my spec choice. During pulls I'm too busy to question anything.",
        },
        RARE = {
            "I heal because I love it. I complain because I love complaining. Both are true.",
        },
        MYTHIC = {
            "One day a group will say 'good heals' without someone dying first. Dreams are free.",
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            "Fewer health bars to watch. Is it wrong that I'm relieved?",
            "DC'd. Less healing needed. Silver lining.",
            "They'll be back. Hopefully with a better connection.",
        },
        UNCOMMON = {
            "Lost a patient to disconnection. It's... not in my training for this.",
        },
        RARE = {
            "If I DC'd, this group would wipe in 4 seconds. Just making sure we all know that.",
        },
        MYTHIC = {
            "They DC'd. The rest of you: do NOT take extra damage to compensate. I see you.",
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            "A health pot! SOMEONE is helping me heal! This is unprecedented.",
            "Self-healing. Beautiful. More of that please.",
            "Potion used. That's one less heal on my plate. Thank you.",
        },
        UNCOMMON = {
            "If everyone potted when they were low, I'd actually have a mana bar after fights.",
        },
        RARE = {
            "They used a pot so I didn't have to heal them. I'm emotional. This is what teamwork looks like.",
        },
        MYTHIC = {
            "A health potion saved me 500 mana. That person is my new favorite.",
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            "Big CD. If it reduces incoming damage, I love you.",
            "Cooldown popped. Please let it be a defensive one.",
            "Inner Focus goes brrr. Free heals. The dream.",
        },
        UNCOMMON = {
            "When I pop cooldowns, it means we're in trouble. When DPS pops cooldowns, it means they're having fun. Unfair.",
        },
        RARE = {
            "Power Infusion is the best thing I can give a DPS. They never appreciate it enough.",
        },
        MYTHIC = {
            "All healing CDs burning. This is the 'if you die now, it's DEFINITELY your fault' phase.",
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            "Nobody is dying right now. This is unprecedented. I'm suspicious.",
            "Also on a bird? At least you can't stand in fire up here.",
            "The bird doesn't need healing. The bird is my favourite patient.",
        },
        UNCOMMON = {
            "I just buffed the bird with Fortitude. Don't judge me. It's a reflex.",
            "If you need healing during this flight, something has gone catastrophically wrong and I'm interested.",
        },
        RARE = {
            "For once, I'm not the one keeping everyone alive. The bird is. Thank you, bird.",
        },
        MYTHIC = {
            "Seven minutes of nobody dying. A priest's paradise. I'm going to remember this flight forever.",
        },
    },

},

}

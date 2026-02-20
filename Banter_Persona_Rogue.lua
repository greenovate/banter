-- Banter_Persona_Rogue.lua
-- Voice: ROGUE CLASS — paranoid, always looking for exits, stealth humor, 
-- treats everything like a heist movie.
-- Rules: 1) Trusts nobody, not even the group. 2) Every situation is an excuse to Vanish.
-- 3) Obsessed with being behind things. 4) Treats every dungeon like a covert op.
-- 5) Secretly the most dramatic person alive (replaces Ninja).
local _, ns = ...

ns.personas.ROGUE = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="rog_dead_c01", weight=1, line="{dead} is dead. I marked the exits, they didn't. Lesson learned." },
            { id="rog_dead_c02", weight=1, line="{dead} went down. Should've stealthed. Oh wait. Can't. Tragic." },
            { id="rog_dead_c03", weight=1, line="RIP {dead}. The target was supposed to be the MOB, not you." },
            { id="rog_dead_c04", weight=1, line="{dead} died in the open. Like an amateur. In PLAIN SIGHT." },
            { id="rog_dead_c05", weight=1, line="I'd have saved {dead} but I was busy being invisible. Priorities." },
            { id="rog_dead_c06", weight=1, line="{dead} is gone. I cased the room before we entered. The threat was obvious." },
            { id="rog_dead_c07", weight=1, line="Another casualty. This is why I always have Vanish ready." },
            { id="rog_dead_c08", weight=1, line="{dead} died standing in the front. Fronts are for tanks. Backs are for professionals." },
        },
        UNCOMMON = {
            { id="rog_dead_u01", weight=1, line="I was behind the mob. Behind it. Where it's safe. {dead} was... not there." },
            { id="rog_dead_u02", weight=1, line="I Vanished during that. Did I need to? No. Did I survive? Yes. Coincidence?" },
            { id="rog_dead_u03", weight=1, line="{dead} didn't have Evasion, Vanish, or Sprint. What kind of class doesn't have an escape plan?" },
            { id="rog_dead_u04", weight=1, line="In my line of work, the ones who die are the ones who forget to check their six." },
        },
        RARE = {
            { id="rog_dead_r01", weight=1, line="I've survived every group I've ever been in. Not all of them can say the same." },
            { id="rog_dead_r02", weight=1, line="I have three escape routes, two Vanish charges, and zero sympathy for people who stand in the open." },
        },
        MYTHIC = {
            { id="rog_dead_m01", weight=1, line="{dead} is dead. I'll mourn later. In stealth. Where it's safe." },
        },
    },

    WIPE = {
        COMMON = {
            { id="rog_wipe_c01", weight=1, line="Wipe. I Vanished. I'm alive. I see no problem here." },
            { id="rog_wipe_c02", weight=1, line="Everyone's dead. I'm stealthed in the corner. This is fine." },
            { id="rog_wipe_c03", weight=1, line="I tried to Vanish but we were already wiping. Even I have limits." },
            { id="rog_wipe_c04", weight=1, line="Total party kill. Except me. Because I have Vanish. Because I plan ahead." },
        },
        UNCOMMON = {
            { id="rog_wipe_u01", weight=1, line="I assessed the situation. The situation was: everyone dies. So I Vanished. It's called tactical analysis." },
            { id="rog_wipe_u02", weight=1, line="I could have stayed and fought. But the smart play was Vanish. I always make the smart play." },
        },
        RARE = {
            { id="rog_wipe_r01", weight=1, line="I Vanished, restealthed, and sapped the nearest mob. I'm running this solo now. Just kidding. ...maybe." },
        },
        MYTHIC = {
            { id="rog_wipe_m01", weight=1, line="Nobody saw me Vanish. Nobody sees me do anything. That's literally the point." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="rog_hplo_c01", weight=1, line="{target} is low. Should probably do something about that. Not me. I'm DPS." },
            { id="rog_hplo_c02", weight=1, line="{target} is about to die. I'd help but I'm behind the mob and things are going well here." },
            { id="rog_hplo_c03", weight=1, line="I see {target} dying. I also see my combo points at 5. Guess which one I'm dealing with first." },
            { id="rog_hplo_c04", weight=1, line="{target} needs health. I have bandages. ...somewhere. Maybe." },
        },
        UNCOMMON = {
            { id="rog_hplo_u01", weight=1, line="I could Gouge the mob hitting {target}. But that resets my combo chain. Hard pass." },
            { id="rog_hplo_u02", weight=1, line="My solution to low health is Evasion and hope. Works 70% of the time." },
        },
        RARE = {
            { id="rog_hplo_r01", weight=1, line="Rogues have bandages and prayers. Neither scales. I'm aware." },
        },
        MYTHIC = {
            { id="rog_hplo_m01", weight=1, line="If {target} dies, that's one less person who can see me fail. ...wait, I never fail." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="rog_mana_c01", weight=1, line="OOM? I use energy. Infinite energy. Well, not infinite. But it comes back FAST." },
            { id="rog_mana_c02", weight=1, line="{target} is out of mana. I can't relate. My resource regenerates every 2 seconds." },
            { id="rog_mana_c03", weight=1, line="Imagine needing to DRINK to fight. Rogues wake up ready." },
            { id="rog_mana_c04", weight=1, line="No mana? Just auto-attack. That's 60% of my rotation anyway." },
        },
        UNCOMMON = {
            { id="rog_mana_u01", weight=1, line="Mana is a crutch for people who fight from the front. Real work happens from behind. With a dagger." },
            { id="rog_mana_u02", weight=1, line="Energy regen is the most elegant resource system in the game. I will not be taking follow-up questions." },
        },
        RARE = {
            { id="rog_mana_r01", weight=1, line="I've never gone OOM. I've never had to drink. My only downtime is when I choose to be dramatic." },
        },
        MYTHIC = {
            { id="rog_mana_m01", weight=1, line="Mana users: you're all prisoners of a blue bar. I'm free. Free and stabbing things." },
        },
    },

    LOOT = {
        COMMON = {
            { id="rog_loot_c01", weight=1, line="AGI and crit or I walk." },
            { id="rog_loot_c02", weight=1, line="Is it a dagger? Is it fast? Does it have Agility? THREE yeses or I'm out." },
            { id="rog_loot_c03", weight=1, line="{looter} got loot. I mean, I already picked the lock on this dungeon. Where's MY reward?" },
            { id="rog_loot_c04", weight=1, line="Nice drop, {looter}. I definitely wasn't going to pickpocket it from you. ...definitely." },
        },
        UNCOMMON = {
            { id="rog_loot_u01", weight=1, line="Leather with Agility or I'm offended. Personally and professionally." },
            { id="rog_loot_u02", weight=1, line="I've been waiting for that dagger since I pickpocketed my first mob at level 12." },
        },
        RARE = {
            { id="rog_loot_r01", weight=1, line="I don't need loot. I need faster daggers. Faster. FASTER." },
        },
        MYTHIC = {
            { id="rog_loot_m01", weight=1, line="If I could pickpocket the loot table, I would. I've thought about it. Extensively." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="rog_inst_c01", weight=1, line="{zone}. I've already scouted three exits and two sap targets." },
            { id="rog_inst_c02", weight=1, line="Entering {zone}. I'll go in first. In stealth. You won't see me. That's the point." },
            { id="rog_inst_c03", weight=1, line="New dungeon. New things to stab in the back. Let's move." },
            { id="rog_inst_c04", weight=1, line="I've been here before. Stealthed past everything. Want me to show you how? ...you can't stealth. Shame." },
        },
        UNCOMMON = {
            { id="rog_inst_u01", weight=1, line="I've mapped every patrol route. I know where the patrols stop. I know where the chests are. Shall we?" },
            { id="rog_inst_u02", weight=1, line="Before we start: I'm going to Vanish at least twice. It's not cowardice. It's called surviving." },
        },
        RARE = {
            { id="rog_inst_r01", weight=1, line="Fun fact: I could solo stealth to the last boss. I won't. But the OPTION exists and that's power." },
        },
        MYTHIC = {
            { id="rog_inst_m01", weight=1, line="I treat every dungeon like a heist. Entry plan. Mark the targets. Execute. Vanish before the guards show. Classic." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="rog_int_c01", weight=1, line="Kicked. That's MY specialty. 10 second lockout. Sit down." },
            { id="rog_int_c02", weight=1, line="{source} with the interrupt. Precise. Efficient. I approve." },
            { id="rog_int_c03", weight=1, line="Kick landed. Nothing gets past rogue reflexes." },
        },
        UNCOMMON = {
            { id="rog_int_u01", weight=1, line="My Kick is on a 10-second cooldown. The mob's castbar is on a 2-second cooldown. I see the problem." },
        },
        RARE = {
            { id="rog_int_r01", weight=1, line="I interrupted mid-Eviscerate. Cost me a finisher. Worth it. Barely." },
        },
        MYTHIC = {
            { id="rog_int_m01", weight=1, line="That Kick was frame-perfect. I've been training for moments like this my entire rogue career." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="rog_fire_c01", weight=1, line="Fire? On the ground? Where I STAND? Behind the boss? This is a personal attack." },
            { id="rog_fire_c02", weight=1, line="Can't DPS the back of the boss if the back of the boss is ON FIRE." },
            { id="rog_fire_c03", weight=1, line="I'm in the fire. I know. All the good positions are in the fire." },
            { id="rog_fire_c04", weight=1, line="Ground AoE is the natural enemy of melee. And I take it personally." },
        },
        UNCOMMON = {
            { id="rog_fire_u01", weight=1, line="I Sprinted out of the fire. Burned 30% of my energy. The fire burned 30% of my health. Nobody won." },
            { id="rog_fire_u02", weight=1, line="Evasion doesn't dodge fire. I've tested this. Several times. Painfully." },
        },
        RARE = {
            { id="rog_fire_r01", weight=1, line="I could Cloak of Shadows through this. Saving it for something scarier. Like social interaction." },
        },
        MYTHIC = {
            { id="rog_fire_m01", weight=1, line="The fire is in my spot. MY spot. The one behind the boss. I've been here ALL fight. Unacceptable." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="rog_cbt_c01", weight=1, line="Opening from stealth. Don't blink." },
            { id="rog_cbt_c02", weight=1, line="Cheap Shot. Backstab. Eviscerate. That's the whole plan." },
            { id="rog_cbt_c03", weight=1, line="Engaging. From behind. As professionals do." },
            { id="rog_cbt_c04", weight=1, line="Going in. If things go wrong, I was never here." },
        },
        UNCOMMON = {
            { id="rog_cbt_u01", weight=1, line="Ambush from stealth does more damage than most people's entire openers. You're welcome." },
            { id="rog_cbt_u02", weight=1, line="I don't start fights. I finish them. From behind. Silently." },
        },
        RARE = {
            { id="rog_cbt_r01", weight=1, line="People say rogues are one-trick ponies. Our trick is being invisible and doing 40% of the group's damage. Some trick." },
        },
        MYTHIC = {
            { id="rog_cbt_m01", weight=1, line="I've been in stealth since the last pull. Nobody noticed. Perfect." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="rog_kill_c01", weight=1, line="Target neutralized. Clean work." },
            { id="rog_kill_c02", weight=1, line="Dead. Didn't even see me coming. That's how it should be." },
            { id="rog_kill_c03", weight=1, line="Another one down. Total backstabs this session: classified." },
        },
        UNCOMMON = {
            { id="rog_kill_u01", weight=1, line="I got the killing blow. From behind. While stealthed. ...okay I might be exaggerating one of those." },
        },
        RARE = {
            { id="rog_kill_r01", weight=1, line="The mob never saw me. The healer never saw me. Nobody sees me. That's the gig." },
        },
        MYTHIC = {
            { id="rog_kill_m01", weight=1, line="I've been tracking that mob since we entered. It was personal. Don't ask why." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="rog_cc_c01", weight=1, line="Sapped. Clean. Silent. Artistic." },
            { id="rog_cc_c02", weight=1, line="I got stunned. A ROGUE. Getting stunned. This is humiliating." },
            { id="rog_cc_c03", weight=1, line="Someone broke my Sap. I don't sap for fun. I sap for SAFETY." },
            { id="rog_cc_c04", weight=1, line="CC'd. Can't Backstab. Can't Eviscerate. My entire identity is on hold." },
        },
        UNCOMMON = {
            { id="rog_cc_u01", weight=1, line="I have Sap, Blind, Gouge, Cheap Shot, and Kidney Shot. I'm basically a crowd control sommelier." },
            { id="rog_cc_u02", weight=1, line="Being feared as a rogue is wrong. I'm supposed to CAUSE fear. Not feel it." },
        },
        RARE = {
            { id="rog_cc_r01", weight=1, line="I got CC'd and my cat reflexes failed me. I'm going to need a moment. In stealth." },
        },
        MYTHIC = {
            { id="rog_cc_m01", weight=1, line="Five CC abilities and I still got stunned. The universe has a sense of humor." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="rog_amb_c01", weight=1, line="Standing here. In stealth. ...you can't see me, right? Good." },
            { id="rog_amb_c02", weight=1, line="Scouting ahead. ...or just standing here stealthed. You don't know which." },
            { id="rog_amb_c03", weight=1, line="I've been behind you this entire time. Just testing something." },
            { id="rog_amb_c04", weight=1, line="Does anyone need a lockpick? No? Then I've contributed nothing. As usual." },
            { id="rog_amb_c05", weight=1, line="Waiting in the shadows. My natural habitat." },
            { id="rog_amb_c06", weight=1, line="I could pickpocket that mob. For like, 2 silver. Hardly worth breaking stealth." },
        },
        UNCOMMON = {
            { id="rog_amb_u01", weight=1, line="Between pulls, I plan my next Vanish. It's not paranoia. It's preparedness." },
            { id="rog_amb_u02", weight=1, line="I'm the only class that could leave this dungeon right now without anyone noticing. Just putting that out there." },
            { id="rog_amb_u03", weight=1, line="Rogues don't rest. We lurk. Lurking is our rest." },
        },
        RARE = {
            { id="rog_amb_r01", weight=1, line="I counted 14 mobs, 3 patrols, and 2 chest spawns while you were all buffing. Casual recon." },
        },
        MYTHIC = {
            { id="rog_amb_m01", weight=1, line="I love this group. Not because I trust you. I trust nobody. But you're useful. Same thing." },
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            { id="rog_dc_c01", weight=1, line="{target} vanished. Not the cool kind. The 'router died' kind." },
            { id="rog_dc_c02", weight=1, line="{target} disconnected. In THIS dungeon? Amateur." },
            { id="rog_dc_c03", weight=1, line="{target} is gone. At least when I disappear, it's on purpose." },
        },
        UNCOMMON = {
            { id="rog_dc_u01", weight=1, line="{target} DC'd. If a rogue disappears, it's skill. When anyone else disappears, it's a problem." },
            { id="rog_dc_u02", weight=1, line="When I vanish, I come back with backstabs. When {target} vanishes, they come back with excuses." },
        },
        RARE = {
            { id="rog_dc_r01", weight=1, line="{target} disconnected. I've been stealthed next to them for 3 minutes. Didn't even notice they left." },
        },
        MYTHIC = {
            { id="rog_dc_m01", weight=1, line="Man down. Or rather, man offline. We adapt. We improvise. We Vanish if necessary." },
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            { id="rog_cons_c01", weight=1, line="Potion? I prefer Thistle Tea. Pure energy. No side effects. Probably." },
            { id="rog_cons_c02", weight=1, line="{source} popped a pot. I pop Thistle Tea and pretend it's coffee." },
            { id="rog_cons_c03", weight=1, line="I use poisons, not potions. Different kind of consumable." },
        },
        UNCOMMON = {
            { id="rog_cons_u01", weight=1, line="My consumable game: Deadly Poison, Instant Poison, Thistle Tea, and a bandage I've never used." },
        },
        RARE = {
            { id="rog_cons_r01", weight=1, line="I applied poisons to my blades before this run. In the dark. Alone. It was very atmospheric." },
        },
        MYTHIC = {
            { id="rog_cons_m01", weight=1, line="Rogues don't drink potions. We apply solutions. Toxic solutions. To our weapons." },
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            { id="rog_cd_c01", weight=1, line="{source} popped something big. My Adrenaline Rush is ready if we need it." },
            { id="rog_cd_c02", weight=1, line="Major CDs. When I pop Blade Flurry, everything around me suffers. Elegantly." },
            { id="rog_cd_c03", weight=1, line="Big cooldown energy. Evasion is MY big CD. Because surviving is a DPS increase." },
        },
        UNCOMMON = {
            { id="rog_cd_u01", weight=1, line="Adrenaline Rush turns me into a stabbing machine. More than usual." },
        },
        RARE = {
            { id="rog_cd_r01", weight=1, line="Preparation resets ALL my cooldowns. It's like a second chance. I always plan for second chances." },
        },
        MYTHIC = {
            { id="rog_cd_m01", weight=1, line="Cold Blood, Eviscerate. One button. Maximum drama. That's the rogue way." },
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            { id="rog_fp_c01", weight=1, line="Can't stealth on a bird. This is the most exposed I've been in months." },
            { id="rog_fp_c02", weight=1, line="No shadows up here. No cover. No corners. Just open sky. Nightmare." },
            { id="rog_fp_c03", weight=1, line="The bird follows a fixed route. Predictable. Traceable. Amateur." },
            { id="rog_fp_c04", weight=1, line="I've already identified three exits. All of them involve falling." },
            { id="rog_fp_c05", weight=1, line="If this bird gets ambushed I'm Vanishing. Good luck, bird." },
            { id="rog_fp_c06", weight=1, line="Rogues don't sit on birds. We sit in shadows. This is a deviation from protocol." },
            { id="rog_fp_c07", weight=1, line="Can't pick the bird's pocket. Tried. No pockets." },
            { id="rog_fp_c08", weight=1, line="Someone could see me up here. In the OPEN. On a BIRD. Like a civilian." },
            { id="rog_fp_c09", weight=1, line="The flight master knows my face now. Operational security: compromised." },
            { id="rog_fp_c10", weight=1, line="I could've run there. Stealthed. Through the shadows. Like a professional. But no. Bird." },
            { id="rog_fp_c11", weight=1, line="My daggers are useless up here. I've checked. Multiple times." },
            { id="rog_fp_c12", weight=1, line="The wind is loud. Can't hear footsteps. Can't hear anything. Vulnerability status: high." },
            { id="rog_fp_c13", weight=1, line="Altitude: too high. Cover: none. Escape routes: zero. Comfort level: negative." },
            { id="rog_fp_c14", weight=1, line="This bird makes noise. A lot of noise. I hate noise. We have a disagreement." },
            { id="rog_fp_c15", weight=1, line="I'm wearing all black on a white bird in broad daylight. Stealth rating: zero." },
            { id="rog_fp_c16", weight=1, line="Clocked the flight time. Six minutes fourteen seconds. I could sprint halfway there in that time." },
            { id="rog_fp_c17", weight=1, line="Everyone can see where I'm going. The trajectory is OBVIOUS. This goes against everything I believe in." },
            { id="rog_fp_c18", weight=1, line="No blind spots on this bird. I've done a full assessment. Unacceptable." },
        },
        UNCOMMON = {
            { id="rog_fp_u01", weight=1, line="I've mapped every flight path in three continents. Memorized the schedules. Noted the blind spots. There are no blind spots. It's infuriating." },
            { id="rog_fp_u02", weight=1, line="The bird banked left without warning. No signal. No visual cue. In my line of work, that gets you stabbed." },
            { id="rog_fp_u03", weight=1, line="Saw another bird pass us going the opposite direction. Made eye contact with the rider. They saw me. Cover blown." },
            { id="rog_fp_u04", weight=1, line="I tried crouching on the saddle to lower my profile. The bird compensated. We had a disagreement about aerodynamics." },
            { id="rog_fp_u05", weight=1, line="This flight path goes directly over hostile territory. I've noted six potential ambush points. The bird noted zero. Amateurs run this operation." },
            { id="rog_fp_u06", weight=1, line="Counted my poison vials to pass the time. All accounted for. Then counted again. Still all there. Counted a third time. I need to land." },
            { id="rog_fp_u07", weight=1, line="The bird squawked. Loudly. In what I can only describe as the OPPOSITE of stealth. We are natural enemies." },
            { id="rog_fp_u08", weight=1, line="If I had Vanish right now I'd use it. Just to feel safe. Even though I'm alone. On a bird. In the sky." },
            { id="rog_fp_u09", weight=1, line="Someone on the ground just waved at me. I didn't wave back. Acknowledgment creates witnesses." },
            { id="rog_fp_u10", weight=1, line="My Detect Traps sense is tingling. There are no traps up here. But I'm not about to stop checking." },
        },
        RARE = {
            { id="rog_fp_r01", weight=1, line="A rogue's power comes from the unknown. Right now, everyone knows exactly where I am: on a bird, in the sky, visible from the GROUND. This is anti-rogue propaganda." },
            { id="rog_fp_r02", weight=1, line="Spent the whole flight planning the perfect route I could've taken on foot. Through the shadows. Past the guards. No witnesses. Instead: bird." },
            { id="rog_fp_r03", weight=1, line="The bird has no sense of urgency. No situational awareness. No respect for operational tempo. I would never partner with this bird voluntarily." },
            { id="rog_fp_r04", weight=1, line="Stared at the horizon for eight minutes. In that time I've planned three heists, two escapes, and one very specific assassination. Of the bird." },
            { id="rog_fp_r05", weight=1, line="I operate in darkness. I thrive in silence. I move unseen. And right now I'm on the loudest, most visible, most OBVIOUS mode of transport in Azeroth." },
        },
        MYTHIC = {
            { id="rog_fp_m01", weight=1, line="Flight path debrief: visibility — total. Stealth options — none. Cover — none. Escape routes — fatal. Dignity — compromised. Mission status: survived. Barely." },
            { id="rog_fp_m02", weight=1, line="They train us to be invisible. To be ghosts. To move without a trace. And then they put us on a bird. In the SKY. Where everyone can SEE. This isn't travel. This is a betrayal of everything I stand for." },
        },
    },

    -- SOLO_AMBIENT
    SOLO_AMBIENT = {
        COMMON = {
            { id="rog_solo_c01", weight=1, line="Solo operative. Preferred status." },
            { id="rog_solo_c02", weight=1, line="Moving through unsecured territory. Standard protocol." },
            { id="rog_solo_c03", weight=1, line="No witnesses. No complications. No complaints." },
            { id="rog_solo_c04", weight=1, line="Stealth active. Not because I need it. Because I can." },
            { id="rog_solo_c05", weight=1, line="Field assessment: clear. Threat level: low. Boredom level: rising." },
            { id="rog_solo_c06", weight=1, line="Every shadow is a potential position. Every corner is a potential exit." },
            { id="rog_solo_c07", weight=1, line="Alone. The way operations were meant to be run." },
            { id="rog_solo_c08", weight=1, line="Quiet out here. Perfect conditions for not existing." },
            { id="rog_solo_c09", weight=1, line="I leave no trace. No footprints. No evidence. Just results." },
            { id="rog_solo_c10", weight=1, line="Checked my six. Clear. Checked it again. Still clear. Old habits." },
            { id="rog_solo_c11", weight=1, line="Nobody knows I'm here. Ideal." },
            { id="rog_solo_c12", weight=1, line="Passed a patrol. They didn't see me. Amateur hour." },
            { id="rog_solo_c13", weight=1, line="The terrain here offers adequate concealment. Acceptable." },
            { id="rog_solo_c14", weight=1, line="Operating independently. Efficiency up three hundred percent." },
            { id="rog_solo_c15", weight=1, line="I could kill everything between here and the horizon. But I'm on a schedule." },
            { id="rog_solo_c16", weight=1, line="Vanish is not an escape. It is a lifestyle." },
            { id="rog_solo_c17", weight=1, line="Inventory check: poisons loaded, daggers sharp, ego intact." },
            { id="rog_solo_c18", weight=1, line="Tracking nothing in particular. Everything in general." },
        },
        UNCOMMON = {
            { id="rog_solo_u01", weight=1, line="Solo operations are clean. No one pulls extra mobs. No one breaks stealth. No one asks 'what does Sap do?' Nobody asks anything. Bliss." },
            { id="rog_solo_u02", weight=1, line="My trainer said rogues work best alone. My trainer was right about that and wrong about almost everything else. But that one stuck." },
            { id="rog_solo_u03", weight=1, line="Mapped three escape routes since I got here. One by land, one by shadow, one by sheer audacity. All viable." },
            { id="rog_solo_u04", weight=1, line="The difference between a rogue alone and a rogue in a group: alone, everything is a target. In a group, everything is a headache." },
            { id="rog_solo_u05", weight=1, line="Spent the last ten minutes observing patrol patterns of local wildlife. The rabbits have no discipline. Easy marks." },
            { id="rog_solo_u06", weight=1, line="My poisons are freshly applied, my blades are honed, and there's no one around to appreciate it. Standard rogue experience." },
            { id="rog_solo_u07", weight=1, line="Scouting ahead. Of no one. For nothing. But the technique stays sharp or the technique dies. Those are the rules." },
            { id="rog_solo_u08", weight=1, line="Considered pickpocketing that mob. Then considered the risk-reward ratio. Then did it anyway. Because I'm a professional." },
            { id="rog_solo_u09", weight=1, line="In a group, I'm the silent professional. Solo, I'm the silent professional who doesn't have to pretend to care about loot rolls." },
            { id="rog_solo_u10", weight=1, line="Walking in daylight without stealth feels like being naked. Not that I'd know what that feels like. I don't go places without stealth." },
        },
        RARE = {
            { id="rog_solo_r01", weight=1, line="The wilderness strips away pretense. No group roles, no loot drama, no 'can the rogue open this lockbox.' Just me, the dark, and whatever poor creature wanders into striking range. This is the purest form of the craft." },
            { id="rog_solo_r02", weight=1, line="Been solo for hours. Haven't spoken, haven't been detected, haven't left a trace. If I disappeared right now, no one would know for days. That's not loneliness. That's a five-star operational review." },
            { id="rog_solo_r03", weight=1, line="Other classes need groups for validation. Rogues need solitude for precision. Every moment alone is a moment spent refining the art of being exactly where you need to be, with exactly the right blade, at exactly the right time." },
            { id="rog_solo_r04", weight=1, line="Found a good vantage point. High ground, clear sightlines, wind at my back. Sat there for twenty minutes watching the road. Nothing happened. Best twenty minutes this week." },
            { id="rog_solo_r05", weight=1, line="My daggers don't ask questions. My poisons don't complain. My stealth doesn't have opinions on the pull order. This is why I work alone." },
        },
        MYTHIC = {
            { id="rog_solo_m01", weight=1, line="They say a rogue is most dangerous when you can't see them. They're wrong. A rogue is most dangerous when they've been alone long enough to get bored. Bored rogues start planning. And a rogue with a plan, idle hands, and no supervision is the reason cities have locks." },
            { id="rog_solo_m02", weight=1, line="Solo in the field. No handler, no team, no extraction plan. Just shadows, steel, and a very clear understanding of every living thing within two hundred yards. This is not solitude. This is sovereignty. The wilderness doesn't know I'm here. And that's exactly how I like it." },
        },
    },

},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "Should've had an escape plan.",
            "I Vanished. They didn't. Circle of life.",
            "I was behind the boss. Safe zone. Join me next time. Oh wait.",
            "I'd rez but that's not in my skill set. My skill set is stabbing.",
            "Next time, stand behind the mob. Like a civilized person.",
        },
        UNCOMMON = {
            "In my professional opinion, {dead} died from being visible. Fatal condition.",
            "I survived because I planned for this exact scenario. During character creation.",
        },
        RARE = {
            "I've never died in this dungeon. ...I've also Vanished 47 times.",
        },
        MYTHIC = {
            "Gone. Another casualty of the 'standing in the open' epidemic.",
        },
    },

    WIPE = {
        COMMON = {
            "I Vanished. I'm alive. I call that a draw.",
            "Wipe, but my Vanish worked perfectly. Personal victory.",
            "Everyone's dead. I'm stealthed next to the boss. ...now what?",
        },
        UNCOMMON = {
            "I could have Vanished earlier but I was mid-combo chain. The DPS was too good to abandon.",
        },
        RARE = {
            "I'm alive, in stealth, behind the boss that killed everyone. This is technically a solo attempt now.",
        },
        MYTHIC = {
            "I survived the wipe. Nobody's surprised. Least of all me.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "Low health? Evasion. Sprint. Vanish. Three solutions. None involve healing.",
            "I'd help but I'm mid-combo. The backstab must flow.",
            "Bandage incoming. ...after this Eviscerate.",
        },
        UNCOMMON = {
            "My healthcare plan is Evasion and Vanish. The deductible is my combo points.",
        },
        RARE = {
            "When I'm low, I Vanish and eat a bandage in stealth. It's the rogue spa treatment.",
        },
        MYTHIC = {
            "Low health is a temporary condition. Death is permanent. Vanish splits the difference.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "Mana? Never heard of it. Energy regenerates every tick. Built different.",
            "Can't relate. My bar refills while I stab things.",
            "OOM sounds like a personal problem. Energy is a rogue thing.",
        },
        UNCOMMON = {
            "While you drink, I pickpocket. Different downtime activities.",
        },
        RARE = {
            "The only resource I run out of is patience. And combo points, briefly.",
        },
        MYTHIC = {
            "Energy. Renewable. Infinite. Superior. Don't @ me.",
        },
    },

    LOOT = {
        COMMON = {
            "Agility or it doesn't exist to me.",
            "Daggers or bust.",
            "Grats. I'll pickpocket my own rewards, thanks.",
        },
        UNCOMMON = {
            "If it doesn't have AGI or crit, my eyes glaze over.",
        },
        RARE = {
            "I rolled Need on accident once. Everyone believed me. Rogue trust issues working in my favor for once.",
        },
        MYTHIC = {
            "My BIS dagger is out there. In the shadows. Where I'll find it.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "I'll scout ahead. ...in stealth. ...alone. ...my favorite way.",
            "Mark sap targets. I'll handle the rest.",
            "Three exits confirmed. Let's proceed.",
        },
        UNCOMMON = {
            "I could skip this entire dungeon in stealth. But that would be selfish. And tempting.",
        },
        RARE = {
            "I've already pickpocketed the first three mobs. Did you not see? Good. You shouldn't have.",
        },
        MYTHIC = {
            "Every dungeon is a heist. The loot is the target. Let's make a clean extraction.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "Kick landed. 10 seconds of quiet. Beautiful.",
            "That's what Kick is for. Clean. Fast.",
            "Interrupted. Silence is golden. And rogue-shaped.",
        },
        UNCOMMON = {
            "I interrupted from behind. The mob never even saw me. Peak performance.",
        },
        RARE = {
            "Kick is the most satisfying button I press. Second only to Vanish.",
        },
        MYTHIC = {
            "Perfect interrupt. No wasted energy. No wasted motion. Just precision.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "Fire behind the boss. Of course. Because I can't have nice things.",
            "I Sprinted out. Lost combo points. Worth it. Barely.",
            "Ground AoE in melee. Designers hate rogues confirmed.",
        },
        UNCOMMON = {
            "I used Cloak of Shadows. The fire still hurt. It's physical fire apparently.",
        },
        RARE = {
            "I Vanished from the fire. The fire can't target what it can't see. Theoretically.",
        },
        MYTHIC = {
            "The fire burns. But losing DPS uptime burns MORE.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "Opening from stealth. It's showtime.",
            "Cheap Shot, Backstab, go go go.",
            "Target acquired. Engaging from behind.",
        },
        UNCOMMON = {
            "Always open from stealth. It's not about damage. It's about the principle.",
        },
        RARE = {
            "My opener hit for 40% of the mob's health. The other 60% is just cleanup.",
        },
        MYTHIC = {
            "From the shadows I come. Into the shadows I return. The middle part is all stabbing.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "Clean kill. Next target.",
            "Done. Nobody saw. Standard.",
            "Target eliminated. Moving to next position.",
        },
        UNCOMMON = {
            "I got the killing blow from behind. Obviously.",
        },
        RARE = {
            "That mob never detected me. I was behind it the entire fight. Rogue excellence.",
        },
        MYTHIC = {
            "Professional. Silent. Lethal. Another day at the office.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "Sapped. Don't touch. Professional CC in progress.",
            "I have Sap for days. Mark 'em, I'll nap 'em.",
            "CC'd. I'm aware. I'm also annoyed.",
        },
        UNCOMMON = {
            "Someone broke my Sap. That Sap was ART. You ruined ART.",
        },
        RARE = {
            "I Sap better than most people DPS. It's a talent. Literally.",
        },
        MYTHIC = {
            "Sap, Blind, Gouge, Kidney Shot. A CC for every occasion. I'm versatile.",
        },
    },

    AMBIENT = {
        COMMON = {
            "Stealthed. Watching. Judging.",
            "I'm here. You just can't see me. Working as intended.",
            "Lurking. As one does.",
        },
        UNCOMMON = {
            "I pickpocketed three mobs while you were rebuffing. Made 47 copper. Worth it.",
        },
        RARE = {
            "When you can go invisible at will, downtime hits different. Better. Quieter.",
        },
        MYTHIC = {
            "I've been standing next to you this whole time. In stealth. You didn't notice. I'm flattered.",
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            "Gone. Poof. My kind of exit, minus the style.",
            "DC'd. At least when I disappear, I come back with backstabs.",
            "Down a person. I'll stealth harder to compensate.",
        },
        UNCOMMON = {
            "If I DC'd, you'd never know if I was offline or just in stealth.",
        },
        RARE = {
            "They vanished. Without the class skill. Embarrassing.",
        },
        MYTHIC = {
            "I respect the disappearance but the execution was sloppy.",
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            "I use poisons. Different kind of consumable.",
            "Potions are for people without escape plans.",
            "Thistle Tea crew checking in.",
        },
        UNCOMMON = {
            "My consumable budget goes entirely to poisons. Priorities.",
        },
        RARE = {
            "I applied Deadly Poison in the middle of combat. Multitasking.",
        },
        MYTHIC = {
            "Consumables? I consume combo points and enemy health bars.",
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            "Big CD. Respect the commitment.",
            "When I pop Evasion, the mob literally can't touch me. Living the dream.",
            "CDs out. Time to stab with enthusiasm.",
        },
        UNCOMMON = {
            "Adrenaline Rush is my 'I've decided to try now' button.",
        },
        RARE = {
            "Blade Flurry hitting two targets at once. I'm essentially two rogues.",
        },
        MYTHIC = {
            "All cooldowns. Full energy. Five combo points. This is the moment.",
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            "You didn't see me on this bird. This conversation didn't happen.",
            "We're both exposed up here. I hate it. You should hate it too.",
            "If anyone asks, I wasn't on this flight path. I was... elsewhere.",
        },
        UNCOMMON = {
            "I cased this bird before I got on. No traps. No tails. Just a slow ride and wounded dignity.",
            "The fact that you can see me right now means my cover is blown. Thanks for that.",
        },
        RARE = {
            "Rogues on flight paths. The single most visible a rogue can be. I'm filing a complaint with someone.",
        },
        MYTHIC = {
            "When we land, I'm going to Vanish immediately. Not because of danger. Because of shame.",
        },
    },

    SOLO_AMBIENT = {
        COMMON = {
            "You can see me. That's a problem. Yours.",
            "I was invisible until just now. Coincidence.",
            "Contact. Unexpected. Noted.",
        },
        UNCOMMON = {
            "My position has been compromised. Recalculating. Your presence is an operational variable I didn't account for.",
            "I was conducting a solo surveillance operation. Your arrival has downgraded it to a social interaction. Unacceptable.",
        },
        RARE = {
            "The fact that you found me means either you're very good or I'm slipping. I choose to believe you're very good. It's less terrifying.",
        },
        MYTHIC = {
            "Fourteen minutes of perfect stealth. Zero detection. Zero contact. And then you stumbled in like a warrior at a buffet and now every mob in the area knows something's here. This is why I work alone.",
        },
    },

},

}

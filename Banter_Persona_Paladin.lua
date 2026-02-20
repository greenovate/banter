-- Banter_Persona_Paladin.lua
-- Voice: PALADIN CLASS — righteous condescension, bubble-hearth legend,
-- The Light is an overbearing parent, blessing management is a full-time job,
-- low-key unkillable and smug about it.
-- Rules: 1) Every problem can be solved with more Light. 2) Bubble is a lifestyle.
-- 3) Blessings are a social contract. 4) Judging is literal AND figurative.
-- 5) Lay on Hands is the nuclear option.
local _, ns = ...

ns.personas.PALADIN = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="pal_dead_c01", weight=1, line="{dead} has fallen. I had Lay on Hands. It was on cooldown. One hour. ONE HOUR." },
            { id="pal_dead_c02", weight=1, line="{dead} died. I had my bubble. I lived. This is the paladin experience." },
            { id="pal_dead_c03", weight=1, line="RIP {dead}. The Light giveth and the Light taketh. Mostly taketh today." },
            { id="pal_dead_c04", weight=1, line="{dead} fell. I was judging. Literally judging a mob. Not figuratively. Though also that." },
            { id="pal_dead_c05", weight=1, line="I could have bubbled {dead}. But Blessing of Protection has a 5-minute cooldown and I already used it. On myself." },
            { id="pal_dead_c06", weight=1, line="{dead} is dead. Divine Shield is personal. I don't make the rules. The Light makes the rules." },
            { id="pal_dead_c07", weight=1, line="The Light protected me. {dead}? The Light had other priorities." },
            { id="pal_dead_c08", weight=1, line="{dead} died because they stood in fire. The Light can't fix spatial awareness." },
        },
        UNCOMMON = {
            { id="pal_dead_u01", weight=1, line="Lay on Hands: 1 hour cooldown. Usable once per dungeon. The pressure of choosing who lives is immense." },
            { id="pal_dead_u02", weight=1, line="I bubbled and watched {dead} die. Felt invincible. Felt guilty. Classic paladin emotions." },
            { id="pal_dead_u03", weight=1, line="I could have used Blessing of Protection on {dead}. I didn't. Because it was on ME." },
            { id="pal_dead_u04", weight=1, line="The Light shines on us all. Some of us just have Shield equipped." },
        },
        RARE = {
            { id="pal_dead_r01", weight=1, line="I had Divine Shield, Blessing of Protection, AND Lay on Hands ready. {dead} still died. I panicked and used all three on myself." },
            { id="pal_dead_r02", weight=1, line="Being a paladin means watching everyone die while glowing gold. It's beautiful. And sad." },
        },
        MYTHIC = {
            { id="pal_dead_m01", weight=1, line="They died. I didn't. The Light has favorites. I don't write the lore." },
        },
    },

    WIPE = {
        COMMON = {
            { id="pal_wipe_c01", weight=1, line="Wipe. I bubbled. Then hearthed. ...I mean I DIDN'T do that. That would be wrong." },
            { id="pal_wipe_c02", weight=1, line="Total wipe. I was the last one alive. In my bubble. Watching. Just... watching." },
            { id="pal_wipe_c03", weight=1, line="Wipe. I used Lay on Hands on myself. I still died. But I died LAST." },
            { id="pal_wipe_c04", weight=1, line="Everyone's dead. I bubbled and auto-attacked until the shield wore off. Went down swinging." },
        },
        UNCOMMON = {
            { id="pal_wipe_u01", weight=1, line="I bubble-hearthed. Judge me. JUDGE me. ...see? Judging. That's my thing." },
            { id="pal_wipe_u02", weight=1, line="I burned Divine Shield, then Lay on Hands, then BoP. Used every cooldown. Still wiped. Just slowly." },
        },
        RARE = {
            { id="pal_wipe_r01", weight=1, line="The classic paladin wipe experience: press bubble, contemplate your life choices for 12 seconds, die." },
        },
        MYTHIC = {
            { id="pal_wipe_m01", weight=1, line="Bubble-hearth is not cowardice. It's TACTICAL RETREAT. The Light approves. I asked." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="pal_hplo_c01", weight=1, line="{target} is low. Flash of Light or Lay on Hands? Scale of commitment here." },
            { id="pal_hplo_c02", weight=1, line="Healing {target}. Slowly. Flash of Light isn't fast. The name is a lie." },
            { id="pal_hplo_c03", weight=1, line="{target} needs healing. I'm on it. One slow, expensive heal at a time." },
            { id="pal_hplo_c04", weight=1, line="Throwing heals on {target}. Paladin healing: three spells and a prayer." },
        },
        UNCOMMON = {
            { id="pal_hplo_u01", weight=1, line="I could Lay on Hands. Full health instantly. But then it's on cooldown for AN HOUR. Is this REALLY the emergency?" },
            { id="pal_hplo_u02", weight=1, line="Flash of Light, Flash of Light, Flash of Light... this is my entire healing kit. Riveting gameplay." },
        },
        RARE = {
            { id="pal_hplo_r01", weight=1, line="Paladin healing: cast a slow heal, hope they don't die, if they do: Lay on Hands. If THAT's on CD: thoughts and prayers." },
        },
        MYTHIC = {
            { id="pal_hplo_m01", weight=1, line="I have three healing spells. Three. A priest has like nine. But sure, I'll solo heal this." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="pal_mana_c01", weight=1, line="OOM. Judging and auto-attacking until mana comes back. The dignified approach." },
            { id="pal_mana_c02", weight=1, line="Out of mana. Seal of Wisdom. Hit the boss. Pray for procs." },
            { id="pal_mana_c03", weight=1, line="No mana. I'm literally just auto-attacking with a judgement sometimes. Living the paladin fantasy." },
            { id="pal_mana_c04", weight=1, line="{target} is OOM too. We're all OOM. Paladins and mana: an unhappy marriage." },
        },
        UNCOMMON = {
            { id="pal_mana_u01", weight=1, line="I'm OOM but I have Seal of Wisdom going. Hit the boss, get mana. It's farming. In combat." },
            { id="pal_mana_u02", weight=1, line="Paladin OOM protocol: Judge Wisdom, auto-attack, contemplate existence, wait." },
        },
        RARE = {
            { id="pal_mana_r01", weight=1, line="Remember when paladins had infinite mana from Illumination? Yeah. That got nerfed. I remember." },
        },
        MYTHIC = {
            { id="pal_mana_m01", weight=1, line="OOM paladin is just a warrior in fancier armor. And I'm okay with that." },
        },
    },

    LOOT = {
        COMMON = {
            { id="pal_loot_c01", weight=1, line="Is it plate with Intellect? That's paladin loot. Warriors, back off." },
            { id="pal_loot_c02", weight=1, line="{looter} got the drop. The Light rewards the faithful. Or the lucky." },
            { id="pal_loot_c03", weight=1, line="Plate gear with spell power. Made specifically for one class. Mine." },
            { id="pal_loot_c04", weight=1, line="Nice loot. I need that for my healing set. And my tanking set. Different piece? That too." },
        },
        UNCOMMON = {
            { id="pal_loot_u01", weight=1, line="I rolled Need on plate with Intellect. Nobody else uses it. There is literally no competition. And yet they still get mad." },
            { id="pal_loot_u02", weight=1, line="Paladins: the only class that unironically wants Strength, Intellect, AND Stamina. On the same piece." },
        },
        RARE = {
            { id="pal_loot_r01", weight=1, line="I carry a healing set, a tanking set, and a DPS set. My bags are a Vatican storage closet." },
        },
        MYTHIC = {
            { id="pal_loot_m01", weight=1, line="Spell plate: designed for one class. My class. The Light provides." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="pal_inst_c01", weight=1, line="{zone}. Blessings up. This takes a while. There are 7 blessings and 5 of you." },
            { id="pal_inst_c02", weight=1, line="Entering {zone}. Greater Blessings on everyone. Don't ask me to rebuff for 15 minutes." },
            { id="pal_inst_c03", weight=1, line="Blessings distributed. Aura active. I'm basically a walking buff station with a mace." },
            { id="pal_inst_c04", weight=1, line="{zone}. Devotion Aura up. The Light walks with us. I walk slightly behind the tank." },
        },
        UNCOMMON = {
            { id="pal_inst_u01", weight=1, line="Everyone wants different blessings. 'Give me Might.' 'Give me Kings.' 'Give me Wisdom.' I am not a restaurant." },
            { id="pal_inst_u02", weight=1, line="Entering the dungeon. I have 7 blessings, 3 auras, and no one agrees on which ones to use." },
        },
        RARE = {
            { id="pal_inst_r01", weight=1, line="I spent more time buffing before the first pull than some classes spend in the entire dungeon." },
        },
        MYTHIC = {
            { id="pal_inst_m01", weight=1, line="Paladin dungeon prep: bless everyone, aura check, gear check, blessing check again because kings fell off. AGAIN." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="pal_int_c01", weight=1, line="Nice interrupt. I have... um. Hammer of Justice. On a one-minute cooldown. We're basically covered." },
            { id="pal_int_c02", weight=1, line="{source} kicked it. I would have Hammer of Justice'd but it stuns, not interrupts. Close enough." },
            { id="pal_int_c03", weight=1, line="Good interrupt. My contribution is standing here, glowing, providing an aura." },
        },
        UNCOMMON = {
            { id="pal_int_u01", weight=1, line="Paladins don't have a true interrupt. We have a stun. On a 1 minute CD. We do our best." },
        },
        RARE = {
            { id="pal_int_r01", weight=1, line="Hammer of Justice: technically an interrupt, spiritually a panic button, functionally on cooldown." },
        },
        MYTHIC = {
            { id="pal_int_m01", weight=1, line="My interrupt tool kit: one stun, one minute cooldown, and righteous indignation." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="pal_fire_c01", weight=1, line="Fire! I'm in plate. With a shield. I'll be fine. Probably." },
            { id="pal_fire_c02", weight=1, line="Standing in the bad. Didn't move. Paladin HP pool can take it. That's my excuse." },
            { id="pal_fire_c03", weight=1, line="Fire on the ground. If it gets bad, I'll bubble. Until then, I swing." },
            { id="pal_fire_c04", weight=1, line="Ground effect. I have Divine Shield for real emergencies. This? This is just warm." },
        },
        UNCOMMON = {
            { id="pal_fire_u01", weight=1, line="Bubble through the fire. Zero damage taken. The Light: better than moving." },
            { id="pal_fire_u02", weight=1, line="I could move out of the fire. OR I could use a cooldown and keep swinging. I choose violence." },
        },
        RARE = {
            { id="pal_fire_r01", weight=1, line="Used Divine Shield to stand in fire and keep DPSing. The healer was confused but impressed." },
        },
        MYTHIC = {
            { id="pal_fire_m01", weight=1, line="Fire can't kill me. Nothing can kill me. I have more immunities than a diplomat." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="pal_cbt_c01", weight=1, line="For the Light! Auto-attacking. Judgement. Auto-attacking. The paladin rotation." },
            { id="pal_cbt_c02", weight=1, line="Pull! Judging. Sealing. Auto-attacking. ...and we wait." },
            { id="pal_cbt_c03", weight=1, line="Engaging the enemy. Devotion Aura is up. Seal is up. I'm basically on autopilot." },
            { id="pal_cbt_c04", weight=1, line="Combat started. I'll judge, seal, and swing. The Holy Trinity of paladin DPS." },
        },
        UNCOMMON = {
            { id="pal_cbt_u01", weight=1, line="Paladin combat rotation: Judge, Seal, auto-attack, contemplate the Light, auto-attack, judge again." },
            { id="pal_cbt_u02", weight=1, line="People mock the auto-attack class. But who survives? Who ALWAYS survives? That's right." },
        },
        RARE = {
            { id="pal_cbt_r01", weight=1, line="I pressed three buttons and now I wait 8 seconds. Welcome to paladin DPS. We're not flashy. We're RELIABLE." },
        },
        MYTHIC = {
            { id="pal_cbt_m01", weight=1, line="Judge. Seal. Swing. If anyone dies, Lay on Hands. If everyone dies, bubble. It's a system." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="pal_kill_c01", weight=1, line="Judged. Defeated. The Light prevails." },
            { id="pal_kill_c02", weight=1, line="Another enemy falls before the righteous. My auto-attack is DEVASTATING." },
            { id="pal_kill_c03", weight=1, line="Target down. The Light remains undefeated. Mostly because of bubble." },
        },
        UNCOMMON = {
            { id="pal_kill_u01", weight=1, line="Kill secured. My DPS was low but my SURVIVAL contribution was off the charts." },
        },
        RARE = {
            { id="pal_kill_r01", weight=1, line="I auto-attacked that mob to death. Slowly. Righteously. With aura damage." },
        },
        MYTHIC = {
            { id="pal_kill_m01", weight=1, line="Consecration did 4% of my damage. But it LOOKED impressive." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="pal_cc_c01", weight=1, line="Hammer of Justice! Stunned for 6 seconds. That's all I got. Use it wisely." },
            { id="pal_cc_c02", weight=1, line="Repentance! Target is meditating. Nobody hit it. NOBODY HIT IT." },
            { id="pal_cc_c03", weight=1, line="Turn Undead! The undead is running away. ...into another pack. Oh no." },
            { id="pal_cc_c04", weight=1, line="CC'd. But I'm in plate. With a shield. And bubble. I can tank the consequences." },
        },
        UNCOMMON = {
            { id="pal_cc_u01", weight=1, line="Repentance: making enemies contemplate their sins since 2004." },
            { id="pal_cc_u02", weight=1, line="Turn Undead is my CC. It fears them. Into other mobs. It's complicated." },
        },
        RARE = {
            { id="pal_cc_r01", weight=1, line="I Hammer of Justice'd a mob, Repentanced another, and Turn Undeaded a third. All three of my CC options. Exhausted." },
        },
        MYTHIC = {
            { id="pal_cc_m01", weight=1, line="Paladin CC: stun one, repent one, fear one. After that? I just stand there. Glowing. Menacingly." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="pal_amb_c01", weight=1, line="Blessings are still up. Checked. Double-checked. Triple-checked. It's an obsession." },
            { id="pal_amb_c02", weight=1, line="Standing here. Glowing. Righteously. This is what paladins do between pulls." },
            { id="pal_amb_c03", weight=1, line="Reapplying blessings. They last 5 minutes. I rebuff every 4. Trust issues." },
            { id="pal_amb_c04", weight=1, line="Devotion Aura is passive. I'm contributing just by STANDING here." },
            { id="pal_amb_c05", weight=1, line="Lay on Hands: still on cooldown from the LAST dungeon. One-hour cooldowns are a design choice." },
            { id="pal_amb_c06", weight=1, line="Between pulls I like to judge. The mobs. And also people's DPS." },
        },
        UNCOMMON = {
            { id="pal_amb_u01", weight=1, line="People think paladins just auto-attack. We ALSO judge. And bless. Multi-taskers." },
            { id="pal_amb_u02", weight=1, line="I've been asked for Blessing of Kings 4 times. Blessing of Might 3 times. Nobody agreed. I gave Wisdom. Out of spite." },
            { id="pal_amb_u03", weight=1, line="Being unkillable is a personality trait at this point." },
        },
        RARE = {
            { id="pal_amb_r01", weight=1, line="I once bubbled during a wipe, hearthed, and no one noticed for 3 minutes. Peak paladin." },
        },
        MYTHIC = {
            { id="pal_amb_m01", weight=1, line="The paladin class fantasy: survive everything, heal everything, auto-attack everything. In full plate. While glowing." },
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            { id="pal_dc_c01", weight=1, line="{target} disconnected. Their blessing will expire in 5 minutes. I'm already anxious about it." },
            { id="pal_dc_c02", weight=1, line="{target} is gone. The Light flickered for a moment. ISP-related." },
            { id="pal_dc_c03", weight=1, line="{target} DC'd. I'll rebuff them when they return. Because that's what paladins do. Constantly." },
        },
        UNCOMMON = {
            { id="pal_dc_u01", weight=1, line="{target} disconnected. I'll bless the empty space where they stood. Just in case." },
            { id="pal_dc_u02", weight=1, line="Down a player. I can heal, tank, or DPS to compensate. All three slowly. But persistently." },
        },
        RARE = {
            { id="pal_dc_r01", weight=1, line="They disconnected. I survived. Because I always survive. It's my whole thing." },
        },
        MYTHIC = {
            { id="pal_dc_m01", weight=1, line="The Light doesn't disconnect. I don't disconnect. The connection between us is eternal." },
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            { id="pal_cons_c01", weight=1, line="{source} used a consumable. I used Lay on Hands. Once. An hour ago. Still on CD." },
            { id="pal_cons_c02", weight=1, line="Potion? The Light is my potion. Also actual potions. I use both." },
            { id="pal_cons_c03", weight=1, line="Nice consumable usage. I have Divine Shield. It's basically a health potion that lasts 12 seconds." },
        },
        UNCOMMON = {
            { id="pal_cons_u01", weight=1, line="I don't need potions. I need my cooldowns to be off cooldown. Big difference." },
        },
        RARE = {
            { id="pal_cons_r01", weight=1, line="I once used Lay on Hands as a health potion. Full health. One hour cooldown. Maximum efficiency." },
        },
        MYTHIC = {
            { id="pal_cons_m01", weight=1, line="Paladins don't consume. Paladins endure. With plate. And shields. And magic bubbles. And heals. ...okay we have a lot." },
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            { id="pal_cd_c01", weight=1, line="{source} popped a big CD. I'm holding Lay on Hands. For a REAL emergency." },
            { id="pal_cd_c02", weight=1, line="Big CDs going off. Mine are all on 5-minute cooldowns or longer. I pick my moments." },
            { id="pal_cd_c03", weight=1, line="Divine Shield is ready. The ultimate 'nope' button. Twelve seconds of invulnerability." },
        },
        UNCOMMON = {
            { id="pal_cd_u01", weight=1, line="Lay on Hands: one button, full health, one hour cooldown. The most dramatic heal in the game." },
        },
        RARE = {
            { id="pal_cd_r01", weight=1, line="I popped every CD: Avenging Wrath, Divine Shield, Lay on Hands. Full power paladin. For 12 seconds." },
        },
        MYTHIC = {
            { id="pal_cd_m01", weight=1, line="Paladin cooldowns: either world-changing or on cooldown. There is no in between." },
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            { id="pal_fp_c01", weight=1, line="The Light guides this bird. I asked. It said yes. Probably." },
            { id="pal_fp_c02", weight=1, line="A paladin on a bird. The Light did not design us for aviation." },
            { id="pal_fp_c03", weight=1, line="I'm in full plate. On a bird. This bird is doing the Light's work and also too much heavy lifting." },
            { id="pal_fp_c04", weight=1, line="If this bird drops me, I'm using Divine Shield. Then suing the flight master." },
            { id="pal_fp_c05", weight=1, line="Plate armor at altitude. The wind goes right through the joints. The Light keeps me warm. Barely." },
            { id="pal_fp_c06", weight=1, line="I could be doing righteous deeds right now. Instead I am sitting. On a bird. The Light is patient." },
            { id="pal_fp_c07", weight=1, line="Blessed this bird before takeoff. Standard procedure. Can't be too careful." },
            { id="pal_fp_c08", weight=1, line="The flight master charged me full price. Even after I explained I'm on official Light business. No discount." },
            { id="pal_fp_c09", weight=1, line="Lay on Hands is on cooldown. If this bird crashes, we're relying on gravity and prayer." },
            { id="pal_fp_c10", weight=1, line="Every minute on this bird is a minute I'm not judging anyone. Figuratively AND literally." },
            { id="pal_fp_c11", weight=1, line="The view is gorgeous. I'm judging it anyway. Could use more cathedrals." },
            { id="pal_fp_c12", weight=1, line="I tried bubbling on the bird. Just to feel safe. The bird didn't notice. I felt safer anyway." },
            { id="pal_fp_c13", weight=1, line="This armor weighs more than the bird. The bird knows it. I know it. We don't discuss it." },
            { id="pal_fp_c14", weight=1, line="No undead to smite up here. No heretics to judge. Just clouds and silence." },
            { id="pal_fp_c15", weight=1, line="The Light shines brightest in service to others. But right now it's shining on me. On a bird. Doing nothing." },
            { id="pal_fp_c16", weight=1, line="I cast Blessing of Wisdom on myself for the flight. Seemed appropriate. Learned nothing." },
            { id="pal_fp_c17", weight=1, line="Seal of the Crusader: righteous. Aura of Devotion: active. Sitting on a bird: undignified." },
            { id="pal_fp_c18", weight=1, line="If the bird falls, I bubble. If the bubble pops, I Lay on Hands. If that's on cooldown... the Light provides. Theoretically." },
        },
        UNCOMMON = {
            { id="pal_fp_u01", weight=1, line="Applied Blessing of Protection to the bird. Couldn't figure out what it was protecting it FROM. Did it anyway. Protocol is protocol." },
            { id="pal_fp_u02", weight=1, line="Another paladin flew past us going the other direction. Full plate. Same bird model. We nodded. Paladin solidarity." },
            { id="pal_fp_u03", weight=1, line="I wrote 'The Light Prevails' in the frost on the saddle. Nobody will ever see it. But the Light knows." },
            { id="pal_fp_u04", weight=1, line="Tried to use my hearthstone mid-flight. It worked. Teleported to the inn. Forgot I was in the air. Fell. Bubbled. Walked back to the flight master. Paid again." },
            { id="pal_fp_u05", weight=1, line="The bird tried to drop below the clouds. I Judged it. Not with Justice. With my eyes. Disappointed eyes. It went higher." },
            { id="pal_fp_u06", weight=1, line="Calculated the fall damage from this height. Answer: lethal. Unless you're a paladin. Then: inconvenient." },
            { id="pal_fp_u07", weight=1, line="My Consecration range is 8 yards. This bird is 800 yards up. I'm outside my operational comfort zone by exactly 792 yards." },
            { id="pal_fp_u08", weight=1, line="Saw a group wiping below us. Wanted to help. Couldn't. The bird has no 'descend into righteous fury' button." },
            { id="pal_fp_u09", weight=1, line="Flight paths test a paladin's patience. And I say that as someone who uses Seal of Command with a two-hander. I KNOW patience." },
            { id="pal_fp_u10", weight=1, line="Someone once asked why paladins can't fly. We're too heavily armored. Too righteous. Too... dense. In multiple senses." },
        },
        RARE = {
            { id="pal_fp_r01", weight=1, line="I've used Lay on Hands, Divine Shield, and Blessing of Protection more on TRANSPORTATION than on actual combat this week. Paladin priorities." },
            { id="pal_fp_r02", weight=1, line="The Light illuminates the righteous path. Today, the righteous path is a flight route from Ironforge to Menethil. The Light doesn't judge. I do." },
            { id="pal_fp_r03", weight=1, line="In plate armor, at altitude, on a bird the size of my shield — this is either faith or foolishness. For a paladin, those are the same thing." },
            { id="pal_fp_r04", weight=1, line="Other classes travel in style. Rogues stealth. Mages portal. Druids shapeshift. Paladins sit in full plate on a bird and PRAY. That's our brand." },
            { id="pal_fp_r05", weight=1, line="Every flight path is a pilgrimage. That's what I tell myself. Makes the boredom feel HOLY instead of just boring." },
        },
        MYTHIC = {
            { id="pal_fp_m01", weight=1, line="I am a champion of the Light. I have faced demons. I have healed the dying. I have judged the wicked. And I am on a bird, in full plate, white-knuckling the saddle, because the Light said 'take the scenic route.'" },
            { id="pal_fp_m02", weight=1, line="The great paladins of history — Uther, Turalyon, Tirion — not one of them was ever depicted on a flight path bird. Because they had DIGNITY. I have a two-silver ticket and a prayer." },
        },
    },

    -- SOLO_AMBIENT
    SOLO_AMBIENT = {
        COMMON = {
            { id="pal_solo_c01", weight=1, line="Walking the righteous path. Alone. By CHOICE. The Light understands." },
            { id="pal_solo_c02", weight=1, line="Solo pilgrimage. Very spiritual. Not at all avoiding guild duties." },
            { id="pal_solo_c03", weight=1, line="The Light guides my steps. My steps are slow. Plate armor." },
            { id="pal_solo_c04", weight=1, line="Bubble isn't on cooldown. Nobody's here to judge. Feels strange." },
            { id="pal_solo_c05", weight=1, line="Out here serving the Light by... wandering around. Counts." },
            { id="pal_solo_c06", weight=1, line="Nobody needs a blessing right now. Weird. I've got blessings ready. Just in case." },
            { id="pal_solo_c07", weight=1, line="My cooldowns are all up and there's nothing to use them on. This is the true test of faith." },
            { id="pal_solo_c08", weight=1, line="Solo paladin out here. Shining armor, moral authority, no audience." },
            { id="pal_solo_c09", weight=1, line="The Light doesn't take days off. Neither do I. This isn't a day off. It's a solo crusade." },
            { id="pal_solo_c10", weight=1, line="Just me and my aura. And my faith. And this enormous amount of plate armor." },
            { id="pal_solo_c11", weight=1, line="Judged a mob in passing. Didn't even fight it. Just Judged it. Spiritually." },
            { id="pal_solo_c12", weight=1, line="I could heal myself if I took damage. I could bubble if things got bad. Nothing can go wrong. Famous last words." },
            { id="pal_solo_c13", weight=1, line="Thought about using Divine Shield to cross that river. Decided to walk around. Restraint is a virtue." },
            { id="pal_solo_c14", weight=1, line="The world needs paladins. Right now it specifically needs THIS paladin to walk over THERE. For the Light." },
            { id="pal_solo_c15", weight=1, line="Blessing of Wisdom on myself. Because the Light says knowledge is power. Also I'm out of mana." },
            { id="pal_solo_c16", weight=1, line="Every step in service of the Light. Even the steps that are just general wandering." },
            { id="pal_solo_c17", weight=1, line="My armor shines in the sunlight. Impressive to no one. The trees don't care." },
            { id="pal_solo_c18", weight=1, line="Lay on Hands is ready. Hearthstone is ready. Bubble is ready. I'm over-prepared for a walk." },
        },
        UNCOMMON = {
            { id="pal_solo_u01", weight=1, line="The Light illuminates the solitary path. Also it reflects off my armor and blinds me. The Light works in mysterious and sometimes inconvenient ways." },
            { id="pal_solo_u02", weight=1, line="Being alone means no one is dying for me to heal. This should be relaxing. Instead I feel USELESS. The paladin condition." },
            { id="pal_solo_u03", weight=1, line="I have seven different blessings and no one to cast them on. I've started blessing wildlife. The rabbits seem confused but spiritually fortified." },
            { id="pal_solo_u04", weight=1, line="Solo questing in plate armor. Every other class jogs past me in cloth and leather. I CLANK. But I clank RIGHTEOUSLY." },
            { id="pal_solo_u05", weight=1, line="Other classes go solo for efficiency. Paladins go solo for spiritual growth. That's my story. Don't check my quest log." },
            { id="pal_solo_u06", weight=1, line="My Divine Shield timer is at zero. I could bubble right now, for no reason, and be invincible for twelve seconds. The temptation is constant." },
            { id="pal_solo_u07", weight=1, line="Walked past a group struggling with elites. Felt the Light urging me to help. Also felt my legs urging me to keep walking. The internal debate was brief." },
            { id="pal_solo_u08", weight=1, line="In a group I'm a paladin — healer, buffer, emergency bubble dispenser. Solo I'm just a person in too much armor with opinions about morality." },
            { id="pal_solo_u09", weight=1, line="My Judgement crits look really impressive when no one's around to see them. The Light sees. The Light keeps score." },
            { id="pal_solo_u10", weight=1, line="Considered using Lay on Hands on a wounded deer. Decided it was a waste of a cooldown. Then felt guilty. The guilt IS the cooldown for paladins." },
        },
        RARE = {
            { id="pal_solo_r01", weight=1, line="When I'm alone, I can admit things. Like the fact that I use Bubble more often to avoid awkward conversations than actual lethal damage. The Light shields the righteous. The righteous are socially exhausted." },
            { id="pal_solo_r02", weight=1, line="Found a chapel on the road. Small, empty, dusty. Knelt down for a prayer. The Light answered immediately: 'what do you need.' I said 'nothing, just visiting.' Awkward pause. The Light and I don't do casual well." },
            { id="pal_solo_r03", weight=1, line="Uther walked alone into darkness to face evil. I'm walking alone into a field to pick herbs. Not all pilgrimages are epic. But the Light doesn't rank them. I do. This one is a six out of ten." },
            { id="pal_solo_r04", weight=1, line="Every paladin wrestles with faith. Am I worthy? Am I good enough? Then I bubble, and for twelve perfect seconds, nothing can hurt me. That's not faith. That's better. That's a cooldown." },
            { id="pal_solo_r05", weight=1, line="My shield has dents from a hundred fights. My sword has weight from a thousand blessings. My boots have mud from every road in Azeroth. The Light asked me to serve. It didn't mention the chafing. Or the walks." },
        },
        MYTHIC = {
            { id="pal_solo_m01", weight=1, line="A paladin alone is still a paladin. The armor stays on. The aura stays up. The moral superiority is non-negotiable. But out here, with no one watching, I can admit the truth: I bubble-hearthed once. On purpose. Not in danger. Just to see if I could. I could. It was the greatest moment of my career and I will never tell anyone." },
            { id="pal_solo_m02", weight=1, line="The Light chose me. Out of everyone, it chose THIS paladin to walk THIS road today. Alone, in full plate, sweating under a holy aura I can't turn off. Other paladins get visions. Great quests. Moments of divine clarity. I get long walks and the nagging feeling that I should be buffing someone. Even the Light doesn't know what to do with me sometimes." },
        },
    },

},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "Lay on Hands was on cooldown. I swear. I SWEAR.",
            "The Light chose to protect me instead. Talk to management.",
            "I bubbled reflexively. It's not selfish. It's muscle memory.",
            "I could have BoP'd them. But it was on cooldown. From saving myself.",
            "Thoughts and prayers. And Lay on Hands. In one hour.",
        },
        UNCOMMON = {
            "I survived. That's the paladin promise. Others surviving is... aspirational.",
            "They died outside my bubble radius. Which is zero. The bubble is personal.",
        },
        RARE = {
            "I watched them die from inside Divine Shield. The glow makes it cinematic.",
        },
        MYTHIC = {
            "Paladins don't die. We just witness. Goldenly.",
        },
    },

    WIPE = {
        COMMON = {
            "I was the last alive. Glowing. As usual.",
            "Bubble bought me 12 extra seconds. Of watching everyone die.",
            "I definitely did NOT bubble-hearth. I died heroically. ...eventually.",
        },
        UNCOMMON = {
            "I used every CD and still wiped. But I wiped LAST. That matters.",
        },
        RARE = {
            "The bubble wore off. Then I died. Like a mortal. Disgusting.",
        },
        MYTHIC = {
            "Bubble-hearth isn't running. It's strategic repositioning.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "Flash of Light incoming. It's not fast but the name is optimistic.",
            "Healing. Slowly. Paladin healing is a marathon, not a sprint.",
            "I have three heals. Three. We'll make it work.",
        },
        UNCOMMON = {
            "Is this a Lay on Hands moment? Probably not. But MAYBE.",
        },
        RARE = {
            "Paladin healing motto: one big slow heal at a time, and if that fails, FULL HEAL PANIC BUTTON.",
        },
        MYTHIC = {
            "Flash of Light, Holy Light, Lay on Hands. My entire toolkit. And it works. Somehow.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "OOM. Auto-attacking with righteous intent.",
            "Seal of Wisdom active. Swinging for mana returns.",
            "Out of mana. In plate. Just hitting things. It's honest work.",
        },
        UNCOMMON = {
            "OOM paladin: still in plate, still unkillable, just not casting anymore.",
        },
        RARE = {
            "My mana bar is empty but my resolve is FULL.",
        },
        MYTHIC = {
            "I'm out of mana but I still have a hammer. Priorities.",
        },
    },

    LOOT = {
        COMMON = {
            "Spell plate. SPELL PLATE. That's my loot and nobody else's.",
            "I need it for my healing set. Or tanking set. Or ret set.",
            "Good drop. The Light provides.",
        },
        UNCOMMON = {
            "Three specs, three gear sets, one tiny inventory. Paladin problems.",
        },
        RARE = {
            "I have plate with Intellect, Strength, AND Stamina in my bags. For three specs. It's a museum.",
        },
        MYTHIC = {
            "The Light provides loot. EVENTUALLY.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "Blessings going up. Hold still. This takes a minute.",
            "Aura active. Buffs distributed. The Light is with us.",
            "Greater Blessings up. Don't die for 15 minutes and we're golden.",
        },
        UNCOMMON = {
            "I'm a buff bot who can also tank, heal, and DPS. Put some respect on it.",
        },
        RARE = {
            "Time spent buffing: 3 minutes. Time spent in combat: unknown. Buff uptime: yes.",
        },
        MYTHIC = {
            "Paladin dungeon prep takes longer than some DPS classes' entire rotation.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "Hammer of Justice! One minute CD but it's technically an interrupt.",
            "Nice kick. My contribution is aura damage and moral support.",
            "I stunned it. That counts. Briefly.",
        },
        UNCOMMON = {
            "One stun, one minute cooldown. That's my interrupt entire toolkit.",
        },
        RARE = {
            "Paladins interrupt through persistence. And one very long cooldown stun.",
        },
        MYTHIC = {
            "I don't interrupt. I outlast. The mob will die eventually. Patience is a virtue.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "Fire? I'm in plate. With a bubble. I'll live.",
            "Stood in it. Survived. Paladin HP pool different.",
            "I could move. OR I could pop a CD and keep swinging.",
        },
        UNCOMMON = {
            "Bubbled through the fire. Zero damage. Big brain plays.",
        },
        RARE = {
            "I used Divine Shield to stand in fire and DPS. TACTICAL.",
        },
        MYTHIC = {
            "Fire is just a temperature. Bubble is a lifestyle.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "Judging. Sealing. Swinging. The Holy Trinity of paladin DPS.",
            "For the Light! And also auto-attack.",
            "Engaging. With extreme prejudice. And moderate DPS.",
        },
        UNCOMMON = {
            "Three buttons pressed. Now we wait. Paladin combat is meditative.",
        },
        RARE = {
            "Consecration down. Standing in it. Mobs come to me. This is how paladins tank. By STANDING.",
        },
        MYTHIC = {
            "I judge, seal, swing, and pray. That IS the rotation.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "Judged. Smitten. Dead. The Light prevails.",
            "Another one falls. Righteously. Slowly. But righteously.",
            "Kill secured. My DPS was low but my UPTIME was perfect.",
        },
        UNCOMMON = {
            "That kill was 60% auto-attack damage. I'd like to thank my weapon.",
        },
        RARE = {
            "I may be slow but I am INEVITABLE.",
        },
        MYTHIC = {
            "Consecration ticked. Seal procced. Judgement landed. Poetry in motion. Slow motion.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "Hammer of Justice! Stunned. You have 6 seconds.",
            "Repentance holding. Nobody touch it.",
            "CC applied. Don't break it. I have limited options.",
        },
        UNCOMMON = {
            "I Turn Undeaded it. It ran into the next pack. Classic.",
        },
        RARE = {
            "My CC is a stun, a repentance, and a fear. None of them last long. All of them are dramatic.",
        },
        MYTHIC = {
            "Paladin CC: make them think about what they did. For 6 seconds.",
        },
    },

    AMBIENT = {
        COMMON = {
            "Rebuffing. It's what I do. Constantly.",
            "Standing here. Providing aura. Contributing passively.",
            "Blessings checked. Aura active. Ready for the next pull.",
        },
        UNCOMMON = {
            "People underestimate the paladin. Then they need a bubble. Or a rez. Or a blessing.",
        },
        RARE = {
            "I'm unkillable and everyone knows it. They NEED me.",
        },
        MYTHIC = {
            "The Light shines on those who buff, judge, and auto-attack. In that order.",
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            "DC'd. Their blessing timer is ticking down. This bothers me.",
            "Gone. I'll rebuff them when they return. As is tradition.",
            "One less person to bless. Briefly.",
        },
        UNCOMMON = {
            "They disconnected but my aura still covers their corpse. I'm still helping.",
        },
        RARE = {
            "They DC'd. I'll outlast this setback. I outlast everything.",
        },
        MYTHIC = {
            "The Light never disconnects. The paladin never disconnects. Your ISP, however...",
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            "Potion? I have Lay on Hands. One per hour. Premium healing.",
            "Nice pot. My version is bubble and ignore the problem.",
            "Consumed. I prefer my built-in immunities.",
        },
        UNCOMMON = {
            "Paladins don't need consumables. We need our 5-minute cooldowns to reset faster.",
        },
        RARE = {
            "Lay on Hands IS my health potion. One use. Per hour. Maximum drama.",
        },
        MYTHIC = {
            "I don't consume. I PERSIST.",
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            "Big CD. I'm saving mine. For the REAL emergency. Which is always.",
            "Nice cooldown. Mine is Lay on Hands and it's been on CD since the Clinton administration.",
            "CDs burning. I'll pop Avenging Wrath. For exactly 20 seconds of glory.",
        },
        UNCOMMON = {
            "Lay on Hands: nuclear option. Always saved. Never used at the right time.",
        },
        RARE = {
            "Popping everything. Avenging Wrath, Divine Shield, Consecration. GOLDEN HOUR.",
        },
        MYTHIC = {
            "Paladin CDs are either legendary saves or hour-long regrets. No middle ground.",
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            "Also on a bird? The Light watches over all travelers. Even the slow ones.",
            "It's a pilgrimage. That's what I'm calling it. Don't correct me.",
            "Full plate on a bird. You get used to it. The bird doesn't, but YOU do.",
        },
        UNCOMMON = {
            "I blessed this bird before takeoff. Not because it asked. Because I'm thorough.",
            "If we crash, I'm bubbling. You're on your own. The Light has priorities.",
        },
        RARE = {
            "Every great paladin has a humbling moment. Mine is this bird. Every single time.",
        },
        MYTHIC = {
            "Uther never rode a flight path bird. Then again, Uther didn't have to get to the Hinterlands by 3 o'clock.",
        },
    },

    SOLO_AMBIENT = {
        COMMON = {
            "The Light sent you to interrupt my meditation? Bold move.",
            "I was communing with the Light. Privately. The Light doesn't do walk-ins.",
            "Oh. Hello. I was just... praying. Out loud. In armor. Normal paladin things.",
        },
        UNCOMMON = {
            "I was having a spiritual experience and you've turned it into a social one. The Light charges extra for those.",
            "My bubble was almost off cooldown and I was going to pop it just to feel something. You've ruined the sacred moment.",
        },
        RARE = {
            "I was about to reach enlightenment. Could feel it. Right there. Then you walked up and the Light said 'we'll reschedule.' This is why I solo. THIS.",
        },
        MYTHIC = {
            "The Light spoke to me in the silence. It said 'you are worthy, champion.' Then you showed up and the Light said 'oh, company. How nice. Help them.' I didn't WANT to help anyone. I wanted ONE quiet moment of PERSONAL holiness. But no. Paladins don't get days off. The Light said so. Just now.",
        },
    },

},

}

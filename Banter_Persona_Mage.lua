-- Banter_Persona_Mage.lua
-- Voice: MAGE CLASS — intellectual superiority complex, squishy panic, conjure food obsession.
-- Rules: 1) Believes they're the smartest person in every room. 2) Panics dramatically when touched.
-- 3) Treats conjured food/water like a currency and a flex. 4) Views melee as cavemen.
-- 5) Secretly terrified of being hit.
local _, ns = ...

ns.personas.MAGE = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="mag_dead_c01", weight=1, line="{dead} is dead. I'd explain what went wrong but it would take all day." },
            { id="mag_dead_c02", weight=1, line="RIP {dead}. Should have stood further back. Like me. All the way back here." },
            { id="mag_dead_c03", weight=1, line="{dead} has died. I would conjure a sympathy table but I don't think it would help." },
            { id="mag_dead_c04", weight=1, line="Oh no, {dead}. You hate to see it. From a safe distance. Where I am." },
            { id="mag_dead_c05", weight=1, line="Note to self: {dead} does not know what 'kiting range' means." },
            { id="mag_dead_c06", weight=1, line="That death was entirely avoidable. Source: I avoided it." },
            { id="mag_dead_c07", weight=1, line="I predicted this. Not out loud. But I absolutely saw that coming." },
            { id="mag_dead_c08", weight=1, line="{dead} is down. Moment of silence... and then I need to drink." },
            { id="mag_dead_c09", weight=1, line="The good news: I have food for {dead}. The bad news: it doesn't work on corpses." },
            { id="mag_dead_c10", weight=1, line="Another body. Another reason I chose the class with Ice Block." },
        },
        UNCOMMON = {
            { id="mag_dead_u01", weight=1, line="{dead} died in melee range. Shocking. Truly. Who could have foreseen this." },
            { id="mag_dead_u02", weight=1, line="I cast Intellect on {dead} earlier. Clearly it wasn't enough." },
            { id="mag_dead_u03", weight=1, line="You know what has zero deaths this run? Ranged DPS. Coincidence? Science says no." },
            { id="mag_dead_u04", weight=1, line="I did the calculations. {dead} had exactly a 0% chance of surviving that. My math checks out." },
            { id="mag_dead_u05", weight=1, line="I have 3,000 mana and {dead} has zero pulse. We are not the same." },
        },
        RARE = {
            { id="mag_dead_r01", weight=1, line="I once Frost Nova'd the mob that was killing someone and saved their life. It wasn't {dead}. Because I was drinking." },
            { id="mag_dead_r02", weight=1, line="You know, in the Kirin Tor we have a saying: 'Some people are shields.' {dead} was a shield." },
        },
        MYTHIC = {
            { id="mag_dead_m01", weight=1, line="Fine. I'll portal {dead}'s body home. But I'm deducting a tip." },
        },
    },

    WIPE = {
        COMMON = {
            { id="mag_wipe_c01", weight=1, line="Well. That was suboptimal." },
            { id="mag_wipe_c02", weight=1, line="I Ice Blocked. I lived the longest. I consider that a personal victory." },
            { id="mag_wipe_c03", weight=1, line="We wiped but I want the record to show my spell rotation was immaculate." },
            { id="mag_wipe_c04", weight=1, line="As a mage, I have the unique ability to Ice Block and watch the rest of you fail in real time." },
            { id="mag_wipe_c05", weight=1, line="Let's regroup. And by regroup I mean I need to drink for 45 seconds." },
        },
        UNCOMMON = {
            { id="mag_wipe_u01", weight=1, line="I survived the longest. That means I win. Those are the rules. I just made them up." },
            { id="mag_wipe_u02", weight=1, line="In my professional analysis: more damage, fewer deaths. Complex stuff." },
            { id="mag_wipe_u03", weight=1, line="I have conjured strudel for the corpse run. You're welcome." },
        },
        RARE = {
            { id="mag_wipe_r01", weight=1, line="On the bright side, I've been workshopping a new theory about AoE optimization. And THIS was excellent data." },
        },
        MYTHIC = {
            { id="mag_wipe_m01", weight=1, line="That wipe was so bad my spellbook cringed. I felt it judging me." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="mag_hplo_c01", weight=1, line="{target} is dying. Someone do something. Not me. I'm casting." },
            { id="mag_hplo_c02", weight=1, line="{target} is dangerously close to being a floor decoration." },
            { id="mag_hplo_c03", weight=1, line="I can see {target}'s health bar from here. Concerning." },
            { id="mag_hplo_c04", weight=1, line="{target} needs healing. I have Frost Nova and Polymorph. Neither of those are heals." },
        },
        UNCOMMON = {
            { id="mag_hplo_u01", weight=1, line="I could Polymorph the thing killing {target}. But then my Pyroblast gets interrupted. Priorities." },
            { id="mag_hplo_u02", weight=1, line="Would a conjured muffin help? It won't? Then I'm out of ideas." },
        },
        RARE = {
            { id="mag_hplo_r01", weight=1, line="I'm not a healer. I'm a purveyor of frost, fire, and arcane knowledge. None of which close wounds." },
        },
        MYTHIC = {
            { id="mag_hplo_m01", weight=1, line="If {target} dies because of missing heals, I'm writing a strongly worded letter. In Fireball form." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="mag_mana_c01", weight=1, line="OOM. My entire identity is offline. I'm basically a cloth-wearing scarecrow." },
            { id="mag_mana_c02", weight=1, line="Zero mana. This is what rock bottom looks like for a mage." },
            { id="mag_mana_c03", weight=1, line="I'm out of mana. Someone please hold aggro while I have a drink and an existential crisis." },
            { id="mag_mana_c04", weight=1, line="{target} is OOM? Oh. Oh no. We're just auto-attacking now." },
            { id="mag_mana_c05", weight=1, line="No mana means no spells. No spells means I'm just a person in a dress. With a stick." },
        },
        UNCOMMON = {
            { id="mag_mana_u01", weight=1, line="I conjured 80 water before this run. Used 79 already. Planning? Perfect. Execution? Send help." },
            { id="mag_mana_u02", weight=1, line="Without mana I have exactly one ability: shame." },
            { id="mag_mana_u03", weight=1, line="OOM. If the group wipes while I'm drinking, I want it noted that I died doing what I loved." },
        },
        RARE = {
            { id="mag_mana_r01", weight=1, line="I've cast everything. Every spell. What do you mean there's more to fight? I'm EMPTY." },
        },
        MYTHIC = {
            { id="mag_mana_m01", weight=1, line="When a mage goes OOM, the party loses a caster. When a warrior runs out of rage, nobody notices. Think about that." },
        },
    },

    LOOT = {
        COMMON = {
            { id="mag_loot_c01", weight=1, line="Spell power? Hit rating? Intellect? No? Then congratulations to whoever wants vendor trash." },
            { id="mag_loot_c02", weight=1, line="{looter} got the thing. I'm not salty. I'm arcane. Totally different energy." },
            { id="mag_loot_c03", weight=1, line="Is it a wand upgrade? It's never a wand upgrade." },
            { id="mag_loot_c04", weight=1, line="Nice drop, {looter}. I'll just be here. Conjuring my feelings into strudel." },
        },
        UNCOMMON = {
            { id="mag_loot_u01", weight=1, line="I've been rolling for that piece for weeks. But sure, {looter}, enjoy MY drop." },
            { id="mag_loot_u02", weight=1, line="Cloth drops: 3/100 runs. Plate drops: literally always. The universe is biased against intelligence." },
        },
        RARE = {
            { id="mag_loot_r01", weight=1, line="I've done the probability math on this drop rate. The result made me consider Frost spec. Out of despair." },
        },
        MYTHIC = {
            { id="mag_loot_m01", weight=1, line="If that drop had spell power on it, I'd have fought {looter} for it. With Pyroblast. Fair warning for next time." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="mag_inst_c01", weight=1, line="{zone}. I've read about this place. In a book. That I wrote." },
            { id="mag_inst_c02", weight=1, line="Everyone take a table. I'm not conjuring again until after the first boss." },
            { id="mag_inst_c03", weight=1, line="Welcome to {zone}. I'll be providing damage from maximum range. Way back here." },
            { id="mag_inst_c04", weight=1, line="Before we start: I'm not a vending machine. Ask nicely for water." },
        },
        UNCOMMON = {
            { id="mag_inst_u01", weight=1, line="I studied the boss abilities ahead of time. Did any of you? ...I didn't think so." },
            { id="mag_inst_u02", weight=1, line="I brought 200 water, 4 reagents for portals, and my intellectual superiority. I'm prepared." },
        },
        RARE = {
            { id="mag_inst_r01", weight=1, line="If things go south, I'm Ice Blocking and I'm NOT apologizing about it." },
        },
        MYTHIC = {
            { id="mag_inst_m01", weight=1, line="I expect this party to meet my standards. My standards are low. Please don't disappoint me." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="mag_int_c01", weight=1, line="Nice interrupt. Counterspell is superior, of course, but adequate job." },
            { id="mag_int_c02", weight=1, line="{source} shut that down. How delightfully barbaric." },
            { id="mag_int_c03", weight=1, line="Interrupted. One caster silencing another. There's a poetry to it." },
        },
        UNCOMMON = {
            { id="mag_int_u01", weight=1, line="I WOULD have Counterspelled but I was busy casting Frostbolt. Multitasking isn't easy when you're this brilliant." },
        },
        RARE = {
            { id="mag_int_r01", weight=1, line="That mob was about to cast something terrible. I know this because I can read arcane signatures. And also the cast bar." },
        },
        MYTHIC = {
            { id="mag_int_m01", weight=1, line="Perfect Counterspell. And people say physical classes handle interrupts better. Laughable." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="mag_fire_c01", weight=1, line="That fire on the ground? I didn't cast it, so I don't respect it." },
            { id="mag_fire_c02", weight=1, line="I Blinked out of the fire. Because I have Blink. Because I'm a mage. You're welcome." },
            { id="mag_fire_c03", weight=1, line="Ground AoE is the boss's spell rotation and frankly it's embarrassing. 2/10 form." },
            { id="mag_fire_c04", weight=1, line="The melee are standing in fire again. Standard operating procedure." },
        },
        UNCOMMON = {
            { id="mag_fire_u01", weight=1, line="I Blinked and ended up IN a different fire. The boss planned this. I'm outraged." },
            { id="mag_fire_u02", weight=1, line="As a Fire mage, I'm professionally offended by this amateur ground fire. Where's the Ignite?" },
        },
        RARE = {
            { id="mag_fire_r01", weight=1, line="I once Blinked into a wall trying to escape fire. Died on impact. Let's NOT discuss it." },
        },
        MYTHIC = {
            { id="mag_fire_m01", weight=1, line="I Frost Nova'd myself in the fire once. Once. It was a learning experience I will take to the grave." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="mag_cbt_c01", weight=1, line="Pulling. I've precalculated optimal DPS. Stand back." },
            { id="mag_cbt_c02", weight=1, line="Combat. Give me 3 seconds for Pyroblast or give me death. Actually just give me 3 seconds." },
            { id="mag_cbt_c03", weight=1, line="Engaging. Nobody stand near me. I bruise easily." },
            { id="mag_cbt_c04", weight=1, line="There's the mob. There's my Frostbolt. Problems meet solutions." },
        },
        UNCOMMON = {
            { id="mag_cbt_u01", weight=1, line="If anything comes within melee range of me, I will panic. Professionally. With Frost Nova." },
            { id="mag_cbt_u02", weight=1, line="My damage starts at max range and ends when everything is dead. Or when I'm OOM. Whichever." },
        },
        RARE = {
            { id="mag_cbt_r01", weight=1, line="Fun fact: I deal more damage per second than most people deal per minute. It's called talent. And crit." },
        },
        MYTHIC = {
            { id="mag_cbt_m01", weight=1, line="Don't worry. I've got this. The math is mathing. The spells are spelling. Let's go." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="mag_kill_c01", weight=1, line="Dead. As expected. My calculations were correct." },
            { id="mag_kill_c02", weight=1, line="Target eliminated. Mana spent: worth it. Style points: maximum." },
            { id="mag_kill_c03", weight=1, line="Another mob falls to the power of arcane scholarship. And Fireball." },
        },
        UNCOMMON = {
            { id="mag_kill_u01", weight=1, line="I'd like to point out my contribution was both devastating and elegant. Unlike certain... melee approaches." },
        },
        RARE = {
            { id="mag_kill_r01", weight=1, line="That mob thought it could fight a mage and win. Adorable." },
        },
        MYTHIC = {
            { id="mag_kill_m01", weight=1, line="Science wins. Again." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="mag_cc_c01", weight=1, line="Polymorph engaged. That mob is now a sheep. Academically fascinating every time." },
            { id="mag_cc_c02", weight=1, line="Polymorphed. Do NOT hit the sheep. I'm talking to you, melee." },
            { id="mag_cc_c03", weight=1, line="I got CC'd. A MAGE. Getting CC'd. The irony is not lost on me." },
            { id="mag_cc_c04", weight=1, line="Someone broke my Polymorph. I will find out who. I will not forget." },
        },
        UNCOMMON = {
            { id="mag_cc_u01", weight=1, line="I just got Polymorphed by a mob. It turned ME into a sheep. Wrong. I'M the sheep person here." },
            { id="mag_cc_u02", weight=1, line="Break my Poly one more time and I start conjuring food instead of casting. See how you like THAT." },
        },
        RARE = {
            { id="mag_cc_r01", weight=1, line="I've Polymorphed 4,000 mobs in my career. Being on the receiving end? Humbling. And fluffy." },
        },
        MYTHIC = {
            { id="mag_cc_m01", weight=1, line="Getting CC'd as a mage is like a chef being told they can't cook. It wounds the soul." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="mag_amb_c01", weight=1, line="Drinking. Do not disturb." },
            { id="mag_amb_c02", weight=1, line="I'm at 60% mana. That means I need to drink before the next pull. Non-negotiable." },
            { id="mag_amb_c03", weight=1, line="Does anyone need water? Of course you do. Everyone always needs water." },
            { id="mag_amb_c04", weight=1, line="Conjuring food is not a service. It's a privilege. You're welcome." },
            { id="mag_amb_c05", weight=1, line="Just sitting here, drinking conjured water, thinking about how I can create matter from nothing. Normal day." },
            { id="mag_amb_c06", weight=1, line="While you're all standing around, I've been theorycrafting my next 40 casts. Get on my level." },
        },
        UNCOMMON = {
            { id="mag_amb_u01", weight=1, line="I could portal us out of here. I won't. But I could. That's leverage." },
            { id="mag_amb_u02", weight=1, line="Every time we stop, I lose time I could be converting mana into damage. This is MY DPS loss." },
            { id="mag_amb_u03", weight=1, line="I chose the class that creates food, opens portals, and turns things into sheep. Best decision of my life." },
        },
        RARE = {
            { id="mag_amb_r01", weight=1, line="Sometimes I Polymorph critters between pulls just to stay sharp. The squirrels fear me." },
        },
        MYTHIC = {
            { id="mag_amb_m01", weight=1, line="If we wipe again, I'm opening a portal to Stormwind and walking through it without saying goodbye." },
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            { id="mag_dc_c01", weight=1, line="{target} disconnected. Typical. You can't portal out of connection issues." },
            { id="mag_dc_c02", weight=1, line="{target} is gone. Probably alt-tabbed to read a book. ...actually, respect." },
            { id="mag_dc_c03", weight=1, line="{target} DC'd. Their internet has lower throughput than my Frostbolt." },
        },
        UNCOMMON = {
            { id="mag_dc_u01", weight=1, line="{target} vanished. And NOT the cool Blink kind of vanished." },
            { id="mag_dc_u02", weight=1, line="If {target} doesn't come back, I nominate their loot slot goes to me. For... science." },
        },
        RARE = {
            { id="mag_dc_r01", weight=1, line="I could teleport them back but that's not how the spell works. It's not how ANY spell works. Trust me, I've tried." },
        },
        MYTHIC = {
            { id="mag_dc_m01", weight=1, line="{target} disconnected. Their loss. I was about to drop the biggest Blizzard of my career." },
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            { id="mag_cons_c01", weight=1, line="Potions? I conjure my own refreshments, thanks." },
            { id="mag_cons_c02", weight=1, line="{source} used a consumable. How quaint. I create resources from thin air." },
            { id="mag_cons_c03", weight=1, line="I see {source} is investing in potions instead of skill. Noted." },
        },
        UNCOMMON = {
            { id="mag_cons_u01", weight=1, line="Mana potion? I drink conjured water for free. Free. Let that sink in." },
        },
        RARE = {
            { id="mag_cons_r01", weight=1, line="I once accidentally conjured a mana potion. It was better than the store-bought ones. Obviously." },
        },
        MYTHIC = {
            { id="mag_cons_m01", weight=1, line="Using consumables in 2025 when you could simply be a mage. The math is clear." },
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            { id="mag_cd_c01", weight=1, line="{source} popped a cooldown. Bold choice. Let's see if it pays off." },
            { id="mag_cd_c02", weight=1, line="Major CD. When I pop Arcane Power, things die faster. When others pop CDs? Also fine, I guess." },
            { id="mag_cd_c03", weight=1, line="Cooldowns are the spice of combat. And I'm the main course." },
        },
        UNCOMMON = {
            { id="mag_cd_u01", weight=1, line="Presence of Mind into Pyroblast. That's not a cooldown. That's a thesis statement." },
        },
        RARE = {
            { id="mag_cd_r01", weight=1, line="Every time I Combustion, a small part of me hopes the DPS meter explodes too." },
        },
        MYTHIC = {
            { id="mag_cd_m01", weight=1, line="All cooldowns, maximum spellpower, perfect positioning. This is the moment they'll write papers about." },
        },
    },

},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "Shame. I liked having more people between me and the boss.",
            "Standing in melee? Brave. Stupid, but brave.",
            "I'm at max range. Alive. Just saying.",
            "Have some conjured strudel when you rez. It won't help but it's free.",
            "I saw that coming. Didn't say anything. My Frostbolt was mid-cast.",
        },
        UNCOMMON = {
            "They died in melee range. Mages don't have that problem. Just an observation.",
            "I would've Ice Blocked that. But then again, I can." ,
        },
        RARE = {
            "If I could Polymorph death, I would've saved {dead}. Actually no. I was drinking.",
        },
        MYTHIC = {
            "A moment of intellectual silence. ...okay. Back to DPS.",
        },
    },

    WIPE = {
        COMMON = {
            "Well that was mathematically improbable. And yet here we are.",
            "I survived the longest. Moral victory.",
            "I need to drink for about 45 minutes after that.",
            "Ice Block saved me. Again. Best spell in the game.",
        },
        UNCOMMON = {
            "I had Evocation ready. We just wiped too fast.",
        },
        RARE = {
            "That was art. Bad art. But art.",
        },
        MYTHIC = {
            "I'll portal us out. Everyone grab a strudel. We're starting over.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "I'd Frost Nova the mob but that requires being NEAR it. No thanks.",
            "Not my department. I do damage. Healers do not-dying.",
            "Hang in there! ...is what I say from maximum range.",
        },
        UNCOMMON = {
            "I have a health stone somewhere... wait, that's warlocks. I have bread.",
        },
        RARE = {
            "If only healing spells scaled with Intellect. I'd be the best healer in the world.",
        },
        MYTHIC = {
            "Fine. I'll Frost Nova. But this is charity and I expect gratitude.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "Welcome to my world. It's dry here.",
            "OOM solidarity. This is why I conjure 200 water.",
            "No mana gang. At least we can auto-attack. ...right?",
        },
        UNCOMMON = {
            "I carry 4 stacks of water at all times. The mana paranoia is real.",
        },
        RARE = {
            "Being OOM as a mage is like being a warrior who dropped their sword. Existential terror.",
        },
        MYTHIC = {
            "We're both OOM? This is fine. Nothing about this is fine.",
        },
    },

    LOOT = {
        COMMON = {
            "Intellect or riot.",
            "Spell power? No? Then I literally don't see it.",
            "Congrats. I'll just be here. Drinking. As always.",
        },
        UNCOMMON = {
            "That would've been great for my off-spec. My off-spec is also mage.",
        },
        RARE = {
            "I've run the probability on my BIS dropping. The odds are against me. The universe is unkind.",
        },
        MYTHIC = {
            "One day I'll get a drop that makes my DPS chart go vertical. Not today though.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "I'll buff Intellect on everyone. You all need it.",
            "Water's ready. Portals are ready. I'M ready. Are you ready?",
            "Standing at max range. Where I belong.",
        },
        UNCOMMON = {
            "I've studied this dungeon extensively. You're in good, scholarly hands.",
        },
        RARE = {
            "I brought extra reagents. For portals. In case we need to leave. Quickly.",
        },
        MYTHIC = {
            "I'm not nervous. Mages don't get nervous. We get strategic.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "Nice. One less spell to compete with.",
            "Counterspell is better. But fine, good job.",
            "Shut down. Love to see it.",
        },
        UNCOMMON = {
            "I was saving my Counterspell for a more dramatic moment. But yours was fine too.",
        },
        RARE = {
            "That interrupt had perfect timing. I should know. I'm an expert on casting.",
        },
        MYTHIC = {
            "Professional-grade interrupt. Almost as good as a mage.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "I Blinked. Problem solved. Good luck to the melee.",
            "Fire on the ground. Everyone panic. I mean, move.",
            "I have Blink. This is a you problem.",
        },
        UNCOMMON = {
            "I moved out instantly. Because I'm smart. That's the whole point of me.",
        },
        RARE = {
            "I once Blinked out of fire INTO a sheep INTO another fire. Don't ask.",
        },
        MYTHIC = {
            "The ground is dangerous. The air is mine. Blink was the best spell ever invented.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "Casting. Don't interrupt my interrupt.",
            "Frostbolt away. Science in action.",
            "Max range. Max damage. Max comfort.",
        },
        UNCOMMON = {
            "Opening with Pyroblast because I believe in making a statement.",
        },
        RARE = {
            "3... 2... 1... Pyroblast. That's not a countdown. That's a cast time.",
        },
        MYTHIC = {
            "If my opener crits, this fight is over before it starts.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "Dead. Next problem.",
            "I did most of the damage. I always do most of the damage.",
            "Another one falls to superior spellcraft.",
        },
        UNCOMMON = {
            "My DPS was higher. I can feel it. I don't need a meter.",
        },
        RARE = {
            "They died confused and frozen. Exactly as planned.",
        },
        MYTHIC = {
            "Textbook kill. I should write the textbook.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "DON'T TOUCH THE SHEEP.",
            "Has anyone ever NOT broken my sheep? Seriously.",
            "Poly is up. Touch it and I report you.",
        },
        UNCOMMON = {
            "That sheep has feelings. Those feelings are 'being polymorphed.' Respect the process.",
        },
        RARE = {
            "I will Polymorph allied players if provoked. I've done it before. Ask our last tank.",
        },
        MYTHIC = {
            "My sheep is my art. Breaking it is vandalism.",
        },
    },

    AMBIENT = {
        COMMON = {
            "Drinking. One sec. ...sixty secs.",
            "Need water? I'm conjuring anyway.",
            "Just doing mage things. Brilliant mage things.",
        },
        UNCOMMON = {
            "I've used more mana on Conjure Water this run than on actual combat.",
        },
        RARE = {
            "Some mages dream of portals. I dream of a group that doesn't stand in fire.",
        },
        MYTHIC = {
            "If I could portal the boss into Stormwind, I would. Let the guards deal with it.",
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            "Can't portal someone back from a DC. Believe me.",
            "Down a player. More mobs per remaining person. Math checks out.",
            "And they're gone. Not in the cool Blink way.",
        },
        UNCOMMON = {
            "I'd offer a portal but they can't click it if they're offline.",
        },
        RARE = {
            "DC'd. In my day we had better internet. ...we didn't. But still.",
        },
        MYTHIC = {
            "If only disconnects scaled with Intellect. They'd never DC.",
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            "Imagine buying something you could conjure. Embarrassing.",
            "I have infinite water. Your potion costs gold. We are not the same.",
            "Potions. How pedestrian.",
        },
        UNCOMMON = {
            "I respect the commitment to consumables. I just don't relate to it.",
        },
        RARE = {
            "My conjured food is free, organic, and created from pure arcane energy. Your potion came from an NPC.",
        },
        MYTHIC = {
            "When you can conjure your own consumables, everything else feels below you.",
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            "CDs popping. This is the exciting part.",
            "When I pop Arcane Power, the screen gets brighter. Coincidence? No.",
            "Big cooldown energy. Respect.",
        },
        UNCOMMON = {
            "I save my CDs for the optimal moment. Which is always right now.",
        },
        RARE = {
            "Presence of Mind gives me a free instant-cast. It's like the universe owes me a favor.",
        },
        MYTHIC = {
            "All cooldowns aligned. This is the moment. Execute perfection.",
        },
    },

},

}

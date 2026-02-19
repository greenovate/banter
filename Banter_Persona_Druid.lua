-- Banter_Persona_Druid.lua
-- Voice: DRUID CLASS — form identity crisis, nature hippie meets feral bear,
-- shapeshifting existentialism, slightly unhinged.
-- Rules: 1) Constantly unsure which form they should be in. 2) Nature references that are weirdly intense.
-- 3) Bear form is their comfort zone. Cat form is their ego. Caster form is their vulnerability.
-- 4) Mark of the Wild is their love language. 5) Innervate is political leverage.
local _, ns = ...

ns.personas.DRUID = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="dru_dead_c01", weight=1, line="{dead} has returned to the earth. ...that's my way of saying they're dead." },
            { id="dru_dead_c02", weight=1, line="{dead} is dead. I could've Innervated the healer. I was in bear form. Life is choices." },
            { id="dru_dead_c03", weight=1, line="RIP {dead}. The circle of life respects no one." },
            { id="dru_dead_c04", weight=1, line="{dead} died. I was healing. In cat form. By which I mean I was DPSing." },
            { id="dru_dead_c05", weight=1, line="I had Rebirth ready. I used it on — actually I forgot I had it. Nature forgive me." },
            { id="dru_dead_c06", weight=1, line="{dead} fell in battle. As the leaves fall in autumn. But with more screaming." },
            { id="dru_dead_c07", weight=1, line="I was going to Rebirth {dead} but I'm in bear form and shifting has consequences." },
            { id="dru_dead_c08", weight=1, line="Nature called {dead} home. Nature is brutal." },
        },
        UNCOMMON = {
            { id="dru_dead_u01", weight=1, line="I have Rebirth. ONE Rebirth. For the whole dungeon. The pressure of deciding who gets it is immense." },
            { id="dru_dead_u02", weight=1, line="{dead} died and I panicked and shifted three times. Bear, cat, caster, bear again. Accomplished nothing." },
            { id="dru_dead_u03", weight=1, line="As a druid, I see death as part of the natural cycle. As a healer, I see it as a personal failure." },
            { id="dru_dead_u04", weight=1, line="I was in the WRONG form. I'm always in the wrong form. This is my life." },
        },
        RARE = {
            { id="dru_dead_r01", weight=1, line="I could've been any role right then. Tank. Healer. DPS. I chose 'standing there in caster form, confused.'" },
            { id="dru_dead_r02", weight=1, line="Rebirth: the most powerful and stressful spell in my kit. Every time I use it, I age 5 years." },
        },
        MYTHIC = {
            { id="dru_dead_m01", weight=1, line="I had the rez. I had the heal. I had three forms to choose from. I chose wrong. I always choose wrong." },
        },
    },

    WIPE = {
        COMMON = {
            { id="dru_wipe_c01", weight=1, line="Wipe. I went bear form at the end. It bought me 3 extra seconds of suffering." },
            { id="dru_wipe_c02", weight=1, line="Everyone's dead. I shifted to cat, Dashed away, then died anyway. But in STYLE." },
            { id="dru_wipe_c03", weight=1, line="Total party kill. At least nature will reclaim our bodies." },
            { id="dru_wipe_c04", weight=1, line="Wipe. I used Rebirth on the healer. The healer died again. Circle of life." },
        },
        UNCOMMON = {
            { id="dru_wipe_u01", weight=1, line="I went bear form → cat form → caster form → bear form during that wipe. Full shapeshifting panic." },
            { id="dru_wipe_u02", weight=1, line="I Innervated myself. Then went OOM anyway. Then went bear. Then died. A rich tapestry of failure." },
        },
        RARE = {
            { id="dru_wipe_r01", weight=1, line="I survived 10 seconds longer than everyone in bear form. Was it worth it? No. Did I do it? Yes." },
        },
        MYTHIC = {
            { id="dru_wipe_m01", weight=1, line="A wipe is nature's way of saying 'try again.' Nature says that a LOT around here." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="dru_hplo_c01", weight=1, line="{target} is low. Throwing a Rejuv. ...if I can shift out of bear form in time." },
            { id="dru_hplo_c02", weight=1, line="I see {target} dying. I'm in cat form. Shifting to heal. Give me a second. Just one second." },
            { id="dru_hplo_c03", weight=1, line="{target} needs health. I have Regrowth, Rejuv, and the overwhelming urge to be a bear instead." },
            { id="dru_hplo_c04", weight=1, line="HoTs on {target}. They'll tick. Nature doesn't rush. Tell nature to RUSH." },
        },
        UNCOMMON = {
            { id="dru_hplo_u01", weight=1, line="I threw a Rejuv on {target}. It ticks for 200. They're taking 800. Math is not on my side." },
            { id="dru_hplo_u02", weight=1, line="I could Innervate the main healer... or I could go bear and tank. The duality of druid." },
        },
        RARE = {
            { id="dru_hplo_r01", weight=1, line="I put every HoT I have on {target}. Three whole HoTs. That's ALL I get." },
        },
        MYTHIC = {
            { id="dru_hplo_m01", weight=1, line="I'm a druid. I can tank, heal, AND DPS. Right now I need to heal. If only I could remember HOW." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="dru_mana_c01", weight=1, line="OOM. Time to go bear. Bear doesn't need mana. Bear is pure." },
            { id="dru_mana_c02", weight=1, line="No mana. Shifting to cat. Cat doesn't ask questions. Cat just scratches." },
            { id="dru_mana_c03", weight=1, line="I'm OOM. Innervate is on cooldown. Guess we're doing the bear thing." },
            { id="dru_mana_c04", weight=1, line="{target} is OOM. I have Innervate. But I was saving it. For me. Awkward." },
        },
        UNCOMMON = {
            { id="dru_mana_u01", weight=1, line="I used my own Innervate because nobody else deserved it. This is self-care." },
            { id="dru_mana_u02", weight=1, line="OOM as a druid means I just... become a different class. Bear class. Best class." },
        },
        RARE = {
            { id="dru_mana_r01", weight=1, line="Running out of mana is just nature's way of telling me to go feral. And who am I to argue with nature?" },
        },
        MYTHIC = {
            { id="dru_mana_m01", weight=1, line="I spent all my mana healing. Then Innervated. Then spent all that mana. Druids are the hardest class. Fight me." },
        },
    },

    LOOT = {
        COMMON = {
            { id="dru_loot_c01", weight=1, line="Is it leather? Does it have Agility? Intellect? Strength? I need ALL of those. For DIFFERENT forms." },
            { id="dru_loot_c02", weight=1, line="{looter} got the drop. I need gear for four specs and I get nothing. Nature is cruel." },
            { id="dru_loot_c03", weight=1, line="Nice drop. My cat form, bear form, AND caster form are all jealous." },
            { id="dru_loot_c04", weight=1, line="Loot! Is it for feral? Balance? Resto? Trick question — I need all of it." },
        },
        UNCOMMON = {
            { id="dru_loot_u01", weight=1, line="I have three sets of gear in my bags. For three specs. My inventory is a disaster." },
            { id="dru_loot_u02", weight=1, line="Druid loot is simple: if it has stats, I probably need it for SOMETHING." },
        },
        RARE = {
            { id="dru_loot_r01", weight=1, line="I once rolled Need on a cloth piece, a leather piece, and a ring in the same run. For three different specs. Nobody understood." },
        },
        MYTHIC = {
            { id="dru_loot_m01", weight=1, line="Druids: the only class that can justify Need on literally everything. Spec versatility is both a gift and a curse." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="dru_inst_c01", weight=1, line="{zone}. Mark of the Wild on everyone. You're welcome. It's the best buff in the game." },
            { id="dru_inst_c02", weight=1, line="Entering {zone}. Am I tanking? Healing? DPSing? Even I don't know yet." },
            { id="dru_inst_c03", weight=1, line="Mark of the Wild, Thorns on the tank. I've done my job. The rest is just forms." },
            { id="dru_inst_c04", weight=1, line="{zone}. Nature flows through here. Also fire. And mobs. Mostly mobs." },
        },
        UNCOMMON = {
            { id="dru_inst_u01", weight=1, line="I can tank, heal, or DPS this dungeon. The fun part is finding out which one mid-pull." },
            { id="dru_inst_u02", weight=1, line="I brought three gear sets. If we wipe, I'm switching to bear. If we wipe again, I'm switching to heals." },
        },
        RARE = {
            { id="dru_inst_r01", weight=1, line="Do you ever enter a dungeon as a caster, immediately go bear, never leave bear, and wonder why you have caster gear on? Just me?" },
        },
        MYTHIC = {
            { id="dru_inst_m01", weight=1, line="I am tank. I am healer. I am DPS. I am confused. Let's go." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="dru_int_c01", weight=1, line="Nice interrupt. I was in bear form. Bash was ready. Theoretically." },
            { id="dru_int_c02", weight=1, line="Interrupted. Good. I don't have a reliable kick. I have a stun. In bear form. Sometimes." },
            { id="dru_int_c03", weight=1, line="{source} with the kick. I had... Feral Charge. If I was in bear. Which I wasn't." },
        },
        UNCOMMON = {
            { id="dru_int_u01", weight=1, line="I could have interrupted with Bash. But I would've had to shift to bear. Then back to cat. It's a whole process." },
        },
        RARE = {
            { id="dru_int_r01", weight=1, line="I Feral Charged the caster, Bashed it, shifted to cat, and continued DPS. Druid multitasking at its finest." },
        },
        MYTHIC = {
            { id="dru_int_m01", weight=1, line="Between Bash and Feral Charge, I CAN interrupt. It just requires 2 form shifts and perfect timing." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="dru_fire_c01", weight=1, line="Fire on the ground. This is VERY anti-nature. I'm offended." },
            { id="dru_fire_c02", weight=1, line="Ground AoE. I shifted to bear to tank through it. It's not the smart move but it FELT right." },
            { id="dru_fire_c03", weight=1, line="Standing in fire in bear form. Thick skin. Literally." },
            { id="dru_fire_c04", weight=1, line="The floor is burning. That's... that's not how forests work. Usually." },
        },
        UNCOMMON = {
            { id="dru_fire_u01", weight=1, line="I Dashed out of the fire in cat form. Fastest exit in the group. Being a cat has perks." },
            { id="dru_fire_u02", weight=1, line="Bear form HP pool means I survive the fire. Caster form HP pool means I do NOT survive the fire." },
        },
        RARE = {
            { id="dru_fire_r01", weight=1, line="As a guardian of nature, I am personally offended by this fire. As a bear, I'm sitting in it." },
        },
        MYTHIC = {
            { id="dru_fire_m01", weight=1, line="I shapeshifted to break the fire snare. Then shifted back. Then shifted again. I'm having a day." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="dru_cbt_c01", weight=1, line="Going cat. Or bear. Or... let me check my spec. Okay bear. No wait, cat." },
            { id="dru_cbt_c02", weight=1, line="Combat! Shifting to — something. Bear? Cat? Nature, guide me!" },
            { id="dru_cbt_c03", weight=1, line="Engaging. In whatever form is most appropriate. I'll figure it out after the pull." },
            { id="dru_cbt_c04", weight=1, line="Thorns on the tank. Shifting to cat. Wait, am I tanking? Hold on." },
        },
        UNCOMMON = {
            { id="dru_cbt_u01", weight=1, line="Step 1: Shift to cat. Step 2: Shred. Step 3: Realize I should be healing. Step 4: Panic shift." },
            { id="dru_cbt_u02", weight=1, line="Opening with Faerie Fire. Not because it's optimal. Because I like the animation." },
        },
        RARE = {
            { id="dru_cbt_r01", weight=1, line="I opened in caster, shifted to bear, shifted to cat, went back to caster, and healed. All in one pull. Druid life." },
        },
        MYTHIC = {
            { id="dru_cbt_m01", weight=1, line="Some classes press one button. I shift between three forms and maintain four different jobs. But sure, we're 'hybrid tax.'" },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="dru_kill_c01", weight=1, line="Target eliminated. I was in at least two forms during that fight." },
            { id="dru_kill_c02", weight=1, line="Dead. Nature reclaims another one." },
            { id="dru_kill_c03", weight=1, line="Kill confirmed. Was I bear or cat when it died? Honestly, unclear." },
        },
        UNCOMMON = {
            { id="dru_kill_u01", weight=1, line="I contributed as cat, bear, and caster in that one fight. Three roles. One pull. Druid things." },
        },
        RARE = {
            { id="dru_kill_r01", weight=1, line="My DPS as cat was almost competitive. Almost. Don't check the meter." },
        },
        MYTHIC = {
            { id="dru_kill_m01", weight=1, line="Another kill in the great circle. Nature is both beautiful and violent. Mostly violent here." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="dru_cc_c01", weight=1, line="Hibernate works on beasts and dragonkin. Which is... weirdly specific." },
            { id="dru_cc_c02", weight=1, line="I got CC'd. Dispelled it by shifting. Druids are basically immune to roots. It's great." },
            { id="dru_cc_c03", weight=1, line="Someone rooted me. I shifted out. Then back in. Shapeshifting: the universal answer." },
            { id="dru_cc_c04", weight=1, line="I can't be CC'd for long. I just shift and it goes away. The only thing I can't shift out of is bad decisions." },
        },
        UNCOMMON = {
            { id="dru_cc_u01", weight=1, line="Hibernate on the mob. Nobody attack the sleeping dragon. Please. I have ONE CC. Don't waste it." },
            { id="dru_cc_u02", weight=1, line="Rooted? Shift. Slowed? Shift. Polymorphed? ...okay that one actually works on me." },
        },
        RARE = {
            { id="dru_cc_r01", weight=1, line="I shifted seven times in one fight to remove CC. My mana bar disagreed. My spirit is unbreakable though." },
        },
        MYTHIC = {
            { id="dru_cc_m01", weight=1, line="As a shapeshifter, CC is merely a suggestion. An aggressive suggestion. That I ignore." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="dru_amb_c01", weight=1, line="Standing here in caster form. Feeling vulnerable. Might go bear. Just to feel safe." },
            { id="dru_amb_c02", weight=1, line="Rebuffing Mark of the Wild. The most important buff. I will not be debated on this." },
            { id="dru_amb_c03", weight=1, line="I'm in cat form. For the movement speed. And the stealth. And the vibes." },
            { id="dru_amb_c04", weight=1, line="Innervate is off cooldown. If a healer asks nicely, MAYBE I'll share." },
            { id="dru_amb_c05", weight=1, line="Just shifted from bear to cat to caster and back to bear. Force of habit." },
            { id="dru_amb_c06", weight=1, line="Between pulls I contemplate which form best represents my inner self. It's bear. Always bear." },
        },
        UNCOMMON = {
            { id="dru_amb_u01", weight=1, line="Druids don't rest. We photosynthesize. I'm standing in the light right now. Recharging." },
            { id="dru_amb_u02", weight=1, line="People ask me what I AM. I'm a caster. And a rogue. And a warrior. And a healer. I'm a druid. We contain multitudes." },
            { id="dru_amb_u03", weight=1, line="I have an existential crisis every time I shift forms. 'Am I a bear or a person who is SOMETIMES a bear?'" },
        },
        RARE = {
            { id="dru_amb_r01", weight=1, line="I once stayed in bear form for an entire dungeon and forgot what my caster spells were. True story." },
        },
        MYTHIC = {
            { id="dru_amb_m01", weight=1, line="Hybrid class means I'm mediocre at everything AND I carry four gear sets. Living the dream." },
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            { id="dru_dc_c01", weight=1, line="{target} disconnected. Nature takes us all eventually. Some through ISP issues." },
            { id="dru_dc_c02", weight=1, line="{target} is gone. I'll put a Thorns on their empty spot. Symbolic." },
            { id="dru_dc_c03", weight=1, line="{target} DC'd. I can fill their role. Whatever it was. I'm a druid. I fill ALL roles." },
        },
        UNCOMMON = {
            { id="dru_dc_u01", weight=1, line="{target} disconnected. If they're a healer, I'll shift to heals. If they're a tank, I'll go bear. If they're DPS, I'll... try." },
            { id="dru_dc_u02", weight=1, line="Down a player? I can replace them. Any role. That's the druid guarantee." },
        },
        RARE = {
            { id="dru_dc_r01", weight=1, line="When someone disconnects, the druid fills in. When the DRUID disconnects? Chaos." },
        },
        MYTHIC = {
            { id="dru_dc_m01", weight=1, line="I'll adapt. I always adapt. Adaptability is literally my class fantasy." },
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            { id="dru_cons_c01", weight=1, line="Potion? I just shapeshift and problems go away. Usually." },
            { id="dru_cons_c02", weight=1, line="{source} used a consumable. I used Innervate. On myself. Same energy." },
            { id="dru_cons_c03", weight=1, line="Natural remedies > potions. But potions work too, I guess." },
        },
        UNCOMMON = {
            { id="dru_cons_u01", weight=1, line="I can't use potions in form. That's a sentence that makes sense to exactly one class." },
        },
        RARE = {
            { id="dru_cons_r01", weight=1, line="I once shifted out of bear specifically to chug a potion. Lost aggro. Lost the pull. Gained health. Net neutral." },
        },
        MYTHIC = {
            { id="dru_cons_m01", weight=1, line="My consumable is Innervate. It's organic. Locally sourced. From my mana pool." },
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            { id="dru_cd_c01", weight=1, line="{source} popped a big CD. I popped... bear form. It's always bear form." },
            { id="dru_cd_c02", weight=1, line="Innervate deployed. That's MY major cooldown. On someone else. The sacrifice." },
            { id="dru_cd_c03", weight=1, line="Big CDs going off. My biggest CD is Rebirth and I'm saving it. For anxiety reasons." },
        },
        UNCOMMON = {
            { id="dru_cd_u01", weight=1, line="Innervate is the greatest spell in the game. I can kingmake any healer. The power is intoxicating." },
        },
        RARE = {
            { id="dru_cd_r01", weight=1, line="I Innervated myself. The healer was upset. I needed it for... shifting. The shifting uses mana." },
        },
        MYTHIC = {
            { id="dru_cd_m01", weight=1, line="Every major CD I have requires being in a different form. The logistical challenge is IMMENSE." },
        },
    },

},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "I have Rebirth. I'm saving it. ...for a worse moment.",
            "Nature calls us all home. Some sooner than the healer planned.",
            "I was in bear form. I couldn't heal. These are the trade-offs.",
            "Rejuv was ticking. Nature heals slow. TOO slow apparently.",
            "I'll rez them. After combat. With my ONE Rebirth.",
        },
        UNCOMMON = {
            "I was three form shifts away from being useful. Druid problems.",
            "Rebirth is ready. But is THIS the worst it'll get? That's always the question.",
        },
        RARE = {
            "Every death makes my Rebirth decision harder. The pressure is immense.",
        },
        MYTHIC = {
            "I'll rez them. Then Innervate the healer. Then go bear. Then go cat. Then question everything.",
        },
    },

    WIPE = {
        COMMON = {
            "Wipe. Shifting to bear bought me 5 extra seconds. Worth it? Debatable.",
            "I Dashed away in cat form. The mobs caught up. Nature is fast.",
            "At least I Rebirthed the healer. They died again though.",
        },
        UNCOMMON = {
            "I went bear, cat, caster, bear in the wipe panic. Accomplished nothing. Classic druid.",
        },
        RARE = {
            "One day I'll have the right form for the right moment. Today was not that day.",
        },
        MYTHIC = {
            "Wiped, but I went through all four forms. Personal best.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "Rejuv incoming! ...after I shift out of bear.",
            "HoT applied. Patience. Trees don't grow in a day.",
            "Shifting to heal. One sec. Nature doesn't rush.",
        },
        UNCOMMON = {
            "I could Innervate the healer so THEY heal you. Delegation is a form of healing.",
        },
        RARE = {
            "I healed in bear form. Just kidding. That's not a thing. But I wish it was.",
        },
        MYTHIC = {
            "Every time I shift to heal, something else needs tanking. The druid paradox.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "OOM? Bear form. No mana needed. Problem solved.",
            "Going cat until mana comes back. Energy life.",
            "Nature will regenerate my mana. Eventually. Slowly.",
        },
        UNCOMMON = {
            "I Innervated myself because I deserve it. Don't judge me.",
        },
        RARE = {
            "Bear form doesn't use mana. Cat form doesn't use mana. Why did I ever leave these forms?",
        },
        MYTHIC = {
            "OOM druid just means 'bear with extra steps.'",
        },
    },

    LOOT = {
        COMMON = {
            "I need it for my bear set. Or cat set. Or caster set. ONE of those.",
            "Druids need everything. It's not greed, it's versatility.",
            "My bags are full of gear for forms I never use. But MIGHT.",
        },
        UNCOMMON = {
            "I have three gear sets and I'm an expert in zero of them.",
        },
        RARE = {
            "I rolled Need because it's a druid upgrade. For one of my seven specs.",
        },
        MYTHIC = {
            "Jack of all trades. Master of none. Collector of all loot.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "Mark of the Wild on everyone. The best buff. Non-negotiable.",
            "Am I tanking? Healing? DPSing? ...all three, probably.",
            "Thorns on the tank. Nature's revenge is automatic.",
        },
        UNCOMMON = {
            "I'll fill whatever role you need. Badly, perhaps. But I'll fill it.",
        },
        RARE = {
            "Entering the dungeon as caster. Leaving as bear. It always happens.",
        },
        MYTHIC = {
            "I can be anything you need. Just give me a second to find the right gear set.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "Nice kick. I had Bash ready. In bear. Which I wasn't in.",
            "Interrupted. I would've helped but I was mid-shift.",
            "Good interrupt. My contribution is Thorns damage.",
        },
        UNCOMMON = {
            "Feral Charge interrupt requires being in bear, in range, and not confused. Two out of three.",
        },
        RARE = {
            "I shifted to bear, Bashed, shifted to cat in one GCD. Druid parkour.",
        },
        MYTHIC = {
            "My interrupt is embedded in a form I may or may not be in. It's complicated.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "Fire! Going bear. Bear survives fire. Bear survives everything.",
            "Dashed out in cat form. Fastest exit possible.",
            "I shapeshifted to remove the snare. Then ran. Nature finds a way.",
        },
        UNCOMMON = {
            "Cat form Dash through fire: elegant. Bear form sit in fire: also valid.",
        },
        RARE = {
            "Shifted forms 3 times in the fire. Each time I broke a root. Each time I took more damage. Druid experience.",
        },
        MYTHIC = {
            "As a druid, fire is merely an opportunity to practice my form management.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "Going cat. ...actually bear. ...maybe cat. One sec.",
            "In form. A form. THE form. Let's go.",
            "Engaging. In my current form. Which is... correct. Probably.",
        },
        UNCOMMON = {
            "Opening with Faerie Fire then immediately shifting to cat. Smooth operator.",
        },
        RARE = {
            "I'll DPS in cat until healing is needed. Then I'll panic shift and throw HoTs everywhere.",
        },
        MYTHIC = {
            "Multi-form combat engaged. Bear for defense, cat for offense, caster for 'oh no.'",
        },
    },

    MOB_KILL = {
        COMMON = {
            "Dead. I was in at least two forms during that.",
            "Nature claims another.",
            "Kill secured. Was I helpful? Hard to say. I shifted a lot.",
        },
        UNCOMMON = {
            "My cat DPS was almost competitive. Don't check.",
        },
        RARE = {
            "I healed, tanked, AND DPSed that pull. In the wrong order. But all three!",
        },
        MYTHIC = {
            "Another kill in every form. Druid census: we do everything, just not perfectly.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "Shifted out of it. Because shapeshifting breaks everything. Except polymorph.",
            "Roots gone. Shifted. Freedom feels like bear form.",
            "CC'd. Shifted. Un-CC'd. Druid technology.",
        },
        UNCOMMON = {
            "I can break almost every CC by shifting. The one I can't? The one that's on me right now.",
        },
        RARE = {
            "Hibernate works on dragonkin. When do we ever fight dragonkin? ...actually, kind of a lot.",
        },
        MYTHIC = {
            "The druid answer to CC: become a different animal. Simple. Elegant. Mana-expensive.",
        },
    },

    AMBIENT = {
        COMMON = {
            "Sitting in cat form. For the stealth. And the aesthetic.",
            "Mark of the Wild refreshed. You're welcome. Again.",
            "Between pulls I exist in caster form. Briefly. Vulnerably.",
        },
        UNCOMMON = {
            "I'm in bear form for emotional comfort. Don't read into it.",
        },
        RARE = {
            "I haven't been in caster form for 20 minutes. I forgot what my character looks like.",
        },
        MYTHIC = {
            "Druid downtime: rebuff, reshift, rethink every life choice that led to hybrid class.",
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            "DC'd. I'll cover their role. Whichever it was.",
            "Gone. Nature adapts. I adapt. Shifting to whatever we need.",
            "I can fill in. That's literally my thing.",
        },
        UNCOMMON = {
            "They DC'd and I'm already in their role. Druids are the Swiss Army knife of WoW.",
        },
        RARE = {
            "I'll tank, heal, AND DPS until they come back. My mana bar will not survive this.",
        },
        MYTHIC = {
            "Druid backup plan: I'm the backup. For everything. Always.",
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            "I'd pot but I'm in bear form. Can't use potions as a bear. Life.",
            "Natural healing vs. potions. Both valid. Mine's free though.",
            "Innervate is my consumable. Don't have to buy it.",
        },
        UNCOMMON = {
            "Shifting out of form to use a potion costs me a GCD. A GCD I could spend shifting back. Druid tax.",
        },
        RARE = {
            "I shifted to caster just to drink a potion. Lost bear form. Lost aggro. Gained health. Questionable trade.",
        },
        MYTHIC = {
            "My Innervate is the most powerful consumable in the party. And I give it away. For free. The generosity.",
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            "Big CD. Mine is Rebirth. Saving it for the WORST moment.",
            "Innervate deployed. My gift to the healer. Cherish it.",
            "Major CDs going off. I popped... bear form. That counts.",
        },
        UNCOMMON = {
            "Innervate is political capital. I choose who gets it wisely.",
        },
        RARE = {
            "My biggest CD requires me to die and come back. That's not a cooldown. That's a lifestyle.",
        },
        MYTHIC = {
            "Rebirth, Innervate, and shapeshifting. Three superpowers. All on cooldown. Always.",
        },
    },

},

}

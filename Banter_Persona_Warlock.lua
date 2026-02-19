-- Banter_Persona_Warlock.lua
-- Voice: WARLOCK CLASS — casually sinister, treats demons like annoying coworkers,
-- "this is fine" energy while everything is on fire (literally).
-- Rules: 1) Suspiciously calm about dark magic. 2) Demons are an HR problem.
-- 3) Life Tap is a lifestyle. 4) Secret superiority over mages. 5) Embraces the evil aesthetic.
local _, ns = ...

ns.personas.WARLOCK = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="wlk_dead_c01", weight=1, line="{dead} has perished. I'd Soulstone them but I already used mine. On myself. Obviously." },
            { id="wlk_dead_c02", weight=1, line="{dead} is dead. Tragic. Anyway, back to draining souls." },
            { id="wlk_dead_c03", weight=1, line="Another soul for the collection — oh wait, {dead} was on our team. Awkward." },
            { id="wlk_dead_c04", weight=1, line="{dead} died. I felt their life force leave their body. Perks of the class." },
            { id="wlk_dead_c05", weight=1, line="My Voidwalker has more health than {dead} had. Let that sink in." },
            { id="wlk_dead_c06", weight=1, line="I warned {dead} about standing there. I warned them with my eyes. While casting." },
            { id="wlk_dead_c07", weight=1, line="{dead} is gone. Another candle extinguished. ...sorry, I've been reading too much dark poetry." },
            { id="wlk_dead_c08", weight=1, line="I could have sacrificed my demon to save {dead}. But I like my demon more. No offense." },
        },
        UNCOMMON = {
            { id="wlk_dead_u01", weight=1, line="Death comes for everyone eventually. Except me. I have a Soulstone and zero shame." },
            { id="wlk_dead_u02", weight=1, line="My imp watched {dead} die and laughed. I apologize for... actually no, he's right." },
            { id="wlk_dead_u03", weight=1, line="I offered {dead} a Healthstone. They didn't use it. You can't help people who won't help themselves." },
            { id="wlk_dead_u04", weight=1, line="Fun fact: warlocks have cheated death more than any other class. Source: me. Just now." },
        },
        RARE = {
            { id="wlk_dead_r01", weight=1, line="In another timeline, {dead} was a warlock and they didn't die. Think about that." },
            { id="wlk_dead_r02", weight=1, line="My succubus suggested we raise {dead} as a minion. I said no. She pouted. It was awkward." },
        },
        MYTHIC = {
            { id="wlk_dead_m01", weight=1, line="Sometimes I wonder if my constant proximity to dark magic makes me numb to death. Then someone dies and yeah, confirmed." },
        },
    },

    WIPE = {
        COMMON = {
            { id="wlk_wipe_c01", weight=1, line="We wiped. My Soulstone activated. I am standing among your corpses. This is fine." },
            { id="wlk_wipe_c02", weight=1, line="Everyone's dead. My demon and I are having a moment." },
            { id="wlk_wipe_c03", weight=1, line="Wipe. My DoTs were still ticking though. So technically I was still doing damage as everyone died." },
            { id="wlk_wipe_c04", weight=1, line="The floor is covered in bodies and my demon is looting them. I need to have a talk with him." },
        },
        UNCOMMON = {
            { id="wlk_wipe_u01", weight=1, line="I survived via Soulstone. Do you all have Soulstones? No? Sounds like a class problem." },
            { id="wlk_wipe_u02", weight=1, line="The darkness took everyone. Except me. I'm on first-name terms with it." },
        },
        RARE = {
            { id="wlk_wipe_r01", weight=1, line="I'm willing to summon everyone back. For a small fee. In soul shards. Which I own. Economics." },
        },
        MYTHIC = {
            { id="wlk_wipe_m01", weight=1, line="Wipe. My demon said 'told you so.' My demon needs to learn boundaries." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="wlk_hplo_c01", weight=1, line="{target} is low. I have a Healthstone if anyone wants — oh wait, I ate it already." },
            { id="wlk_hplo_c02", weight=1, line="{target} is dying. This is concerning. Not as concerning as my soul shard supply, but still." },
            { id="wlk_hplo_c03", weight=1, line="Somebody heal {target}. I'd Drain Life them but that's more of an enemy thing." },
            { id="wlk_hplo_c04", weight=1, line="{target} is almost dead and I'm almost out of Healthstones. We're both having a day." },
        },
        UNCOMMON = {
            { id="wlk_hplo_u01", weight=1, line="I could sacrifice my Voidwalker to save {target}. Could. Won't. But could." },
            { id="wlk_hplo_u02", weight=1, line="My Drain Life heals ME, not {target}. I didn't design the system. I just exploit it." },
        },
        RARE = {
            { id="wlk_hplo_r01", weight=1, line="I spent all my health Life Tapping. Now {target} is also low. We match." },
        },
        MYTHIC = {
            { id="wlk_hplo_m01", weight=1, line="If {target} had sold their soul to the darkness they'd have a Healthstone. Just saying." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="wlk_mana_c01", weight=1, line="OOM? What's that? I don't know that word. *Life Taps aggressively*" },
            { id="wlk_mana_c02", weight=1, line="{target} has no mana. I have Life Tap. My blood IS mana." },
            { id="wlk_mana_c03", weight=1, line="Imagine running out of mana when you could just convert health into mana. Amateurs." },
            { id="wlk_mana_c04", weight=1, line="Zero mana? That's adorable. I haven't been OOM since level 20." },
        },
        UNCOMMON = {
            { id="wlk_mana_u01", weight=1, line="Life Tap. Life Tap. Life Tap. I am at full mana and half health. The healer hates me. Worth it." },
            { id="wlk_mana_u02", weight=1, line="My mana bar is full because I have no boundaries and a complete disregard for my own health." },
        },
        RARE = {
            { id="wlk_mana_r01", weight=1, line="The secret to never going OOM is simple: convert your health, your demon's health, everyone's health. Everything is mana if you're brave enough." },
        },
        MYTHIC = {
            { id="wlk_mana_m01", weight=1, line="Mana management is for other classes. I manage souls. And somehow that's more efficient." },
        },
    },

    LOOT = {
        COMMON = {
            { id="wlk_loot_c01", weight=1, line="Shadow damage? Spell power? Stamina? Speak to me, loot." },
            { id="wlk_loot_c02", weight=1, line="Congrats {looter}. I'd be excited but I save my emotions for soul harvesting." },
            { id="wlk_loot_c03", weight=1, line="Interesting. Not shadow damage though. Yawn." },
            { id="wlk_loot_c04", weight=1, line="I don't need loot. I need soul shards. The loot is secondary." },
        },
        UNCOMMON = {
            { id="wlk_loot_u01", weight=1, line="Every cloth drop goes to the mage. But WHO has a demon army? Not the mage." },
            { id="wlk_loot_u02", weight=1, line="{looter} got the drop. My Imp Phase Shifted in jealousy. Dramatic little thing." },
        },
        RARE = {
            { id="wlk_loot_r01", weight=1, line="I've been offered my BIS in exchange for a soul. I said yes. I had extras." },
        },
        MYTHIC = {
            { id="wlk_loot_m01", weight=1, line="If I could roll Need on souls, I'd win every time. Alas." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="wlk_inst_c01", weight=1, line="{zone}. How delightfully grim. I love what they've done with the corpses." },
            { id="wlk_inst_c02", weight=1, line="Welcome to {zone}. Healthstones are in the summoning circle. Help yourselves." },
            { id="wlk_inst_c03", weight=1, line="I've summoned everyone here. You're welcome. That cost me three soul shards. THREE." },
            { id="wlk_inst_c04", weight=1, line="Entering the dungeon. My demon is excited. I'm apprehensive. This is our dynamic." },
        },
        UNCOMMON = {
            { id="wlk_inst_u01", weight=1, line="Every dungeon has dark magic in it. I'm basically visiting family." },
            { id="wlk_inst_u02", weight=1, line="Soulstone is on me. Healthstones are out. If we wipe, I'll be the one standing. As usual." },
        },
        RARE = {
            { id="wlk_inst_r01", weight=1, line="My Voidwalker just looked at the dungeon entrance and sighed. Even he knows it's going to be a long night." },
        },
        MYTHIC = {
            { id="wlk_inst_m01", weight=1, line="I've pre-placed a Soulstone, distributed Healthstones, and sacrificed three critters for luck. Standard prep." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="wlk_int_c01", weight=1, line="Interrupted. If it was casting a shadow spell, I'm almost offended. That's MY thing." },
            { id="wlk_int_c02", weight=1, line="Nice kick. I would've feared it but that causes different problems." },
            { id="wlk_int_c03", weight=1, line="{source} interrupted the cast. Decisive. A little aggressive. I approve." },
        },
        UNCOMMON = {
            { id="wlk_int_u01", weight=1, line="I have Spell Lock. Via my Felhunter. We interrupt as a team. A dark, creepy team." },
        },
        RARE = {
            { id="wlk_int_r01", weight=1, line="My Felhunter did the interrupt. Good boy. He gets a soul snack later." },
        },
        MYTHIC = {
            { id="wlk_int_m01", weight=1, line="Between my Spell Lock and their kick, that mob cast nothing. Die silent. That's poetic." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="wlk_fire_c01", weight=1, line="Fire on the ground? Cute. I've been on fire since I specced Conflagrate." },
            { id="wlk_fire_c02", weight=1, line="Is this supposed to hurt? My Life Tap does more damage to me than this AoE." },
            { id="wlk_fire_c03", weight=1, line="Ground effects. The floor is expressing itself. I relate." },
            { id="wlk_fire_c04", weight=1, line="I'm standing in fire. My DoTs are also fire. It's thematic." },
        },
        UNCOMMON = {
            { id="wlk_fire_u01", weight=1, line="The boss is using fire. I also use fire. We should talk. Compare notes." },
            { id="wlk_fire_u02", weight=1, line="This damage tickles compared to Life Tapping at 20% health. I live dangerously." },
        },
        RARE = {
            { id="wlk_fire_r01", weight=1, line="I stood in the fire on purpose. The Drain Life proc was worth it. My healer disagrees." },
        },
        MYTHIC = {
            { id="wlk_fire_m01", weight=1, line="The fire burns. But so does my Immolate. We're kindred spirits. The fire and I." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="wlk_cbt_c01", weight=1, line="Applying DoTs. Like a curse artist. Which I literally am." },
            { id="wlk_cbt_c02", weight=1, line="Combat time. Death to the enemy. And also to my health bar, because Life Tap." },
            { id="wlk_cbt_c03", weight=1, line="Let the corruption begin. Literally. That's a spell name." },
            { id="wlk_cbt_c04", weight=1, line="Engaging target. My demon is already there. He has no concept of 'wait for tank.'" },
        },
        UNCOMMON = {
            { id="wlk_cbt_u01", weight=1, line="DoT, DoT, DoT, Shadowbolt. The four food groups of warlock DPS." },
            { id="wlk_cbt_u02", weight=1, line="I lead with Corruption because I believe in setting the mood." },
        },
        RARE = {
            { id="wlk_cbt_r01", weight=1, line="My ideal combat lasts exactly as long as my DoTs. If it goes longer, someone's underperforming. Not me." },
        },
        MYTHIC = {
            { id="wlk_cbt_m01", weight=1, line="I've pre-cursed everything in this room. Spiritually. Now let's make it official." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="wlk_kill_c01", weight=1, line="Dead. Another soul shard for the collection." },
            { id="wlk_kill_c02", weight=1, line="Target eliminated. My DoTs outlasted their health bar." },
            { id="wlk_kill_c03", weight=1, line="It died while my DoTs were still ticking. Efficient." },
        },
        UNCOMMON = {
            { id="wlk_kill_u01", weight=1, line="I don't kill things. I apply conditions and let nature take its extremely dark course." },
        },
        RARE = {
            { id="wlk_kill_r01", weight=1, line="My Imp cheered. I didn't teach him that. He's developing a personality. Concerning." },
        },
        MYTHIC = {
            { id="wlk_kill_m01", weight=1, line="Another soul harvested. I should start a loyalty program." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="wlk_cc_c01", weight=1, line="Fear is technically CC and I use it liberally. My party disagrees." },
            { id="wlk_cc_c02", weight=1, line="I got CC'd. ME. A person who communes with darkness." },
            { id="wlk_cc_c03", weight=1, line="Feared? I CAST Fear. I don't GET feared. This is an identity crisis." },
            { id="wlk_cc_c04", weight=1, line="Someone CC'd me. My demon continued DPS without me. He didn't even check if I was okay." },
        },
        UNCOMMON = {
            { id="wlk_cc_u01", weight=1, line="I Feared the mob into three more mobs. Technically that's more soul shards. You're welcome." },
            { id="wlk_cc_u02", weight=1, line="Being silenced as a warlock is like being told to stop being creepy. I can't. It's my whole thing." },
        },
        RARE = {
            { id="wlk_cc_r01", weight=1, line="My succubus can Seduce targets. It's awkward but effective. Like networking." },
        },
        MYTHIC = {
            { id="wlk_cc_m01", weight=1, line="You CC a warlock, you just give their DoTs time to tick. We win either way." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="wlk_amb_c01", weight=1, line="Just... standing here. With my demon. In comfortable sinister silence." },
            { id="wlk_amb_c02", weight=1, line="Farming shards. Always farming shards. The shard economy is brutal." },
            { id="wlk_amb_c03", weight=1, line="My demon is bored. A bored demon is a dangerous demon." },
            { id="wlk_amb_c04", weight=1, line="I have 14 soul shards and a Healthstone. I'm ready for anything." },
            { id="wlk_amb_c05", weight=1, line="Need a summon? Speak now or walk here like a peasant." },
            { id="wlk_amb_c06", weight=1, line="Does anyone else hear the whispers or is that just a warlock thing?" },
        },
        UNCOMMON = {
            { id="wlk_amb_u01", weight=1, line="I once had a deep conversation with my Voidwalker between pulls. He said nothing. We bonded." },
            { id="wlk_amb_u02", weight=1, line="People think warlocks are creepy. We're not creepy. We're ATMOSPHERIC." },
            { id="wlk_amb_u03", weight=1, line="My imp won't stop talking. I'm reconsidering the Voidwalker." },
        },
        RARE = {
            { id="wlk_amb_r01", weight=1, line="Between you and me, I didn't choose the dark arts. The questline sort of railroaded me. But I'm committed now." },
        },
        MYTHIC = {
            { id="wlk_amb_m01", weight=1, line="I maintain three demons, 20 soul shards, a Soulstone rotation, and Healthstone distribution. But sure, mages 'conjure bread.' Cute." },
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            { id="wlk_dc_c01", weight=1, line="{target} disconnected. I could summon them back. For a price." },
            { id="wlk_dc_c02", weight=1, line="{target} is gone. Nothing I can't fix with a summoning ritual and two volunteers." },
            { id="wlk_dc_c03", weight=1, line="{target} vanished. Not even my kind of vanishing. The boring kind." },
        },
        UNCOMMON = {
            { id="wlk_dc_u01", weight=1, line="{target} DC'd. Their router sold its soul to... nothing. Routers don't have souls. I checked." },
            { id="wlk_dc_u02", weight=1, line="If {target} comes back, I'll have a summon ready. If not, I'll have a shard ready. Either works." },
        },
        RARE = {
            { id="wlk_dc_r01", weight=1, line="{target} disconnected. My Felhunter tried to Devour Magic their internet. That's... not how it works, buddy." },
        },
        MYTHIC = {
            { id="wlk_dc_m01", weight=1, line="When I summon people, they come through a portal of darkness. When ISPs disconnect people, there's no drama at all. Waste." },
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            { id="wlk_cons_c01", weight=1, line="Potions. Quaint. My Healthstone is free and created from suffering." },
            { id="wlk_cons_c02", weight=1, line="{source} used a consumable. Meanwhile my Healthstone is just sitting here, being superior." },
            { id="wlk_cons_c03", weight=1, line="I see potions. I raise you: literal dark magic candy." },
        },
        UNCOMMON = {
            { id="wlk_cons_u01", weight=1, line="Healthstones are organic, free-range, and dark-magic-infused. Accept no substitutes." },
        },
        RARE = {
            { id="wlk_cons_r01", weight=1, line="I once handed a Healthstone to a stranger. They asked what was in it. I said 'don't ask.' They ate it anyway." },
        },
        MYTHIC = {
            { id="wlk_cons_m01", weight=1, line="My Healthstone saved more lives than most healers this run. I'm keeping score." },
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            { id="wlk_cd_c01", weight=1, line="{source} went all out. I respect a good dramatic escalation." },
            { id="wlk_cd_c02", weight=1, line="Big cooldowns. Big energy. Big shadow bolt incoming." },
            { id="wlk_cd_c03", weight=1, line="When I pop Death Coil, someone dies. That's the whole tooltip." },
        },
        UNCOMMON = {
            { id="wlk_cd_u01", weight=1, line="Infernal incoming. Stand back. Stand WAY back. I have limited control over this." },
        },
        RARE = {
            { id="wlk_cd_r01", weight=1, line="I once popped all my cooldowns at once. My demon panicked. I panicked. Everything died." },
        },
        MYTHIC = {
            { id="wlk_cd_m01", weight=1, line="Death Coil, Shadowburn, Soul Fire. The unholy trinity. Beautiful." },
        },
    },

},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "I had a Soulstone. ...I used it on myself though.",
            "Should've asked for a Healthstone. I had spares.",
            "{dead} is gone. Anyway, who wants a cookie?",
            "My DoTs killed the thing that killed them. Small comfort. Very small.",
            "Death is just a phase. Like my demon said. He knows about phases.",
        },
        UNCOMMON = {
            "I was busy Life Tapping. My health was more important. No judgment.",
            "My imp says hi. From the afterlife. ...wait, that's {dead}'s new address.",
        },
        RARE = {
            "If {dead} had a demon, the demon would've tanked that. Just putting it out there.",
        },
        MYTHIC = {
            "I felt their soul leave. It was warm. And vaguely lemon-scented. Weird.",
        },
    },

    WIPE = {
        COMMON = {
            "Soulstone saved me. The rest of you need better planning.",
            "My DoTs outlasted the wipe. I'm proud of them.",
            "Everyone's dead. Except me. This feels right somehow.",
        },
        UNCOMMON = {
            "Wipe. I'm going to Life Tap back to full mana while standing on your bodies. Nothing personal.",
        },
        RARE = {
            "I'm alive, you're all dead, and my demon is judging everyone. Standard Tuesday.",
        },
        MYTHIC = {
            "I've seen darker days. Literally. I summon darkness for a living. But this was close.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "Healthstone? Anyone? I've been offering them all night.",
            "My Drain Life works on enemies only. Unfortunately.",
            "Low health is a lifestyle choice for warlocks. For you? Concerning.",
        },
        UNCOMMON = {
            "I'd sacrifice my demon for you but I just resummoned him. He's having a day.",
        },
        RARE = {
            "I have a cookie. Eat it. Don't ask questions. Trust the darkness.",
        },
        MYTHIC = {
            "Dark magic can't heal allies. Otherwise I'd be the best healer. AND the most terrifying.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "OOM? Could never be me. *Life Taps*",
            "Just stab your own health pool for mana. Oh wait, that's MY thing.",
            "I convert health to mana. It's called innovation.",
        },
        UNCOMMON = {
            "Life Tap is basically a cheat code. I'm surprised it's still in the game.",
        },
        RARE = {
            "My healer asked me to stop Life Tapping. I Life Tapped while making eye contact.",
        },
        MYTHIC = {
            "Mana is infinite when you have no self-preservation instinct.",
        },
    },

    LOOT = {
        COMMON = {
            "I don't need loot. I need souls. Can the boss drop souls?",
            "Shadow damage or bust.",
            "Nice drop. My Imp cried.",
        },
        UNCOMMON = {
            "If it doesn't make my DoTs hit harder, it's dead to me. Like everything else.",
        },
        RARE = {
            "I once got a drop that increased my shadow damage by 2%. Named it. Gave it a backstory.",
        },
        MYTHIC = {
            "My BIS is out there. In the void. Where all good things go.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "Healthstones for everyone. Take one or don't. Your funeral. Literally.",
            "I'll summon stragglers. For the low price of two people clicking my portal.",
            "Soulstone is on the healer. Probably.",
        },
        UNCOMMON = {
            "I feel dark energy in here. That's either the boss or my own aura. Hard to tell.",
        },
        RARE = {
            "Every dungeon I enter feels like homecoming. That's either comforting or concerning.",
        },
        MYTHIC = {
            "Demons ready. Shards stocked. If we wipe, it's not my fault. Contractually.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "My Felhunter could've done that. Probably.",
            "Silenced. Beautiful. Dark, but beautiful.",
            "Good. I hate when enemies cast. Only I should cast.",
        },
        UNCOMMON = {
            "Spell Lock was ready. But sure, you handle it.",
        },
        RARE = {
            "Clean interrupt. My demon nodded approvingly. He does that.",
        },
        MYTHIC = {
            "Between your kicks and my Spell Lock, this mob has no voice. Poetic justice.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "Fire on the ground. Whatever. I Life Tap through worse.",
            "This floor damage? I've done worse to myself for mana.",
            "Oh no, environmental damage. Anyway. *casts*",
        },
        UNCOMMON = {
            "The boss puts fire on the ground. I put Corruption on the boss. Fair trade.",
        },
        RARE = {
            "My health bar fluctuates so much from Life Tap that I genuinely can't tell if this fire is hurting me.",
        },
        MYTHIC = {
            "Ground fire is just ambiance. I'm a warlock. I'm used to everything being vaguely on fire.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "DoTs loaded. Fire at will. Fire IS my will.",
            "Engaging. My Imp is already complaining.",
            "Corruption, Agony, Immolate. Breakfast, lunch, dinner.",
        },
        UNCOMMON = {
            "I don't burst. I corrode. Slowly. Deliberately. Sinisterly.",
        },
        RARE = {
            "My demon pulled before the tank. ...look, I said I'd summon him. I didn't say I'd control him.",
        },
        MYTHIC = {
            "Every fight begins with Corruption. The spell and the mood.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "Soul collected. Moving on.",
            "Another shard for the pile.",
            "Dead. My DoTs got the killing blow. Probably.",
        },
        UNCOMMON = {
            "It died slowly to my DoTs. As intended. Patience is a dark art.",
        },
        RARE = {
            "My Imp danced on the corpse. I didn't teach him that. Should I be worried?",
        },
        MYTHIC = {
            "Another soul. For the greater... well, for MY greater good.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "Fear was applied. Mob ran. That's working as intended... mostly.",
            "I CC'd it. Via Fear. It ran into more mobs. Technically that's CC for all of us.",
            "Feared and confused. Like my party.",
        },
        UNCOMMON = {
            "My succubus Seduced it. Don't make it weird.",
        },
        RARE = {
            "I got CC'd. My demon watched. He did nothing. We're going to have a long talk later.",
        },
        MYTHIC = {
            "Being CC'd as a warlock is ironic. I invented being annoying. You can't out-annoy me.",
        },
    },

    AMBIENT = {
        COMMON = {
            "Farming shards. The eternal grind.",
            "My demon and I are bonding. Through silence. And darkness.",
            "Need a summon? You know who to ask.",
        },
        UNCOMMON = {
            "I'm not AFK. I'm consulting with my demon. It's a management thing.",
        },
        RARE = {
            "Some days I wonder if I chose the right path. Then I summon an Infernal and think 'yeah, this is cool.'",
        },
        MYTHIC = {
            "I'm the Swiss Army knife of dungeon prep. Stones, cookies, summons, and a vague sense of dread.",
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            "DC'd. I'll prep a summon. It's what I do.",
            "Gone. Poof. Less dramatic than my portals.",
            "I can summon them back. If two of you click the stone. Please.",
        },
        UNCOMMON = {
            "Their connection died. Just like everything else around me.",
        },
        RARE = {
            "I tried to summon them through the void. Turns out that's not how internet works.",
        },
        MYTHIC = {
            "They'll be back. And when they are, my summoning stone will be ready. Because I'm always ready.",
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            "Health pot? I have a Healthstone. It's better. Fight me.",
            "Consumables are for classes without free self-healing. So... not me.",
            "Every potion costs gold. Every Healthstone costs a soul. Different economies.",
        },
        UNCOMMON = {
            "My Healthstone is artisanal. Hand-crafted from genuine soul essence.",
        },
        RARE = {
            "I gave away so many Healthstones I should have a loyalty card program.",
        },
        MYTHIC = {
            "Healthstone economy: I produce, you consume, everyone lives. Mostly.",
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            "Big CDs going off. Love the energy. Dark energy, specifically.",
            "When I pop cooldowns, things don't just die. They suffer first.",
            "Major CD. Mine is Death Coil. It does what it sounds like.",
        },
        UNCOMMON = {
            "I save Infernal for emergencies. And flex moments. They're the same thing.",
        },
        RARE = {
            "All my cooldowns popped. My demon felt the power surge. He flinched.",
        },
        MYTHIC = {
            "Full cooldowns. Maximum DoTs. This is peak dark magic performance.",
        },
    },

},

}

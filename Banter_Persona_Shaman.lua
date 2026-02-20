-- Banter_Persona_Shaman.lua
-- Voice: SHAMAN CLASS — talks to elements like dysfunctional roommates,
-- totem placement is an art form, ankh is a get-out-of-death-free card,
-- weather commentary, slightly chaotic energy.
-- Rules: 1) Elements have personalities and opinions. 2) Totems are children.
-- 3) Ankh is cheating death and being smug about it. 4) Enhancement is punching with lightning.
-- 5) Chain Heal is the greatest spell ever designed.
local _, ns = ...

ns.personas.SHAMAN = {

---------------------------------------------------------------------------
-- STATEMENTS
---------------------------------------------------------------------------
statements = {

    PLAYER_DEAD = {
        COMMON = {
            { id="sha_dead_c01", weight=1, line="{dead} died. I have an Ankh. But that's for ME. Personal use only." },
            { id="sha_dead_c02", weight=1, line="{dead} fell in battle. The elements mourn. Wind is being dramatic about it." },
            { id="sha_dead_c03", weight=1, line="RIP {dead}. I asked the earth to protect them. Earth said no." },
            { id="sha_dead_c04", weight=1, line="{dead} is dead. I can't rez in combat. I can reincarnate MYSELF. But that's different." },
            { id="sha_dead_c05", weight=1, line="{dead} down. Chain Heal can't heal the dead. I've tried." },
            { id="sha_dead_c06", weight=1, line="The elements weep for {dead}. Specifically the water element. Because that's what water does." },
            { id="sha_dead_c07", weight=1, line="{dead} has fallen. I dropped a Healing Stream Totem. It tried its best." },
            { id="sha_dead_c08", weight=1, line="I can talk to the dead. It's called Ancestral Spirit. After combat. Way after." },
        },
        UNCOMMON = {
            { id="sha_dead_u01", weight=1, line="I have Reincarnation. I cheat death once an hour. It's not sharing. It's self-care." },
            { id="sha_dead_u02", weight=1, line="My totems are crying. Mana Spring is leaking. Tremor is shaking. It's a mess." },
            { id="sha_dead_u03", weight=1, line="The wind whispered a warning. {dead} didn't hear it. Wind whispers. That's the problem." },
            { id="sha_dead_u04", weight=1, line="Chain Heal bounced to everyone BUT {dead}. The spell has favorites." },
        },
        RARE = {
            { id="sha_dead_r01", weight=1, line="I asked Fire for help. Fire said 'I only do damage.' Earth said 'not my problem.' Water tried. Air just blew away." },
            { id="sha_dead_r02", weight=1, line="Reincarnation: the one ability that makes dying a minor inconvenience. For me. Only me." },
        },
        MYTHIC = {
            { id="sha_dead_m01", weight=1, line="I commune with four elements and NONE of them could keep {dead} alive. What am I even paying them for?" },
        },
    },

    WIPE = {
        COMMON = {
            { id="sha_wipe_c01", weight=1, line="Wipe. But I have Reincarnation. So I'll just... pop up. Like nothing happened." },
            { id="sha_wipe_c02", weight=1, line="Everyone's dead. I died too. Then I came back. Ankh MVP." },
            { id="sha_wipe_c03", weight=1, line="Total wipe. My totems are still standing though. Brave little guys." },
            { id="sha_wipe_c04", weight=1, line="Wipe. I chain healed as fast as I could. Every bounce was hope. Every bounce was futility." },
        },
        UNCOMMON = {
            { id="sha_wipe_u01", weight=1, line="I Reincarnated. Stood up. Looked around at 4 corpses. Back to wiping. Alone this time." },
            { id="sha_wipe_u02", weight=1, line="Used Ankh. Rezzed. Immediately pulled aggro on the remaining mobs. Died again. Net zero." },
        },
        RARE = {
            { id="sha_wipe_r01", weight=1, line="Reincarnated into a wipe is peak shaman. You cheat death just to watch everyone else stay dead." },
        },
        MYTHIC = {
            { id="sha_wipe_m01", weight=1, line="I have an Ankh. I can self-rez. I came back. Looked around. Said 'nope.' Sat back down." },
        },
    },

    HEALTH_LOW = {
        COMMON = {
            { id="sha_hplo_c01", weight=1, line="{target} is low. Chain Heal incoming — and it bounces! It's the best spell in the game." },
            { id="sha_hplo_c02", weight=1, line="Dropping a Healing Stream Totem. It'll trickle health. Like a sad little fountain." },
            { id="sha_hplo_c03", weight=1, line="{target} needs health. Healing Wave casting. Water element, do your thing." },
            { id="sha_hplo_c04", weight=1, line="Chain Heal! Watch it bounce. Three targets. Beautiful. Efficient. Art." },
        },
        UNCOMMON = {
            { id="sha_hplo_u01", weight=1, line="Chain Heal: the only spell that heals three people and makes me feel like a genius every time." },
            { id="sha_hplo_u02", weight=1, line="Healing Stream Totem: it heals. Slowly. On a pulse. From a stick in the ground. Technology." },
        },
        RARE = {
            { id="sha_hplo_r01", weight=1, line="I Chain Healed and all three bounces hit people who needed it. Statistically improbable. Emotionally incredible." },
        },
        MYTHIC = {
            { id="sha_hplo_m01", weight=1, line="Shaman healing: one big slow heal, one bouncy miracle, and a totem that tries its hardest." },
        },
    },

    MANA_ZERO = {
        COMMON = {
            { id="sha_mana_c01", weight=1, line="OOM. Mana Spring Totem is down. It's helping. Barely." },
            { id="sha_mana_c02", weight=1, line="No mana. Mana Tide is on cooldown. The water element is exhausted." },
            { id="sha_mana_c03", weight=1, line="OOM. Time to auto-attack with my two-hand... uh, I mean totem. Wait." },
            { id="sha_mana_c04", weight=1, line="{target} is OOM too. We're all dry. Water element is on vacation." },
        },
        UNCOMMON = {
            { id="sha_mana_u01", weight=1, line="I asked the water element for more mana. It said I've used my allocation for this fight." },
            { id="sha_mana_u02", weight=1, line="Mana Spring Totem: the aquifer that runs dry when you need it most." },
        },
        RARE = {
            { id="sha_mana_r01", weight=1, line="I popped Mana Tide. Everyone got mana. I felt like a hero. For 12 seconds." },
        },
        MYTHIC = {
            { id="sha_mana_m01", weight=1, line="Four elements at my command and NONE of them generate mana fast enough." },
        },
    },

    LOOT = {
        COMMON = {
            { id="sha_loot_c01", weight=1, line="Is that mail with Intellect? Or Agility? I need BOTH. For different specs." },
            { id="sha_loot_c02", weight=1, line="{looter} got loot. The elements bestow. Sometimes they bestow on the WRONG person." },
            { id="sha_loot_c03", weight=1, line="Nice drop. I need mail with spell power. Or attack power. Shaman gearing is chaos." },
            { id="sha_loot_c04", weight=1, line="Loot! My enhancement set and my resto set are fighting over bag space." },
        },
        UNCOMMON = {
            { id="sha_loot_u01", weight=1, line="I rolled Need. For enhancement. Or elemental. Or resto. One of those. All valid." },
            { id="sha_loot_u02", weight=1, line="Mail armor: the no-man's land between leather and plate. Hunters and shamans fighting over scraps." },
        },
        RARE = {
            { id="sha_loot_r01", weight=1, line="I need a caster weapon, a melee weapon, and a shield. My bank is a armory." },
        },
        MYTHIC = {
            { id="sha_loot_m01", weight=1, line="Shamans share loot with hunters. Mail users. Of which there are two classes. Competition is fierce." },
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            { id="sha_inst_c01", weight=1, line="{zone}. Dropping totems. All four. It's a process. Give me a moment." },
            { id="sha_inst_c02", weight=1, line="Entering {zone}. Let me set up my totems. Earth. Fire. Water. Air. My four employees." },
            { id="sha_inst_c03", weight=1, line="Totems planted. They have a 20-yard range. Stand near my sticks, people." },
            { id="sha_inst_c04", weight=1, line="{zone}. The elements are interested. Fire is excited. Water is cautious. Earth is indifferent. Air doesn't care." },
        },
        UNCOMMON = {
            { id="sha_inst_u01", weight=1, line="I drop four totems every pull. FOUR. Then we move and I drop four MORE. This is my life." },
            { id="sha_inst_u02", weight=1, line="Totem range is 20 yards. Everyone spread 30 yards apart. Every time. I'm screaming internally." },
        },
        RARE = {
            { id="sha_inst_r01", weight=1, line="I have 20 totems and 4 slots. The optimization game is REAL. Nobody appreciates totem logistics." },
        },
        MYTHIC = {
            { id="sha_inst_m01", weight=1, line="Shamans don't enter dungeons. We move our totem collection from room to room. With combat in between." },
        },
    },

    INTERRUPT = {
        COMMON = {
            { id="sha_int_c01", weight=1, line="Earth Shock interrupt! Shamans have the best interrupt in the game. Instant. No cooldown drama." },
            { id="sha_int_c02", weight=1, line="Kicked it with Earth Shock. Wind element wanted to do it but earth called dibs." },
            { id="sha_int_c03", weight=1, line="{source} got the interrupt. I had Earth Shock ready. Quick draw shaman." },
        },
        UNCOMMON = {
            { id="sha_int_u01", weight=1, line="Earth Shock: my answer to casting. Also my answer to everything. Earth doesn't negotiate." },
        },
        RARE = {
            { id="sha_int_r01", weight=1, line="I interrupted with Earth Shock, then followed with Frost Shock. Elements one-two punch." },
        },
        MYTHIC = {
            { id="sha_int_m01", weight=1, line="Some classes have kick cooldowns. I have Earth Shock. Available whenever. The elements are efficient." },
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            { id="sha_fire_c01", weight=1, line="Fire on the ground! Fire is MY element. I should be immune. I'm not. That seems unfair." },
            { id="sha_fire_c02", weight=1, line="AoE damage. My totems are in it. They don't care. They're wood. And magic." },
            { id="sha_fire_c03", weight=1, line="Ground effect. I dropped a Healing Stream in it. For the totem's sake. And mine." },
            { id="sha_fire_c04", weight=1, line="Fire everywhere. I COMMAND fire. This fire doesn't listen. Rude." },
        },
        UNCOMMON = {
            { id="sha_fire_u01", weight=1, line="I'm standing in fire. I, a shaman, who controls fire. The irony is not lost on me." },
            { id="sha_fire_u02", weight=1, line="Grounding Totem absorbed one tick. ONE. Then it died. Brave sacrifice." },
        },
        RARE = {
            { id="sha_fire_r01", weight=1, line="I asked the fire to stop. It didn't. Apparently boss fire outranks shaman fire." },
        },
        MYTHIC = {
            { id="sha_fire_m01", weight=1, line="Master of elements. Standing in fire. Dying. The elements are laughing at me." },
        },
    },

    COMBAT_START = {
        COMMON = {
            { id="sha_cbt_c01", weight=1, line="Totems down! All four! Fighting alongside my stick army." },
            { id="sha_cbt_c02", weight=1, line="Combat! Lightning Bolt! ...it's a long cast. The mob is already here." },
            { id="sha_cbt_c03", weight=1, line="Pulling with Lightning Bolt and hoping the tank gets aggro before it reaches me." },
            { id="sha_cbt_c04", weight=1, line="Totems deployed. Elements engaged. Chain Lightning ready. Let's make weather." },
        },
        UNCOMMON = {
            { id="sha_cbt_u01", weight=1, line="Enhancement opening: Stormstrike, then hit things while lightning shoots out. It's therapeutic." },
            { id="sha_cbt_u02", weight=1, line="Dropped four totems. Repositioned two. Re-dropped one. Combat started 10 seconds ago and I'm still setting up." },
        },
        RARE = {
            { id="sha_cbt_r01", weight=1, line="I hit things with a mace and lightning comes out. Nobody explains WHY this works. It just does." },
        },
        MYTHIC = {
            { id="sha_cbt_m01", weight=1, line="Every pull I set up four totems. Every pull they get out-ranged. The dance of the shaman." },
        },
    },

    MOB_KILL = {
        COMMON = {
            { id="sha_kill_c01", weight=1, line="Dead. The elements are satisfied. Earth literally doesn't care though." },
            { id="sha_kill_c02", weight=1, line="Target eliminated. Lightning style." },
            { id="sha_kill_c03", weight=1, line="Kill confirmed. My totems helped. They always help. Good sticks." },
        },
        UNCOMMON = {
            { id="sha_kill_u01", weight=1, line="Chain Lightning hit three things. My DPS looked amazing for one global cooldown." },
        },
        RARE = {
            { id="sha_kill_r01", weight=1, line="Windfury procced three times in a row. The mob didn't stand a chance. Wind goes BRRRR." },
        },
        MYTHIC = {
            { id="sha_kill_m01", weight=1, line="I employed all four elements to kill one mob. Overkill? Maybe. Satisfying? Absolutely." },
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            { id="sha_cc_c01", weight=1, line="Frost Shock! Slowed. That's my CC. A slow. It's not glamorous." },
            { id="sha_cc_c02", weight=1, line="Tremor Totem pulsing. Fear is NOT an option near my sticks." },
            { id="sha_cc_c03", weight=1, line="Grounding Totem ate the spell. Good totem. Brave totem. Dead totem." },
            { id="sha_cc_c04", weight=1, line="CC'd! I dropped Tremor. Tremor pulses. Tremor FREES." },
        },
        UNCOMMON = {
            { id="sha_cc_u01", weight=1, line="Earthbind Totem: the 'nobody runs away' stick. Useful. Underappreciated." },
            { id="sha_cc_u02", weight=1, line="Grounding Totem absorbed that spell. It's like a tiny elemental bodyguard." },
        },
        RARE = {
            { id="sha_cc_r01", weight=1, line="Tremor Totem pulsed at the exact right moment. The timing was perfect. Finally, a COMPETENT element." },
        },
        MYTHIC = {
            { id="sha_cc_m01", weight=1, line="My CC is placing the right totem before the CC happens. Proactive, not reactive. Big brain shaman." },
        },
    },

    AMBIENT = {
        COMMON = {
            { id="sha_amb_c01", weight=1, line="Repositioning totems. They're 20 yards from everyone. As usual." },
            { id="sha_amb_c02", weight=1, line="Just communing with the elements. Earth is bored. Fire wants to burn something. Water is chill. Air is gone." },
            { id="sha_amb_c03", weight=1, line="My ankh is ready. Just in case. Always just in case." },
            { id="sha_amb_c04", weight=1, line="Four totems. Four elements. Four sticks in the ground. Maximum effort." },
            { id="sha_amb_c05", weight=1, line="Checking the weather. By feeling the elements. Partly cloudy. Lightning later." },
            { id="sha_amb_c06", weight=1, line="Mana Spring is ticking. Healing Stream is ticking. My totems work harder than I do." },
        },
        UNCOMMON = {
            { id="sha_amb_u01", weight=1, line="People walk past my totems. Don't stand in totem range? Don't get totem benefits. Simple." },
            { id="sha_amb_u02", weight=1, line="I asked the air element for guidance. It blew in my face. Elements have a sense of humor." },
            { id="sha_amb_u03", weight=1, line="Totems are basically my pets. Except they don't move. Or think. Or survive." },
        },
        RARE = {
            { id="sha_amb_r01", weight=1, line="I have more totems than bag space. I bring sticks to every fight. I'm the stick class." },
        },
        MYTHIC = {
            { id="sha_amb_m01", weight=1, line="Shaman downtime: pick up totems, put down totems, argue with elements, repeat." },
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            { id="sha_dc_c01", weight=1, line="{target} disconnected. The wind carried them away. Specifically, their internet wind." },
            { id="sha_dc_c02", weight=1, line="{target} is gone. I'll leave a totem where they stood. In memoriam." },
            { id="sha_dc_c03", weight=1, line="{target} DC'd. The elements sense their absence. Earth felt the footsteps stop." },
        },
        UNCOMMON = {
            { id="sha_dc_u01", weight=1, line="{target} disconnected. I can't reincarnate THEM. Only myself. The ankh is selfish." },
            { id="sha_dc_u02", weight=1, line="Down a player. My totems will pick up the slack. They always do." },
        },
        RARE = {
            { id="sha_dc_r01", weight=1, line="I put a Healing Stream totem where they DC'd. Just in case they come back hurt." },
        },
        MYTHIC = {
            { id="sha_dc_m01", weight=1, line="The elements don't disconnect. They're always on. I aspire to elemental uptime." },
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            { id="sha_cons_c01", weight=1, line="{source} used a consumable. I dropped a Mana Spring Totem. Same energy." },
            { id="sha_cons_c02", weight=1, line="Potion? My totems ARE my consumables. They regenerate. From sticks." },
            { id="sha_cons_c03", weight=1, line="Nice pot. I have Mana Tide. Once every 5 minutes. It's basically a potion. A shared potion." },
        },
        UNCOMMON = {
            { id="sha_cons_u01", weight=1, line="I don't consume. I commune. With elements. Who provide. Eventually." },
        },
        RARE = {
            { id="sha_cons_r01", weight=1, line="I popped Mana Tide. Everyone got mana. Nobody thanked the totem. They never thank the totem." },
        },
        MYTHIC = {
            { id="sha_cons_m01", weight=1, line="My consumables are called totems. I drop them. They work. For 20 yards. Then you move. And they don't." },
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            { id="sha_cd_c01", weight=1, line="{source} popped a big CD. I'm saving Mana Tide. For when things get REALLY dry." },
            { id="sha_cd_c02", weight=1, line="Big CDs going off. Mine is Reincarnation. It requires dying first. Unique activation condition." },
            { id="sha_cd_c03", weight=1, line="Nature's Swiftness ready. One instant heal. The pressure of choosing when is enormous." },
        },
        UNCOMMON = {
            { id="sha_cd_u01", weight=1, line="Mana Tide Totem: it gives mana to everyone. I'm the party's gas station. You're welcome." },
        },
        RARE = {
            { id="sha_cd_r01", weight=1, line="Nature's Swiftness + Healing Wave = one massive instant heal. My one moment of glory per fight." },
        },
        MYTHIC = {
            { id="sha_cd_m01", weight=1, line="My biggest cooldown requires me to die first. Shamans: the only class with a death-activated ability." },
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            { id="sha_fp_c01", weight=1, line="The wind is carrying this bird. The wind is also screaming in my ear. Mixed signals." },
            { id="sha_fp_c02", weight=1, line="I asked the Air elemental to make us go faster. Air said 'no.' Classic Air." },
            { id="sha_fp_c03", weight=1, line="Earth is down there. Water is... somewhere. Fire is irrelevant. Air is being smug." },
            { id="sha_fp_c04", weight=1, line="Can't place totems on a bird. Tried. Totem fell off. I felt it scream on the way down." },
            { id="sha_fp_c05", weight=1, line="My Ghost Wolf form could outrun this bird. But Ghost Wolf can't fly. So. Bird." },
            { id="sha_fp_c06", weight=1, line="The elements are quiet up here. Except Air. Air never shuts up at altitude." },
            { id="sha_fp_c07", weight=1, line="Wind is everywhere up here. It's like Air is showing off. 'Look at MY domain.' We get it, Air." },
            { id="sha_fp_c08", weight=1, line="No earth below my feet. No water in sight. Fire is confused. Air is having the time of its life." },
            { id="sha_fp_c09", weight=1, line="Shamans are supposed to be grounded. Connected to the earth. I am 800 yards in the air. On a bird." },
            { id="sha_fp_c10", weight=1, line="The bird doesn't respond to Lightning Bolt. Or Lightning Shield. Or any lightning. I've checked." },
            { id="sha_fp_c11", weight=1, line="Earth Spirit is silent. Water Spirit is distant. Fire Spirit is bored. Air Spirit is insufferable." },
            { id="sha_fp_c12", weight=1, line="My totems are back on the ground. I can feel their disappointment from up here. Little judgmental sticks." },
            { id="sha_fp_c13", weight=1, line="Flight paths: where shamans go to remember that Air thinks it's the most important element." },
            { id="sha_fp_c14", weight=1, line="The bird is struggling. Might be the wind. Might be the mail armor. Might be the totems in my bags." },
            { id="sha_fp_c15", weight=1, line="I told the elements I'd be gone for a few minutes. Earth said 'take your time.' Earth doesn't miss me." },
            { id="sha_fp_c16", weight=1, line="Just Purged the bird on instinct. Force of habit. The bird is fine. Just... slightly less buffed." },
            { id="sha_fp_c17", weight=1, line="If this bird falls, I have Reincarnation. That's my safety net. A net made of dying and coming back. Fine." },
            { id="sha_fp_c18", weight=1, line="Mages portal. Druids fly. Warlocks summon. Shamans... negotiate with the wind and sit on a bird." },
        },
        UNCOMMON = {
            { id="sha_fp_u01", weight=1, line="Asked Air for a tailwind. Air gave me a headwind. Then laughed. The WIND laughed. I'm arguing with WEATHER." },
            { id="sha_fp_u02", weight=1, line="Dropped a Searing Totem on the saddle. The bird panicked. The totem panicked. I panicked. Fire panicked. Everyone panicked." },
            { id="sha_fp_u03", weight=1, line="My Grounding Totem would love it up here. All this open sky. All this electricity. It's basically totem paradise." },
            { id="sha_fp_u04", weight=1, line="The bird flew through a thundercloud. I felt at home for exactly four seconds. Then the lightning missed me. Even nature has bad aim." },
            { id="sha_fp_u05", weight=1, line="I tried Chain Healing the bird out of boredom. The heal bounced to nothing. Loneliest Chain Heal of my career." },
            { id="sha_fp_u06", weight=1, line="Water said to tell ye it misses ye. Earth said nothing. Fire said 'hurry up.' Air said 'wheeeee.' They're all terrible coworkers." },
            { id="sha_fp_u07", weight=1, line="Saw a thunderstorm in the distance. My first instinct was to claim it as mine. Shaman territorial instincts are REAL." },
            { id="sha_fp_u08", weight=1, line="The bird just flew through rain. I cast Water Walking on it out of reflex. It didn't help. It's a bird. It walks on nothing." },
            { id="sha_fp_u09", weight=1, line="Asked Earth how things are going down there. Earth said 'rocky.' Earth thinks that's funny. I do not." },
            { id="sha_fp_u10", weight=1, line="I have an Ankh in my bag. If this bird crashes, I'll die, self-rez, and walk the rest of the way. Plan B has always been death." },
        },
        RARE = {
            { id="sha_fp_r01", weight=1, line="Twenty minutes in Air's domain. Air has told me forty jokes. None of them were funny. Wind humor is just... bad." },
            { id="sha_fp_r02", weight=1, line="From up here I can see rivers, mountains, plains, and forests. Every element represented. None of them care that I'm on a bird. Independent contractors, all of them." },
            { id="sha_fp_r03", weight=1, line="The ancestors whisper to me on the wind. They're saying 'why didn't you walk.' The ancestors are cheap." },
            { id="sha_fp_r04", weight=1, line="I commune with four elements. Direct line. Spiritual connection. And not ONE of them can get me across a continent without a bird. Useless." },
            { id="sha_fp_r05", weight=1, line="Placed Earthbind Totem on the saddle to have something familiar. It slowed the bird. Now we're going BACKWARDS. I've made things worse." },
        },
        MYTHIC = {
            { id="sha_fp_m01", weight=1, line="I speak to the earth and it trembles. I call to the water and it rises. I command fire and it obeys. I ask Air for a faster bird and Air says 'no.' The power dynamic up here is HUMBLING." },
            { id="sha_fp_m02", weight=1, line="My totems are on the ground. My elements are unresponsive. My Ankh is my only safety net. I am a shaman — master of the elements, speaker of spirits — sitting on a bird. And the bird is in charge." },
        },
    },

    -- SOLO_AMBIENT
    SOLO_AMBIENT = {
        COMMON = {
            { id="sha_solo_c01", weight=1, line="The elements are quiet. Suspiciously quiet." },
            { id="sha_solo_c02", weight=1, line="Dropped a totem. Just for company. It's a totem thing." },
            { id="sha_solo_c03", weight=1, line="Earth says 'slow down.' Wind says 'speed up.' Typical." },
            { id="sha_solo_c04", weight=1, line="Out here alone with four opinionated elements. Not really alone." },
            { id="sha_solo_c05", weight=1, line="Ankh in my bags. Can die once without consequences. Living dangerously." },
            { id="sha_solo_c06", weight=1, line="Fire keeps suggesting I burn things. I keep saying no. This is our relationship." },
            { id="sha_solo_c07", weight=1, line="The spirits of the land say hello. I say hello back. This is my social life." },
            { id="sha_solo_c08", weight=1, line="Solo shaman in the wild. Just me and the elemental committee." },
            { id="sha_solo_c09", weight=1, line="Water is humming. Earth is grumbling. Fire is crackling. Wind is... somewhere. Probably late." },
            { id="sha_solo_c10", weight=1, line="My totems would enjoy this area. I'd plant them but nobody's around to buff." },
            { id="sha_solo_c11", weight=1, line="Ghost Wolf form for traveling. Still slower than a mount. But it's about the spiritual journey." },
            { id="sha_solo_c12", weight=1, line="The ancestors walk with me. They have opinions about my gear." },
            { id="sha_solo_c13", weight=1, line="Good location for an Earth Totem. Not that anyone's here. Earth doesn't care. Earth works alone." },
            { id="sha_solo_c14", weight=1, line="Peaceful out here. Fire wants me to change that. Fire always wants me to change that." },
            { id="sha_solo_c15", weight=1, line="Communing with the elements. Or trying to. They're on break." },
            { id="sha_solo_c16", weight=1, line="Wind just blew my hair sideways. Not a message. Just rude." },
            { id="sha_solo_c17", weight=1, line="Ankh ready, totems stacked, elements complaining. Standard operations." },
            { id="sha_solo_c18", weight=1, line="Nature is beautiful. The elements take credit for all of it. Every time." },
        },
        UNCOMMON = {
            { id="sha_solo_u01", weight=1, line="Earth says I should ground myself. Water says I should flow with the moment. Fire says I should fight something. Wind went to get snacks. The committee never agrees." },
            { id="sha_solo_u02", weight=1, line="Being a solo shaman means every conversation is between me and an element. Today Fire told a joke. I didn't laugh. Fire set my sleeve on fire. It thought THAT was a joke too." },
            { id="sha_solo_u03", weight=1, line="I've been walking for an hour and Air has blown my cape over my face eleven times. I counted. Air says it was twelve. Air is wrong. This is why we fight." },
            { id="sha_solo_u04", weight=1, line="Dropped a Strength of Earth totem on this rock just to mark my territory. Earth approved. Wind knocked it over. This is why shaman diplomacy takes so long." },
            { id="sha_solo_u05", weight=1, line="Other classes have inner monologues. I have inner ARGUMENTS. Four voices. None of them helpful. All of them loud." },
            { id="sha_solo_u06", weight=1, line="Reincarnation is ready. Which means technically I can die and it's just an inconvenience. No other class has a 'die casually' button. It's our flex." },
            { id="sha_solo_u07", weight=1, line="Met a stream. Water wanted me to stop and 'listen to its story.' I did. It was pointless. Forty minutes about erosion. Water has no sense of pacing." },
            { id="sha_solo_u08", weight=1, line="Solo shaman on the road. I heal, I DPS, I drop totems nobody asked for. The elements assigned me four jobs and no help. Typical management." },
            { id="sha_solo_u09", weight=1, line="The ancestors gave me wisdom today. They said 'bring a group next time.' Thanks, dead people. Very helpful." },
            { id="sha_solo_u10", weight=1, line="Fire keeps pointing out flammable things. That bush. That tree. That other tree. My cloak. Fire needs a hobby that isn't arson." },
        },
        RARE = {
            { id="sha_solo_r01", weight=1, line="When I'm alone, the elements get chatty. Earth talks about the old days. Water talks about the weather. Fire talks about Fire. Wind doesn't talk — it just moves things when you're not looking. I didn't sign up for this support group." },
            { id="sha_solo_r02", weight=1, line="Found a hilltop. Good view. Asked the elements for guidance. Earth said 'stand firm.' Water said 'adapt.' Fire said 'BURN IT ALL.' Wind said nothing and stole my hat. Average consultation." },
            { id="sha_solo_r03", weight=1, line="The ancestors whispered my name on the wind today. I whispered back. We had a nice chat. Mostly they complained about politics. Even in the spirit world there's drama. Death solves nothing, apparently." },
            { id="sha_solo_r04", weight=1, line="I placed all four totems in a clearing. Earth, Water, Fire, Air. For a moment, they were in harmony. Then Fire tried to evaporate Water. Water retaliated. Earth took sides. Air just watched. I spent twenty minutes mediating. Standard totem deployment." },
            { id="sha_solo_r05", weight=1, line="Sometimes I wonder what a normal person feels when they walk through nature. Do they hear Earth complaining about erosion? Does Fire whisper 'ignite' when they see a bush? Does Water narrate the clouds? Probably not. Must be quiet in there. Sounds boring." },
        },
        MYTHIC = {
            { id="sha_solo_m01", weight=1, line="A shaman is never truly alone. I have Earth beneath my feet, offering structural opinions. Water at my side, narrating everything. Fire in my hand, lobbying for destruction. And Wind at my back, doing whatever Wind wants because Wind answers to no one. Four elements, four personalities, one shaman, zero peace. And somewhere in the middle of all that noise, I find my path. Usually by accident." },
            { id="sha_solo_m02", weight=1, line="Out here, no group, no raid, just me and the elemental board of directors. Earth submitted a proposal for 'standing still.' Water counter-proposed 'going with the flow.' Fire vetoed both and submitted 'burn everything in a half-mile radius.' Wind abstained. As usual. I overruled all of them and kept walking. This is leadership. This is shamanism. This is exhausting." },
        },
    },

},

---------------------------------------------------------------------------
-- RESPONSES
---------------------------------------------------------------------------
responses = {

    PLAYER_DEAD = {
        COMMON = {
            "I have Ancestral Spirit. After combat. Nature doesn't rush.",
            "The elements tried. Wind blew. Earth shook. They died anyway.",
            "My Healing Stream was ticking. Apparently not fast enough.",
            "Chain Heal bounced to three people. They weren't one of them.",
            "Ankh is ready. For me. If I die. It's a personal thing.",
        },
        UNCOMMON = {
            "I dropped a totem. It helped. A little. Not enough. But it tried.",
            "The elements grieve differently. Fire burns brighter. Water drips. Earth just sits there.",
        },
        RARE = {
            "I asked all four elements to save them. Turns out elements have a union. After-hours requests denied.",
        },
        MYTHIC = {
            "I'll rez them after combat. Until then, their spirit can hang out with the other ancestral spirits. Networking opportunity.",
        },
    },

    WIPE = {
        COMMON = {
            "I Reincarnated. Stood up alone. Assessed the situation. Sat back down.",
            "Wipe. My totems outlived everyone. Proud of them.",
            "Chain Heal couldn't bounce fast enough. Some things can't be healed.",
        },
        UNCOMMON = {
            "Ankh used. I'm alive. Everyone else is not. This is fine.",
        },
        RARE = {
            "I self-rezzed into a room of angry mobs. Died again. Two deaths, one pull. Personal record.",
        },
        MYTHIC = {
            "Reincarnation: the ultimate 'I'm not done yet' button. Except I was. I was very done.",
        },
    },

    HEALTH_LOW = {
        COMMON = {
            "Chain Heal incoming! It bounces! Watch it bounce!",
            "Healing Wave casting. It's big. It's slow. It's happening.",
            "Dropped a Healing Stream. For background heals. Keep fighting.",
        },
        UNCOMMON = {
            "Nature's Swiftness + Healing Wave. Instant. Massive. Once per fight.",
        },
        RARE = {
            "Chain Heal triple bounce to the three lowest health targets. Peak shaman moment.",
        },
        MYTHIC = {
            "Shaman healing: one slow spell, one bouncy spell, and a stick that drips health.",
        },
    },

    MANA_ZERO = {
        COMMON = {
            "OOM. Mana Spring is ticking. Slowly. Very slowly.",
            "Dry. Water element is empty. This is on them.",
            "Out of mana. Going to just shock and auto-attack for a bit.",
        },
        UNCOMMON = {
            "Mana Tide dropped. Enjoy the mana fountain. While it lasts.",
        },
        RARE = {
            "I drank five potions between pulls. Shamans are expensive to operate.",
        },
        MYTHIC = {
            "Four elements. Zero mana. The irony is cosmic.",
        },
    },

    LOOT = {
        COMMON = {
            "Mail armor. Two classes share it. The competition is real.",
            "Need it for enhance. Or elemental. Or resto. We pivot.",
            "Good drop. The elements favor... whoever won the roll.",
        },
        UNCOMMON = {
            "I need spell mail AND melee mail. My bank is a warehouse.",
        },
        RARE = {
            "Rolling against hunters for mail. The eternal struggle.",
        },
        MYTHIC = {
            "Shaman loot: whatever the hunter didn't take.",
        },
    },

    ENTER_INSTANCE = {
        COMMON = {
            "Totems going down. Four at a time. In the right spots. Give me a second.",
            "Elements reporting in. Fire: ready. Water: chill. Earth: immovable. Air: absent.",
            "My sticks are placed. Stand near them or miss out.",
        },
        UNCOMMON = {
            "I bring four elements and 20 totems. The setup time is... significant.",
        },
        RARE = {
            "I optimized my totem placement. Nobody noticed. Nobody ever notices totem placement.",
        },
        MYTHIC = {
            "Enter dungeon. Drop totems. Move. Drop totems. Move. Drop totems. This is the shaman way.",
        },
    },

    INTERRUPT = {
        COMMON = {
            "Earth Shocked it. Instant. Clean. Shamans interrupt best.",
            "Interrupted. Earth element doesn't miss.",
            "Earth Shock. No cast time. No drama. Just silence.",
        },
        UNCOMMON = {
            "My interrupt is instant and always ready. Fear the shaman.",
        },
        RARE = {
            "I Earth Shocked it so fast the cast bar barely appeared. REFLEXES.",
        },
        MYTHIC = {
            "Earth Shock: the element of surprise. And also earth.",
        },
    },

    PERIODIC_DAMAGE = {
        COMMON = {
            "Fire on the ground. I command fire. This fire is insubordinate.",
            "My totems are fine. They're wood. In fire. ...they might not be fine.",
            "Ground AoE. Dropped a Healing Stream in it. Aggressive self-care.",
        },
        UNCOMMON = {
            "I'm a master of fire. This fire doesn't listen to me. Rogue fire.",
        },
        RARE = {
            "Grounding Totem absorbed the hit. One hit. Then it died. It lived a full life.",
        },
        MYTHIC = {
            "Elements vs. boss fire: a battle of wills. I'm losing.",
        },
    },

    COMBAT_START = {
        COMMON = {
            "Totems down! Four sticks providing valor!",
            "Lightning Bolt casting! It's long! But it's lightning!",
            "Engaging. With totems. And shocks. And weather.",
        },
        UNCOMMON = {
            "Enhancement mode: hit things, lightning happens, it's beautiful.",
        },
        RARE = {
            "Windfury active. Each swing is a CHANCE at glory. Oh, there it goes!",
        },
        MYTHIC = {
            "I bring the thunder. And the lightning. And four sticks. FIGHT ME.",
        },
    },

    MOB_KILL = {
        COMMON = {
            "Dead. Lightning works.",
            "The elements claim another.",
            "Kill confirmed. Totems assisted.",
        },
        UNCOMMON = {
            "Chain Lightning hit three targets and I felt powerful for one GCD.",
        },
        RARE = {
            "Windfury triple proc. That mob didn't stand a chance.",
        },
        MYTHIC = {
            "Four elements, one dead mob. That's called EFFICIENCY.",
        },
    },

    CROWD_CONTROL = {
        COMMON = {
            "Frost Shock slowing. It's a slow, not a root. I know. I KNOW.",
            "Tremor Totem pulsing. Fear this, not us.",
            "Grounding Totem ate that. Good stick.",
        },
        UNCOMMON = {
            "Earthbind holding them. My totems CC better than I do.",
        },
        RARE = {
            "Tremor broke the fear at the PERFECT time. The totem KNEW.",
        },
        MYTHIC = {
            "Shaman CC: a slow, a snare totem, and optimism.",
        },
    },

    AMBIENT = {
        COMMON = {
            "Checking totems. Replacing totems. Shaman life.",
            "The elements are calm. For now. Fire always wants to start something.",
            "Mana Spring ticking. The sound of progress.",
        },
        UNCOMMON = {
            "I just picked up and re-placed all four totems. For the third time. This pull.",
        },
        RARE = {
            "The wind told me a joke. I'd repeat it but you had to be there. Wind humor is niche.",
        },
        MYTHIC = {
            "Between pulls I negotiate with four elements. It's like managing a very small, very powerful HOA.",
        },
    },

    PLAYER_DISCONNECT = {
        COMMON = {
            "DC'd. Left a totem where they stood. Marking the spot.",
            "Gone. The elements barely noticed.",
            "Disconnected. My totems are still here. Loyal sticks.",
        },
        UNCOMMON = {
            "I put a Healing Stream where they DC'd. Just in case.",
        },
        RARE = {
            "They disconnected and my Tremor Totem pulsed nervously. Even totems feel loss.",
        },
        MYTHIC = {
            "The elements don't lose connection. They ARE the connection.",
        },
    },

    CONSUMABLE_USED = {
        COMMON = {
            "Nice pot. My version is a totem that trickles mana to everyone.",
            "Consumables are smart. Mana Spring is smarter. And free.",
            "Potion popped. My totems are always running. No cooldown.",
        },
        UNCOMMON = {
            "Mana Tide is my potion. It's communal. Socialism in totem form.",
        },
        RARE = {
            "I once dropped Mana Tide just to flex on potion users.",
        },
        MYTHIC = {
            "My consumable is a stick. That I put on the ground. That gives resources. TOTEM TECHNOLOGY.",
        },
    },

    MAJOR_COOLDOWN = {
        COMMON = {
            "Big CD. Mine is dying and coming back. It's dramatic.",
            "CDs burning. I'm saving Nature's Swiftness for the panic moment.",
            "Mana Tide dropped. Drink from the totem fountain.",
        },
        UNCOMMON = {
            "Nature's Swiftness: one instant cast. One chance. Make it count.",
        },
        RARE = {
            "Popped everything: NS + Healing Wave, Mana Tide, all totems fresh. Peak shaman.",
        },
        MYTHIC = {
            "My ultimate cooldown: Reincarnation. Step 1: die. Step 2: refuse.",
        },
    },

    FLIGHT_PATH = {
        COMMON = {
            "Also on a bird? Air says hi. Air says hi to everyone. Air has no boundaries.",
            "We're in Air's territory now. Stay humble. Air has opinions.",
            "The wind is carrying us both. Allegedly. I have trust issues with Air.",
        },
        UNCOMMON = {
            "If the bird crashes, I have Reincarnation. You... might want to buckle something.",
            "Asked the wind to pass along a message. It delivered it to the wrong continent. Typical.",
        },
        RARE = {
            "Four elements and not one of them can fly me somewhere faster than this bird. I've filed a formal complaint with the spirit world.",
        },
        MYTHIC = {
            "When shamans travel, the elements are supposed to guide us. Right now Air is giggling, Earth is asleep, Water is confused, and Fire just burned my seat. Guided indeed.",
        },
    },

    SOLO_AMBIENT = {
        COMMON = {
            "You startled Earth. Earth doesn't GET startled. What did you do?",
            "Oh, someone's here. Fire perked up. Fire always perks up when there's company.",
            "I was mid-commune. The elements say hi. Except Fire. Fire says 'threat assessment in progress.'",
        },
        UNCOMMON = {
            "You interrupted an elemental meeting. Earth is annoyed, Water is curious, Fire wants to know if you're flammable, and Wind already left. Classic Wind.",
            "The ancestors were mid-sentence. Something about humility and patience. They'll have to wait. Ironic.",
        },
        RARE = {
            "I was THIS close to getting all four elements to agree on something. First time in months. And here you are. Fire is blaming you. Earth is blaming Fire. The meeting has collapsed.",
        },
        MYTHIC = {
            "I had achieved elemental harmony. HARMONY. Earth was singing. Water was dancing. Fire was calm. Wind was present AND paying attention for the first time ever. It was unprecedented. Historic. And then you showed up and they all started arguing about who should introduce themselves first and it's been downhill since. You've set back elemental diplomacy by decades.",
        },
    },

},

}

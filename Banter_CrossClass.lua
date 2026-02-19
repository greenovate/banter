-- Banter_CrossClass.lua
-- CROSS-CLASS BANTER: How each persona REACTS to lines from other personas.
-- This is the heart of the addon. When a Warrior says something about a death,
-- the Mage doesn't just say a random line — they clap back AT the Warrior.
--
-- Loaded AFTER all persona files. Populates ns.personas.X.banter tables.
-- Lookup: ns.personas[myClass].banter[theirClass][trigger] → string[]
--
-- Key triggers for cross-class: PLAYER_DEAD, WIPE, HEALTH_LOW, COMBAT_START,
-- AMBIENT, LOOT, MANA_ZERO. Other triggers fall through to generic responses.
local _, ns = ...

---------------------------------------------------------------------------
-- Helper: attach a banter pool to a persona
---------------------------------------------------------------------------
local function B(myClass, theirClass, trigger, lines)
    local p = ns.personas[myClass]
    if not p then return end
    if not p.banter then p.banter = {} end
    if not p.banter[theirClass] then p.banter[theirClass] = {} end
    p.banter[theirClass][trigger] = lines
end

--=========================================================================
--  W A R R I O R   reacting to others
--=========================================================================

-- WARRIOR → MAGE
B("WARRIOR", "MAGE", "PLAYER_DEAD", {
    "The mage died. Again. From ONE hit. How do you people survive getting dressed in the morning?",
    "Mage down. Maybe if you wore ACTUAL armor instead of a bathrobe, this wouldn't keep happening.",
    "If I had that much health I'd have died seven times already. Oh wait — you DID.",
    "I watched the mage drop from full to dead in one swing. That's not a health bar, that's a suggestion.",
    "The mage died and I felt NOTHING. That's how often this happens.",
    "Maybe try standing behind me next time. I'm the one in plate. You're the one in pajamas.",
})
B("WARRIOR", "MAGE", "WIPE", {
    "We wiped. I held the line as long as I could. The mage held approximately nothing.",
    "I died with my shield up. The mage died with a Frostbolt half-cast. Guess who lasted longer?",
    "Maybe if the mage hadn't Blinked INTO the boss we'd still be alive.",
    "Wipe. I blame the squishy in the back who attracts aggro like a magnet.",
    "Next time I'll just strap the mage to my shield. At least they'd be NEAR the armor.",
})
B("WARRIOR", "MAGE", "HEALTH_LOW", {
    "Mage is low. Again. I've seen wet paper towels take more damage than you.",
    "Protect the mage! They have the HP of a particularly ambitious squirrel.",
    "Mage needs healing. I need healing too but I can actually SURVIVE while I wait.",
})
B("WARRIOR", "MAGE", "COMBAT_START", {
    "Stay behind me, mage. If I catch you Blinking into melee range I'm letting you die.",
    "You nuke 'em, I'll hold 'em. And if you pull aggro, that's a YOU problem.",
    "Engaging! Mage, try not to die in the first three seconds. Personal best, let's aim for four.",
})
B("WARRIOR", "MAGE", "AMBIENT", {
    "The mage is reading a book between pulls. IN A DUNGEON. We're in combat in 30 seconds, put it down.",
    "I asked the mage for food. They conjured it instantly. I'll never admit it, but that's actually impressive.",
    "Every time I look at the mage I flexe involuntarily. It's not personal. It's biological.",
    "I don't understand magic. I don't WANT to understand magic. I have a sword. It works.",
    "Mage keeps trying to explain 'arcane theory' to me. I keep hearing 'blah blah I die in one hit.'",
    "I respect mages. From far away. Where they can't accidentally Frost Nova me.",
})
B("WARRIOR", "MAGE", "LOOT", {
    "Cloth drop. That's mage loot. Wouldn't protect you from a stiff breeze, but sure.",
    "I can't believe mages CHOOSE to wear that. I'd rather die than wear a robe into battle.",
    "Mage got gear. Maybe this one has more than 3 stamina on it.",
})

-- WARRIOR → WARLOCK
B("WARRIOR", "WARLOCK", "PLAYER_DEAD", {
    "Warlock died. Their demon survived. Priorities are clear in that relationship.",
    "The warlock is dead. I'm sure they planned it somehow. Everything with them is 'calculated.'",
    "Warlock down. Probably Life Tapped themselves to death again. Life choices, man.",
    "I told the warlock to stop draining their own health. Did they listen? They never listen.",
    "Warlock died but the imp is still shooting. Respect to the imp.",
})
B("WARRIOR", "WARLOCK", "WIPE", {
    "Wipe. The warlock was the last one alive, draining health from corpses. Probably.",
    "We wiped and the warlock seemed... fine with it? That's unsettling.",
    "I died honorably. The warlock died doing something I don't want to understand.",
})
B("WARRIOR", "WARLOCK", "AMBIENT", {
    "The warlock is talking to their demon again. It's talking BACK. I don't like it here.",
    "I fight with steel and muscle. The warlock fights with... demons and suffering. Different strokes.",
    "I don't trust the warlock. Not because they're evil. Because their pet keeps looking at me funny.",
    "Every time the warlock Life Taps, a healer cries. I've learned to enjoy the chaos.",
    "The warlock offered me a 'Healthstone.' I don't know what's in it and I don't WANT to know.",
})
B("WARRIOR", "WARLOCK", "COMBAT_START", {
    "Engaging! Warlock, do your... dark thing. I'll be up front. Not dying.",
    "I charge in. The warlock sends a demon in. We're both leading with meat shields, honestly.",
})
B("WARRIOR", "WARLOCK", "LOOT", {
    "Cloth drop again. Warlock and mage can fight over the bathrobes.",
    "I don't care about warlock loot. As long as they keep making Healthstones.",
})

-- WARRIOR → PRIEST
B("WARRIOR", "PRIEST", "PLAYER_DEAD", {
    "Someone died. Priest, that's YOUR department. I just swing the sword.",
    "Priest, I see a corpse over there. Isn't that your whole thing?",
    "They died. Priest, where were the heals? I'm not accusing, I'm just... loudly asking.",
    "I kept aggro. I held the line. The heals didn't land. I'm not placing blame, but...",
    "We lost someone. Priest, you okay? Your spell bar has a 'heal' button? Just checking.",
})
B("WARRIOR", "PRIEST", "WIPE", {
    "Wipe. Healer down first. The one person we needed alive. Died first. How.",
    "Priest went OOM and we went OOL. Out Of Luck.",
    "I would've survived if literally any heals landed. Just one. ONE green number.",
    "Wipe. The priest died and then we all died. The healer is the load-bearing wall of this group.",
})
B("WARRIOR", "PRIEST", "HEALTH_LOW", {
    "I'M LOW. ME. THE TANK. THE ONE KEEPING EVERYTHING OFF YOU. HEALS. PLEASE.",
    "Priest I'm at 20%. If I die, everything eats YOU next. Think about that.",
    "My health bar is a suggestion at this point. Priest, do you see me? LOOK at me.",
})
B("WARRIOR", "PRIEST", "AMBIENT", {
    "The priest is drinking. Again. How much mana do you people USE?",
    "Priest is buffing. I respect the buff. Fortitude is the one magic I understand.",
    "I protect the priest and the priest keeps me alive. It's a beautiful, codependent relationship.",
    "If the priest dies, we all die. So I stand between them and everything. That's the job.",
})
B("WARRIOR", "PRIEST", "MANA_ZERO", {
    "Priest is OOM. I'll just... not take damage for a while. Simple.",
    "Healer has no mana. Guess I'm using my cooldowns now. All of them.",
    "Priest OOM means warrior tanking on fumes. We've been worse off. Actually, no, this is the worst.",
})

-- WARRIOR → ROGUE
B("WARRIOR", "ROGUE", "PLAYER_DEAD", {
    "Rogue died. Where even WERE you? I've been tanking this solo for the last 30 seconds.",
    "The rogue is dead. They were 'behind the boss' which apparently means 'not here.'",
    "Rogue down. Probably got cleaved because they were standing inside the boss's hitbox. Again.",
    "I saw the rogue Vanish. Then die anyway. Stealth: not actually armor.",
})
B("WARRIOR", "ROGUE", "WIPE", {
    "Wipe. I notice the rogue used Vanish and lived. Must be nice. MUST BE NICE.",
    "The rogue Vanished and lived. I died. In plate. Face first. Life is fair.",
    "Rogue survived the wipe. Because of course they did. Rogues can just DISAPPEAR when things get hard.",
})
B("WARRIOR", "ROGUE", "AMBIENT", {
    "The rogue has been in stealth for 5 minutes. Are they still HERE?",
    "I see the rogue. Stealthed. Right there. The shimmer. I can see you.",
    "Fight me head-on like a real combatant. No stealth. No poisons. Just metal on metal. ...they vanished.",
    "I don't know where half our DPS goes. Probably because the rogue is invisible.",
    "Rogue keeps 'accidentally' Sapping critters. I've counted seven.",
})
B("WARRIOR", "ROGUE", "COMBAT_START", {
    "I'll hold the front. Rogue, go stab it in the back. The ACTUAL back. Not the side.",
    "Rogue— wait where are they? THERE. Okay. Go. Stab things.",
})

-- WARRIOR → HUNTER
B("WARRIOR", "HUNTER", "PLAYER_DEAD", {
    "Hunter died. Pet's still alive though. The pet is a better player honestly.",
    "Hunter is dead. I bet their pet pulled something. I bet it ALWAYS pulls something.",
    "RIP hunter. Feign Death failed? Or was that actually Feign Death? Hard to tell with you.",
    "Hunter down. The pet mourns. For about 3 seconds. Then attacks something else.",
})
B("WARRIOR", "HUNTER", "WIPE", {
    "Wipe. Hunter Feigned and survived. I see how this works.",
    "Everyone died except the hunter who Feign Death'd and is now lying there like a liar.",
    "Hunter lived because of Feign Death. That's not a save, that's ACTING.",
    "The hunter 'died' first but they're fine. They're always fine. Feign Death is cheating.",
})
B("WARRIOR", "HUNTER", "AMBIENT", {
    "If that pet pulls ONE more pack, I'm replacing the hunter with a second warrior.",
    "The hunter's pet just ran through three packs. Three. The hunter says 'sorry.' They are NOT sorry.",
    "I don't understand hunters. You have a ranged weapon AND a pet. Why is the pet in MELEE?",
    "Hunter has their pet on aggressive. I can feel it. My blood pressure knows.",
    "The hunter asked me to off-tank. I AM the tank. They meant their PET should off-tank. The pet. Off-tanking.",
})
B("WARRIOR", "HUNTER", "COMBAT_START", {
    "Hunter, control your pet. I mean it this time. CONTROL it.",
    "If the pet pulls before I do, the pet tanks it.",
    "Engaging! Hunter, manage that pet or I will.",
})
B("WARRIOR", "HUNTER", "LOOT", {
    "The hunter needs on everything. Plate? 'For my pet.' A shield? 'Stat stick.' Unbelievable.",
    "Hunter rolled Need. Of course. On what? Doesn't matter. They always Need.",
})

-- WARRIOR → DRUID
B("WARRIOR", "DRUID", "PLAYER_DEAD", {
    "The druid died. In caster form. WHY were you in caster form?!",
    "Druid's dead. Which form were they in? Wrong one, clearly.",
    "I watched the druid shift three times and then die. That's not a strategy, that's a seizure.",
    "Druid down. They had bear form. They CHOSE not to use it. Think about that.",
})
B("WARRIOR", "DRUID", "WIPE", {
    "Wipe. The druid was in cat form instead of healing. Priorities.",
    "We wiped because — okay which role was the druid even DOING?",
    "Druid was bear, then cat, then caster, then dead. Four forms in five seconds. Impressive and useless.",
})
B("WARRIOR", "DRUID", "AMBIENT", {
    "The druid keeps shifting forms. Bear. Cat. Caster. Bear again. Just PICK ONE.",
    "I asked the druid their role. They said 'yes.' That's not an answer.",
    "The druid is in bear form. I'm in plate. We're basically the same except they can ALSO heal. That's not fair.",
    "Bear-form druid thinks they're a tank. Cute. Have you tried it in plate?",
    "I respect druids. They can be anything. They CHOOSE to be confused.",
})
B("WARRIOR", "DRUID", "COMBAT_START", {
    "I'll tank. Unless the druid wants to tank? Do you want to tank? PICK A FORM.",
    "Druid, are you healing or DPSing this pull? Decide BEFORE we pull. For once.",
})

-- WARRIOR → PALADIN
B("WARRIOR", "PALADIN", "PLAYER_DEAD", {
    "Someone died. The paladin didn't, obviously. They NEVER die. It's infuriating.",
    "I'll die protecting this group. The paladin will die of old age. In their bubble. Untouched.",
    "A death occurred. The paladin was standing right there. Glowing. Did they bubble someone? No. Themselves.",
    "Someone died and the paladin didn't use a single one of their SEVENTEEN save abilities.",
})
B("WARRIOR", "PALADIN", "WIPE", {
    "Wipe. Paladin was the last one standing. IN A BUBBLE. WATCHING US DIE.",
    "I watched the paladin bubble and auto-attack while we all died around them. Golden and useless.",
    "Paladin bubbled. Paladin hearthed? ...where's the paladin? Did they bubble-hearth?!",
    "We wiped. The paladin is fine. The paladin is ALWAYS fine. I hate it.",
})
B("WARRIOR", "PALADIN", "AMBIENT", {
    "The paladin has been rebuffing for 3 minutes. How many blessings DO you have?",
    "I wear plate. The paladin wears plate AND a magic force field. How is that balanced?",
    "Paladin just standing there. Glowing. Smugly. They know they can't die and they LOVE it.",
    "I earned my survival through skill. The paladin presses one button and becomes immortal. Cool. Fine.",
    "The paladin offered me Blessing of Kings. I'll accept it. Under protest.",
})
B("WARRIOR", "PALADIN", "COMBAT_START", {
    "I'll tank. Unless the paladin wants to just bubble through the whole fight. Again.",
    "Watch the paladin bubble at 90% health. Preemptive invulnerability. Must be nice.",
})

-- WARRIOR → SHAMAN
B("WARRIOR", "SHAMAN", "PLAYER_DEAD", {
    "Shaman's dead. But they'll Reincarnate. They ALWAYS Reincarnate. Some of us acutally STAY dead.",
    "The shaman died then stood back up. If I could do that, I'd die more often too.",
    "Shaman down. Wait, no. Back up. Ankh. Must be nice to have a cheat death.",
})
B("WARRIOR", "SHAMAN", "WIPE", {
    "Wipe. Shaman Reincarnated. Stood up. Looked around. Sat back down. I feel that.",
    "We all died. The shaman came back. Then died again. At least they tried.",
    "The shaman self-rezzed into a room of angry mobs. Bravest or dumbest thing I've ever seen.",
})
B("WARRIOR", "SHAMAN", "AMBIENT", {
    "The shaman is placing totems. Four sticks on the ground. They seem proud of their sticks.",
    "I don't understand totems. I stand near them because the shaman told me to. That's the arrangement.",
    "The shaman keeps talking about 'the elements.' I talk to my sword. We're the same.",
    "Windfury just procced. The shaman is smiling. I'm smiling too because DAMN that was a lot of damage.",
})
B("WARRIOR", "SHAMAN", "COMBAT_START", {
    "Shaman, drop your sticks. I'll hold the line. Standard arrangement.",
    "Windfury totem? Please? PLEASE?",
})

-- WARRIOR → PIRATE
B("WARRIOR", "PIRATE", "PLAYER_DEAD", {
    "The... pirate? Is that a class? Whatever they are, they're dead now.",
    "Pirate's down. I'd say 'rest in peace' but they smell the same either way.",
})
B("WARRIOR", "PIRATE", "WIPE", {
    "Wipe. I blame whoever thinks 'pirate' is a legitimate combat specialization.",
})
B("WARRIOR", "PIRATE", "AMBIENT", {
    "The pirate keeps calling me 'matey.' I am not your matey. I am a soldier.",
    "I've been called a lot of things. 'Landlubber' is a new one.",
    "The pirate is drinking rum. In a dungeon. During combat. Bold strategy.",
})

--=========================================================================
--  M A G E   reacting to others
--=========================================================================

-- MAGE → WARRIOR
B("MAGE", "WARRIOR", "PLAYER_DEAD", {
    "The warrior died. Despite wearing approximately 200 pounds of metal. Fascinating.",
    "How does someone in THAT much armor die? You have more steel on you than a forge.",
    "Warrior's down. The one person who was supposed to be impossible to kill. Incredible.",
    "The walking tin can fell over. I'm sure it was very loud.",
    "The tank is dead. We're all going to die. I'd like everyone to know this was avoidable.",
})
B("MAGE", "WARRIOR", "WIPE", {
    "Wipe. The warrior lost aggro. The warrior's ONE job. Keep. Aggro.",
    "We wiped because the warrior charged in before anyone was ready. As is tradition.",
    "The warrior Charged. Then died. Then we died. I predicted this. Nobody listens to the mage.",
    "Next time the warrior wants to 'just go,' I'm Blinking the other direction.",
})
B("MAGE", "WARRIOR", "HEALTH_LOW", {
    "Warrior is low. Swing faster! That's how you solve problems, right? With MORE hitting?",
    "The tank is melting. I could Frost Nova to help, or I could save my mana. Decisions, decisions.",
    "Warrior is dying. If only there were a way to AVOID damage instead of just soaking all of it.",
})
B("MAGE", "WARRIOR", "COMBAT_START", {
    "The warrior Charged. Because of course they did. They see red and they Charge. Like a bull.",
    "Go ahead, warrior. Run in. I'll be back here. Casting. Safely. At range. Where smart people fight.",
    "The warrior just yelled and ran straight at the enemy. I will never understand martial classes.",
})
B("MAGE", "WARRIOR", "AMBIENT", {
    "The warrior is sharpening their sword. Has it occurred to you that FIRE does more damage than metal?",
    "I could explain basic arcane theory to the warrior, but I'd need crayons and a lot of patience.",
    "The warrior asked me for food. I conjured it. They said 'thanks.' Simple creatures, simple pleasures.",
    "I have 4,000 years of accumulated arcane knowledge. The warrior has a stick with a sharp end. Guess who gets more party invites.",
    "The warrior just picked something up and THREW it. At the ENEMY. When you could just... Fireball.",
    "I measured our group's collective IQ. It went up when the warrior left the room. Correlation, perhaps.",
})
B("MAGE", "WARRIOR", "LOOT", {
    "Plate dropped. That's warrior loot. For people who solve problems by getting hit repeatedly.",
    "The warrior needs more armor. Of course. Because the answer is always 'more armor.'",
})

-- MAGE → WARLOCK
B("MAGE", "WARLOCK", "PLAYER_DEAD", {
    "The warlock died. Probably Life Tapped at the wrong time. Again. As I've warned. Repeatedly.",
    "Warlock is dead. Their demon survived. I'd be offended but that tracks for dark magic users.",
    "A fellow caster — and I use 'fellow' loosely — has perished. Life Tap: the spell that kills you from the inside.",
    "The warlock died. Their imp didn't even stop shooting. Professional relationship, I see.",
})
B("MAGE", "WARLOCK", "WIPE", {
    "Wipe. I'd blame the warlock but they'd enjoy that. They enjoy suffering. It's their whole thing.",
    "We all died. The warlock seemed prepared for this. SUSPICIOUSLY prepared.",
    "Wiped. I cast Intellect on the warlock before the pull. Clearly not enough.",
})
B("MAGE", "WARLOCK", "AMBIENT", {
    "The warlock and I both use mana. That's where the similarities end. THEY drain their own health for it.",
    "I studied at the Kirin Tor. The warlock studied... wherever you learn to summon things from the Nether. Different institutions.",
    "The warlock keeps calling their magic 'just as valid' as mine. It comes from DEMONS. My arcana comes from KNOWLEDGE.",
    "I conjure food. The warlock conjures Healthstones from suffering. We are not the same.",
    "The warlock's demon keeps looking at my food table. The demon. Is looking. At my food. Get it away from me.",
    "Theoretically I could do what the warlock does. I CHOOSE not to. For ethical reasons. And taste.",
})
B("MAGE", "WARLOCK", "COMBAT_START", {
    "I'll nuke from range. The warlock will... drain things? Creepily? From range? Fine.",
    "Two casters in the back. One uses fire. One uses souls. I'll let you guess which one I respect.",
})
B("MAGE", "WARLOCK", "LOOT", {
    "Warlock needs cloth with stamina. Because they keep DRAINING THEIR OWN HEALTH. The irony.",
    "We're both cloth users. The competition is real. At least my spec doesn't require self-harm.",
})

-- MAGE → PRIEST
B("MAGE", "PRIEST", "PLAYER_DEAD", {
    "Someone died. The priest — whose ENTIRE ROLE is preventing that — was doing what exactly?",
    "A death occurred under the priest's watch. I'm not saying it's their fault. The math says it though.",
    "Priest, the tank is dead. You had one job. One VERY specific job.",
    "I have Arcane Intellect. I can SEE the health bars. I watched that one hit zero while you cast... Smite?",
})
B("MAGE", "PRIEST", "WIPE", {
    "Wipe. Healer died first. The probability of us surviving dropped to zero in 0.3 seconds.",
    "We wiped because the healer went OOM. I offered to Evocate sympathy. Not sure that helped.",
    "The priest died and took the whole group with them. That's what we call a 'single point of failure.'",
})
B("MAGE", "PRIEST", "HEALTH_LOW", {
    "I'm at 30% health. I am a mage. I have 4,000 HP. At 30% that's approximately NOTHING. Heal me.",
    "Priest, I'm dying. I'm the one doing ALL the damage. Prioritize me. I've done the calculations.",
})
B("MAGE", "PRIEST", "AMBIENT", {
    "The priest is drinking between pulls. I conjured the water they're drinking. You're welcome.",
    "Priest keeps asking for Arcane Intellect. Of course. Everyone wants my intellect. Few can handle it.",
    "I gave the priest conjured water. They gave me Fort. Mutual benefit. Almost equals.",
    "The priest relies on faith. I rely on mathematics. Only one of us can prove our results.",
})
B("MAGE", "PRIEST", "MANA_ZERO", {
    "Priest is OOM. I gave them my water. I have 40 stacks of water. There is no excuse for this.",
    "Healer OOM and I just Evocated. At least ONE of us manages our mana like a professional.",
})

-- MAGE → ROGUE
B("MAGE", "ROGUE", "PLAYER_DEAD", {
    "The rogue died. In melee. Like a barbarian. There's a perfectly good RANGE to fight from. Out here. With me.",
    "Rogue down. Vanish on cooldown? Tragic. Should've taken up a RANGED class.",
    "The rogue is dead. I barely noticed they were alive. Stealth is effective, I'll give them that.",
})
B("MAGE", "ROGUE", "WIPE", {
    "Wipe. The rogue Vanished and lived. I Blinked but there was a wall. THERE'S ALWAYS A WALL.",
    "Rogue survived. Of course. Disappearing when things get hard. Some of us have to stand here and DIE.",
})
B("MAGE", "ROGUE", "AMBIENT", {
    "I can see the rogue in stealth. I'm a mage. I see everything. The shimmer is OBVIOUS.",
    "The rogue asked me for food. I conjured it. They tried to 'pickpocket' more. I SAW THAT.",
    "Rogues solve problems by walking up to them invisible and stabbing them. Crude. Effective. Crude.",
    "I theorize the rogue's intelligence is inversely proportional to the number of daggers they carry.",
})
B("MAGE", "ROGUE", "COMBAT_START", {
    "I'll Fireball from range. The rogue will... crawl up to the boss and stab it? Stone age tactics.",
    "Rogue, you go invisible and stab. I'll stay visible and set things on fire. Division of labor.",
})

-- MAGE → HUNTER
B("MAGE", "HUNTER", "PLAYER_DEAD", {
    "The hunter died. The pet is fine. As always. The pet has better survival instincts than the hunter.",
    "Hunter down. They died at range. You're supposed to be SAFE at range. That's the POINT.",
    "I'm also a ranged class. I don't die. The hunter dies. The difference? Intellect. Literally.",
})
B("MAGE", "HUNTER", "WIPE", {
    "Wipe. Hunter Feigned Death and lived. I respect the deception. Academically.",
    "The hunter survived by lying on the ground and pretending. I survived nothing. I'm jealous of a hunter.",
})
B("MAGE", "HUNTER", "AMBIENT", {
    "The hunter's pet just ate my conjured food. OFF THE TABLE. The pet ATE it OFF THE TABLE.",
    "I studied arcane arts for decades. The hunter tamed a cat. We're both invited to the same dungeons. Fair.",
    "The hunter asked me to conjure food for their pet. The PET. Am I a catering service?",
    "The hunter is a fellow ranged DPS. I respect the philosophy. Not the execution. Or the pet.",
    "I have encyclopedic knowledge of magic. The hunter knows which end of the arrow is pointy. We contribute equally. Somehow.",
})
B("MAGE", "HUNTER", "COMBAT_START", {
    "Hunter, if your pet pulls before the tank, I'm Polymorphing it. THE PET.",
    "Two ranged DPS. One uses advanced arcana. The other shoots a stick with a pointy end. No judgment.",
})
B("MAGE", "HUNTER", "LOOT", {
    "The hunter rolled Need. On a CASTER item. The statistics show this happens 47% of the time.",
    "Hunter needs everything. It's not even greed. It's some kind of compulsion.",
})

-- MAGE → DRUID
B("MAGE", "DRUID", "PLAYER_DEAD", {
    "The druid died. In... what form were they even in? Does it matter? They're dead in ALL forms now.",
    "Druid down. They shifted four times on the way to death. Like flipping through channels to find something good.",
    "The druid died in caster form. The ONE form with no armor bonus. Bold.",
})
B("MAGE", "DRUID", "WIPE", {
    "Wipe. The druid couldn't decide if they were tanking or healing. They chose 'neither.'",
    "We wiped because the druid was in cat form instead of healing. Feline priorities.",
})
B("MAGE", "DRUID", "AMBIENT", {
    "The druid can do 'everything.' Mediocrely. A generalist in a specialist's world.",
    "I mastered arcane magic. The druid 'mastered' turning into animals. One of us has a PhD.",
    "The druid is in bear form. Again. When you can be ANYTHING, why choose bear? Repeatedly?",
    "I conjure food through arcane mastery. The druid... grows berries? From the ground? How primitive.",
    "The druid keeps offering me Mark of the Wild. I'll take the stats. Not the nature lecture that comes with it.",
})

-- MAGE → PALADIN
B("MAGE", "PALADIN", "PLAYER_DEAD", {
    "Someone died. The paladin, predictably, did not. They have more immunities than a diplomatic envoy.",
    "A death occurred within bubble range and the paladin chose themselves. Shocking. That's sarcasm.",
    "The paladin could've used Blessing of Protection. They chose to use it on themselves. Last pull.",
})
B("MAGE", "PALADIN", "WIPE", {
    "Wipe. The paladin survived inside their golden immunity sphere. Intellectually, I'm furious.",
    "Paladin bubbled while we all died. I could've Iceblocked but... no wait, I DID Iceblock. I still died.",
    "The paladin bubble-hearthed. I... have to respect the efficiency. Ethically, I'm disgusted.",
})
B("MAGE", "PALADIN", "AMBIENT", {
    "The paladin is unkillable. I've done the math. Between bubble, BoP, and Lay on Hands, they literally CANNOT die.",
    "I'm an intellect class. The paladin is an intellect class. But only ONE of us earned it through study.",
    "The paladin keeps telling me about 'the Light.' I keep telling them about thermodynamics. We're at an impasse.",
    "I respect the paladin's ability to survive anything. I do NOT respect them auto-attacking while glowing.",
})
B("MAGE", "PALADIN", "COMBAT_START", {
    "I'll do the damage. The paladin will... judge things? And auto-attack? In a very bright way?",
    "The paladin pressed three buttons and now they're waiting. For 8 seconds. Riveting gameplay.",
})

-- MAGE → SHAMAN
B("MAGE", "SHAMAN", "PLAYER_DEAD", {
    "The shaman died. Then came back. Without a rez. Show-off ability but I'm not NOT impressed.",
    "Shaman died and Reincarnated. I would trade Evocation for that in a SECOND.",
})
B("MAGE", "SHAMAN", "WIPE", {
    "Wipe. The shaman self-rezzed. I'm an archmage and I can't cheat death. Explain how that's balanced.",
    "The shaman came back from death with an ankh. I came back with a corpse run. Fair.",
})
B("MAGE", "SHAMAN", "AMBIENT", {
    "The shaman talks to 'elements.' I manipulate elements through ARCANE SCIENCE. Who's more qualified?",
    "I create fire through equations and willpower. The shaman asks fire nicely. Same result. Different methodology.",
    "The shaman dropped four totems. Ground-based area effects. Interesting. Primitive, but interesting.",
    "I use frost, fire, AND arcane. The shaman uses earth, fire, water, and air. We're both elemental. I'm just better at it.",
})

-- MAGE → PIRATE
B("MAGE", "PIRATE", "PLAYER_DEAD", {
    "The pirate died. I don't believe 'pirate' is in any academic text on combat specialization.",
    "Our... nautical colleague has perished. The ocean claims another. Or the dungeon. Same thing.",
})
B("MAGE", "PIRATE", "AMBIENT", {
    "The pirate keeps calling me 'matey.' We are not 'mateys.' I am a scholar. They are... unwashed.",
    "I offered the pirate conjured water. They asked for rum. I don't conjure rum. Yet.",
    "The pirate is drinking during a dungeon. From a flask. A PERSONAL flask. This is fine.",
})

--=========================================================================
--  W A R L O C K   reacting to others
--=========================================================================

-- WARLOCK → WARRIOR
B("WARLOCK", "WARRIOR", "PLAYER_DEAD", {
    "The warrior died. Unfortunate. They made an excellent meat shield while they lasted.",
    "Tank's dead. And here I was, comfortably Life Tapping behind their broad, now-deceased shoulders.",
    "The warrior fell. My demon survived. My demon has better self-preservation instincts.",
    "Shield. Plate. Sword. Still dead. At least I can Soulstone someone who matters.",
})
B("WARLOCK", "WARRIOR", "WIPE", {
    "Wipe. The warrior died first. The one in the most armor. The irony fuels my shadow magic.",
    "We all died. Some of us more dramatically than others. The warrior fell face-first. Classic.",
    "I Soulstoned the healer before the pull. Warrior wanted the Soulstone. The healer is more valuable. Sorry not sorry.",
})
B("WARLOCK", "WARRIOR", "AMBIENT", {
    "The warrior flexed at me. Cute. My demon flexes BACK. And the demon shoots fire.",
    "I have personal demons. Literally. The warrior has personal anger issues. We cope differently.",
    "The warrior doesn't trust me. Smart. But they take my Healthstones. So the relationship works.",
    "I offered the warrior a Soulstone. They seemed confused by the concept. 'What did you do with the soul?'",
    "The warrior thinks they're the scariest thing in this group. They haven't met my Voidwalker.",
})
B("WARLOCK", "WARRIOR", "COMBAT_START", {
    "Warrior charges in. I send the demon. We both lead with the expendable one.",
    "Go ahead, warrior. Soak the damage. I'll be back here. Draining things. Comfortably.",
})

-- WARLOCK → MAGE
B("WARLOCK", "MAGE", "PLAYER_DEAD", {
    "The mage died. Cloth armor. No demon bodyguard. What did they EXPECT?",
    "Mage is dead. I'm also cloth and I'm FINE. The difference? I plan for pain. They plan for... food.",
    "Did the mage just die? We wear the same armor type and I'm sitting at full. Life Tap, Drain Life, repeat.",
    "Fellow caster down. Their magic couldn't save them. MY magic FEEDS on their kind of failure.",
})
B("WARLOCK", "MAGE", "WIPE", {
    "Wipe. The mage Iceblocked. Then died anyway. Delayed the inevitable. How... mage of them.",
    "I could have Soulstoned the mage. I chose the healer. Better investment. Nothing personal.",
})
B("WARLOCK", "MAGE", "AMBIENT", {
    "The mage conjured food. How... quaint. I conjure DEMONS. But yes, your bread table is nice too.",
    "The mage thinks their magic is superior. I commune with beings from the Twisting Nether. They make cookies.",
    "Arcane. Fire. Frost. That's CUTE. Try 'suffering,' 'agony,' and 'unstoppable darkness.'",
    "I respect the mage's intellect. I do NOT respect their refusal to tap into real power. Coward.",
    "The mage runs out of mana and drinks water. I run out of mana and drain my own blood. One of us is committed.",
})
B("WARLOCK", "MAGE", "LOOT", {
    "Cloth spell power. We BOTH need it. But I need it more. Trust me on this. Don't ask why.",
    "The mage and I are competing for loot. At least we agree on one thing: cloth is superior when you have MAGIC.",
})
B("WARLOCK", "MAGE", "COMBAT_START", {
    "Two casters. Mine involves demons. Theirs involves... studying. My method is more fun.",
})

-- WARLOCK → PRIEST
B("WARLOCK", "PRIEST", "PLAYER_DEAD", {
    "Someone died. Priest, you use the Light to heal. I use the Void to drain. NEITHER of us helped.",
    "The healer let someone die. Interesting. I thought the Light was supposed to be... good at that.",
    "Priest, that death is on you. I'd help heal but I'm too busy draining the enemy. And myself.",
})
B("WARLOCK", "PRIEST", "WIPE", {
    "Wipe. Healer down first. The Light didn't protect the Light-user. Poetic.",
    "I Soulstoned the priest before the pull. They died and came back. You're welcome. Again.",
})
B("WARLOCK", "PRIEST", "HEALTH_LOW", {
    "I'm low. Priest, I know I Life Tapped, but I ALSO need heals. That's the arrangement.",
    "My health is low because I gave it to myself as mana. Now give it back. That's teamwork.",
    "Priest, I see you not healing me out of principle. I Life Tapped because I NEEDED the mana. Don't judge me.",
})
B("WARLOCK", "PRIEST", "AMBIENT", {
    "The priest serves the Light. I serve darker forces. But we're in the same GROUP so it's fine, right?",
    "Priest keeps giving me suspicious looks. I'm not summoning anything evil. RIGHT NOW.",
    "The priest and I have an understanding: they don't ask about my demons, I don't ask about their shadow spec.",
    "I gave the priest a Healthstone. They seemed uncomfortable. It's just compressed suffering. Totally safe.",
    "The priest uses Shadow magic sometimes. And then acts surprised when I say we're similar. We ARE.",
})
B("WARLOCK", "PRIEST", "MANA_ZERO", {
    "Priest OOM. I'd offer to help but my mana recovery method involves blood. Yours specifically? No. Mine.",
    "Healer is dry. Maybe if they'd taken my Healthstone earlier... but no, 'the Light provides.' Where is it now?",
})

-- WARLOCK → ROGUE
B("WARLOCK", "ROGUE", "PLAYER_DEAD", {
    "The rogue died. Silently, at least. They lived silently too. Consistent.",
    "Rogue's dead. Vanish was on cooldown? My demons don't HAVE cooldowns. Well... they have attitudes.",
})
B("WARLOCK", "ROGUE", "AMBIENT", {
    "The rogue thinks they understand darkness because they hide in shadows. Adorable.",
    "I have a Voidwalker. The rogue has 'stealth.' One of us is actually invisible. The other is shimmering.",
    "The rogue pickpocketed my imp. My IMP. What did you expect to find?",
    "We both deal in underhanded methods. But MY methods involve actual supernatural entities.",
})

-- WARLOCK → HUNTER
B("WARLOCK", "HUNTER", "PLAYER_DEAD", {
    "Hunter died. Pet lived. I relate — my demon would also absolutely let me die.",
    "The hunter is dead but their pet is still fighting. Kindred spirit — my imp does the same.",
    "We both have pets. Mine is from the Nether. Theirs is from... Durotar? Different sourcing.",
})
B("WARLOCK", "HUNTER", "WIPE", {
    "Hunter Feigned Death. I actually DIE and come back via Soulstone. Who's more committed?",
    "The hunter faked dying. I think about dying constantly. We approach death differently.",
})
B("WARLOCK", "HUNTER", "AMBIENT", {
    "The hunter has a pet. I have a demon. The hunter's comes when called. Mine complains. We are not the same.",
    "My imp has more personality than the hunter's cat. My imp also has MORE ATTITUDE than the hunter.",
    "The hunter feeds their pet. I sustain my demon with suffering. Different management styles.",
    "We both command minions. Mine is from the void. Theirs fetches sticks. Professional gap.",
})

-- WARLOCK → DRUID
B("WARLOCK", "DRUID", "PLAYER_DEAD", {
    "The druid died mid-shift. Not sure what form they were going for. Not sure it mattered.",
    "Druid's dead. Nature called them home. Permanently, this time.",
})
B("WARLOCK", "DRUID", "AMBIENT", {
    "The druid serves nature. I serve... well, let's not compare employers.",
    "The druid can shapeshift into animals. I can summon things from the Twisting Nether. Both cool. Mine's cooler.",
    "The druid communes with trees. I commune with demons. Both valid forms of therapy.",
    "The druid offered me Mark of the Wild. I accepted. Even dark magic benefits from... nature stats.",
})

-- WARLOCK → PALADIN
B("WARLOCK", "PALADIN", "PLAYER_DEAD", {
    "Someone died near the paladin. The paladin, encased in Light, survived. Typical.",
    "The paladin didn't die because the paladin NEVER dies. Light magic. Cheating. Same thing.",
})
B("WARLOCK", "PALADIN", "WIPE", {
    "Paladin bubbled through the wipe. Glowing gold while everyone died. How... holy of them.",
    "I Soulstoned myself. The paladin bubbled. We both cheated death. Don't lecture me about morality.",
})
B("WARLOCK", "PALADIN", "AMBIENT", {
    "The paladin keeps cleansing my Healthstone effect. IT'S A BUFF. STOP CLEANSING MY BUFFS.",
    "Light versus dark. The paladin and I are natural opposites. In a group together. Awkward.",
    "The paladin looked at my demon and sighed. Loudly. VERY loudly. We get it. You disapprove.",
    "The paladin refuses my Soulstone because it's 'dark magic.' It's a FREE REZ. Drop the theology.",
})
B("WARLOCK", "PALADIN", "COMBAT_START", {
    "The paladin charges in glowing. I send my demon in, also glowing. Different glow. Same energy.",
})

-- WARLOCK → SHAMAN
B("WARLOCK", "SHAMAN", "PLAYER_DEAD", {
    "Shaman's dead. But they'll come back. Must be nice to cheat death with a rock.",
    "The shaman died. Then stood up. Ankh magic. I use Soulstones. Same vibe. Different aesthetic.",
})
B("WARLOCK", "SHAMAN", "AMBIENT", {
    "The shaman speaks to elements. I speak to demons. We both talk to things others can't see.",
    "Four totems on the ground. Interesting. My demon is essentially a mobile totem. With teeth.",
    "The shaman dropped Mana Spring Totem. Free mana from a stick. Even I'm impressed.",
})

-- WARLOCK → PIRATE
B("WARLOCK", "PIRATE", "AMBIENT", {
    "The pirate fears nothing. That's foolish. Fear is useful. I can show them.",
    "I offered the pirate a Healthstone. They tried to drink it. That's... not how it works.",
})

--=========================================================================
--  P R I E S T   reacting to others
--=========================================================================

-- PRIEST → WARRIOR
B("PRIEST", "WARRIOR", "PLAYER_DEAD", {
    "The TANK is dead. I was healing them. MY heals were landing. They just took 8,000 damage in 2 seconds.",
    "Warrior down. I was casting. The heal was 0.3 seconds from landing. I'll live with this guilt forever.",
    "The tank died and everyone's going to blame me. I was healing. I was ALWAYS healing. Check the logs.",
    "I healed the warrior for 15,000 HP this fight. They took 17,000. I can't outpace a freight train.",
})
B("PRIEST", "WARRIOR", "WIPE", {
    "Wipe because the tank went down. Do you know what that FEELS like as a healer? MY fault. Always my fault.",
    "Warrior charged into three groups. THREE. I healed through one. Almost through two. Not three. Nobody heals through three.",
    "I used every spell, every cooldown, every drop of mana. The warrior still died. And then I died. And then everyone died. But sure, 'healer's fault.'",
})
B("PRIEST", "WARRIOR", "HEALTH_LOW", {
    "I SEE your health bar. I am ALWAYS looking at your health bar. It's all I do. Cast incoming.",
    "Warrior at 30%. Heal landing in — casting — DON'T MOVE. Stay in range. STAY IN RANGE.",
    "Healing the tank. Again. This is my entire life. Cast. Cast. Cast. OOM. Pray.",
})
B("PRIEST", "WARRIOR", "COMBAT_START", {
    "Warrior's charging in. Here we go. *begins casting before they even reach the mob*",
    "Shield on the tank. Renew on the tank. And we pray. Standard priest opening.",
})
B("PRIEST", "WARRIOR", "AMBIENT", {
    "The warrior thinks they're the backbone of this group. Cute. Without my heals, they're a paperweight in plate.",
    "I buffed the warrior. Fort. Spirit. Shadow Prot. They said 'thanks.' Almost made all the healing worth it. Almost.",
    "Warrior is full health and I have 20% mana. That's the healer experience. Beautiful, isn't it?",
    "The tank is sitting at full HP drinking a beer while I drink mana water. The audacity.",
})
B("PRIEST", "WARRIOR", "MANA_ZERO", {
    "I'm OOM. Because I spent it all on the WARRIOR. Who still needs healing. Who ALWAYS needs healing.",
    "No mana. The tank is still pulling. THE TANK IS STILL PULLING. DO THEY NOT SEE MY MANA BAR?",
})

-- PRIEST → MAGE
B("PRIEST", "MAGE", "PLAYER_DEAD", {
    "Mage died. One-shot. 4,000 HP and ZERO awareness. I can't heal through 'instantly dead.'",
    "The mage died and it's NOT my fault. They went from 100% to 0% in one global. Nothing could save that.",
    "Mage down. Cloth armor. Standing in front. What was the PLAN?",
})
B("PRIEST", "MAGE", "WIPE", {
    "Wipe. The mage pulled aggro with a crit and died. Then the tank died. Then me. Thanks, big numbers.",
    "The mage's Fireball critted for 3K. Pulled aggro. Died. We wiped. Hope that DPS meter was worth it.",
})
B("PRIEST", "MAGE", "AMBIENT", {
    "The mage gave me water. I'll remember that. One act of kindness per dungeon keeps the heals flowing.",
    "I have to heal the mage AND the tank. The mage has 40% of the tank's HP. It's like healing a hummingbird.",
    "The mage keeps Blinking out of my healing range. Do they WANT to die?",
    "Thank you for the conjured water, mage. It's the only thing between me and a wipe.",
})
B("PRIEST", "MAGE", "HEALTH_LOW", {
    "Mage is low. Throwing a heal. Please stand still. PLEASE. Stop Blinking. STOP.",
    "Mage at 20%. That's like 800 HP. One more hit and they're done. HEAL LANDING. STAND. STILL.",
})

-- PRIEST → WARLOCK
B("PRIEST", "WARLOCK", "PLAYER_DEAD", {
    "The warlock died. They Life Tapped at 30% health during a damage spike. I cannot fix stupidity.",
    "Warlock is dead. They drained their own health THEN got hit. I was healing the TANK. I can't be everywhere.",
})
B("PRIEST", "WARLOCK", "HEALTH_LOW", {
    "Warlock is low. Because they Life Tapped. AGAIN. I see you. Do NOT Life Tap while I'm healing the tank.",
    "The warlock is low HP. By choice. THEIR choice. And now it's MY problem.",
    "Life Tap. Life Tap. Life Tap. Then 'healz plz.' I hate this class.",
    "I'm going to let the warlock sit at low HP for a second. Just to make a point. ...okay fine, healing.",
})
B("PRIEST", "WARLOCK", "AMBIENT", {
    "The warlock Life Taps and then looks at me expectantly. Like I'm a mana-to-health ATM.",
    "I heal the warlock knowing they'll immediately Life Tap it away. This is my Sisyphean nightmare.",
    "The warlock and I have opposite jobs. I give health. They throw it away. Intentionally.",
    "Warlock took the Healthstone instead of asking me for heals. THANK YOU. Self-sufficiency. Finally.",
})
B("PRIEST", "WARLOCK", "MANA_ZERO", {
    "I'm OOM because I spent half my mana healing the warlock's SELF-INFLICTED damage. Life Tap is a sin.",
    "No mana. And the warlock is Life Tapping. They are converting THEIR health into mana while I have NONE. Coincidence?",
})

-- PRIEST → ROGUE
B("PRIEST", "ROGUE", "PLAYER_DEAD", {
    "Rogue's dead. They were behind the boss. OUT of my heal range. I can't heal what I can't TARGET.",
    "The rogue died. I didn't even know they were here. Stealth means I can't see your health bar either.",
    "Rogue down. I healed the tank. The tank lived. The rogue, who was invisible, did not. Triage.",
})
B("PRIEST", "ROGUE", "AMBIENT", {
    "The rogue is stealthed. I can't pre-heal stealth. I can't shield stealth. I can't even SEE stealth.",
    "When the rogue unstealths I throw a Renew. The 3-second window between Stealth and Taking Damage. My specialty.",
    "I'd heal the rogue more if I could FIND them. They're always behind something. In shadows. Where heals don't reach.",
})

-- PRIEST → HUNTER
B("PRIEST", "HUNTER", "PLAYER_DEAD", {
    "Hunter died. The pet lived. Do I need to heal the PET now? Is that what we've come to?",
    "The hunter is dead. They were standing at max range. Forty yards away. My heals go twenty. DO THE MATH.",
    "Hunter down. I was healing the tank. The hunter was in a different zip code. I can't help that.",
})
B("PRIEST", "HUNTER", "AMBIENT", {
    "The hunter's pet took damage. The hunter is looking at me. No. I'm not healing the PET.",
    "I heal five people. Sometimes six if you count my own sanity. The PET is not on my list.",
    "Hunter keeps Feigning Death and I panic-target them thinking they're dying. STOP THAT.",
    "The hunter stood in fire. At range. 40 YARDS from the boss. HOW? How is there fire at 40 yards?!",
})
B("PRIEST", "HUNTER", "HEALTH_LOW", {
    "Hunter is low. They're also 30 yards away. I'm running toward them casting. Stay. Still.",
    "The hunter doesn't know what 'line of sight' means. They're behind a pillar. I can't heal through geology.",
})

-- PRIEST → DRUID
B("PRIEST", "DRUID", "PLAYER_DEAD", {
    "The druid died. They can also heal. They CHOSE not to heal themselves. I have questions.",
    "Druid down. Another healer. Dead. I'm the only one keeping this group alive and it shows.",
    "The druid has bear form. And healing spells. And they still died. In cat form. Priority disorder.",
})
B("PRIEST", "DRUID", "HEALTH_LOW", {
    "Druid is low. Druid can also heal. Should I heal them or should they heal themselves? The eternal question.",
    "The druid is at 30% HP and they're in CAT FORM. Shift and heal yourself! I'm busy with the tank!",
})
B("PRIEST", "DRUID", "AMBIENT", {
    "Another healer in the group. The druid. Do they help heal? Sometimes. When they remember they can.",
    "The druid keeps offering to off-heal. Then goes cat. Then goes bear. Then needs healing themselves.",
    "The druid has Innervate. I want Innervate. The druid used Innervate on themselves. Of COURSE they did.",
    "If the druid would Innervate me, nobody would ever die. NOBODY. But no. They keep it. For THEMSELVES.",
})
B("PRIEST", "DRUID", "MANA_ZERO", {
    "I'm OOM. The druid has Innervate. The druid is saving Innervate. FOR THEMSELVES. Typical.",
    "No mana. The druid could fix this. With ONE spell. They won't. Because druids only Innervate druids.",
})

-- PRIEST → PALADIN
B("PRIEST", "PALADIN", "PLAYER_DEAD", {
    "Someone died. Near a paladin. With Lay on Hands available. I have SO many questions.",
    "The paladin didn't use Blessing of Protection. Lay on Hands was off cooldown. They had BUBBLE. Someone still died.",
    "I healed through the whole fight. The paladin used ALL their saves on themselves. We lost a DPS. Unrelated? No.",
})
B("PRIEST", "PALADIN", "WIPE", {
    "Wipe. I went OOM healing. The paladin survived in their bubble. Watching. WATCHING.",
    "The paladin was the last one alive. As always. Bubble. Auto-attack. Die when the bubble fades. Every time.",
})
B("PRIEST", "PALADIN", "AMBIENT", {
    "Two Light users in one group. The paladin and me. They can't die. I can't stop healing. Great combo.",
    "The paladin has 3 blessings, 2 immunities, and Lay on Hands. I have Prayer of Healing and ANXIETY.",
    "The paladin is unkillable and they KNOW IT. The smugness radiates brighter than their aura.",
    "I WISH I had a bubble. A 12-second immunity? Do you know what I could do with 12 seconds of not healing?!",
})

-- PRIEST → SHAMAN
B("PRIEST", "SHAMAN", "PLAYER_DEAD", {
    "The shaman died. Then stood back up. While I'm over here spending 3 seconds casting Resurrection. THEY JUST STAND UP.",
    "Shaman died and self-rezzed. My rez costs mana AND a cast time. Theirs costs an ankh. I'm jealous.",
})
B("PRIEST", "SHAMAN", "AMBIENT", {
    "Two healers. The shaman drops totems that heal. I cast heals manually. One of us is working harder.",
    "The shaman dropped Mana Spring. Free mana? From a stick? I love this shaman. Don't tell them.",
    "If the shaman's Mana Tide could last forever, I'd never go OOM. But it's 12 seconds. Life is cruel.",
    "The shaman can self-rez. I can rez others. Between us, nobody stays dead. Theoretically.",
})
B("PRIEST", "SHAMAN", "MANA_ZERO", {
    "OOM. The shaman dropped Mana Tide. It helped. For 12 seconds. Give me a permanent one. PLEASE.",
})

-- PRIEST → PIRATE
B("PRIEST", "PIRATE", "HEALTH_LOW", {
    "The pirate is low. Probably from drinking. In combat. I'll heal them anyway. It's what I do.",
})
B("PRIEST", "PIRATE", "AMBIENT", {
    "I heal sinners and saints alike. The pirate tests this philosophy daily.",
    "The pirate asked if the Light could fix their liver. I said I'd pray about it.",
})

--=========================================================================
--  R O G U E   reacting to others
--=========================================================================

-- ROGUE → WARRIOR
B("ROGUE", "WARRIOR", "PLAYER_DEAD", {
    "The tank died. Guess who's getting aggro next. Guess who does NOT want aggro. Me. It's me.",
    "Warrior's down. I'm Vanishing. Not because I'm scared. Because I'm STRATEGIC.",
    "Tank's dead. I'm stealthing. Good luck everyone. I'll be... nearby. Invisible. Alive.",
    "The walking aggro magnet died. Time for plan B. Plan B is Vanish. It's always Vanish.",
})
B("ROGUE", "WARRIOR", "WIPE", {
    "Wipe. I Vanished. Survived. The warrior died in a blaze of 'glory.' I died of boredom watching.",
    "The warrior went down swinging. I went down... sneaking. To the corner. Where I survived.",
    "Everyone died heroically. I hid. Successfully. This is why I'm alive and they're not.",
})
B("ROGUE", "WARRIOR", "AMBIENT", {
    "The warrior has 'honor' and 'glory.' I have Vanish and a survival rate. Who's really winning?",
    "I don't stand in front of things. I stand BEHIND things. And stab them. The warrior and I have different philosophies.",
    "The warrior calls me a coward. I call them a corpse. Regularly.",
    "Big armor. Big sword. Big target. I'll stay in the shadows, thanks.",
    "The warrior thinks strength is everything. I think POSITIONING is everything. There are no positions when you're dead.",
})
B("ROGUE", "WARRIOR", "COMBAT_START", {
    "Warrior's charging in. I'll wait 2 seconds. Then Cheap Shot from behind. Civilized combat.",
    "The big one goes first. I go second. From stealth. Where it's safe.",
})

-- ROGUE → MAGE
B("ROGUE", "MAGE", "PLAYER_DEAD", {
    "Mage died. At least I can Vanish. They can Iceblock. For 10 seconds. Then die anyway.",
    "The mage is dead. Cloth + visible = dead. I'm cloth-adjacent and INVISIBLE. Important difference.",
    "Mage down. They aggroed with a big crit. In plain sight. Never heard of subtlety?",
})
B("ROGUE", "MAGE", "AMBIENT", {
    "The mage is casting with the subtlety of a fireworks display. I prefer the quiet approach.",
    "I asked the mage for food. They made a whole table appear. That's... fine. Not stealthy. But fine.",
    "Frost Nova rooted me during a pull. ME. The melee DPS. Mage. We need to talk.",
    "I could Vanish and the mage could Iceblock. We both avoid death differently. Mine's cooler.",
})

-- ROGUE → PRIEST
B("ROGUE", "PRIEST", "PLAYER_DEAD", {
    "Someone died. Healer, I notice I'm still alive. Just saying. KEEP it that way.",
    "Priest, I don't need many heals. I Vanish when it hurts. But WHEN I do need heals, I NEED them.",
})
B("ROGUE", "PRIEST", "HEALTH_LOW", {
    "Priest, I'm behind the boss. I'm hard to see. I know. But I NEED heals. I am HERE. Back here. Stabbing.",
    "Low health. I can Vanish. Or you can heal me. One costs me DPS. How much do you care about the meter?",
    "I'm low. I respect that you're busy. But if I die, the boss doesn't die. Connect the dots.",
})
B("ROGUE", "PRIEST", "AMBIENT", {
    "The healer keeps me alive. I keep the healer alive by killing things before they get close. Symbiosis.",
    "If the priest dies, I'm Vanishing. Not running. Not fighting. Vanishing. Just so we're clear.",
    "The priest can see HP bars. I wonder if they can see mine from behind the boss. Probably not. Terrifying.",
})

-- ROGUE → HUNTER
B("ROGUE", "HUNTER", "PLAYER_DEAD", {
    "Hunter's dead. But their pet's still alive, so they're basically still contributing. Same amount as before.",
    "The hunter died. We had the same range advantage. I also have STEALTH. Upgrade your escape plan.",
})
B("ROGUE", "HUNTER", "WIPE", {
    "Hunter Feigned. I Vanished. We're the two survivors. The coward's alliance.",
    "Feign Death and Vanish: the two abilities that make you friends in a wipe and enemies in everything else.",
})
B("ROGUE", "HUNTER", "AMBIENT", {
    "The hunter has a pet for tanking. I have stealth for avoiding. Different philosophies, same goal: not dying.",
    "Both Feign Death and Vanish are 'pretend you're not here.' We're more alike than I'd like to admit.",
    "The pet keeps breaking my Sap. KEEP. THE PET. AWAY. FROM MY SAP TARGET.",
    "Hunter tracked me in stealth. With TRACK HUMANOIDS. That's RUDE. That's my personal space.",
})
B("ROGUE", "HUNTER", "COMBAT_START", {
    "Hunter opens from range. I open from stealth. Both good plans. Mine involves more stabbing.",
})

-- ROGUE → WARLOCK
B("ROGUE", "WARLOCK", "PLAYER_DEAD", {
    "Warlock's dead. Demon's fine. I know the feeling — your minion outliving you. Except I don't have a minion.",
    "The warlock died. Life Tapped too much? Live by the blood, die by the blood.",
})
B("ROGUE", "WARLOCK", "AMBIENT", {
    "The warlock is dark and mysterious. I'M dark and mysterious. There's only room for ONE in this party.",
    "I hide in shadows. The warlock commands shadows. Professional overlap. I'm filing a complaint.",
    "The warlock's imp is the only thing louder than a paladin's aura. That little fire guy never shuts up.",
    "The warlock offered me a Healthstone. A free heal rock? I'll take six.",
})

-- ROGUE → DRUID
B("ROGUE", "DRUID", "PLAYER_DEAD", {
    "The druid died. In caster form. They had STEALTH. In cat! They had an exit! They WASTED it!",
    "Druid down. They have stealth. In cat. And they didn't use it. Amateur hour.",
})
B("ROGUE", "DRUID", "AMBIENT", {
    "The druid has stealth. In cat form. MY stealth is BETTER. More consistent. Don't even compare us.",
    "Druid prowls around in cat form. Cute. I've been stealthing since level 1. They're a tourist.",
    "Cat form stealth is a DISCOUNT version of real stealth. There, I said it.",
    "The druid can stealth AND heal. If I could heal in stealth, I'd be UNSTOPPABLE.",
})

-- ROGUE → PALADIN
B("ROGUE", "PALADIN", "PLAYER_DEAD", {
    "Someone died. The paladin bubbled. I Vanished. Two survivors. Two different escape artists.",
    "I Vanish. The paladin bubbles. We're both alive. The dead person is neither of us. System works.",
})
B("ROGUE", "PALADIN", "WIPE", {
    "Wipe. Paladin bubbled. I Vanished. We both survived. We're the two people who refuse to die.",
    "I survived the wipe in stealth. The paladin survived in a bubble. The rest? Thoughts and prayers.",
})
B("ROGUE", "PALADIN", "AMBIENT", {
    "The paladin glows. I don't glow. Glowing is the OPPOSITE of stealth. I'll never understand.",
    "The paladin can't die. I choose not to die. Different approaches, same result.",
    "I offered to Sap a target. The paladin judged it. JUDGED IT. Before I could SAP it. Why.",
    "Bubble-hearth is the paladin's Vanish. Except MORE obvious and LESS subtle. But effective.",
})

-- ROGUE → SHAMAN
B("ROGUE", "SHAMAN", "PLAYER_DEAD", {
    "Shaman died. Then stood back up. Like it was nothing. I Vanish to AVOID death. They just... undo it.",
    "The shaman rezzed themselves. I can't even rez OTHERS. They rez THEMSELVES. Unfair ability.",
})
B("ROGUE", "SHAMAN", "AMBIENT", {
    "The shaman puts sticks on the ground. I prefer a more MOBILE approach to combat. Sticks can't Vanish.",
    "Windfury procced on me. Hit the mob three extra times. Whatever the shaman is doing with those sticks, keep doing it.",
    "Totems are like traps that DON'T stealth. I don't understand the appeal. But the buffs are nice.",
})

-- ROGUE → PIRATE
B("ROGUE", "PIRATE", "AMBIENT", {
    "The pirate thinks they're sneaky because they're a criminal. I'm PROFESSIONALLY sneaky. There's a difference.",
    "Pirate said 'we should work together.' Never work with someone louder than your stealth.",
    "The pirate has a cutlass. I have two daggers. Dual wield beats single wield. It's math.",
})

--=========================================================================
--  H U N T E R   reacting to others
--=========================================================================

-- HUNTER → WARRIOR
B("HUNTER", "WARRIOR", "PLAYER_DEAD", {
    "Tank's dead. My pet is eyeing the boss. My pet wants to tank. Should I... let it?",
    "Warrior down. My pet could tank. I'm not saying it SHOULD, but it COULD. And it's cheaper on repairs.",
    "The tank died. If only they had a pet to take the hits for them. Oh wait — that's MY class.",
})
B("HUNTER", "WARRIOR", "WIPE", {
    "Wipe. Feigned Death. Survived. My pet survived. We're the real team here.",
    "The warrior died heroically. I Feigned Death. My pet sat on the warrior's corpse. Disrespectful, but alive.",
})
B("HUNTER", "WARRIOR", "AMBIENT", {
    "The warrior tanks with a shield. My pet tanks with its FACE. Both valid.",
    "I have a pet to take hits and I STILL won't tank. That's how much I value not being in melee.",
    "The warrior called my pet 'useless.' My pet has higher DPS than the warrior. Don't @ me.",
    "I stand 40 yards away and shoot things. The warrior stands 0 yards away and gets hit. Different intelligence levels.",
})
B("HUNTER", "WARRIOR", "COMBAT_START", {
    "Warrior charges. I send the pet. ...wait, the pet went FIRST. I swear I pressed 'Stay.' I SWEAR.",
    "Tank's going in. Auto Shot engaged. From over here. Where it's safe.",
})

-- HUNTER → MAGE
B("HUNTER", "MAGE", "PLAYER_DEAD", {
    "Mage died. Also a ranged class. Also squishy. But I have Feign Death and THEY don't. Sorry.",
    "The mage died at range. I survived at range. What's the difference? Feign Death. And a pet. And humility.",
})
B("HUNTER", "MAGE", "AMBIENT", {
    "The mage conjures food from thin air. I... buy mine. At a vendor. Who charges. Whatever.",
    "I asked the mage for food. For my pet. They sighed. LOUDLY. I need 60 portions. The pet is hungry.",
    "The mage does magic from 30 yards. I shoot things from 40 yards. I outrange MAGIC. Think about it.",
    "My pet just ate the mage's conjured food table. ALL of it. The mage is staring at me. I'm looking away.",
})
B("HUNTER", "MAGE", "LOOT", {
    "I need that. For... my ranged attack power. And my pet. Mostly my pet. My pet needs things.",
    "Mage wants it for intellect. I want it for... also intellect? We use mana too. Technically.",
})

-- HUNTER → PRIEST
B("HUNTER", "PRIEST", "PLAYER_DEAD", {
    "Someone died. Healer, I'm at max range. I'm hard to heal. I KNOW. But please try.",
    "Deaths happened. I was at 40 yards. The longest heal range is 30. I don't make the rules.",
})
B("HUNTER", "PRIEST", "HEALTH_LOW", {
    "I'm low. I'm also very far away. This is a ME problem. Feign Death is my heal.",
    "Priest, I'm taking damage back here at max range. I know healers can't reach this far. I'll manage. Pet, TANK.",
})
B("HUNTER", "PRIEST", "AMBIENT", {
    "The priest keeps healing my pet. I didn't ask, but I appreciate it. The pet appreciates NOTHING.",
    "Priest said 'I'm not healing your pet.' Then healed my pet. They have a big heart.",
    "Healer keeps forgetting I exist back here at range. That's fair. I forget about them too. Until I'm dying.",
})

-- HUNTER → DRUID
B("HUNTER", "DRUID", "PLAYER_DEAD", {
    "Druid's dead. They had cat form. Cats are great. My pet cat agrees. We're cat people.",
    "The druid died in bear form. My pet is tougher than bear form. Just saying.",
})
B("HUNTER", "DRUID", "AMBIENT", {
    "The druid turns into animals. I BEFRIEND animals. One of us has a healthier relationship with nature.",
    "Cat form druid thinks they're stealthy. My pet can TRACK them. In stealth. Nature BETRAYS you, druid.",
    "The druid can be a bear. My pet IS a bear. My bear is better. It listens. ...sometimes.",
    "I have a pet cat. The druid IS a cat. We bonded over this. Briefly. Then they went bear.",
})

-- HUNTER → WARLOCK
B("HUNTER", "WARLOCK", "PLAYER_DEAD", {
    "Warlock died. Demon survived. Finally, someone who understands the pet-owner dynamic.",
    "The warlock is dead but their demon is fighting. Soul mates. My pet and I. Same dynamic. Different dimension.",
})
B("HUNTER", "WARLOCK", "AMBIENT", {
    "The warlock has a pet from hell. I have a pet from Ashenvale. Both are disobedient.",
    "My pet and the warlock's demon are staring at each other. I don't like it. There's tension.",
    "The warlock's imp does fire damage. My pet does bite damage. Different skill sets. Both underpaid.",
    "I tame my pets with love. The warlock enslaves theirs with dark magic. Different management styles.",
})

-- HUNTER → PALADIN
B("HUNTER", "PALADIN", "PLAYER_DEAD", {
    "Someone died near the paladin. Not the paladin. Never the paladin. My pet has better survival odds than ANYONE except a paladin.",
    "The paladin didn't save them. The paladin saved ITSELF. As a hunter, I respect self-preservation.",
})
B("HUNTER", "PALADIN", "AMBIENT", {
    "The paladin can't die. My pet can't die if I keep healing it. We're both immortal by proxy.",
    "I have Feign Death. The paladin has Bubble. When we're both in the party, nobody REALLY dies.",
    "The paladin is glowing. My pet is growling. Between the glow and the growl, we've got it covered.",
})

-- HUNTER → ROGUE
B("HUNTER", "ROGUE", "PLAYER_DEAD", {
    "Rogue's dead. Vanish was down? That's rough. At least I have Feign Death AND a pet. Backup plans.",
    "The rogue died in melee. This is why I fight from 40 yards away. With arrows. Like a civilized person.",
})
B("HUNTER", "ROGUE", "AMBIENT", {
    "The rogue is stealthed. My Track Humanoids sees them. Right... there. *points* Don't tell them I can see them.",
    "I can track stealthed rogues. They don't know. It's my favorite secret.",
    "Feign Death and Vanish. Both make you 'not there.' But my pet can TRACK Vanished rogues. Just saying.",
    "The rogue broke my Freezing Trap. MY TRAP. I placed it specifically. RIGHT THERE. And they walked THROUGH it.",
})

-- HUNTER → SHAMAN
B("HUNTER", "SHAMAN", "PLAYER_DEAD", {
    "Shaman died. Then rezzed. My pet doesn't do that. I want a pet that self-rezzes.",
    "The shaman came back from the dead. Meanwhile, my Feign Death just PRETENDS to die. Less powerful.",
})
B("HUNTER", "SHAMAN", "AMBIENT", {
    "The shaman put totems near my pet. My pet is standing on one. The shaman is upset. The pet doesn't care.",
    "Windfury on my pet. My pet just hit the boss four times. FOUR TIMES. Whatever that totem does, KEEP IT DOWN.",
    "My pet and the shaman's totems: both ground-based. Both doing work. The pet moves, though. Advantage: pet.",
})

-- HUNTER → PIRATE
B("HUNTER", "PIRATE", "AMBIENT", {
    "The pirate wants my pet to be a 'first mate.' My pet isn't interested. My pet has standards. ...low standards, but standards.",
    "The pirate keeps calling my gun a 'boomstick.' ...that's actually accurate.",
})

--=========================================================================
--  D R U I D   reacting to others
--=========================================================================

-- DRUID → WARRIOR
B("DRUID", "WARRIOR", "PLAYER_DEAD", {
    "Warrior's dead. I could've gone bear and helped tank. I was in cat. I'm always in the wrong form.",
    "The tank died. I have Rebirth. But choosing WHEN to use it is the hardest decision of my life.",
    "Tank down. I shifted to bear to help. Then shifted to caster to heal. Then back to bear. Then they died.",
})
B("DRUID", "WARRIOR", "WIPE", {
    "Wipe. I was cat when we needed heals. Then bear when we needed DPS. Then dead when we needed anything.",
    "I could've saved this if I'd been in the right form. I was not. Story of my druid life.",
})
B("DRUID", "WARRIOR", "AMBIENT", {
    "The warrior only has ONE form. Must be simple. I have four. Each one gives me anxiety.",
    "I can tank like the warrior. In bear. But the warrior doesn't understand my FLEXIBILITY.",
    "The warrior asked if I'm tanking or healing. I said 'both?' They didn't laugh.",
    "Bear form vs. plate armor. Same concept. Except I can ALSO be a cat. Versatility wins.",
})

-- DRUID → MAGE
B("DRUID", "MAGE", "PLAYER_DEAD", {
    "Mage down. I had a heal ready. In caster form. I was in bear form. The form problem. Always the form problem.",
    "The mage died. I cast Rebirth. One use. The most expensive rez in the game. They better appreciate it.",
})
B("DRUID", "MAGE", "AMBIENT", {
    "The mage conjures food. I eat berries from the forest. Different lifestyles. Both valid. Mine's organic.",
    "I do nature magic. The mage does arcane magic. One of us works with nature. The other VIOLATES it.",
    "The mage called me a 'lesser caster.' I turned into a bear and sat on their foot. Argument won.",
    "I can moonfire. The mage can meteor. Scale difference. But MY spell is NATURAL.",
})

-- DRUID → PRIEST
B("DRUID", "PRIEST", "PLAYER_DEAD", {
    "Someone died. I could help heal but I was in bear form. Shifting takes a GCD and by then...",
    "The priest let someone die. I could've helped. But I had no mana. Because I was in cat. Because I'm a druid.",
})
B("DRUID", "PRIEST", "HEALTH_LOW", {
    "Priest is low. I'll throw a Rejuv. If I shift to caster. Which costs a GCD. Which might be too late. Druid anxiety.",
    "I'll help heal. After I shift. And find caster form. In the middle of combat. While panicking.",
})
B("DRUID", "PRIEST", "AMBIENT", {
    "The priest heals with the Light. I heal with nature. Mine involves more HoTs. And more shifting. And more stress.",
    "The priest wants my Innervate. Badly. I can FEEL them wanting it. Every pull. The eyes. The EYES.",
    "I'll Innervate the priest... eventually. When MY mana is sorted. Self-care.",
    "The priest heals in one form. I heal in one form. But I'm also in three OTHER forms, so I forget.",
})
B("DRUID", "PRIEST", "MANA_ZERO", {
    "Priest OOM. I have Innervate. ...do I give it? It's my Innervate. MY precious Innervate. ...fine. Take it.",
    "Healer OOM. Innervate deployed. The sacrifice was immense. Don't let anyone tell you druids are selfish.",
})

-- DRUID → ROGUE
B("DRUID", "ROGUE", "PLAYER_DEAD", {
    "Rogue's dead. They had stealth. I ALSO have stealth. In cat. Mine's better because I can heal after.",
    "The rogue died. They ONLY have stealth. I have stealth AND bear form AND heals. Druid supremacy.",
})
B("DRUID", "ROGUE", "AMBIENT", {
    "The rogue thinks they own stealth. I can ALSO stealth. In cat. It's less dramatic but MORE versatile.",
    "Cat form prowl vs. rogue stealth. The rogue's is better. There, I said it. Don't tell them.",
    "The rogue and I bonded over stealth. Then I went bear and the bonding was over.",
    "I can do everything the rogue does, plus heal, plus tank. Hybrid supremacy.",
})

-- DRUID → HUNTER
B("DRUID", "HUNTER", "PLAYER_DEAD", {
    "Hunter died. Pet survived. My cat form IS the pet and the hunter. Combined. Better.",
    "The hunter is dead but their pet is still going. I respect the pet. The pet understands commitment.",
})
B("DRUID", "HUNTER", "AMBIENT", {
    "The hunter TAMES animals. I BECOME animals. Which is more respectful? Debate.",
    "I can be a bear. The hunter's pet can be a bear. Two bears in one party. Nature is generous.",
    "The hunter's cat and my cat form locked eyes. It was weird. I shifted to bear. Less awkward.",
    "Mark of the Wild on the pet. Yes, I buff pets. No, I won't explain why.",
})

-- DRUID → PALADIN
B("DRUID", "PALADIN", "PLAYER_DEAD", {
    "The paladin didn't die. I also didn't die. Because I went bear. Two survivalists, one group.",
    "Someone died near the paladin. The paladin didn't bubble them. I didn't Rebirth them. We're both saving cooldowns.",
})
B("DRUID", "PALADIN", "AMBIENT", {
    "The paladin has plate. I have fur. Both are armor. Mine is... natural. And itchy.",
    "The paladin has blessings. I have Mark of the Wild. BOTH good. Mine's better. Don't argue.",
    "I can tank, heal, and DPS. The paladin can also tank, heal, and DPS. The hybrid competition is REAL.",
    "Fellow hybrid. We should stick together. Both of us do everything. Neither of us does it perfectly.",
})

-- DRUID → WARLOCK
B("DRUID", "WARLOCK", "AMBIENT", {
    "I serve nature. The warlock serves... the opposite of nature. We're in the same group. It's awkward.",
    "The warlock's magic feels wrong. Like standing downwind of a forest fire. But evil.",
    "I gave the warlock Mark of the Wild. They said 'nature's blessing on a dark servant? Delicious.' I regret it.",
})

-- DRUID → SHAMAN
B("DRUID", "SHAMAN", "PLAYER_DEAD", {
    "Shaman died and self-rezzed. I can Rebirth others but not myself. THEY rez THEMSELVES. How?",
    "The shaman rezzed with an ankh. I'd trade Rebirth for Reincarnation in a HEARTBEAT.",
})
B("DRUID", "SHAMAN", "AMBIENT", {
    "The shaman talks to elements. I talk to nature. We're both talking to things that don't talk back. Solidarity.",
    "Fellow nature class. The shaman and I understand that EVERYTHING is alive. Including the totems. Especially the totems.",
    "The shaman drops totems. I shift forms. We both have complicated rotations that nobody appreciates.",
})

-- DRUID → PIRATE
B("DRUID", "PIRATE", "AMBIENT", {
    "The pirate wants a parrot. I can turn into a bird. ...I should not turn into a parrot. But I could.",
    "The pirate threw me an orange for scurvy. Nature would've provided. But the orange was nice.",
})

--=========================================================================
--  P A L A D I N   reacting to others
--=========================================================================

-- PALADIN → WARRIOR
B("PALADIN", "WARRIOR", "PLAYER_DEAD", {
    "The warrior died. In plate. WITHOUT a bubble. How do they live like this?",
    "Warrior's down. Same armor type, no immunities. It's like playing without a safety net.",
    "The tank died. I had Lay on Hands. I used it on myself three pulls ago. Regrettable.",
    "I survived. The warrior didn't. We wear the same armor. The difference? THE LIGHT.",
})
B("PALADIN", "WARRIOR", "WIPE", {
    "Wipe. I survived — briefly — in my bubble. The warrior did not. Plate without bubble is just... plate.",
    "The warrior died honorably. I died 12 seconds later when my bubble wore off. Less honorably. But later.",
})
B("PALADIN", "WARRIOR", "AMBIENT", {
    "The warrior and I both wear plate. They have rage. I have the Light. One of us is always angry. The other glows.",
    "I blessed the warrior. Might. Because all they do is hit things. Might makes right. For them.",
    "The warrior doesn't have a bubble. A paladin without a bubble — that's basically what a warrior IS.",
    "We both wear plate. But only ONE of us can become invincible on command. I'm not gloating. I'm stating facts.",
})
B("PALADIN", "WARRIOR", "COMBAT_START", {
    "I'll judge it. The warrior will charge it. One of us has a plan. The other has rage.",
})

-- PALADIN → MAGE
B("PALADIN", "MAGE", "PLAYER_DEAD", {
    "The mage died. I could've used Blessing of Protection. But it was on cooldown. From protecting myself.",
    "Mage is dead. Cloth armor. The Light protects those who protect themselves. With plate. And shields.",
})
B("PALADIN", "MAGE", "AMBIENT", {
    "The mage studies. I pray. Both rigorous. Only one of us has immunity bubbles.",
    "I blessed the mage with Wisdom. Because they need all the wisdom they can get to survive in cloth.",
    "The mage and I are both intellect users. But I have plate, a shield, bubble, AND intellect. Overqualified.",
})

-- PALADIN → PRIEST
B("PALADIN", "PRIEST", "PLAYER_DEAD", {
    "The priest let someone die. I would've helped but Lay on Hands has a ONE HOUR cooldown. ONE. HOUR.",
    "Both Light wielders. Both had heals. One of us was on cooldown. You pick which.",
})
B("PALADIN", "PRIEST", "WIPE", {
    "Wipe. The priest went OOM. I had zero mana too. Two Light users. Zero mana between us. Poetic.",
    "We're both healers. We both failed. The Light has days like this too, apparently.",
})
B("PALADIN", "PRIEST", "AMBIENT", {
    "Two Light wielders. The priest heals by casting. I heal by existing and pressing one button every 8 seconds.",
    "The priest serves the Light. I AM the Light. Well, I channel it. Through armor. With a hammer.",
    "I respect the priest. Fellow Light user. Less armor. More spells. Different approach, same deity.",
    "The priest can Shadow spec. I find that... concerning. The Light has a dark side? No. I refuse to think about it.",
})

-- PALADIN → WARLOCK
B("PALADIN", "WARLOCK", "PLAYER_DEAD", {
    "The warlock died. I could've saved them but... dark magic users and the Light... it's complicated.",
    "Warlock down. The Light protects the RIGHTEOUS. I'm not saying they're not righteous. But...",
})
B("PALADIN", "WARLOCK", "AMBIENT", {
    "The warlock summons demons. I smite demons. We're in the same party. This is FINE.",
    "I cleansed the warlock out of habit. They screamed. 'That was a BUFF!' Sorry. Reflex.",
    "Light versus dark. In the same group. On the same side. Theology is complicated.",
    "The warlock offered me a Soulstone. A SOUL stone. Do they know what a soul IS to a paladin?",
    "I keep wanting to smite the warlock's imp. On principle. The imp FEELS evil. It's just sitting there. Evilly.",
})

-- PALADIN → ROGUE
B("PALADIN", "ROGUE", "PLAYER_DEAD", {
    "The rogue died. In the shadows. Alone. That's sad. Also preventable if they stood near my aura.",
    "Rogue down. They died outside my 30-yard aura. I can't bless what I can't reach.",
})
B("PALADIN", "ROGUE", "AMBIENT", {
    "The rogue operates in darkness. I operate in Light. We are philosophical opposites in the same party.",
    "I glow. The rogue hides. I'm a BEACON. They're a SHADOW. We shouldn't work together. But we do.",
    "Blessing the rogue with Might. Even shadows need strength.",
})

-- PALADIN → HUNTER
B("PALADIN", "HUNTER", "PLAYER_DEAD", {
    "Hunter's dead. Pet's alive. Blessing the pet now. The pet earned it.",
    "The hunter Feigned Death. Wait, no. Actually dead. I should've used Lay on Ha— nevermind.",
})
B("PALADIN", "HUNTER", "AMBIENT", {
    "I blessed the pet. The HUNTER got jealous. I blessed the hunter too. Everyone gets blessed.",
    "The hunter's pet is standing in my Consecration. It's HELPING. The fire is holy. The pet will be fine.",
    "The hunter and their pet need TWO blessings. Two mouths to bless. In a party of five that's SIX blessings total.",
})

-- PALADIN → DRUID
B("PALADIN", "DRUID", "PLAYER_DEAD", {
    "The druid died. They can do EVERYTHING and they still died. Meanwhile I just bubble and live.",
    "Druid down. Another hybrid. Less durable. No bubble. Tragic but predictable.",
})
B("PALADIN", "DRUID", "AMBIENT", {
    "Fellow hybrid. The druid and I both do everything. They shapeshift. I just... persist. Glowingly.",
    "Mark of the Wild and Blessing of Kings. Together. The stat boost is MAGNIFICENT.",
    "The druid said my blessings are 'almost as good as Mark of the Wild.' Almost?! ALMOST?!",
    "I can tank, heal, DPS. The druid can ALSO tank, heal, DPS. But can the druid BUBBLE? No. Advantage: me.",
})

-- PALADIN → SHAMAN
B("PALADIN", "SHAMAN", "PLAYER_DEAD", {
    "The shaman died. Then rezzed. I bubble to NOT die. They die and COME BACK. Different philosophies.",
    "Shaman down and back up. Ankh vs bubble. They cheat death. I prevent it. Both impressive.",
})
B("PALADIN", "SHAMAN", "AMBIENT", {
    "The shaman drops totems. I provide auras. Both are passive. Mine is attached to my BODY. Theirs is a stick.",
    "Blessing of Kings + Windfury Totem. The synergy. *chef's kiss*",
    "The shaman has four elements. I have the Light. ONE element. But it does EVERYTHING.",
    "Shaman can self-rez. I can bubble. Neither of us really dies. It's an unspoken kinship.",
})

-- PALADIN → PIRATE
B("PALADIN", "PIRATE", "AMBIENT", {
    "The pirate is... not traditionally a follower of the Light. I'm praying for them anyway.",
    "I blessed the pirate. They bit the blessing. Thought it was a gold coin. We're working on it.",
})

--=========================================================================
--  S H A M A N   reacting to others
--=========================================================================

-- SHAMAN → WARRIOR
B("SHAMAN", "WARRIOR", "PLAYER_DEAD", {
    "Tank's dead. I dropped a healing totem. The totem tried. The totem always tries.",
    "Warrior down. If I had Rebirth like a druid... but no. I save Reincarnation for ME.",
    "The warrior died. Windfury was proccing beautifully on them. A waste of good procs.",
})
B("SHAMAN", "WARRIOR", "WIPE", {
    "Wipe. I Reincarnated. The warrior is jealous. I can feel the jealousy from their corpse.",
    "I came back with Ankh. The warrior gets a corpse run. The elements play favorites.",
})
B("SHAMAN", "WARRIOR", "AMBIENT", {
    "The warrior wants Windfury. EVERYONE wants Windfury. I'm a totem dispenser, apparently.",
    "I dropped Windfury and the warrior hit like a truck. You're WELCOME. Nobody thanks the totem shaman.",
    "Four totems around the warrior. They didn't notice. Just kept swinging. NOBODY notices the totems.",
    "Strength of Earth Totem. For the warrior. Who didn't say thanks. The totem is also offended.",
})
B("SHAMAN", "WARRIOR", "COMBAT_START", {
    "Windfury down. Go hit things, warrior. The wind is with you. Literally.",
    "Totems planted! Warrior, stand near the sticks. NEAR. THE. STICKS.",
})

-- SHAMAN → MAGE
B("SHAMAN", "MAGE", "PLAYER_DEAD", {
    "Mage is dead. I have a rez — after combat. Ancestral Spirit. It's slow but it works.",
    "The mage died. Earth mourns. Water weeps. Fire doesn't care. Air was blowing somewhere else.",
})
B("SHAMAN", "MAGE", "AMBIENT", {
    "The mage uses fire magic. I ALSO use fire magic. Through totems. And Flame Shock. We're fire buddies.",
    "I control lightning. The mage controls frost. Between us, we're a weather system.",
    "The mage thinks arcane mastery beats elemental communion. I lit them on fire once. Accidentally. Point made.",
    "I asked the mage for conjured water. They gave me 40 stacks. Mages are useful. ONCE per rest break.",
})

-- SHAMAN → PRIEST
B("SHAMAN", "PRIEST", "PLAYER_DEAD", {
    "Someone died. I was healing. With Chain Heal. It bounced to three people. Not the dead one.",
    "The priest let someone die. I threw a Chain Heal. It bounced the wrong way. Deaths are complicated.",
})
B("SHAMAN", "PRIEST", "AMBIENT", {
    "Two healers. My healing bounces. Theirs doesn't. Chain Heal superiority is real.",
    "The priest heals one person at a time. I heal three. With one spell. CHAIN. HEAL.",
    "Mana Spring Totem for the priest. You're welcome. My totem is working harder than both of us.",
    "The priest uses the Light. I use the elements. Both heal. Mine has more... weather.",
})
B("SHAMAN", "PRIEST", "MANA_ZERO", {
    "Priest OOM. Mana Tide dropped. Drink from the totem, priest. It's free elemental mana.",
    "OOM healer? Mana Tide fixes that. For 12 seconds. Then we're both OOM again. But for 12 seconds, we're GODS.",
})

-- SHAMAN → WARLOCK
B("SHAMAN", "WARLOCK", "PLAYER_DEAD", {
    "Warlock's dead. The elements don't mourn dark magic users. I'll rez them anyway. Professionally.",
    "The warlock died and their demon is STILL fighting. That's... dedication. Or demonic contract law.",
})
B("SHAMAN", "WARLOCK", "AMBIENT", {
    "The warlock summons demons. I summon elements. One of us is in touch with nature. The other is not.",
    "Fire totem and fire imp. Side by side. The fire totem feels UNCOMFORTABLE. I can tell.",
    "I communicate with spirits. The warlock communicates with demons. Different realms, same concept.",
})

-- SHAMAN → ROGUE
B("SHAMAN", "ROGUE", "PLAYER_DEAD", {
    "Rogue's dead. They were behind the boss. My totems were in front. We cover different zones.",
    "The rogue died in melee. My totems, which are ALSO in melee, survived. Totems: 1. Rogue: 0.",
})
B("SHAMAN", "ROGUE", "AMBIENT", {
    "I can't see the rogue. My totems can't see the rogue. But Windfury still procs on them. Trust the sticks.",
    "The rogue moved out of totem range. AGAIN. Stay near the sticks! The sticks HELP you!",
    "I dropped Windfury and the rogue's daggers went crazy. You're WELCOME. The totem did that.",
})

-- SHAMAN → HUNTER
B("SHAMAN", "HUNTER", "PLAYER_DEAD", {
    "Hunter died. Pet is still going. The shamanic spirits respect the pet's commitment.",
    "The hunter is dead but the pet isn't. I'll stand near the pet. For totem range purposes.",
})
B("SHAMAN", "HUNTER", "AMBIENT", {
    "The pet stood on my totem. ON IT. The totem broke. I had to re-drop. That's a GCD I'll never get back.",
    "Hunter and I both use nature. They shoot animals with arrows. I... prefer a more spiritual approach.",
    "The pet keeps Growling near my totems. My totems don't respond. They're wood. And magic.",
})

-- SHAMAN → DRUID
B("SHAMAN", "DRUID", "PLAYER_DEAD", {
    "Druid died. They had Rebirth. I have Reincarnation. Between us, NOBODY should stay dead.",
    "The druid is dead. They rez others. I rez myself. If we both die, nobody rezzes anyone. Terrifying thought.",
})
B("SHAMAN", "DRUID", "AMBIENT", {
    "Fellow nature class. The druid becomes animals. I commune with ELEMENTS. We're both hippies, if we're honest.",
    "The druid's Mark of the Wild stacks with my totems. Together, we buff everything in a 20-yard radius. Power couple.",
    "The druid talks to trees. I talk to rocks, fire, water, and wind. We both need therapy. Different therapy.",
    "I have totems. The druid has forms. We both have to manage 4+ things at once. Solidarity.",
})

-- SHAMAN → PALADIN
B("SHAMAN", "PALADIN", "PLAYER_DEAD", {
    "The paladin didn't die. They never die. My totems are jealous of the bubble.",
    "Someone died near the paladin. The paladin's survival rate is INSULTING. Mine is also high. Ankh high.",
})
B("SHAMAN", "PALADIN", "AMBIENT", {
    "The paladin provides blessings. I provide totems. Both passive buffs. Mine come from STICKS. Theirs from LIGHT.",
    "Paladin aura and shaman totems in the same group. We're STACKING passive benefits. Maximum efficiency.",
    "I drop 4 totems. The paladin has 7 blessings. 3 auras. Together we buff EVERYTHING. The party can't die.",
    "The paladin bubbled. I want a bubble. Four elements and I can't make a BUBBLE. Earth, explain yourself.",
})

-- SHAMAN → PIRATE
B("SHAMAN", "PIRATE", "AMBIENT", {
    "The pirate has sailed the seas. I CONTROL the seas. Professionally. The water element works for me.",
    "The pirate fears storms. I MAKE storms. Chain Lightning is basically a weather event.",
    "I asked the wind to carry the pirate's words. The wind refused. Even elements have standards.",
})

--=========================================================================
--  P I R A T E   reacting to others  (novelty persona — shorter pools)
--=========================================================================

-- PIRATE → WARRIOR
B("PIRATE", "WARRIOR", "PLAYER_DEAD", {
    "The big armored one fell! A ship without its hull! ...that's a compliment. Sort of.",
    "Warrior's dead. Good fighter. Bad at not dyin'. I've known scurvy dogs with better survival instincts.",
    "The tank sank. Ha! Maritime humor. Nobody appreciates it.",
})
B("PIRATE", "WARRIOR", "AMBIENT", {
    "The warrior reminds me of a first mate I had. Big. Angry. Died in a bar fight. Miss 'em.",
    "I like the warrior. They fight up close. With honor. I fight up close too. Without honor. Faster that way.",
    "The warrior's got discipline. I've got rum. We BOTH solve problems. Different methods.",
})

-- PIRATE → MAGE
B("PIRATE", "MAGE", "PLAYER_DEAD", {
    "The magic one died! Poof! Like a candle in a hurricane! Pretty but fragile.",
    "Mage is dead. Back in me day, we didn't have magic. We had swords. An' we lived. Some of us.",
})
B("PIRATE", "MAGE", "AMBIENT", {
    "The mage makes food from thin air. If they could make RUM from thin air, they'd be the perfect crewmate.",
    "I don't understand magic. Don't WANT to understand it. Last thing I need is more voices in me head.",
    "The mage keeps shootin' fire. I set fires too, but on SHIPS. And usually by accident.",
})

-- PIRATE → PRIEST
B("PIRATE", "PRIEST", "PLAYER_DEAD", {
    "The healer's dead?! WHO HEALS THE HEALER?! This is like the captain goin' down first!",
    "Priest died. The one person who keeps ME alive. This is a CRISIS.",
})
B("PIRATE", "PRIEST", "AMBIENT", {
    "The priest keeps prayin'. In a dungeon. I pray too. For loot. And survival. Mostly loot.",
    "I respect the priest. They keep everyone alive. Even ME. And I make that job HARD.",
})

-- PIRATE → ROGUE
B("PIRATE", "ROGUE", "PLAYER_DEAD", {
    "The sneaky one died! Vanish on cooldown? Should've been sneakier!",
    "Rogue's dead. They operate in the shadows. Sometimes the shadows don't operate BACK.",
})
B("PIRATE", "ROGUE", "AMBIENT", {
    "The rogue's a thief. I'm ALSO a thief. But I do it on BOATS. That makes me a PIRATE. Better title.",
    "I could use a rogue on me crew. Good at stealin'. Bad at swabbin' the deck.",
    "The rogue and I understand each other. We both take things that aren't ours. PROFESSIONALLY.",
})

-- PIRATE → WARLOCK
B("PIRATE", "WARLOCK", "PLAYER_DEAD", {
    "The spooky one died! Their little fire imp is STILL goin'. Respect, tiny devil. Respect.",
    "Warlock's down. The dark magic didn't save 'em. Rum wouldn't have either but at least they'd have DIED HAPPY.",
})
B("PIRATE", "WARLOCK", "AMBIENT", {
    "The warlock's got a pet demon. I once had a monkey. The monkey was friendlier. Also less fire.",
    "I don't trust the warlock. I don't trust ANYONE. But I trust the warlock LESS.",
})

-- PIRATE → HUNTER
B("PIRATE", "HUNTER", "PLAYER_DEAD", {
    "Hunter's dead! The beast lives! The beast is the real captain of this ship!",
    "The hunter fell but their pet's still swinging. THAT'S the kind of crew loyalty I want!",
})
B("PIRATE", "HUNTER", "AMBIENT", {
    "The hunter has a pet. I had parrots. MULTIPLE parrots. None of 'em listen either.",
    "The hunter's got a beast and a bow. I've got a sword and a bad attitude. Both valid loadouts.",
    "That pet pulled AGAIN. On me ship, if yer animal pulls, ye clean the bilge!",
})

-- PIRATE → DRUID
B("PIRATE", "DRUID", "PLAYER_DEAD", {
    "The shapeshifter died! In which form? Doesn't matter. Dead in all of 'em now!",
    "Druid's down. Turned into a bear. A cat. A person. Dead. Full cycle.",
})
B("PIRATE", "DRUID", "AMBIENT", {
    "The druid turns into animals. If they could turn into a KRAKEN, I'd be impressed.",
    "A bear, a cat, AND a healer? That's three crew members in one. EFFICIENT.",
})

-- PIRATE → PALADIN
B("PIRATE", "PALADIN", "PLAYER_DEAD", {
    "Someone died an' the paladin didn't. PAL. A. DIN. NEVER. DIES. It's gettin' ridiculous.",
    "The glowy one lives. AGAIN. Whatever magic they've got, I want some.",
})
B("PIRATE", "PALADIN", "WIPE", {
    "Wipe! Paladin bubbled! I... did NOT bubble. Because I CAN'T. Life's unfair.",
    "The paladin survived in their golden orb of cheating. I drowned. Like a REAL pirate.",
})
B("PIRATE", "PALADIN", "AMBIENT", {
    "The paladin is too righteous fer a pirate crew. But they CAN'T DIE so they're hired.",
    "I offered the paladin rum. They said 'the Light provides.' The Light provides RUM?! Where do I sign up?!",
})

-- PIRATE → SHAMAN
B("PIRATE", "SHAMAN", "PLAYER_DEAD", {
    "Shaman died! Then stood back UP! Every time! It's SPOOKY! And I LOVE it!",
    "The stick-dropper fell an' got back up. If me crew could do that, I'd have a LOT more crew.",
})
B("PIRATE", "SHAMAN", "AMBIENT", {
    "The shaman controls the wind and the sea. On a BOAT that would make 'em CAPTAIN.",
    "If the shaman could summon wind, we'd never need sails! ...wait, CAN they? SHAMAN. CAN YE?!",
    "The shaman puts sticks everywhere. My ship had lots of sticks too. We called them MASTS.",
})

-- Banter_Engagements_Universal.lua
-- Massive topic-based engagement pools with multi-choice arrays.
-- T(target, openers, responses, followUps) — anyone can open, target responds in character
-- U(openers, responses, followUps) — universal topics, any persona to any persona
--
-- Each topic: 3-6 openers × 4-8 responses × 3-5 followUps = 36-240 unique combos PER TOPIC
-- {name} is replaced with the target player's character name at runtime.
local _, ns = ...
local T = ns.engagements.T
local U = ns.engagements.U

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → WARRIOR
--=========================================================================

T("WARRIOR", {
    "Hey {name}, real talk — do you ever get tired of being hit in the face?",
    "{name}, serious question. Does the plate armor chafe or do you just... get used to it?",
    "So {name}, what's the warrior retirement plan? Bad knees and stories?",
    "{name}, honest question — have you ever tried NOT charging into things?",
}, {
    "Tired? I don't get tired. I get ANGRY. There's a difference.",
    "The armor is fine. My back, however, is filing a formal complaint.",
    "Retirement? Warriors don't retire. We just yell louder until they give us a desk job.",
    "I tried standing still once. Almost died of boredom. Charging is safer.",
    "Every scar is a story. And every story ends with 'and then I hit it harder.'",
    "You worry about my face. I worry about whether my axes are sharp. We are not the same.",
}, {
    "That... actually explains a lot about you.",
    "Your therapist must be EXHAUSTED.",
    "I genuinely can't tell if you're joking or not and that concerns me.",
    "Okay but the desk job thing — I can actually picture that.",
    "You know what? Fair enough. Carry on.",
})

T("WARRIOR", {
    "{name}, I saw you eat an entire wheel of cheese mid-combat. How.",
    "Do you warriors just... not feel pain? Or is that a learned skill?",
    "{name}, be honest. How many weapons do you own? Ballpark.",
    "Hey {name}, is the constant yelling a warrior thing or a you thing?",
    "{name}, I noticed you tanked that boss with your face. By choice?",
}, {
    "Cheese heals the SOUL, and if the soul is healed the body follows. Warrior science.",
    "Oh we feel pain. We just file it under 'motivation.'",
    "I stopped counting at forty. My armory has an armory.",
    "The yelling is tactical. It intimidates the enemy and annoys my friends. Win-win.",
    "The face has the most armor. It's called a HELMET. Look it up.",
    "Pain is just weakness leaving the body. And I have A LOT of weakness, apparently.",
}, {
    "Warrior science is NOT a real discipline.",
    "I am genuinely scared of you.",
    "Forty?! WHERE do you keep forty weapons?!",
    "It's working. I'm very annoyed.",
    "I don't think that's how helmets work but I'm afraid to argue.",
}, "dungeon|raid")

T("WARRIOR", {
    "{name}, what's it like knowing your entire strategy is 'run at it'?",
    "Hey {name}, when you charge, do you plan what happens AFTER or is it vibes?",
    "Honest question {name} — has a healer ever just... walked away from you?",
    "{name}, do warriors dream about fighting? Or is sleep the ONLY time you're peaceful?",
}, {
    "Strategy? I have a strategy. Step one: charge. Step two: see step one.",
    "Plan? The PLAN is to arrive at the problem faster than anyone else. Then punch it.",
    "Three healers have quit mid-dungeon because of me. I count those as victories.",
    "I dream about new axes mostly. Sometimes about fighting. Once about a really good sandwich.",
    "Peaceful? I'm peaceful RIGHT NOW. This is my calm face.",
    "Every battle plan survives until contact with the enemy. So I skip the plan and go straight to contact.",
}, {
    "I'm going to walk away from this conversation, slowly.",
    "You just described every bad decision I've ever witnessed.",
    "Three healers?! That's not a victory, that's a RECORD.",
    "Your calm face is terrifying and I need you to know that.",
})

T("WARRIOR", {
    "{name}, I've never seen anyone eat an entire roast boar while running. You're talented.",
    "Hey {name}, quick survey — on a scale of 1 to rage, how are you feeling?",
    "{name}, real question — do all warriors have anger issues or just the good ones?",
    "{name}, what happens when a warrior gets a cold? Do you just punch the virus?",
}, {
    "Running burns calories. I replace them IMMEDIATELY. It's efficient.",
    "I'm at a solid simmering fury right now. It's my baseline.",
    "The anger isn't an issue. It's a FEATURE. Check the tooltip.",
    "Last time I got a cold I yelled at it until it left. Took two days.",
    "You know what's unhealthy? NOT eating during combat. That's how people die.",
    "Punch the virus? Don't be ridiculous. I INTIMIDATING SHOUT the virus.",
}, {
    "None of that is how biology works.",
    "Your baseline is other people's emergency.",
    "I checked. There is no tooltip.",
    "You yelled at a COLD? And it WORKED?",
    "I can't even argue because I'm pretty sure it'd work for you.",
})

T("WARRIOR", {
    "Hey {name}, fun question — what's the biggest thing you've punched?",
    "{name}, if you couldn't be a warrior, what would you be? And 'angrier warrior' doesn't count.",
    "Hey {name}, do you ever talk to your weapons? I've seen you whisper to that axe.",
    "{name}, how much of being a warrior is talent vs how much is stubbornness?",
}, {
    "A dragon. In the face. It was surprised. I was not.",
    "If not a warrior? Probably a blacksmith. Same hitting, different context.",
    "That's between me and the axe. She has a name and feelings.",
    "Stubbornness IS the talent. Anyone can swing. I refuse to stop swinging.",
    "I once headbutted a wall to prove a point. The wall lost.",
    "I don't have talent. I have MOMENTUM. And no one can stop momentum.",
}, {
    "You headbutted a WALL? What was the POINT?",
    "She?! The axe is a SHE? Does she have a NAME?",
    "I need you to define 'refuse to stop' because I'm getting worried.",
    "...did the dragon survive? Did YOU?",
    "A blacksmith warrior. So just hitting things at different temperatures. Sure.",
})

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → MAGE
--=========================================================================

T("MAGE", {
    "Hey {name}, real question — do you actually UNDERSTAND the magic or do you just point and hope?",
    "{name}, so when you conjure food... where does it come FROM?",
    "Hey {name}, has anyone ever told you that polymorphing people is rude?",
    "{name}, real talk — how much of being a mage is just showing off?",
}, {
    "I understand magic on a MOLECULAR level. You wouldn't get it. Literally.",
    "The food comes from the Nether. Or a pocket dimension. I try not to think about it.",
    "Rude? It's a SHEEP. Sheep are adorable. I'm doing them a FAVOR.",
    "Showing off? That implies effort. This is just how I exist.",
    "I point with PRECISION and INTENT. The hoping is optional but recommended.",
    "Every mage understands magic. Great mages understand that understanding is overrated.",
}, {
    "So you DON'T understand it. Got it.",
    "You're feeding us NETHER FOOD?!",
    "The sheep never look happy about it, {name}.",
    "Your entire personality is a magic show, isn't it?",
    "I'm choosing to not eat the conjured food anymore.",
})

T("MAGE", {
    "{name}, honest question — how many times have you set yourself on fire by accident?",
    "Hey {name}, is it true mages can open portals anywhere? Even to the bathroom?",
    "{name}, I've always wondered — do you get cold casting frost spells?",
    "{name}, what happens if you sneeze while casting? Should I be worried?",
    "So {name}, is there like a mage school or do you just... figure it out?",
}, {
    "Set MYSELF on fire? Only twice. Three times. It's a learning curve.",
    "I COULD open a portal to the bathroom but that's a waste of arcane energy. ...mostly.",
    "Cold? I AM the cold. The frost flows through me. My toes are numb year-round though.",
    "If I sneeze during a cast? Best case, the spell fizzles. Worst case, everyone's a sheep.",
    "Dalaran has a mage academy. I was expelled for 'excessive creativity.' Their loss.",
    "I set OTHER people on fire. On purpose. There's a distinction.",
}, {
    "TWICE?! You said twice then immediately said THREE!",
    "'Mostly.' That word is doing a LOT of heavy lifting.",
    "You can't feel your TOES?! {name}, that's not magic, that's frostbite!",
    "I'm going to stand further away from you during pulls.",
    "EXPELLED?! For WHAT?!",
}, "dungeon|raid")

T("MAGE", {
    "{name}, be honest — do you just teleport to avoid walking, like... always?",
    "Hey {name}, is it hard being the smartest person in the room all the time?",
    "{name}, I've always wanted to ask — that portal you opened, was it SUPPOSED to go there?",
    "So {name}, conjured water — is it real water or just... wet illusions?",
}, {
    "Walking is for people who haven't mastered teleportation. So yes, always.",
    "Hard? No. Lonely? ...also no. I have books.",
    "Every portal goes exactly where I intend. The INTENT just changes sometimes.",
    "It's real water. Arcane-infused, delicious, and it only glows a little.",
    "I once teleported out of a boring conversation. Highly recommend it.",
    "Smart? I prefer 'arcane-enhanced.' It sounds more impressive on a resume.",
}, {
    "It GLOWS. The water GLOWS, {name}.",
    "Please don't teleport out of THIS conversation.",
    "'The intent changes' is a WILD way to say you messed up.",
    "You have a RESUME?",
    "Lonely is the word I would've used but okay.",
})

T("MAGE", {
    "{name}, what's the most useless thing you've used magic for?",
    "Hey {name}, do mages have rivalries? Like is there a mage you hate?",
    "{name}, if you could only cast ONE spell for the rest of your life, which one?",
    "So {name}, does the hat come with the job or is that a personal choice?",
}, {
    "I once used Arcane Explosion to dry laundry. It was ON me at the time.",
    "Every mage hates every other mage. It's our only genuine tradition.",
    "One spell? Blink. You can solve ANY problem by being somewhere else instantly.",
    "The hat is EARNED. Years of study, sacrifice, and complaining about warriors.",
    "I used Polymorph on a chicken once. It turned into a bigger chicken. I panicked.",
    "The hat amplifies arcane resonance. It's also very stylish. Both matter.",
}, {
    "You Arcane Exploded your OWN laundry?!",
    "So mages are just... angry nerds? Got it.",
    "Blink AWAY from problems? That's not a spell, that's avoidance!",
    "A BIGGER chicken?! How is that even possible?!",
})

T("MAGE", {
    "{name}, quick mage quiz: fire, frost, or arcane — and why are you wrong?",
    "Hey {name}, do you ever worry about running out of mana?",
    "{name}, level with me — have you ever accidentally teleported someone's pants off?",
    "So {name}, what's the weirdest thing anyone's asked you to conjure?",
}, {
    "Fire. Because everything is better on fire. Next question.",
    "Run out of mana? That's what potions, runes, and sheer panic are for.",
    "The pants thing was ONE time and they shouldn't have been standing in my portal.",
    "Someone asked me to conjure a girlfriend. I... could not do that.",
    "Frost. The answer is always frost. Fire mages are drama queens.",
    "I run out of mana every day. I just pretend I meant to stop casting.",
}, {
    "So the pants thing DID happen! I KNEW IT!",
    "You can't conjure PEOPLE? Where's the line?!",
    "Fire mages are drama queens SAYS THE PERSON WHO JUST FROZE THE GROUND!",
    "You actively pretend?! That's not magic, that's acting!",
})

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → WARLOCK
--=========================================================================

T("WARLOCK", {
    "Hey {name}, serious question — does your demon have a dental plan?",
    "{name}, real talk — how evil ARE you, exactly? Like on a scale.",
    "So {name}, the whole summoning-demons thing... how'd you get into that?",
    "{name}, I've been meaning to ask — do warlocks have a union?",
}, {
    "Dental? He's a demon. His teeth regenerate. Though he does complain about flossing.",
    "Evil? Please. I'm chaotic neutral with excellent fashion sense.",
    "It's a long story involving a book, bad decisions, and a Tuesday.",
    "A union? We tried. The meeting descended into curses within ten minutes.",
    "My demon has BETTER benefits than I do. That's the real tragedy.",
    "I'm not evil. I just have access to dark forces and questionable morals.",
}, {
    "Demons FLOSS?!",
    "'Chaotic neutral with fashion sense' is the scariest thing I've heard today.",
    "A TUESDAY?! The worst decisions always happen on a Tuesday!",
    "The meeting LITERALLY descended into curses? Like... actual curses?",
    "Questionable morals. That's one way to put it.",
})

T("WARLOCK", {
    "{name}, does your demon ever just... judge you? Like silently?",
    "Hey {name}, if soul shards could talk, what would they say?",
    "So {name}, when you drain someone's life... do you feel bad or is it more of a Tuesday?",
    "{name}, honest question — has your demon ever tried to add you on friends list?",
    "Hey {name}, do warlocks get invited to parties? Regular parties, not dungeon parties.",
}, {
    "Judge me? He writes NOTES. I've seen the notepad. It's very detailed.",
    "Soul shards would scream. Like, constantly. It's best they don't talk.",
    "Feel bad? The life drain is consensual. ...well, it's not NOT consensual.",
    "He poked me for raid invites once. I had to set boundaries.",
    "I got invited to a party once. Two people fainted when I arrived. I took that as a compliment.",
    "My demon and I have a professional relationship. He kills things. I take credit.",
}, {
    "He takes NOTES?! About WHAT?!",
    "'It's not NOT consensual' is absolutely NOT a defense!",
    "Your demon asked for a RAID INVITE? Do demons even HAVE characters?",
    "Two people FAINTED. You are a WALKING red flag, {name}.",
    "I have so many follow-up questions and I'm afraid of all the answers.",
})

T("WARLOCK", {
    "Hey {name}, what's it like knowing everyone's a little scared of you?",
    "{name}, quick question — is Hellfire supposed to hurt YOU too or is that a bug?",
    "So {name}, between you and me — have you ever summoned something you COULDN'T put back?",
    "{name}, I notice you talk to your demon more than you talk to us. Should we be worried?",
}, {
    "A little scared? Only a little? I need to try harder.",
    "Hellfire hurts me too. It's called COMMITMENT. Look it up.",
    "Once. We don't talk about that. It lives in Winterspring now.",
    "My demon is a better conversationalist. He has range.",
    "Fear is respect's weird cousin. I'll take either.",
    "If I told you what I summoned last Thursday you would not sleep for a week.",
}, {
    "TRY HARDER?! No! Please do NOT try harder!",
    "Commitment to SELF-IMMOLATION is not a personality trait!",
    "It LIVES in Winterspring?! Just... LIVING THERE?! Doing WHAT?!",
    "I don't want to know about last Thursday. I really, really don't.",
    "Your demon has RANGE? What does that even mean?!",
})

T("WARLOCK", {
    "{name}, fun question — what's the darkest spell you know? And should I run?",
    "Hey {name}, do you ever just... look at a sunset? Or is it always skulls and shadows?",
    "{name}, be honest — do other warlocks think you're weird?",
    "So {name}, if you WEREN'T a warlock, what would you be? And 'darker warlock' isn't an answer.",
}, {
    "The darkest spell I know? You'd need a permission slip from the Kirin Tor to hear about it.",
    "I watched a sunset once. A demon tried to use it as a portal. Ruined the moment.",
    "Other warlocks think EVERYONE is weird. That's kind of our thing.",
    "If not a warlock? Probably a shopkeeper. With a back room no one asks about.",
    "I know spells that would make your ancestors uncomfortable. The DEAD ones.",
    "Sunsets are beautiful. They remind me of Hellfire. Very soothing.",
}, {
    "A shopkeeper with a SECRET BACK ROOM. Classic warlock energy.",
    "Sunsets remind you of HELLFIRE?! That's... you know what, never mind.",
    "My ancestors are already uncomfortable. They met me.",
    "Permission slip from the Kirin Tor. So it's THAT bad.",
})

T("WARLOCK", {
    "{name}, has your demon ever wanted a day off?",
    "Hey {name}, do warlocks celebrate holidays? Or just... curse them?",
    "{name}, I found a green glowing rock near your bunk. Should I be concerned?",
    "So {name}, when you die and the demon just STANDS there... is he sad or relieved?",
}, {
    "A day off? He gets every other Tuesday. It's in the contract.",
    "We celebrate Hallow's End. It's the one time a year people appreciate our aesthetic.",
    "That rock is a soul shard and you should put it down VERY carefully.",
    "When I die? He's waiting for the respawn. We have a 'no mourning' clause.",
    "My demon asked for vacation time once. I laughed. He cursed my pillow.",
    "Holidays are for people without demons to maintain. I have RESPONSIBILITIES.",
}, {
    "Your demon has a CONTRACT?! With CLAUSES?!",
    "Put it down carefully?! It's been in my POCKET for an hour!",
    "He cursed your PILLOW? What does a cursed pillow even DO?",
    "A 'no mourning' clause. That's the saddest professional boundary I've ever heard.",
})

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → PRIEST
--=========================================================================

T("PRIEST", {
    "Hey {name}, does the Light ever just... not pick up? Like when you pray?",
    "{name}, serious question — do you ever get tired of healing everyone?",
    "So {name}, the whole Shadow thing... is that like the Light's evil twin?",
    "{name}, be honest — do you judge us? Like, spiritually?",
}, {
    "The Light always answers. Sometimes the answer is 'figure it out yourself.'",
    "Tired of healing? I'm tired of people NEEDING healing. Stop standing in fire.",
    "Shadow isn't evil. It's... complex. Like a good wine. That can kill you.",
    "Judge you? I'm a priest, not a paladin. I judge QUIETLY.",
    "The Light once left me on read for three days. I had to burn incense to get a callback.",
    "I'm not tired of healing. I'm tired of healing the SAME person for the SAME mistake.",
}, {
    "The Light left you on READ?! That's cold!",
    "You judge QUIETLY? So you ARE judging us!",
    "Shadow is 'complex'? That's what people say about their exes!",
    "Stop standing in fire. Great advice. Revolutionary. Write a book.",
})

T("PRIEST", {
    "{name}, what's it like having a direct line to a divine being?",
    "Hey {name}, if I confess something to you, are you REQUIRED to keep it secret?",
    "{name}, I gotta know — do you ever use Power Word: Shield on like... your food?",
    "So {name}, when you smite someone — is the Light cool with that?",
    "{name}, has the Light ever told you something you REALLY didn't want to hear?",
}, {
    "Direct line? It's more like a suggestion box. I suggest, it decides.",
    "Required? ...technically yes. Will I gossip later? Define 'later.'",
    "Shield my food? That's wasteful. I Shield my TEA. Priorities.",
    "Smite is holy damage. It's like being punched by righteousness. The Light approves.",
    "The Light told me to 'be patient with warriors.' Hardest commandment I've ever received.",
    "A divine being? It's like having a manager who's always right and never explains why.",
}, {
    "A suggestion box?! That's the most honest thing a priest has ever said!",
    "'Define later' — so NO, you won't keep it secret!",
    "You Shield your TEA! That's the MOST priest thing possible!",
    "'Be patient with warriors.' I felt that in my SOUL.",
    "Punched by righteousness. What a way to go.",
})

T("PRIEST", {
    "Hey {name}, does healing someone create like, a bond? Can you feel their pain?",
    "{name}, honest question — have you ever just... NOT healed someone? On purpose?",
    "So {name}, if the Light is so great, why does it let me keep dying?",
    "{name}, what's the most ridiculous thing someone's asked you to bless?",
}, {
    "I feel their pain, their stubbornness, and their terrible life choices. It's a lot.",
    "Not healed someone on purpose? I have a LIST. It's categorized.",
    "The Light lets you die as a learning experience. You're its worst student.",
    "Someone asked me to bless their fishing pole. I did. It caught nothing.",
    "The bond from healing is real. I'm spiritually connected to every idiot here.",
    "I 'forgot' to heal someone who called me a 'buff bot.' My memory is very selective.",
}, {
    "You have a LIST?! Am I on it?!",
    "The Light's WORST STUDENT?! That's so mean coming from a priest!",
    "Spiritually connected to every idiot — that must be exhausting.",
    "You blessed a FISHING POLE? And it STILL caught nothing?",
    "Your memory is 'selective.' I'm never insulting you again.",
})

T("PRIEST", {
    "{name}, do priests ever have crisis of faith or is the Light pretty convincing?",
    "Hey {name}, between Holy and Shadow — which one's more fun?",
    "{name}, what happens if two priests disagree? Does the Light pick a side?",
    "So {name}, do you pray BEFORE or DURING the pull? Asking for survival reasons.",
}, {
    "Crisis of faith? Every Tuesday. By Wednesday the Light sends a sign. Usually in fire form.",
    "Holy is fulfilling. Shadow is... exhilarating. I'm not supposed to enjoy Shadow this much.",
    "When priests disagree, the Light gets awkward. It dims slightly. Very passive aggressive.",
    "I pray during the pull. BEFORE the pull I'm busy judging the tank's life choices.",
    "The Light's convincing when it wants to be. Other times it's vague and cryptic. Like a horoscope.",
    "Shadow's more fun. Please don't tell the Light I said that.",
}, {
    "Signs in FIRE FORM? Your religion is INTENSE!",
    "'I'm not supposed to enjoy Shadow this much' — somebody get this priest a therapist!",
    "The Light is PASSIVE AGGRESSIVE?! Even the Light?!",
    "Judging the tank's life choices — truly a healer's pre-pull ritual.",
}, "dungeon|raid")

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → ROGUE
--=========================================================================

T("ROGUE", {
    "Hey {name}, how long have you been standing there? Please be honest.",
    "{name}, serious question — have you stolen anything today? And 'hearts' doesn't count.",
    "So {name}, when you go stealth... where do you actually GO?",
    "{name}, be honest — if we turned our backs, would our pockets be safe?",
}, {
    "I've been here the whole time. The WHOLE time. You just didn't notice.",
    "Stolen anything today? Define 'today.' Define 'stolen.' Define 'anything.'",
    "In stealth I go to a shadow dimension. Or behind a bush. Depends on the terrain.",
    "Your pockets are safe. Your BACKPACK, on the other hand...",
    "I've been standing so still that a bird landed on me. I let it. Excellent cover.",
    "Steal? Never. Redistribute? Frequently.",
}, {
    "THE WHOLE TIME?! How long is 'the whole time'?!",
    "The fact that you need me to DEFINE stolen is very concerning!",
    "My BACKPACK?! {name}, what did you TAKE?!",
    "The bird was COVER?! You weaponized a BIRD?!",
    "Redistribute. Right. That's just theft with a PR team.",
})

T("ROGUE", {
    "{name}, real talk — is pickpocketing a skill or a compulsion?",
    "Hey {name}, what's the shadiest thing you've done this week? Keep it PG.",
    "{name}, I noticed my gold count is different. Should I be suspicious?",
    "So {name}, do rogues have a code of honor or is it more of a... guideline situation?",
    "{name}, quick question — can you teach me to stealth or is that a rogue-only thing?",
}, {
    "Pickpocketing is an ART. And like all art, it's compulsive and poorly compensated.",
    "Shadiest thing this week? I can't tell you. Rogue-client privilege.",
    "Your gold is fine. I counted it earlier. ...to make sure it was all there. Obviously.",
    "Code of honor? More like a code of 'don't get caught.' Very flexible.",
    "I could teach you stealth but you'd fail the first test: not tripping over your own feet.",
    "It's a compulsion, but a PROFITABLE one. That's the difference between illness and career.",
}, {
    "You COUNTED my gold?! When?! HOW?!",
    "Rogue-client privilege is NOT a real thing!",
    "A code of 'don't get caught.' How NOBLE.",
    "I would NOT trip! ...okay maybe I would trip. Once.",
    "Illness vs career. That's the most rogue thing anyone has ever said.",
})

T("ROGUE", {
    "{name}, your knives are very shiny. Very sharp. Very close to me. Can you... not?",
    "Hey {name}, what do rogues do for fun? And 'crime' doesn't count.",
    "{name}, I've noticed you always sit with your back to the wall. Is that a rogue thing?",
    "So {name}, if I hired you for a job, hypothetically, what are your rates?",
}, {
    "The knives like being close to people. It relaxes them. The knives, not the people.",
    "Fun? I enjoy long walks in the shadows, candlelit lockpicking, and undetected entry.",
    "Back to the wall is survival 101. You should try it. ...actually, please don't. I need YOUR back exposed.",
    "My rates depend on the job, the risk, and how much I like you. You're looking at premium pricing.",
    "The knives aren't FOR you. Probably. Let's keep it that way.",
    "For fun I count things. Coins, daggers, the mistakes people make around me.",
}, {
    "The knives RELAX?! Knives don't RELAX!",
    "'Undetected entry' is NOT a hobby!",
    "You need my back EXPOSED?! How is that reassuring?!",
    "PREMIUM pricing?! I don't even know what the job IS yet!",
    "You count our MISTAKES?! Like, a running tally?!",
})

T("ROGUE", {
    "{name}, fun fact: I locked my chest and the lock was already picked. Was that you?",
    "Hey {name}, have you ever sapped someone for fun? Like, not for combat reasons?",
    "{name}, what's the longest you've stayed in stealth? Records purposes.",
    "So {name}, does poison ever... leak? Like, should I not touch your stuff?",
}, {
    "Your lock was picked? Terrible. Who would do that? Not me. I was somewhere else. Definitely.",
    "Sapped for fun? Once. Okay, eleven times. But that guy in Stormwind DESERVED it.",
    "Longest stealth? Four hours. Everyone thought I left. I was at the buffet table the whole time.",
    "Poison doesn't leak. Usually. Don't touch the green bottles. Or the purple ones. Actually, don't touch anything.",
    "I would never pick your lock without permission. I picked it WITH permission. My permission.",
    "Sapping is my love language. Some people get flowers. My targets get unconsciousness.",
}, {
    "YOUR permission?! That's not how that works!",
    "ELEVEN TIMES?! The Stormwind guy must be TRAUMATIZED!",
    "Four hours at the BUFFET TABLE invisible?! You just ATE for four hours?!",
    "Don't touch ANYTHING?! How do I GROUP with you without touching things?!",
    "Sapping is your LOVE LANGUAGE? Your relationships must be TERRIFYING.",
})

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → HUNTER
--=========================================================================

T("HUNTER", {
    "Hey {name}, does your pet ever just... ignore you? Like, completely?",
    "{name}, real talk — Feign Death to avoid chores. Have you done it?",
    "So {name}, when you 'accidentally' pull an extra pack, is it really accidental?",
    "{name}, honest question — do you love your pet more than the group?",
}, {
    "Ignore me? She has SELECTIVE hearing. It's a sophisticated survival trait.",
    "Feign Death to avoid chores? I plead the Fifth. ...which is also a feign.",
    "Every pull is calculated. Some calculations are just... more approximate.",
    "Love my pet more than the group? My pet doesn't ask me stupid questions, so... yes.",
    "My pet ignores me when she's hungry. We have a food-based economy.",
    "Accidental pulling is a MYTH. We pull when the universe tells us to pull.",
}, {
    "Selective hearing. In a PET. Right.",
    "You used Feign Death for CHORES! I knew it!",
    "'More approximate.' That's a WILD euphemism for 'I pulled the whole room.'",
    "You chose the PET over US! Publicly! Without hesitation!",
    "The universe told you to pull? The universe is WRONG.",
}, "dungeon|raid")

T("HUNTER", {
    "{name}, quick question — has your pet ever bitten a party member? On purpose?",
    "Hey {name}, do hunters actually TALK to animals or is that a PR thing?",
    "{name}, I saw your pet eating from the healer's bag. Should I intervene?",
    "So {name}, what's the naming convention for pets? Is there a system?",
    "{name}, has setting a trap ever gone wrong? Wrong enough to be a story?",
}, {
    "Bitten a party member? Only the ones who earned it. She has standards.",
    "I don't TALK to animals. I COMMUNE with them. There's a difference. They also talk back.",
    "The healer's bag? That's CHARACTER FLAW. I'm working on it. The pet, not the bag.",
    "Naming convention? First pet gets a real name. After that it's vibes. My third cat is called 'Number Three.'",
    "Every trap has gone wrong at least once. My greatest trap caught ME. We don't discuss it.",
    "My pet bit the tank once. The tank deserved it. My pet has excellent judgment.",
}, {
    "She has STANDARDS for biting people?! What are the criteria?!",
    "Your pet is called NUMBER THREE? That's so disrespectful!",
    "The trap caught YOU? How does that even HAPPEN?!",
    "You COMMUNE with animals? What does your cat think about ME?",
    "The pet BIT the TANK and you DEFENDED the pet?!",
})

T("HUNTER", {
    "Hey {name}, how many pets have you 'released back into the wild'? Be honest.",
    "{name}, what do hunters do when you run out of arrows? Throw the bow?",
    "So {name}, is Multi-Shot aimed or is it more of a 'general direction' thing?",
    "{name}, I notice your pet gets more food than any of us. Explain.",
}, {
    "Released? We prefer the term 'honorary retirement.' They get a nice forest.",
    "Run out of arrows? Hasn't happened since I started carrying six quivers. YES, six.",
    "Multi-Shot is PRECISELY aimed at APPROXIMATELY the right targets.",
    "My pet does more work than any of you. The food ratio is EARNED.",
    "I've retired twelve pets. They send letters. ...they can't write but I know they would.",
    "Arrows are a resource. When I run out, I swap to melee. Everyone screams. Good times.",
}, {
    "They send LETTERS?! They're ANIMALS, {name}!",
    "SIX quivers?! How do you even WALK?!",
    "'Precisely aimed at approximately the right targets.' That's NOT reassuring!",
    "You swap to MELEE? A HUNTER in melee?! No wonder everyone screams!",
})

T("HUNTER", {
    "{name}, does your pet ever get jealous of other hunters' pets?",
    "Hey {name}, what's the most ridiculous thing you've tamed?",
    "{name}, I found feathers in my bedroll. Any idea how they got there?",
    "So {name}, aspect of the cheetah — are you SUPPOSED to daze the whole party?",
}, {
    "Jealous? She sizes up every pet we meet. There's a ranking system. She's #1.",
    "Most ridiculous tame? A turtle. In a dungeon. Mid-boss. The group was NOT happy.",
    "Feathers? Could be anyone's. Could be a bird's. Could be evidence I should destroy.",
    "Aspect of the Cheetah dazes the party? That's a FEATURE. It builds character.",
    "My pet doesn't get jealous. She gets COMPETITIVE. There is a scoreboard.",
    "I once tamed something I couldn't identify. It's been three months. I still can't identify it.",
}, {
    "There's a SCOREBOARD?! For PETS?!",
    "You tamed a turtle MID-BOSS?! During a FIGHT?!",
    "Evidence you should DESTROY?! {name}, what HAPPENED?!",
    "You can't IDENTIFY your own pet?! How is that possible?!",
    "It 'builds character' to be DAZED by your OWN hunter?!",
}, "dungeon|raid")

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → PALADIN
--=========================================================================

T("PALADIN", {
    "Hey {name}, does the Light ever give you a day off or is it constant righteousness?",
    "{name}, real talk — how often do you bubble just because you CAN?",
    "So {name}, be honest — do all paladins glow or is that a YOU thing?",
    "{name}, I need to know — do you think you're better than us? The Light tells you that, right?",
}, {
    "Day off? The Light doesn't have weekends. Neither do I.",
    "I bubble when I NEED to. And also in the shower. And while eating. It's soothing.",
    "The glow is natural. It happens when you live a righteous life. You wouldn't know.",
    "Better than you? The Light teaches humility. But BETWEEN US... yes.",
    "The Light doesn't give days off but it does give CLARITY. And JUDGEMENT. Lots of judgement.",
    "I don't think I'm better. The Light thinks I'm better. I'm just the messenger.",
}, {
    "You bubble in the SHOWER?! WHY?!",
    "'You wouldn't know'? Did a PALADIN just roast me with the LIGHT?!",
    "The Light teaches humility and you IMMEDIATELY broke that rule!",
    "You're 'just the messenger' for divine superiority?! That's peak paladin!",
    "Lots of judgement. From a paladin. Shocking.",
})

T("PALADIN", {
    "{name}, quick question — do you polish your armor every day or does the Light do that?",
    "Hey {name}, what's the most petty thing you've used a blessing on?",
    "{name}, I've noticed you judge our food choices. Is that a paladin thing?",
    "So {name}, Lay on Hands — have you ever used it for something stupid?",
    "{name}, do paladins get holidays? Like, Light-approved holidays?",
}, {
    "Polish? I polish THREE times a day. Dawn, noon, and before every boss. Standards matter.",
    "Most petty blessing? I blessed a sandwich once to make a point about gratitude.",
    "I judge your food because the Light demands clean living. Also because you eat like animals.",
    "I used Lay on Hands on a stubbed toe once. No regrets. COMPLETE healing for ALL injuries.",
    "Every day is a paladin holiday. We celebrate by being better than everyone. QUIETLY.",
    "The armor polishes itself. Just kidding. But the Light makes it SHINE more when I'm righteous.",
}, {
    "THREE times a day?! We're in a DUNGEON!",
    "You blessed a SANDWICH?! To make a POINT?!",
    "We eat like ANIMALS because we're in a CAVE fighting MONSTERS!",
    "Lay on Hands for a STUBBED TOE! That's the most paladin thing EVER!",
    "'Quietly.' Nothing about you is quiet, {name}.",
}, "dungeon")

T("PALADIN", {
    "{name}, do you ever take the armor off? Like, ever?",
    "Hey {name}, be honest — how many people have you judged TODAY?",
    "{name}, I need you to explain Divine Shield to me like I'm five.",
    "So {name}, does the Light have a customer service department?",
}, {
    "Take the armor off? Only to put on BETTER armor. I sleep in plate.",
    "Judged today? I lost count after breakfast. You people make it very easy.",
    "Divine Shield: I become untouchable by everything. Damage. Magic. Consequences.",
    "Customer service? The Light IS customer service. Except you can't return blessings.",
    "I once took the armor off at an inn. Put it back on within an hour. Felt naked.",
    "I judged twelve people today and healed EVERY SINGLE ONE OF THEM. That's what paladins DO.",
}, {
    "You SLEEP in plate?! How?! WHY?!",
    "Untouchable by CONSEQUENCES? That explains SO much about paladins!",
    "You can't RETURN blessings? What kind of policy IS that?!",
    "Twelve people judged AND healed. Efficiency.",
})

T("PALADIN", {
    "{name}, does it bother you that rogues exist? Like, philosophically?",
    "Hey {name}, what's the paladin answer to 'why do bad things happen to good people?'",
    "{name}, I've noticed you bless everything. The food. The door. Is the door blessed now?",
    "So {name}, hypothetically — paladin vs priest. Who does the Light like MORE?",
}, {
    "Rogues existing is the Light's way of testing my patience. I'm failing.",
    "Why do bad things happen? Because people don't listen to paladins. It's very simple.",
    "The door IS blessed now. You're welcome. It opens 12% more righteously.",
    "The Light likes paladins more. We do the work AND look good. Priests just... pray in corners.",
    "Rogues bother me philosophically, morally, AND practically. It's a full-spectrum bothering.",
    "Bad things happen because the Light is also petty sometimes. Don't quote me on that.",
}, {
    "The door opens MORE RIGHTEOUSLY?! That's not a THING!",
    "'Pray in corners' — you're gonna make a priest CRY one day.",
    "The Light is PETTY?! A paladin said the Light is PETTY!",
    "You're failing the patience test? A PALADIN? We're doomed.",
    "12% more righteously. Did you MEASURE that?!",
})

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → DRUID
--=========================================================================

T("DRUID", {
    "Hey {name}, when you shapeshift, do your CLOTHES change too? I've always wondered.",
    "{name}, real talk — do you ever forget which form you're in?",
    "So {name}, when you talk to trees... do they talk back?",
    "{name}, honest question — is being a druid just identity crisis as a profession?",
}, {
    "The clothes are magical. They shift with me. Otherwise this would be a VERY different addon.",
    "Forget which form? I woke up as a bear once. Slept through the shift. Very confusing.",
    "Trees talk. Slowly. VERY slowly. A conversation takes six months.",
    "Identity crisis? I have FOUR identities and they're ALL confident. That's the opposite.",
    "The clothes merge with my soul. Or something. The training manual was vague on that part.",
    "I was in cat form for three days once. Started purring in meetings. Not embarrassed.",
}, {
    "The training manual was VAGUE?! About CLOTHES?!",
    "You woke up as a BEAR?! That must have been STARTLING!",
    "Six months for ONE conversation?! What do trees even TALK about?!",
    "Purring in MEETINGS! And you're NOT embarrassed?!",
    "Four confident identities. That's not healthy. That's just FOUR problems.",
})

T("DRUID", {
    "{name}, what's the pecking order? Bear, cat, tree, or moonkin — who's the REAL you?",
    "Hey {name}, has a lumberjack ever accidentally threatened you?",
    "{name}, I notice you hug trees. Literally hug them. Is that required?",
    "So {name}, Innervate — who do you REALLY want to use it on?",
    "{name}, do druid forms come with... instincts? Like do you want to chase things in cat form?",
}, {
    "The real me? All of them. I'm a democracy of forms. Bear gets the tiebreaker vote.",
    "A lumberjack threatened a tree I was STANDING NEXT TO. I had to intervene. Diplomatically. By becoming a bear.",
    "Hugging trees is communion with nature. Also they're just... very huggable. Have you tried?",
    "Innervate goes to whoever DESERVES it. So... me. Usually me.",
    "Cat form instincts? I chase butterflies sometimes. It's TRAINING. Very tactical butterfly chasing.",
    "Bear gets the tiebreaker because bear can eat the other forms. That's democracy.",
}, {
    "Bear gets the tiebreaker because bear can EAT the others?! That's not democracy!",
    "You 'diplomatically' became a BEAR?! That's the opposite of diplomacy!",
    "Innervate goes to YOU? The HEALER is right there, {name}!",
    "Tactical butterfly chasing. I have no words.",
    "Have I tried hugging a tree? No. Because I'm NORMAL.",
})

T("DRUID", {
    "{name}, when you're in Moonkin form and you dance — is that a spell or are you just vibing?",
    "Hey {name}, do animals treat you differently because you're a druid?",
    "{name}, what's the most awkward form to accidentally shift into?",
    "So {name}, nature is 'balance' right? Does nature know about your loot rolls?",
}, {
    "The Moonkin dance is SACRED. Also hilarious. It's both. Don't judge.",
    "Animals treat me like a coworker. The squirrels wave. It's nice.",
    "Most awkward form? Bear. In a tavern. Broke two tables and a chandelier.",
    "Nature knows about my loot rolls. Nature APPROVES. I need those items for BALANCE.",
    "I vibe in ALL forms. Vibing is my neutral state. The dance just makes it visible.",
    "A deer once bowed to me. Then tried to eat my robe. Nature is complicated.",
}, {
    "The squirrels WAVE?! That's either adorable or terrifying!",
    "Bear form IN A TAVERN? Two tables AND a chandelier?!",
    "Nature approves your loot rolls?! Nature is BIASED!",
    "A deer bowed AND ate your robe?! Nature IS complicated!",
})

T("DRUID", {
    "{name}, quick question — when you heal as a tree, can people pick your leaves?",
    "Hey {name}, is Barkskin just... giving yourself bark? Are you BECOMING a tree?",
    "{name}, do other druids ever fight about which form is best? Like a druid civil war?",
    "So {name}, if I water you in tree form, does that help?",
}, {
    "Pick my leaves? Someone tried. I cast Thorns. They learned.",
    "Barkskin is TEMPORARY bark. Full tree is COMMITMENT. Know the difference.",
    "Druid civil war? Bear druids and cat druids haven't spoken since the Great Shift of '04.",
    "Watering me in tree form? It's... actually kind of nice? Don't tell anyone.",
    "My leaves are NOT for picking. They are photosynthesizing. It's SCIENCE.",
    "The Great Druid Form Debate has been going on for millennia. We're all wrong AND right.",
}, {
    "You THORNED someone for picking a LEAF?! Overreaction!",
    "The Great Shift of '04?! There's druid LORE about form arguments?!",
    "It's NICE?! You LIKE being watered?! That's the most druid thing ever!",
    "Photosynthesizing. In a dungeon. With no sunlight.",
}, "dungeon")

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → SHAMAN
--=========================================================================

T("SHAMAN", {
    "Hey {name}, when the elements talk to you... what do they actually SAY?",
    "{name}, real question — do you ever get tired of placing totems everywhere?",
    "So {name}, Reincarnation — dying and coming back. How's that feel?",
    "{name}, honest question — is the wind actually your FRIEND or just... wind?",
}, {
    "The elements say lots of things. Mostly 'too hot,' 'too wet,' and 'STOP ASKING.'",
    "Tired of totems? I place four just to SIT DOWN. It's muscle memory at this point.",
    "Reincarnation feels like a really long nap with a rude alarm clock.",
    "The wind is my friend. My BEST friend. ...I need to get out more.",
    "Earth says calm down. Fire says burn things. Water says go with the flow. Air just screams.",
    "I place totems in my SLEEP. I woke up surrounded by four of them once. Very unsettling.",
}, {
    "Air just SCREAMS?! The element of air is just SCREAMING?!",
    "You place totems in your SLEEP?! That's a CONDITION!",
    "A rude alarm clock — THAT'S how you describe DYING AND COMING BACK?!",
    "You need to get out more and your best friend is WIND. I'm worried about you.",
    "The elements sound exhausting. ALL of them.",
})

T("SHAMAN", {
    "{name}, what happens when two elements disagree? Do you mediate?",
    "Hey {name}, has a totem ever broken at a really bad time?",
    "{name}, I gotta ask — do you control lightning or does lightning control YOU?",
    "So {name}, all four elements — do you have a FAVORITE? Be honest.",
    "{name}, when you say 'the earth speaks' — is it like, words? Or just... rumbling?",
}, {
    "When elements disagree, I stand between fire and water and PRAY.",
    "A totem broke mid-boss once. Specifically the healing totem. Dark times.",
    "I control lightning. Lightning THINKS it controls me. We have a... dynamic.",
    "Favorite element? Earth. It's the only one that doesn't try to kill me accidentally.",
    "The earth speaks in vibrations. You feel it in your bones. Also, sometimes actual words. Weird ones.",
    "Fire and water argue CONSTANTLY. I'm basically a couples therapist for elements.",
}, {
    "Couples therapist for ELEMENTS! That's your resume?!",
    "The HEALING totem broke mid-boss?! Everyone must have PANICKED!",
    "You and lightning have a 'dynamic'?! That sounds DANGEROUS!",
    "Earth doesn't try to kill you ACCIDENTALLY? What about ON PURPOSE?!",
    "The earth speaks in WEIRD WORDS? Like what? What does earth SAY?!",
}, "dungeon|raid")

T("SHAMAN", {
    "{name}, do the other classes take you seriously or is it the totem thing?",
    "Hey {name}, has an element ever ghosted you? Like just... stopped answering?",
    "{name}, Chain Lightning — does it choose who it bounces to or is that on you?",
    "So {name}, tribal wisdom — what's the most useless piece you've received?",
}, {
    "Take me seriously? I LITERALLY talk to the planet. If that's not serious, what is?",
    "Fire ghosted me for a week after I favored frost for a dungeon. Very petty element.",
    "Chain Lightning chooses its OWN targets. I just point it in a direction and hope.",
    "Most useless tribal wisdom? 'Listen to the earth.' The earth was telling me to nap. BAD advice.",
    "I talk to planets and throw lightning. HOW is that not taken seriously?",
    "Fire is the most dramatic element. It ghosted me AND sent a lava burst as a goodbye.",
}, {
    "Fire GHOSTED you! An element has RELATIONSHIP drama with you!",
    "Chain Lightning CHOOSES its OWN targets?! That sounds TERRIFYING!",
    "The earth told you to NAP?! Maybe the earth had a point!",
    "Fire sent a LAVA BURST as a GOODBYE?! That's a BREAKUP, not ghosting!",
})

T("SHAMAN", {
    "{name}, when you reincarnate, do you come back in the same spot or...?",
    "Hey {name}, do elements ever argue about which one you should use in a fight?",
    "{name}, real question — Bloodlust. Does it actually change your BLOOD?",
    "So {name}, totems — do they have feelings? You always seem sad when one breaks.",
}, {
    "Same spot. With the same enemies. Who are now AWARE I can do that. Very awkward.",
    "Elements argue about EVERYTHING. 'Use me!' 'No, use ME!' It's like having four children.",
    "Bloodlust changes everything. My blood, my heartbeat, my shopping impulse. It's intense.",
    "Totems have feelings. Maybe. I'm not sure but I apologize every time one gets destroyed. Just in case.",
    "I reincarnate and the first thing I see is the boss looking at me like 'didn't I just...'",
    "Are you asking if my totems are SENTIENT? Because I... honestly don't know. And that bothers me.",
}, {
    "The boss WATCHES you reincarnate?! And just LETS you?!",
    "Four elemental CHILDREN arguing about who gets used?! NO WONDER you're stressed!",
    "Bloodlust changes your SHOPPING IMPULSE?! What does that even mean?!",
    "You DON'T KNOW if your totems are sentient?! Shouldn't you FIND OUT?!",
}, "dungeon|raid")

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → PIRATE
--=========================================================================

T("PIRATE", {
    "Hey {name}, real question — do you have an ACTUAL ship or is this purely vibes?",
    "{name}, I gotta know — is the rum a personality trait or a coping mechanism?",
    "So {name}, treasure — do you actually HAVE any or is it all stolen?",
    "{name}, honest question — how does one become a pirate? Is there a form?",
}, {
    "A ship? I have three ships. Well, two ships and a raft. The raft has sentimental value.",
    "The rum is BOTH. A personality trait that is ALSO a coping mechanism. Multitasking.",
    "All treasure is stolen, friend. That's what MAKES it treasure. Purchased gold is just.... currency.",
    "Becoming a pirate requires a hat, an attitude, and a court order you're ignoring.",
    "My ship is currently... between locations. Which is pirate for 'I forget where I parked.'",
    "The rum is ESSENTIAL. It fuels the bravado. Without rum, I'm just... a person with a hat.",
}, {
    "A RAFT with sentimental value?! That's the saddest pirate thing I've ever heard!",
    "'A court order you're ignoring' — I should NOT be grouping with you!",
    "You FORGOT where you parked your SHIP?!",
    "Without rum you're just a person with a HAT?! That's existential!",
    "Purchased gold is 'just currency'?! That's... actually a good point?",
})

T("PIRATE", {
    "{name}, has the parrot thing ever gotten you in trouble?",
    "Hey {name}, what's the pirate position on personal hygiene?",
    "{name}, when you say 'walk the plank' — is that a real threat or more of a vibe?",
    "So {name}, do pirates actually bury treasure or is that just a tax strategy?",
    "{name}, I have to ask — does EVERYTHING need to be a sea metaphor with you?",
}, {
    "The parrot repeated something I said in confidence. To the ENTIRE tavern. We've had words.",
    "Hygiene? The sea cleans us. Salt water is nature's soap. Don't look it up.",
    "Walk the plank is a REAL threat. I have a portable plank. It folds. Very convenient.",
    "Burying treasure is tradition AND tax strategy. You can't tax what you can't find.",
    "Sea metaphors are the OCEAN of my vocabulary. They WAVE through every shore of my soul.",
    "My parrot knows more secrets than anyone in this group. He is my most trusted confidant.",
}, {
    "A PORTABLE FOLDING PLANK?! That's the most pirate gadget ever!",
    "Salt water is NOT soap! Please tell me you use actual soap!",
    "That was the most painful sea metaphor pileup I've ever experienced.",
    "Your PARROT is your most trusted confidant?! Over PEOPLE?!",
    "You can't tax what you can't find. That's actually... brilliant? Illegally brilliant?",
})

T("PIRATE", {
    "{name}, rate this group's crew potential. Are we mutiny-worthy?",
    "Hey {name}, what's the pirate code say about loot? Asking for me.",
    "{name}, serious question — have you committed any crimes TODAY?",
    "So {name}, is there a pirate retirement plan or do you just... keep pirrating?",
}, {
    "Crew potential? Two of you would survive the first storm. The rest are decoration.",
    "The pirate code on loot: I get first pick. Second pick. And the tiebreaker. It's MY code.",
    "Crimes today? Define 'crime.' Define 'today.' Actually, don't define anything. Plausible deniability.",
    "Pirate retirement? There's a beach somewhere with my name on it. Literally. I carved it.",
    "You're all crew until someone disagrees with me. Then we revisit the plank situation.",
    "I haven't committed crimes. I've committed ADVENTURES. The law is a matter of perspective.",
}, {
    "DECORATION?! I'm group DECORATION?!",
    "It's YOUR code?! You wrote the code to benefit YOURSELF?!",
    "Adventures. The law is 'perspective.' I'm filing this under 'things I'll deny hearing.'",
    "You CARVED your name on a beach?! That's not retirement, that's vandalism!",
    "Revisit the PLANK situation?! Was the plank ever NOT a situation?!",
})

T("PIRATE", {
    "{name}, do pirates have funerals or is it more of a 'float away' deal?",
    "Hey {name}, what's your opinion on the 'pirate vs ninja' debate?",
    "{name}, I notice you refer to everything as 'booty.' Can you... not?",
    "So {name}, if you could steal one thing — ANYTHING — what would it be?",
}, {
    "Pirate funerals are BEAUTIFUL. Flaming ship at sunset. Very dramatic. Expensive though.",
    "Pirate vs ninja? Pirates have rum. Ninjas have stealth. We have rum AND cannons. Discussion over.",
    "Everything IS booty. Gold? Booty. Food? Booty. Friendship? The greatest booty of all.",
    "One thing? A bigger ship. Then I'd steal a SECOND bigger ship. It's a scalable strategy.",
    "Pirate funerals double as parties. If you're not dancing at my funeral, you're walking the plank. ...at the funeral.",
    "Friendship is the greatest booty — I'm NOT being sarcastic. That's genuine pirate philosophy.",
}, {
    "Friendship is the greatest BOOTY?! I can't tell if that's sweet or terrible!",
    "A SCALABLE stealing strategy?! You've OPTIMIZED theft?!",
    "Rum AND cannons — okay, you win the debate. That's not debatable.",
    "Walking the plank AT your funeral?! Your funeral has a PUNISHMENT?!",
    "You just called friendship booty with a STRAIGHT FACE!",
})

--=========================================================================
--  TARGET-SPECIFIC TOPICS: Anyone → WARLOCK (additional depth)
--=========================================================================

T("WARLOCK", {
    "{name}, I had a nightmare about shadows. Was that you?",
    "Hey {name}, what do warlocks consider a 'good day'?",
    "{name}, your demon just winked at me. Should I be concerned or flattered?",
    "So {name}, is there a warlock handbook or do you just improvise the evil?",
}, {
    "A nightmare about shadows? That was probably just a nightmare. Unless it had tentacles. Then yes.",
    "A good day? No accidental summonings, no demon mutinies, and at least one soul shard. Low bar.",
    "If my demon winked at you, he wants something. Don't give him anything. Especially snacks.",
    "There IS a handbook but half the pages burst into flame when you read them. On purpose.",
    "My demon winks at EVERYONE. It's called psychological warfare. Or he has a thing. I don't ask.",
    "Improvise the evil? I'll have you know my corruption is METHODICAL.",
}, {
    "The handbook BURNS ITSELF?! Who DESIGNED that?!",
    "No accidental summonings is the bar?! How often do ACCIDENTAL summonings happen?!",
    "He wants SNACKS?! Your demon wants people SNACKS?!",
    "Methodical corruption. Put that on a business card.",
    "Tentacles?! The nightmare had TENTACLES?! {name}, WHAT DID YOU DO?!",
})

--=========================================================================
--  UNIVERSAL TOPICS: Anyone → Anyone (persona-agnostic)
--=========================================================================

U({
    "Hey {name}, be honest — are you having fun or are you just here for the loot?",
    "{name}, real talk — on a scale of 1 to 'why am I here,' how's the run going?",
    "So {name}, what made you decide to spend your evening in a dungeon with strangers?",
    "{name}, quick check — are we a GOOD group or just a group?",
}, {
    "I'm here for the loot. The fun is accidental.",
    "Why am I here? Don't ask questions you don't want answers to.",
    "I chose this dungeon because the alternative was going outside. PASS.",
    "We're a group. 'Good' is aspirational. I respect the ambition though.",
    "Fun and loot are the same thing. My brain has merged them.",
    "This is the most productive thing I've done all day and I have VERY mixed feelings about that.",
}, {
    "Fun is ACCIDENTAL?! That's the saddest honest answer ever!",
    "The alternative was going outside. Fair. Very fair.",
    "'Good is aspirational.' I'm offended but you're not wrong.",
    "Your brain merged fun and loot?! Is that healthy?!",
    "Most productive thing all day... in a dungeon... yeah, same actually.",
}, "dungeon")

U({
    "Hey {name}, unpopular opinion time — what's overrated in this game?",
    "{name}, hot take: the best part of any dungeon is the trash pulls. Fight me.",
    "So {name}, controversial question — are we overgeared for this or undergeared?",
    "{name}, random thought — do we ever TRULY recover from a wipe or does it haunt us?",
}, {
    "Overrated? Epics. I've had blues that OUTPERFORMED purples. Don't @ me.",
    "Trash pulls ARE great. Low pressure, decent loot, nobody yelling. Peak gaming.",
    "We are perfectly geared. Not a single piece too many or too few. ...I'm lying.",
    "Wipes haunt me. Every corpse run adds a new layer to my character's trauma.",
    "If the boss doesn't drop what I need, the BOSS is overrated.",
    "We recover from wipes physically but never emotionally.",
}, {
    "Blues outperforming purples?! Show me the RECEIPTS!",
    "Nobody yelling during trash is basically vacation.",
    "You're LYING about our gear?! How badly?!",
    "Emotionally haunted by a wipe. We should all get therapy.",
}, "dungeon")

U({
    "{name}, if this group had a name, what would it be?",
    "Hey {name}, ten years from now, will you remember this dungeon run?",
    "{name}, group question — if we were a band, who's the drummer?",
    "So {name}, what's your excuse for being online right now? Mine's 'insomnia.'",
}, {
    "Group name? 'Accidental Heroes.' Or 'Controlled Chaos.' Both fit.",
    "Ten years? I'll remember the WIPES. The victories blend together. The pain is specific.",
    "I'm the drummer. I hit things at regular intervals and nobody notices until I stop.",
    "My excuse? 'Research.' I'm researching how to play the game I've been playing for years.",
    "We'd be called 'No Refunds.' Because that's our policy AND our skill description.",
    "I'm online because real life doesn't have an auction house.",
}, {
    "'No Refunds' as a group name! I love it and hate it simultaneously!",
    "The pain IS specific! Why is that so TRUE?!",
    "Research?! You're RESEARCHING the game?! For WHOM?!",
    "Real life doesn't have an auction house. The truest thing said today.",
}, "dungeon")

U({
    "{name}, random question — what's the last thing you ate? In game AND real life.",
    "Hey {name}, do you ever talk to NPCs and forget they're not real people?",
    "So {name}, what's your most embarrassing in-game moment? I'll go first if you want.",
    "{name}, be honest — how many times have you gotten lost in a dungeon?",
    "{name}, I need to know — do you read quest text or just accept and go?",
}, {
    "In-game: conjured bread. Real life: also bread. I have a type.",
    "I thanked a vendor once. OUT LOUD. The vendor said nothing. Because they're fake. I felt real shame.",
    "Most embarrassing? I fell off a bridge into lava in front of twenty people. Zero lived.",
    "Lost? Define 'lost.' I prefer 'aggressively exploring the wrong direction.'",
    "Read quest text? I read the first line and the last line. The middle is always 'go kill ten things.'",
    "I talk to NPCs normally. They don't respond. This is fine. Everything is fine.",
}, {
    "You have a TYPE and it's BREAD?! Bread in BOTH realities?!",
    "You thanked a VENDOR out LOUD?! That's either cute or a cry for help!",
    "'Aggressively exploring the wrong direction.' I'm stealing that phrase.",
    "You fell into LAVA?! In front of TWENTY people?! No witnesses survived?!",
    "The middle IS always 'kill ten things'! That's EXACTLY right!",
})

U({
    "{name}, quick game — what's the worst group you've EVER been in?",
    "Hey {name}, if you could change one thing about your class, what would it be?",
    "So {name}, what was your 'I'm never doing THAT again' moment?",
    "{name}, real talk — have you ever rage-quit? Like truly QUIT quit?",
}, {
    "Worst group? We had a tank who pulled in moonwalk. Like, walking backwards into mobs. On purpose.",
    "Change one thing? More bag space. Everything else is fine. But the BAGS. The bags are suffering.",
    "The 'never again' moment? Four-hour dungeon run that ended in a wipe on the LAST boss. The last. Boss.",
    "Rage-quit? Twice. Both times I was back in twenty minutes. I have no self-control.",
    "Worst group was also the funniest group. We wiped nine times and made a friend. Mixed results.",
    "One change? I want to fly. Every class should fly. Ground mounts are for people who hate fun.",
}, {
    "MOONWALKING INTO MOBS?! ON PURPOSE?! That's either genius or insanity!",
    "Bag space! YES! I'm carrying forty-seven grey items RIGHT NOW!",
    "Four hours and a wipe on the LAST boss! I'd uninstall!",
    "Back in twenty minutes! Your 'rage quit' has a TIMER!",
    "Nine wipes and made a friend. That's like a group bonding trauma study.",
})

U({
    "Hey {name}, what's the most gold you've ever had at one time?",
    "{name}, serious question — do you think loot should be fair or should I get more?",
    "So {name}, how's your bank look? Organized or chaos?",
    "{name}, real talk — auction house or vendor? Where do you dump stuff?",
}, {
    "Most gold? I had 500 once. For eight minutes. Then the auction house happened.",
    "Fair loot? Loot should go to whoever keeps losing rolls. Which is ALWAYS me.",
    "My bank is organized by the system of 'throw it in and close your eyes.'",
    "I vendor everything. The auction house requires math and I refuse.",
    "I had gold once. Then I decided I needed ALL the mounts. Now I have mounts and NO gold.",
    "My bank is organized. Into two categories: 'stuff' and 'more stuff.' Very efficient.",
}, {
    "500 gold for EIGHT MINUTES! What did you BUY?!",
    "You ALWAYS lose rolls?! Statistically that shouldn't be possible!",
    "Throw it in and close your eyes! That's not a SYSTEM!",
    "All the mounts and no gold. The classic trade.",
    "'Stuff' and 'more stuff.' I can't even argue. That IS a system.",
}, "city")

U({
    "{name}, random thought — do you think mobs talk about US after we leave?",
    "Hey {name}, do you think the bosses are scared of us or just annoyed?",
    "So {name}, if NPCs had feelings, are we the bad guys?",
    "{name}, philosophical question — are we heroes or just really aggressive tourists?",
}, {
    "Mobs DEFINITELY talk about us. 'Here they come again. With the SWORDS.'",
    "Bosses are annoyed. We show up, mess up their house, and take their stuff. We're basically in-laws.",
    "If NPCs had feelings? They'd need therapy. We're their worst recurring nightmare.",
    "Aggressive tourists. We walk in, admire nothing, break everything, and take souvenirs.",
    "The mobs have a group chat about us. I'm sure of it. We're their villains.",
    "We are ABSOLUTELY the bad guys from the boss's perspective. He was just STANDING there.",
}, {
    "We're their IN-LAWS! That's the funniest insult to adventurers I've heard!",
    "Aggressive tourists who take SOUVENIRS! That's literally what loot is!",
    "The mobs have a GROUP CHAT?! About US?!",
    "He was just STANDING there! We ARE the villains!",
    "Their worst recurring nightmare. That's... accurate, actually.",
})

U({
    "{name}, confession time — what's the pettiest thing you've done in game?",
    "Hey {name}, have you ever done something so dumb you were glad nobody was watching?",
    "So {name}, what's your comfort activity in game? Mine's fishing. Don't judge.",
    "{name}, real talk — how much of your playtime is productive vs just walking around?",
}, {
    "Pettiest thing? I needed on an item just because someone was rude. No regrets.",
    "Dumb? I jumped off a cliff to 'save time.' The corpse run was longer. Much longer.",
    "Comfort activity? I organize my bags. For an hour. It's meditation.",
    "Productive? Maybe 20%. The other 80% is standing in town and checking my gear.",
    "I vendored a purple once out of spite. Best gold I ever made emotionally.",
    "I once walked to a quest location, forgot what the quest was, and walked back. Twice.",
}, {
    "You needed out of SPITE?! You're a LEGEND!",
    "Jumped off a cliff to save time! How did you think that would WORK?!",
    "Organizing bags for an hour is MEDITATION?! To each their own!",
    "Vendored a purple out of SPITE! The emotional gold economy is real!",
    "Walked there TWICE and forgot BOTH times?! How?!",
})

U({
    "{name}, who's the MVP of this group right now? And you can't say yourself.",
    "Hey {name}, if this group had to survive on a desert island, who dies first?",
    "So {name}, group trust exercise — rate our teamwork out of 10.",
    "{name}, quick poll — are we GOOD at this or just resilient?",
    "{name}, fun question — if everyone in the group swapped roles, who'd be worst?",
}, {
    "MVP? The healer. Always the healer. If you disagree, you've never played healer.",
    "Desert island? I die first. Not because I'm weak but because I'd eat something poisonous within an hour.",
    "Teamwork? Solid 6. We function. Not gracefully, but we function.",
    "We're resilient. Like cockroaches. We can't die and nobody finds us attractive.",
    "Worst at swapped roles? Anyone who goes healer. Healing looks easy until you're the one doing it.",
    "MVP is whoever ISN'T currently dead. The bar is on the floor.",
}, {
    "Like COCKROACHES?! Resilient and unattractive?! RUDE but... accurate?",
    "The bar is on the FLOOR! And we're STILL tripping over it!",
    "A solid 6. That's... generous, honestly.",
    "You'd eat something poisonous within an HOUR?! On a DESERT ISLAND?!",
    "Everyone who isn't dead is MVP. That's the lowest bar in history.",
})

U({
    "{name}, if you could have any NPC's job, whose would you take?",
    "Hey {name}, what's the ideal group size? And 'just me' isn't an answer.",
    "So {name}, what's the first thing you do when you log in? Every time. Be honest.",
    "{name}, deep cut — why do we keep coming back to this game?",
}, {
    "NPC job? The innkeeper. Stand still, charge rent, never get attacked. Perfect.",
    "Ideal group size? Three. Enough to survive, small enough that nobody says anything stupid.",
    "First thing I do? Check the auction house. THEN check if anyone's online. Priorities.",
    "Why do we come back? Because the real world doesn't have experience bars. Here, I PROGRESS.",
    "I'd take the flight master's job. You sit on a griffin and wave at people. DREAM career.",
    "First thing I do is stand still for three minutes deciding what to do. EVERY time.",
}, {
    "The innkeeper! That IS the dream job! No combat! Just RENT!",
    "'Just me' wasn't an option but I was GOING to say it!",
    "Three minutes standing still! And I thought I was indecisive!",
    "The real world doesn't have experience bars. That's... actually profound?",
    "Flight master — sit on a griffin and wave. You've found your calling.",
})

U({
    "Hey {name}, what's an ability you WISH your class had?",
    "{name}, if you could learn ONE skill from another class, what would it be?",
    "So {name}, what's your dream loot drop? The one you'd SCREAM for?",
    "{name}, random — what do you think your character does on their day off?",
}, {
    "I wish I could stealth. Every class should stealth. Just to avoid conversations.",
    "I'd learn Hearthstone. Wait, everyone has that. Okay — Blink. Get me OUT of trouble instantly.",
    "Dream drop? Anything with my name in the tooltip. They should name loot after us.",
    "My character on a day off? Sits in an inn, drinks, and complains about adventuring. Same as me IRL.",
    "I want Feign Death. Just lie down and let the problem move past you.",
    "Dream loot is whatever the person next to me ALSO wants. I love competition.",
}, {
    "Stealth to avoid CONVERSATIONS! You'd stealth from US!",
    "Feign Death to let problems pass you! That's not a skill, that's a LIFESTYLE!",
    "Name loot after us?! I want 'Greaves of {name}' immediately!",
    "You love competition for loot?! You're a MONSTER! A loot gremlin!",
    "Sits in an inn and complains. Your character IS you!",
})

U({
    "{name}, what's a sound in this game that's burned into your brain forever?",
    "Hey {name}, do you ever zone out and just auto-attack for a while?",
    "{name}, what's a quest you'd NEVER do again even for all the gold?",
    "So {name}, how many characters do you have? And how many do you ACTUALLY play?",
}, {
    "The MURLOC sound. Mrgrgrlgl. It plays in my nightmares. They're ORGANIZED.",
    "Auto-attack zone out? I've almost died three times doing it. My brain just... leaves.",
    "Any escort quest. EVERY escort quest. The NPC walks slower than my PATIENCE.",
    "Characters? I have seven. I play ONE. The other six are emotional support alts.",
    "The level-up sound. It's Pavlovian. I hear it and feel instant happiness.",
    "Zone out? I zoned out MID-CONVERSATION with a group once. Nobody noticed for ten minutes.",
}, {
    "MURLOCS IN YOUR NIGHTMARES! They haunt us ALL!",
    "Emotional support ALTS! I'm dying!",
    "Escort quests. The NPC walks at 80% run speed. WHY is it ALWAYS 80%?!",
    "Nobody noticed for TEN MINUTES?! Were we... are we boring?",
    "The level-up sound as Pavlov. That's SCIENCE!",
})

U({
    "Hey {name}, do you think our gear matches or do we look ridiculous?",
    "{name}, serious — fashion or stats? When they conflict, what wins?",
    "So {name}, is there a piece of gear you WON'T take off for sentimental reasons?",
    "{name}, be honest — have you ever worn something ugly just for the stats?",
}, {
    "We look ridiculous. Like a circus that found an armory. I've made peace with it.",
    "Fashion over stats. I will DIE pretty. That's not a joke. I have died. In pretty gear.",
    "I have boots from level 20 in my bank. They got me through hard times. They stay.",
    "Ugly for stats? I wore a bright green chest piece for six levels. Six VISIBLE levels.",
    "Our gear matches if you squint. And also if you're colorblind. And also if you're looking away.",
    "Stats always win. Fashion is for people who aren't getting hit in the face.",
}, {
    "A circus that found an armory! I can't UNSEE it now!",
    "You will DIE pretty! Warriors should never say that!",
    "Boots from level 20! In the BANK! That's actually sweet!",
    "Six VISIBLE levels in bright green?! You must have been a BEACON!",
    "Fashion is for people NOT getting hit in the face — fair critique.",
})

U({
    "{name}, what's the longest you've played in one sitting? Be honest, no judgment.",
    "Hey {name}, do you plan your play sessions or just... end up here?",
    "So {name}, what time is it for you IRL? And should either of us be asleep?",
    "{name}, confession — have you ever lied about why you were AFK?",
}, {
    "Longest sitting? Twelve hours. I emerged a different person. My chair was warm. Too warm.",
    "Plan? I sit down to 'do one quest.' I emerge six hours later with 40 completed quests and no memory.",
    "It's 3 AM. I should DEFINITELY be asleep. But the dungeon isn't going to run itself.",
    "Lied about AFK? I said 'phone call' when I was actually making a sandwich. A BIG sandwich.",
    "One sitting? I lost a weekend once. Saturday to Sunday evening. My cat staged an intervention.",
    "I AFK'd and said 'bio break.' I was actually checking my auction house on my phone. In the bathroom.",
}, {
    "Your CHAIR was warm?! After twelve hours I'd expect it to be ON FIRE!",
    "'Do one quest' to six hours! That pipeline is REAL!",
    "3 AM! WE SHOULD BOTH BE ASLEEP! Yet here we are!",
    "A BIG sandwich! Was it at least a GOOD sandwich?",
    "Your CAT staged an INTERVENTION! Even the cat knows!",
})

U({
    "Hey {name}, what do you ACTUALLY think about when we're running back after a wipe?",
    "{name}, corpse run confession time — what goes through your mind?",
    "So {name}, at what point does a wipe become funny instead of frustrating?",
    "{name}, after a wipe, who do you blame? Internally. No judgment.",
}, {
    "During corpse runs? 'This is fine. Everything is fine. I chose this. Why did I choose this.'",
    "I think about whether my food buffs survived. They never do. A moment of silence.",
    "A wipe becomes funny at wipe three. Wipe one is rage. Wipe two is bargaining. Three is acceptance.",
    "Who do I blame? The person who says 'that was easy' before the pull. That person.",
    "Corpse running, I contemplate my life choices. Then I res and do it all again.",
    "I blame nobody. I blame the ENCOUNTER DESIGN. That's healthier and also avoids conflict.",
}, {
    "Food buffs never survive! A moment of SILENCE!",
    "Wipe grief cycle: rage, bargaining, acceptance! That's TEXTBOOK!",
    "'That was easy' jinxes EVERY time! EVERY. TIME!",
    "Blame the encounter design. Very diplomatic. Very cowardly. I respect it.",
    "You contemplate life choices AND res anyway! That's the human condition!",
}, "dungeon|raid")

U({
    "{name}, if bosses dropped REAL rewards, like pizza, would you play more or less?",
    "Hey {name}, hypothetically — if you could trade one IRL skill for an in-game skill, what's the swap?",
    "So {name}, if our characters met IRL, would we be friends or would it be weird?",
    "{name}, big question — is this game better now or was it better back then? The eternal debate.",
}, {
    "Bosses dropping pizza? I'd NEVER leave. I'd be a skeleton at my desk. But well-fed.",
    "Trade IRL cooking for in-game portal spell. I'd never cook again but I'd teleport to RESTAURANTS.",
    "Our characters IRL? We'd be WANTED criminals. None of this is legal in real life.",
    "This game is ALWAYS better 'back then.' Even 'back then' people said it was better 'back then.'",
    "Pizza drops? The world first raiders would be professional competitive eaters. I'm here for it.",
    "Better now. Rose-tinted goggles are a real item and everyone has them equipped.",
}, {
    "A skeleton at your desk but WELL-FED! The dream!",
    "Teleport to RESTAURANTS instead of cooking! GENIUS trade!",
    "We'd be WANTED CRIMINALS! Murder, theft, trespassing — we do it ALL!",
    "'Back then' people said 'back then'! It's recursive nostalgia!",
    "Rose-tinted goggles as an equipped item! Where do I farm those?",
})

U({
    "Hey {name}, what's the best advice anyone ever gave you about this game?",
    "{name}, what's the worst advice you FOLLOWED?",
    "So {name}, is there something you wish you knew when you first started?",
    "{name}, did anyone teach you to play or did you just... figure it out?",
}, {
    "Best advice? 'Don't stand in the fire.' I heard it. I understood it. I stand in it anyway.",
    "Worst advice? 'Just pull everything, it'll be fine.' It was NOT fine.",
    "I wish I knew that quest items STACK. Level 1-30 my bags were a NIGHTMARE.",
    "Nobody taught me. I clicked my abilities like a piano player having a seizure. It worked out.",
    "Best advice: 'Read the dungeon journal.' I ignored it. Wiped seven times. Then I read it.",
    "I was taught by trial and error. Mostly error. Error was a great teacher.",
}, {
    "You KNOW about the fire and stand in it ANYWAY?! WHY?!",
    "Pull everything — it's fine. NARRATOR: it was not fine.",
    "Quest items STACK?! ...wait, you didn't know that?! For THIRTY LEVELS?!",
    "Clicked abilities like a piano seizure! That's... actually how I started too!",
    "Seven wipes THEN read the journal! That order is PEAK stubbornness!",
})

U({
    "{name}, unpopular opinion: waiting for the group is the hardest content in the game.",
    "Hey {name}, what do you do while waiting for everyone to be ready?",
    "So {name}, the 'one more run' trap — have you fallen for it today?",
    "{name}, how many times have you said 'okay this is my last dungeon' and LIED?",
}, {
    "Waiting IS the hardest content. I'd rather fight five bosses than wait five minutes.",
    "While waiting? I reorganize my action bars. They never NEED reorganizing. It's a compulsion.",
    "The 'one more run' trap got me last night. I said one more at 11 PM. It's NOW.",
    "I say 'last dungeon' at least three times per session. My word means nothing.",
    "I wait by jumping in circles. If you see someone jumping in circles, they're WAITING and LOSING IT.",
    "'One more run' is a lie I tell myself. I'm not even mad. I accept my fate.",
}, {
    "Waiting vs five bosses — bosses EVERY time! At least bosses DO something!",
    "Reorganizing action bars that don't need it! It's a SICKNESS!",
    "'It's NOW.' You got trapped for a WHOLE NIGHT!",
    "Jumping in circles to cope with waiting! I DO THAT TOO!",
    "Your word means nothing and you've accepted it! Beautiful self-awareness!",
}, "dungeon")

U({
    "Hey {name}, what's something every player does but nobody admits?",
    "{name}, guilty pleasures in game — go. No judgment. Maybe light judgment.",
    "So {name}, what's your secret shame? The thing you'd never tell your guild?",
    "{name}, be real — what's a 'normal' thing you do in game that's actually unhinged?",
}, {
    "Everyone talks to their character. IN FULL SENTENCES. Nobody admits it. You do it. I do it.",
    "Guilty pleasure? I dance alone in empty rooms. Full routines. Nobody claps. I clap for myself.",
    "Secret shame? I've vendored quest items and had to abandon and REDO quests. Multiple times.",
    "Normal-but-unhinged? I keep a mental ranking of every group I've ever been in. Updated in real time.",
    "Everyone vendor-checks random NPCs even though it never has anything good. EVERYONE.",
    "I say 'grats' on achievements I don't understand. Every time. I have no idea what they did.",
}, {
    "Full conversations with your character! Okay, yes, I do that!",
    "Dance alone and clap for yourself! That's either tragic or EMPOWERING!",
    "A MENTAL RANKING of every group?! Where do WE rank?!",
    "Vendor-checking random NPCs! It's a COMPULSION! I can't stop!",
    "'Grats' for unknown achievements! The automated politeness!",
})

U({
    "{name}, let's settle this — tanks, healers, or DPS: who has it hardest?",
    "Hey {name}, hot take: the most important role in a group is the one nobody thanks.",
    "So {name}, if roles had salaries, who should get paid most?",
    "{name}, follow-up question — who gets BLAMED most?",
}, {
    "Tanks have it hardest. You face the monster AND the group's opinions. Double boss fight.",
    "Nobody thanks the person who DOESN'T pull extra mobs. Restraint is a skill.",
    "Healers get paid most. They keep everyone alive AND manage everyone's ego. Two jobs.",
    "Blamed most? The last person to die. It's not fair but it IS consistent.",
    "DPS has it hardest. You have to be PERFECT. Too slow? Trash. Too fast? You pulled. No winning.",
    "Nobody gets thanked enough. Except maybe me. I could use more thanks. Just saying.",
}, {
    "Double boss fight — the monster AND the opinions! That's BRUTAL!",
    "Restraint as a skill! The person who DOESN'T pull! Unsung hero!",
    "Healers managing health AND egos! TWO jobs! And we barely say thanks!",
    "The last person to die gets blamed! The accuracy HURTS!",
    "You want more thanks? Thank you, {name}. There. Was that enough?",
})

U({
    "{name}, if the game had a yearbook, what would your 'most likely to' be?",
    "Hey {name}, class of Azeroth — what's your superlative?",
    "So {name}, if the group voted, what would YOUR title be?",
    "{name}, be honest — what character trait do other players know you for?",
}, {
    "Most likely to die first. And most likely to STILL be having fun while dead.",
    "My superlative? 'Most likely to start a side conversation during a boss fight.'",
    "My title? 'The One Who Always Needs a Sec.' I'm working on it. One sec.",
    "I'm known for being late. And then immediately pulling. The combo is my signature.",
    "Most likely to loot while everyone is still in combat. Priorities.",
    "My trait? Accidental leadership. Nobody asked me to lead. I didn't ask either. Yet here I am.",
}, {
    "Die first AND have fun! That's a TALENT!",
    "Side conversation DURING A BOSS?! Focus, {name}!",
    "'One sec' while saying 'one sec' — meta lateness!",
    "Loot during combat! You have NO shame! And I respect that!",
    "Accidental leadership — the reluctant hero trope!",
})

U({
    "Hey {name}, serious check — when's the last time you saw sunlight?",
    "{name}, gamer wellness question — have you eaten today? Like REAL food?",
    "So {name}, water check. Hydration matters. Even in a dungeon.",
    "{name}, posture check — are you sitting correctly? Be honest.",
}, {
    "Sunlight? I saw some through the curtain crack. Does that count?",
    "Real food? Does energy drinks count as food? They have calories. Calories are food.",
    "I am hydrated by the tears of my enemies. And also a glass of water. Mostly the water.",
    "Posture? I'm sitting like a pretzel in a gaming chair. My spine is CREATIVE.",
    "Sunlight is overrated. It doesn't give experience points.",
    "I ate a meal. A FULL meal. Two hours ago. ...okay, it was chips. But a LOT of chips.",
}, {
    "Curtain crack sunlight DOES NOT count!",
    "Energy drinks as food! Please eat SOMETHING!",
    "Your spine is CREATIVE?! See a doctor!",
    "Sunlight doesn't give XP — okay, that's a fair argument!",
    "A lot of chips is NOT a meal! {name}, please!",
})

U({
    "{name}, how many addon issues have you blamed on lag?",
    "Hey {name}, lag or skill issue? The eternal question.",
    "So {name}, do you blame the server or yourself? Honest answers only.",
    "{name}, random — has anyone ever accused you of using an aimbot? In WoW?",
}, {
    "Lag is responsible for 90% of my deaths. The other 10% is also lag but less provable.",
    "It's ALWAYS lag. When I succeed it's skill. When I fail it's lag. This is scientifically proven.",
    "I blame the server. The server and I have a complicated relationship.",
    "Aimbot? In WoW? Someone accused me of using one. I was a HEALER. Casting heals. On my team.",
    "Lag is convenient because it's invisible and unprovable. The perfect excuse.",
    "I blame myself. Just kidding. It's the server. Or the patch. Or solar flares.",
}, {
    "You blamed lag for 90% of deaths AND the other 10%?! It's ALL lag?!",
    "Aimbot in WoW! AS A HEALER! What were you aimbotting?! HEALS?!",
    "Solar flares! You're blaming SPACE for your gameplay!",
    "Lag is invisible and unprovable — the PERFECT crime!",
    "You were accused of aimbotting HEALS?! That's the best compliment ever!",
})

U({
    "Hey {name}, if you had to explain this game to your grandma, what would you say?",
    "{name}, elevator pitch — sell me on your class in ten words or less.",
    "So {name}, how would you explain what we're doing RIGHT NOW to a stranger?",
    "{name}, if a non-gamer walked in right now, what would they think?",
}, {
    "Grandma? 'I'm friends with a computer who lives in a sword castle.' She'd get it.",
    "My class in ten words? 'I hit things until they stop moving. Also, yelling.'",
    "What we're doing? 'Cooperative violence in a fantasy cave for imaginary rewards.' Normal stuff.",
    "A non-gamer would think I'm arguing with strangers about math. They'd be RIGHT.",
    "I'd tell grandma it's like bingo but with swords and more yelling.",
    "A stranger would see five people typing furiously about a dragon. And think we need help.",
}, {
    "SWORD CASTLE! Grandma would LOVE sword castle!",
    "'Cooperative violence for imaginary rewards' is the honest game description!",
    "Arguing with strangers about MATH! That IS what we're doing!",
    "Bingo with swords and yelling! I'd play THAT game too!",
    "Five people typing about a dragon. We DO need help!",
})

U({
    "Hey {name}, what's an in-game habit you can't break?",
    "{name}, what's something you do EVERY session without fail?",
    "So {name}, do you have any rituals before a boss fight?",
    "{name}, is there something you do that you KNOW is suboptimal but do anyway?",
}, {
    "I jump before every pull. EVERY pull. It does nothing. I can't stop.",
    "Every session I check guild chat, see the same drama, sigh, and close it. EVERY time.",
    "Before a boss? I eat food, pop a flask, and whisper 'don't die' to myself. Works 60% of the time.",
    "Suboptimal? I use my favorite ability even when another is better. LOYALTY to my rotation.",
    "I mount up for distances I could walk in three seconds. Every. Single. Time.",
    "I /wave at every player I pass. Most don't wave back. I wave anyway. It's who I am.",
}, {
    "Jump before EVERY pull?! I thought I was the only one!",
    "Same guild drama every day! And you open it EVERY TIME!",
    "'Don't die' as a pre-boss whisper! Does it WORK?",
    "Mounting for three seconds of walking! The COMMITMENT to mounting!",
    "Waving at everyone! Wholesome but heartbreaking when nobody waves back!",
})

U({
    "{name}, quick hypothetical — group gets ONE wish. What do we wish for?",
    "Hey {name}, if a genie appeared right now and offered 3 in-game wishes, go.",
    "So {name}, dream scenario — what would the PERFECT game session look like?",
    "{name}, imagine — unlimited gold for one hour. What do you do?",
}, {
    "One wish? Instant teleport to any dungeon. No more walking. EVER.",
    "Three wishes: Bag space. More bag space. INFINITE bag space.",
    "Perfect session? Zero wipes, all drops I need, everyone's funny, done in two hours.",
    "Unlimited gold for an hour? Buy EVERYTHING on the auction house. Crash the economy. Watch the chaos.",
    "One wish? Every recipe in the game. I'd become the ULTIMATE crafter. Nobody would ever need anyone else.",
    "Perfect session is just this. Good people, good banter, good drops. ...okay, the drops could improve.",
}, {
    "Three wishes and ALL of them are bag space?! The dedication!",
    "Crash the economy!! In ONE HOUR?! You'd be a LEGEND!",
    "Every recipe in the game — crafter MONOPOLY! That's evil and brilliant!",
    "Zero wipes AND all drops?! Wake up, {name}, you're dreaming!",
    "Good drops COULD improve. Story of our LIVES.",
})

U({
    "Hey {name}, what's a rule you NEVER break in groups?",
    "{name}, what's your one non-negotiable in a dungeon run?",
    "So {name}, what's the fastest way to get on your bad side?",
    "{name}, is there a line? Like, something a group member could do that's unforgivable?",
}, {
    "Never pull when the healer is drinking. That's a COMMANDMENT.",
    "Non-negotiable: we wait for everyone. If one person's not ready, NOBODY pulls.",
    "Bad side? Need on something you can't use. Instant blacklist. Emotional and mental.",
    "Unforgivable? Going AFK without saying anything. Just... vanishing. Are you dead? Did you quit? WHO KNOWS.",
    "Never blame the healer. The healer is the reason you're ALIVE. Show RESPECT.",
    "My rule: always say 'gg' at the end. Even if it wasn't 'gg.' It's MANNERS.",
}, {
    "Never pull while healer drinks! THE commandment! Tatoo-worthy!",
    "Needing on unusable items! INSTANT blacklist! I'm with you!",
    "AFK without telling anyone! Are they DEAD?! DID THEY GO TO BED?!",
    "Always say gg. Even lying gg. Because MANNERS. I love that.",
    "Never blame the healer — said while the healer reads this and CRIES.",
}, "dungeon")

U({
    "Hey {name}, do you screenshot anything or is your memories folder empty?",
    "{name}, do you think people will play this game in 20 years?",
    "So {name}, what's ONE memory from this game you'll genuinely never forget?",
    "{name}, big question — what keeps you playing after all this time?",
}, {
    "My screenshot folder has 2,000 images. I've looked at them once. But they're THERE.",
    "20 years? People will play this game FOREVER. We're trapped. Happily trapped.",
    "One memory? My first time stepping into Stormwind. The music hit. I was HOOKED.",
    "What keeps me playing? The people. The chaos. The tiny dopamine hit when loot drops. It's the TRIFECTA.",
    "Screenshots? I take them of EVERY achievement. Including the ones nobody cares about.",
    "What keeps me playing? Honestly? Conversations like this. The banter. Literally.",
}, {
    "2,000 screenshots! Viewed ONCE! But they're THERE just in case!",
    "Happily trapped. That's the most honest description of this game.",
    "The Stormwind music! That theme! EVERYONE remembers that moment!",
    "Conversations like THIS keep you playing? That's sweet. And a little concerning.",
    "Dopamine trifecta: people, chaos, loot. Science backs this up!",
})

U({
    "{name}, let me ask you something deep — are we the NPCs of someone else's game?",
    "Hey {name}, shower thought — what if the NPCs are the real players?",
    "So {name}, what if this game is a simulation INSIDE a simulation?",
    "{name}, quick philosophy — is our character real or are WE the character they're playing?",
}, {
    "We're DEFINITELY NPCs. We follow the same routes, do the same quests. Wake up. We're scripted.",
    "NPCs are the real players? That explains why the vendors are always SO calm.",
    "Simulation in a simulation? That's too many layers. My brain has a rendering limit.",
    "Are we the character? Maybe. This would explain why I feel pain when I die in game.",
    "We're NPCs with good voice acting. That's the only difference.",
    "If NPCs are the real players then they're REALLY committed to standing still.",
}, {
    "We're SCRIPTED?! I don't follow routes! ...wait, I DO go to the same spots every day!",
    "A RENDERING LIMIT for existential questions! Your brain has min specs!",
    "NPCs are committed to standing still! That IS dedication!",
    "You feel pain when you die in game?! That's... not normal!",
    "Good voice acting NPCs! That's the nicest thing anyone's called me!",
})

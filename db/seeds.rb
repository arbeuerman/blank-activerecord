# Seed Your Database

# Spell.create(name: "Levitation Charm", spell_type: "Charm", incantation: "Wingardium Leviosa", description: "The Levitation Charm is one of the first spells learnt by any young witch or wizard. With the charm a witch or wizard can make things fly with the flick of a wand. The charm is an excellent test of your magical skills, wand control and above all, patience.")
# Spell.create(name: "Killing Curse", spell_type: "Curse", incantation: "Avada Kedavra", description: "The Killing Curse (Avada Kedavra) was a tool of the Dark Arts and was one of the three Unforgivable Curses. It was one of the most powerful and sinister (if not the most sinister) spells known to Wizardkind. When cast successfully on a living person or creature, the curse caused instantaneous and painless death, without causing any injury to the body, and without any trace of violence.")
# Spell.create(name: "General Counter-Spell", spell_type: "Counter-Spell", incantation: "Finite Incantantem", description: "The General Counter-Spell (Finite or Finite Incantatem) is a counter-spell for general use. It might be used in duels to counter or reverse minor damage, such as the effects of minor jinxes, hexes and curses.")

Spell.create(name: "Disarming Charm", spell_type: "Charm", incantation: "Expelliarmus", description: "The Disarming Charm (Expelliarmus) is a charm that forces whatever an opponent was holding to fly out of their hand. It is commonly used in duel to make an opponent lose their wand.")
Spell.create(name: "Stunning Spell", spell_type: "Charm", incantation: "Stupefy", description: "The Stunning Spell (Stupefy) is a charm that stuns the target, rendering them unconscious. The charm is exceptionally useful in duelling, as it can quickly end a duel without causing lasting damage. The spell also has the ability to haly objects.")
Spell.create(name: "Patronus Charm", spell_type: "Charm", incantation: "Expecto Patronum", description: "The Patronus Charm (Expecto Patronum) is one of the most famous and powerful defensive charms known to wizardkind. It is an immensely complicated and extremely difficult spell, that evokes a partially-tangible positive energy force known as a Patronus or spirit guardian. It is used primarily as protection against Dementors, against which there is no other defense.")
Spell.create(name: "Cruciatus Curse", spell_type: "Curse", incantation: "Crucio", description: "The Cruciatus Curse (Crucio), also known as the Torture Curse, was a tool of the Dark Arts and is one of the three Unforgivable Curses. It is one of the most powerful and sinister spells known to Wizardkind. When cast successfully the curse inflicts intense, excruciating pain on the victim. The penalty for use of this curse on another human being is a life sentence in Azkaban, unless there is sufficient enough evidence that the caster did so under the influence of the Imperius Curse.")
Spell.create(name: "Imperius Curse", spell_type: "Curse", incantation: "Imperio", description: "The Imperius Curse (Imperio) was a tool of the Dark Arts, and is one of the three Unforgivable Curses. It is one of the most powerful and sinister spells known to wizardkind. When cast successfully, the curse places the victim completely under the caster's control, though a person with exceptional strength of will can resist it. A person under the curse is said to be Imperiused.")
Spell.create(name: "Jelly-Legs Jinx", spell_type: "Jinx", incantation: "Locomotor Wibbly", description: "The Jelly-Legs Jinx is a jinx that causes the target's legs to collapse as if they were turned to jelly.")
Spell.create(name: "Impediment Jinx", spell_type: "Jinx", incantation: "Impedimenta", description: "The Impediment Jinx (Impedimenta) is a jinx that hinders the movement of the tarfet, slowing it down or stopping it in its tracks.")
Spell.create(name: "Vanishing Spell", spell_type: "Transfiguration", incantation: "Evanesco", description: "The Vanishing Spell (Evanesco) is a Transfiguration spell used to vanish both animate and inanimate objects into non-being.")
Spell.create(name: "Episkey", spell_type: "Healing Spell", incantation: "Episkey", description: "Episkey is the incantation of a healing charm meant to treat relatively minor injuries such as broken noses, toes, and split lips. The spell can create sudden temperature changes in the body parts being healed. It can also be used to relieve pain.")
Spell.create(name: "Densaugeo", spell_type: "Hex", incantation: "Densaugeo", description: "Densaugeo is the incantation of a hex which causes the teeth of the target to elongate at an alarming rate.")

# User.destroy_all
# User.reset_pk_sequence

# House.destroy_all
# House.reset_pk_sequence

# Quizquestion.destroy_all
# Quizquestion.reset_pk_sequence

# Useranswer.destroy_all
# Useranswer.reset_pk_sequence

# Useranswer.create(quizquestion_id:1,user_id:1)
# Useranswer.create(quizquestion_id:2,user_id:2)
# Useranswer.create(quizquestion_id:3,user_id:3)

# User.create(name: "Zech", username: "zech_loves_harry_potter", password: "123abc", house_id: 1)
# User.create(name: "Aiden", username: "aiden_wizard", password: "abc123", house_id: 2)
# User.create(name: "Alexandra", username: "alexandra_is_a_witch", password: "password", house_id: 3)

# House.create(name: "Gryffindor", colors: "Red & Gold", qualities: "Bravery & Loyalty")
# House.create(name: "Hufflepuff", colors: "Yellow & Black", qualities: "Dedication & Patience")
# House.create(name: "Ravenclaw", colors: "Blue & Bronze", qualities: "Intelligence & Creativity")
# House.create(name: "Slytherin", colors: "Green & Silver", qualities: "Resourcefulness & Ambition")


# # Question 1
# Quizquestion.create(question: "If you could make one of the following wishes come true, which would you pick?", response_option: "To have world peace", house_id: 2)
# Quizquestion.create(question: "If you could make one of the following wishes come true, which would you pick?", response_option: "To be all powerful", house_id: 4)
# Quizquestion.create(question: "If you could make one of the following wishes come true, which would you pick?", response_option: "To be omnipotent", house_id: 3)
# Quizquestion.create(question: "If you could make one of the following wishes come true, which would you pick?", response_option: "To have no fear", house_id: 1)


# # Question 2
# Quizquestion.create(question: "The first Quidditch match of the season is approaching, and you can't wait to get involved. What role are you playing?", response_option: "Seeker. I want the glory!", house_id: 1)
# Quizquestion.create(question: "The first Quidditch match of the season is approaching, and you can't wait to get involved. What role are you playing?", response_option: "Chaser. I like to be involved, and work as part of the team.", house_id: 3)
# Quizquestion.create(question: "The first Quidditch match of the season is approaching, and you can't wait to get involved. What role are you playing?", response_option: "I'll be in the crowd, making sure supporter morale is high!", house_id: 2)
# Quizquestion.create(question: "The first Quidditch match of the season is approaching, and you can't wait to get involved. What role are you playing?", response_option: "Beater. I like having all that power.", house_id: 4)


# # Question 3
# Quizquestion.create(question: "Which of your skills are you most proud of", response_option: "My ability to absorb new information.", house_id: 3)
# Quizquestion.create(question: "Which of your skills are you most proud of", response_option: "My ability to make new friends.", house_id: 1)
# Quizquestion.create(question: "Which of your skills are you most proud of", response_option: "My ability to keep secrets.", house_id: 2)
# Quizquestion.create(question: "Which of your skills are you most proud of", response_option: "My ability to get what I want.", house_id: 4)


# #Question 4
# Quizquestion.create(question: "Which of the following games would you prefer to play:", response_option: "Secret Hitler", house_id: 4)
# Quizquestion.create(question: "Which of the following games would you prefer to play:", response_option: "Pandemic", house_id: 2)
# Quizquestion.create(question: "Which of the following games would you prefer to play:", response_option: "Euchre", house_id: 3)
# Quizquestion.create(question: "Which of the following games would you prefer to play:", response_option: "Battleship", house_id: 1)

# #Question 5 
# Quizquestion.create(question: "Which bathroom item is most essential to you?", response_option: "Bandaids", house_id: 1)
# Quizquestion.create(question: "Which bathroom item is most essential to you?", response_option: "Dental floss", house_id: 2)
# Quizquestion.create(question: "Which bathroom item is most essential to you?", response_option: "Sunscreen", house_id: 3)
# Quizquestion.create(question: "Which bathroom item is most essential to you?", response_option: "Perfume/Cologne", house_id: 4)

# #Question 6
# Quizquestion.create(question: "How would you spend your ideal day?", response_option: "Starting off with the NYT crossword followed by a leisurely 2000 piece puzzle", house_id: 3)
# Quizquestion.create(question: "How would you spend your ideal day?", response_option: "Getting up early and going for a long hike where you rescue a lost dog", house_id: 1)
# Quizquestion.create(question: "How would you spend your ideal day?", response_option: "Planning your epic upcoming party and then working on your Sudoku skills", house_id: 4)
# Quizquestion.create(question: "How would you spend your ideal day?", response_option: "Running some errands in the morning and then taking a long bubble bath", house_id: 2)

# #Question 7
# Quizquestion.create(question: "Given the choice, would you rather invent a potion that would guarantee you?", response_option: "Glory", house_id: 1)
# Quizquestion.create(question: "Given the choice, would you rather invent a potion that would guarantee you?", response_option: "Wisdom", house_id: 3)
# Quizquestion.create(question: "Given the choice, would you rather invent a potion that would guarantee you?", response_option: "Love", house_id: 2)
# Quizquestion.create(question: "Given the choice, would you rather invent a potion that would guarantee you?", response_option: "Power", house_id: 4)

# #Question 8
# Quizquestion.create(question: "A Muggle confronts you and says that they are sure you are a witch or wizard. Do you:", response_option: "Ask what makes them think so.", house_id: 2)
# Quizquestion.create(question: "A Muggle confronts you and says that they are sure you are a witch or wizard. Do you:", response_option: "Agree, and ask whether they’d like a free sample of a jinx.", house_id: 1)
# Quizquestion.create(question: "A Muggle confronts you and says that they are sure you are a witch or wizard. Do you:", response_option: "Agree, and walk away, leaving them to wonder whether you are bluffing.", house_id: 3)
# Quizquestion.create(question: "A Muggle confronts you and says that they are sure you are a witch or wizard. Do you:", response_option: "Tell them that you are worried about their mental health, and offer to call a doctor.", house_id: 4)

# #Question 9
# Quizquestion.create(question: "Which nightmare would scare you most?", response_option: "None of your friends or family know who you are.", house_id: 1)
# Quizquestion.create(question: "Which nightmare would scare you most?", response_option: "Being trapped in a dark room with an eye peering at you through a keyhole.", house_id: 2)
# Quizquestion.create(question: "Which nightmare would scare you most?", response_option: "Being caught up high with no handholds.", house_id: 3)
# Quizquestion.create(question: "Which nightmare would scare you most?", response_option: "Being forced to speak in a funny voice so that everyone laughs at you.", house_id: 4)



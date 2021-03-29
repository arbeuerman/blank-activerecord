# Seed Your Database 

User.destroy_all
User.reset_pk_sequence

User.create(name: "Zech", username: "zech_loves_harry_potter", password: "123abc")
User.create(name: "Aiden", username: "aiden_wizard", password: "abc123")
User.create(name: "Alexandra", username: "alexandra_is_a_witch", password: "password")

QuizQuestion.destroy_all
QuizQuestion.reset_pk_sequence


#1 Zeck's questions
QuizQuestion.create(question: "If you could make one of the following wishes come true, which would you pick?", response_option: "To have world peace", house_id: 2)
QuizQuestion.create(question: "If you could make one of the following wishes come true, which would you pick?", response_option: "To be all powerful", house_id: 4)
QuizQuestion.create(question: "If you could make one of the following wishes come true, which would you pick?", response_option: "To be omnipotent", house_id: 3)
QuizQuestion.create(question: "If you could make one of the following wishes come true, which would you pick?", response_option: "To have no fear", house_id: 1)


#2 Zeck's questions

QuizQuestion.create(question: "The first Quidditch match of the season is approaching, and you can't wait to get involved. What role are you playing?
Seeker.", response_option: "Seeker. I want the glory!", house_id: 1)
QuizQuestion.create(question: "The first Quidditch match of the season is approaching, and you can't wait to get involved. What role are you playing?
Seeker.", response_option: "Chaser. I like to be involved, and work as part of the team.", house_id: 3)
QuizQuestion.create(question: "The first Quidditch match of the season is approaching, and you can't wait to get involved. What role are you playing?
Seeker.", response_option: "I'll be in the crowd, making sure supporter morale is high!", house_id: 4)
QuizQuestion.create(question: "The first Quidditch match of the season is approaching, and you can't wait to get involved. What role are you playing?
Seeker.", response_option: "To have no fear", house_id: 2)


#3  Zeck's questions
QuizQuestion.create(question: "Which of your skills are you most proud of", response_option: "My ability to absorb new information.", house_id: 3)
QuizQuestion.create(question: "Which of your skills are you most proud of", response_option: "My ability to make new friends.", house_id: 1)
QuizQuestion.create(question: "Which of your skills are you most proud of", response_option: "My ability to keep secrets.", house_id: 2)
QuizQuestion.create(question: "Which of your skills are you most proud of", response_option: "My ability to get what I want.", house_id: 4)


#Question 4
QuizQuestion.create(question: "Which of the following games would you prefer to play:", response_option: "Secret Hitler", house_id: 4)
QuizQuestion.create(question: "Which of the following games would you prefer to play:", response_option: "Pandemic", house_id: 2)
QuizQuestion.create(question: "Which of the following games would you prefer to play:", response_option: "Euchre", house_id: 3)
QuizQuestion.create(question: "Which of the following games would you prefer to play:", response_option: "Battleship", house_id: 1)

#Question 5 
QuizQuestion.create(question: "Which bathroom item is most essential to you?", response_option: "Bandaids", house_id: 1)
QuizQuestion.create(question: "Which bathroom item is most essential to you?", response_option: "Dental floss", house_id: 2)
QuizQuestion.create(question: "Which bathroom item is most essential to you?", response_option: "Sunscreen", house_id: 3)
QuizQuestion.create(question: "Which bathroom item is most essential to you?", response_option: "Perfume/Cologne", house_id: 4)

#Question 6
QuizQuestion.create(question: "How would you spend your ideal day?", response_option: "Starting off with the NYT crossword followed by a leisurely 2000 piece puzzle", house_id: 3)
QuizQuestion.create(question: "How would you spend your ideal day?", response_option: "Getting up early and going for a long hike where you rescue a lost dog", house_id: 1)
QuizQuestion.create(question: "How would you spend your ideal day?", response_option: "Planning your epic upcoming party and then working on your Sudoku skills", house_id: 4)
QuizQuestion.create(question: "How would you spend your ideal day?", response_option: "Running some errands in the morning and then taking a long bubble bath", house_id: 2)

#Question 7
QuizQuestion.create(question: "Given the choice, would you rather invent a potion that would guarantee you?", response_option: "Glory", house_id: 1)
QuizQuestion.create(question: "Given the choice, would you rather invent a potion that would guarantee you?", response_option: "Wisdom", house_id: 3)
QuizQuestion.create(question: "Given the choice, would you rather invent a potion that would guarantee you?", response_option: "Love", house_id: 2)
QuizQuestion.create(question: "Given the choice, would you rather invent a potion that would guarantee you?", response_option: "Power", house_id: 4)

#Question 8
QuizQuestion.create(question: "A Muggle confronts you and says that they are sure you are a witch or wizard. Do you:", response_option: "Ask what makes them think so.", house_id: 2)
QuizQuestion.create(question: "A Muggle confronts you and says that they are sure you are a witch or wizard. Do you:", response_option: "Agree, and ask whether they’d like a free sample of a jinx.", house_id: 1)
QuizQuestion.create(question: "A Muggle confronts you and says that they are sure you are a witch or wizard. Do you:", response_option: "Agree, and walk away, leaving them to wonder whether you are bluffing.", house_id: 3)
QuizQuestion.create(question: "A Muggle confronts you and says that they are sure you are a witch or wizard. Do you:", response_option: "Tell them that you are worried about their mental health, and offer to call a doctor.", house_id: 4)

#Question 9
QuizQuestion.create(question: "Which nightmare would scare you most?", response_option: "None of your friends or family know who you are.", house_id: "1")
QuizQuestion.create(question: "Which nightmare would scare you most?", response_option: "Being trapped in a dark room with an eye peering at you through a keyhole.", house_id: "2")
QuizQuestion.create(question: "Which nightmare would scare you most?", response_option: "Being caught up high with no handholds.", house_id: "3")
QuizQuestion.create(question: "Which nightmare would scare you most?", response_option: "Being forced to speak in a funny voice so that everyone laughs at you.", house_id: "4")



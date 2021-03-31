class Quizquestion < ActiveRecord::Base
    belongs_to :house
    has_many :useranswers
    has_many :users, through: :useranswers

    def self.give_quiz
        # Display some sort of description of the quiz
        # puts "Welcome to the Sorting Hat Quiz! INSERT SONG HERE"
        # Display the question and all of the responses for each question to the user using prompt
        quiz = {}
        self.all.each do |question|
            if quiz[question.question]
                quiz[question.question] << question.response_option
            else
                quiz[question.question] = [question.response_option]
            end
        end

        # quiz.each do |question, answers|
        #     display_question(question, answers)
        # end
        # Add the answer that the user chose and their id to the useranswers table
        # Once quiz is finished, calculate the responses for each house for the user
        # Return the house with the most responses
        # Sort the user into a house
        quiz
    end

    # def self.display_question(question, answers)
    #     prompt.select question do |menu|
    #         menu.choice "Answer 1", -> { login_helper }
    #         menu.choice "Answer 2", -> { register_helper }
    #         menu.choice "Answer 3", -> {"Goodbye"}
    #     end
    # end
end
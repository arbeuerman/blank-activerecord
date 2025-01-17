class Quizquestion < ActiveRecord::Base
    belongs_to :house
    has_many :useranswers
    has_many :users, through: :useranswers

    def self.give_quiz
        # Display some sort of description of the quiz
        puts "Welcome to the Sorting Hat Quiz!" # INSERT SONG HERE"
        quiz = {}
        self.all.each do |question|
            if quiz[question.question]
                quiz[question.question] << question.response_option
            else
                quiz[question.question] = [question.response_option]
            end
        end
        quiz
    end
end
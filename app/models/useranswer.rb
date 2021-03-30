class Useranswer < ActiveRecord::Base
    belongs_to :quizquestion 
    belongs_to :user 
end
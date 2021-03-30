class Quizquestion < ActiveRecord::Base
    belongs_to :house
    has_many :useranswers
    has_many :users, through: :useranswers
end

class User < ActiveRecord::Base
    belongs_to :house
    has_many :useranswers
    has_many :quizquestions, through: :useranswers
end 
class House < ActiveRecord::Base
    has_many :users
    has_many :quizquestions

    def number_of_members
        self.users.count
    end 
end
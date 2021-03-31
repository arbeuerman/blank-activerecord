class Useranswer < ActiveRecord::Base
    belongs_to :quizquestion 
    belongs_to :user 


    def self.enters_answers_for_user(user_answers, user)
        #loop through user answers and find match in Quizquestions
        #get quizquestion_id for that match
        #get user_id from User
        #populate user_answers table
        #dont forget about house_id!!!
        user_answers.each do |response|
            question_response = Quizquestion.all.find_by(response_option: response)
            Useranswer.create(quizquestion_id: question_response.id, user_id: user.id)
    
        end
        binding.pry 
    end



end
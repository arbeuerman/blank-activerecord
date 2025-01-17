
class User < ActiveRecord::Base
    belongs_to :house
    has_many :useranswers
    has_many :quizquestions, through: :useranswers
    has_many :userspells
    has_many :spells, through: :userspells

    def self.log_in
        #get the username
        puts "Enter your username."
        username = STDIN.gets.strip
        #get the password
        puts "Enter your password."
        password = STDIN.gets.strip
        #find the user in the table 
        user_instance = User.find_by({username:username, password:password})

        #if user does not enter correct username password combo, retry
        until user_instance
            puts "Bad username/password, give it another shot"
            user_instance = User.log_in
        end

        user_instance
    end 

    def self.create_new_account
        #get the username
        puts "Enter the username you would like."
        username = STDIN.gets.strip
        
        # while User.find_by(username: username)
        #     puts "This username is already taken"
        #     username
        # end

        #get the password
        puts "Enter the password you would like."
        password = STDIN.gets.strip
        #add the user to the table 
        user_instance = User.create({username:username, password:password})
        puts "Welcome #{username}! Your House awaits!"
        user_instance
    end 

    # instance methods
    
    def sort_user
        # we have all user answers associated to user
        # loop through user answers
        # tally the house_ids 
        house_ids = self.quizquestions.group(:house_id).count
        # figure out which house received the most number of answers 
        house_id = house_ids.max_by { |house_id, count| count }[0]
        self.update(house_id: house_id)
    end

    def find_user_house
        self.house
    end

    def delete_user_answers
        self.useranswers.destroy_all
    end 

end 

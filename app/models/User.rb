
class User < ActiveRecord::Base
    belongs_to :house
    has_many :useranswers
    has_many :quizquestions, through: :useranswers

    def self.log_in
        #get the username
        puts "Enter your username."
        username = STDIN.gets.chop
        #get the password
        puts "Enter your password."
        password = STDIN.gets.chop 
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
        username = STDIN.gets.chop
        # while User.find_by(username: username)
        #     puts "This username is already taken"
        #     username
        # end
        #get the password
        puts "Enter the password you would like."
        password = STDIN.gets.chop 
        #add the user to the table 
        user_instance = User.create({username:username, password:password})
        puts "Welcome #{username}! Your House awaits!"
        user_instance
    end 
end 

# def user_sign_up_helper
#     name = prompt.ask("What is your username?")
    # while User.find_by(username: name)
    #     puts "This username is already taken"
    #     name = prompt.ask("What is your username?")
    # end

#     self.user = User.create(name: name, username:??)
#     puts "Hello #{user.name}!"
#     main_screen
# end
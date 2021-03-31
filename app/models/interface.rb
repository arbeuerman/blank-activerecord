class Interface 

    #setter and getter methods 
    attr_accessor :user, :user_answers
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new
        @user_answers = []
    end 

    def run
        welcome
        sign_up_or_login
        display_main_menu
    end

    #enter the wizarding world
    def welcome
        puts "hello"
    end

    def sign_up_or_login
        prompt.select "Would you like to login or register?" do |menu|
            menu.choice "Login", -> { login_helper }
            menu.choice "Register", -> { register_helper }
            # menu.choice "I do not wish to enter the wizarding world", -> {"Goodbye"}
        end 
    end 

    def display_main_menu
        @user.reload
        sleep 2
        system 'clear'

        #use: if @user.house_id to change menu options
        prompt.select "What do you want to do?" do |menu|
            menu.choice "Begin Quiz", -> { quiz_helper }
            menu.choice "View House", -> { get_house_name_helper}
            menu.choice "Exit app", -> { puts "Goodbye" }
        end
    end
    
    #helper functions
    def login_helper
        @user = User.log_in
    end 

    def register_helper
        @user = User.create_new_account
    end

    def quiz_helper
        Quizquestion.give_quiz.each do |question, answers|
            response = display_question(question, answers)
            @user_answers << response
        end
        add_useranswers
    end

    def get_house_name_helper
        @user.sort_user
        # binding.pry
        display_main_menu
        display_house
    end

    def display_house
        #call on the house class to display the house data 
        #using the user's new house id 
        #puts user.house_id
    end 

    def display_question(question, answers)
        sleep 1
        system("clear")
        response = prompt.select question do |menu|
            menu.choice answers[0]
            menu.choice answers[1]
            menu.choice answers[2]
            menu.choice answers[3]
        end
    end

    def add_useranswers
        Useranswer.enters_answers_for_user(user_answers, user)
    end

    
end

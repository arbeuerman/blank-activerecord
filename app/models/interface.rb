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
            menu.choice "View House", -> { display_house }
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
        # add user answers to useranswer table
        add_useranswers
        # sort user into house
        @user.sort_user
        system 'clear'
        puts "The Sorting Hat is choosing your house..."
        sleep 2
        system 'clear'
        display_house
    end

    def display_house
        house = @user.find_user_house
        if house
            puts "You're in #{house.name}!"
            prompt.select "" do |menu|
                menu.choice "Back to Main Menu", -> { display_main_menu }
            end
        else
            puts "You haven't been sorted into a house yet!"
            prompt.select "Do you want to take your sorting quiz?" do |menu|
                menu.choice "Let's do it!", -> { quiz_helper }
                menu.choice "No thanks", -> { display_main_menu }
            end
        end

        #call on the house class to display the house data 
        #using the user's new house id 
        #puts user.house_id
        # Want it to say the name of the house, if not in a house it asks you to take the quiz
        # Display the number of people in your house
        # Qualities and colors incoporated somehow
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

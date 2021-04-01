class Interface 

    #setter and getter methods 
    attr_accessor :user, :user_answers, :house
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new(active_color: :cyan)
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
        # check if user answers contains answers
        # and check if user has a house
        if user.house
            puts "You've already been sorted into #{user.house.name}"
            sleep 2
            prompt.select "Are you sure you want to be resorted?" do |menu|
                menu.choice "Yes", -> {retake_quiz_helper}
                menu.choice "No, go back to Main Menu", -> { display_main_menu }
            end    
        else
            take_quiz_and_sort 
        end 
        system 'clear'
        display_house
    end

    def retake_quiz_helper
        # delete user answers from useranswers table
        @user.delete_user_answers
        # then retake the quiz and re-sort the user
        take_quiz_and_sort
    end 

    def take_quiz_and_sort 
        @user_answers = []
        Quizquestion.give_quiz.each do |question, answers|
            response = display_question(question, answers)
            @user_answers << response
        end

        # add user answers to useranswer table
        add_useranswers
        # sort user into house
        @user.sort_user

        #display user house
        system 'clear'
            puts "The Sorting Hat is choosing your house..."
            sleep 2
    end 

    def display_house
        #call on the house class to display the house data 
        @house = @user.find_user_house
        
        # Qualities and colors incoporated somehow
        if house
            puts "You're in #{house.name}!"
            
            #can we store this as a variable instead of rewriting the prompt over and over?
            prompt.select "" do |menu|
                menu.choice "Learn more about your house", -> {display_house_data}
                menu.choice "Back to Main Menu", -> { display_main_menu }
            end
        else
            puts "You haven't been sorted into a house yet!"
            prompt.select "Do you want to take your sorting quiz?" do |menu|
                menu.choice "Let's do it!", -> { quiz_helper }
                menu.choice "No thanks", -> { display_main_menu }
            end
        end
        # Display the number of people in your house
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

    def display_house_data
        if house.id == 1 
            color = :light_red
        elsif house.id == 2
            color = :yellow
        elsif house.id == 3
            color = :blue
        elsif house.id == 4
            color = :green
        else
            color = :light_white
        end
            puts "Your qualities are #{house.qualities}".colorize(color)
            puts "Your colors are #{house.colors}".colorize(color)
            puts "Your founder is #{house.founder}".colorize(color)
            puts "Your animal is #{house.animal}".colorize(color)
            puts "Your head of house is #{house.head}".colorize(color)
            puts "Your ghost is #{house.ghost}".colorize(color)
            puts "Your common room is #{house.commonroom}".colorize(color)
        # prompt back to main menu
        prompt.select "" do |menu|
            menu.choice "Back to Main Menu", -> { display_main_menu }
        end
    end 

    
end

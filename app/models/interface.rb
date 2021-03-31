class Interface 

    #setter and getter methods 
    attr_accessor :user
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end 

    def run
        welcome
        sign_up_or_register
        display_main_menu
    end

    #enter the wizarding world
    def welcome
        puts "hello"
    end

    def sign_up_or_register
        prompt.select "Would you like to login or register?" do |menu|
            menu.choice "Login", -> { login_helper }
            menu.choice "Register", -> { register_helper }
            menu.choice "I do not wish to enter the wizarding world", -> {"Goodbye"}
        end 
    end 

    def display_main_menu
        #@user.reload
        sleep 2
        system 'clear'
        #puts "welcome #{user.username}"
        prompt.select "What do you want to do?" do |menu|
            menu.choice "Begin Quiz", -> { quiz_helper }
            menu.choice "Exit app", -> { puts "Goodbye" }
        end
    end

    def display_question
        prompt.select Quizquestion.give_quiz.keys[0] do |menu|
            menu.choice Quizquestion.give_quiz.values[0][0], -> { puts "picked answer 1" }
            menu.choice Quizquestion.give_quiz.values[0][1], -> { puts "picked answer 1" }
            menu.choice Quizquestion.give_quiz.values[0][2], -> { puts "picked answer 3" }
            menu.choice Quizquestion.give_quiz.values[0][3], -> { puts "picked answer 4" }
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
        # Quizquestion.give_quiz
        display_question
    end
    
end


#     def register_helper
#         puts "typed register"
#         @user = User.register_helper_class_method
#     end

#     def generic_warning_message
#         puts "not login or register, try again"
#     end

#     def create_post_helper
#         # Post.create(...)
#     end

#     def see_all_categories_helper
#     end

#     def see_my_posts_helper
#         @user.display_posts
#         display_main_menu
#     end


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
        puts "                                                    `.-:/+o/`                                       
                                               ./oydmNNMMMMMms:.`                                   
                                              /mMNmMMMMMMMMMMMMNmmhs+:-`                            
                                             .NMMN:dMMNyMMMMMMMMMMMMMMNmy/.                         
                                             yMMMMm:mMd/MMMMMMMMMMMMMMMMMMm/                        
                                            -MMMMMMy-dh oNMMMMNddddhhhhhyo/.                        
                                            hMMMMMMNo...`-dMMMd`                                    
                                         `.oMMMMMMMMMd+Nd/hMMMm                                     
                                       `smNMMMMMMMMMMMMMMNdNy+.                                     
                                       hMMMMMMMMMMMMMMMMMMMd`                                       
                                      +MMMMMMMMMMMMMMMMMMMMMs                                       
                                     `NMMMMMMMMMMMMMMMMMMMMMMo                                      
                                    `yMMMMMMMMMMMMMMMMMMMMMMMM/                                     
                                   -hMMMMMNNNMMMMMMMMMMMMMMMMMN:                                    
                                 `yMMMMMMy:--:+dNMMMMMMMMMMMMMMN:                                   
                                 sMMMMMMMMm/    -hMMMMMMMMMMMMMMMy                                  
                                 sMMMMMMMM+`      /mMMMMMMMMMMMMMN`                                 
                                 .MMMMMMMMMmo`     `sMMMMMMMMNy/+s                                  
                                  yMMMMMMMMMMd`      -hMMMMh/`  od                                  
                                  :MMMMMMMMMMMNs/-`    ./:`   -yMM/                                 
                                  /MMMMMMMMMMMMMMMN/./shdy/``mMMMMN.                                
                                 `mMMMMMMMMMMMMNy+odMMMMMMMNhyMMMMMm`                               
                                 oMMMMMMMMMMMMMddNMMMMMMMMMMMMMMMMMMd`                              
                                 dMMMMMMMMMMMMMMMMMMMmdhhyyssssydMMMMd.                             
                                oMMMMMMMMMMMMMMMmy+-```         `:mMMMm-                            
                              .yMMMMMMMMMMMMNh+.`     ``.-::////:-:so+NN+                           
                             -NMMMMMMMMMMds:..-:/osydmmNNNNMMMMMMNNmh++MMy`                         
                             oMMmNMMNdhyosydmNNMMMMMMMMMMMMMMMMMMMMMMMNMMMd     `-/+syddmmmds.      
                             +MMy-/oymmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo:/ohmNMMmdyssshdMN-     
                             .MMMmmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNdy+-.`     `oMo     
                              mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNds/.`       `.:ohs`     
                             `NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmhs:.`    `-:+syyyso/.       
         .:+syhddhhys+/:----/dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMdo:-...-:/+syyys+:-.`           
      `/hmMMMMMMMMMMMMMMMNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmmdyssyyhhys+:-.`                  
     .dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmdys+:--.```                               
     +MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmhs+:-`                                          
     `/hNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNNmhs+:.`                                                
        ./shmmNNMMMMMMMMMMMMMMMMNNNNmmhys+:-.                                                       
             `.-://++oooooo++//::-..`                                                               ".colorize(:magenta)
             puts "Welcome to the Wizarding World!".bold
    end

    def sign_up_or_login
        prompt.select "Would you like to login or register?" do |menu|
            menu.choice "Login", -> { login_helper }
            menu.choice "Register", -> { register_helper }
        end 
    end 

    def display_main_menu
        @user.reload
        sleep 2
        system 'clear'

        prompt.select "What do you want to do?" do |menu|
            menu.choice "View Acceptance Letter", -> { letter_helper }
            menu.choice "Begin Quiz", -> { quiz_helper }
            menu.choice "View House", -> { display_house }
            menu.choice "Spell Book", -> { spell_helper }
            menu.choice "Exit app", -> { puts "Goodbye" }
        end
    end
    
    ##################
    # Helper Methods #
    ##################

    def login_helper
        prompt.select "Do you have a username and password?" do |menu|
            menu.choice "Yes"
            menu.choice "No", -> {register_helper}
        end 
        @user = User.log_in
    end 

    def register_helper
        puts "Please create a username and password."
        sleep 1
        system 'clear'
        @user = User.create_new_account
    end

    def letter_helper
        puts "\nHOGWARTS SCHOOL of WITCHCRAFT and WIZARDRY".bold

        puts "\nHeadmaster: Albus Dumbledore\n(Order of Merlin, First Class, Grand Sorc., Chf. Warlock,\nSupreme Mugwump, International Confed. of Wizards)\n"
        
        puts"\nDear Mr/Ms. #{user.username},\n\nWe are pleased to inform you that you have been accepted at Hogwarts School of Witchcraft and Wizardry. Please find enclosed a list of all necessary books and equipment.\n\nTerm begins on 1 September. We await your owl by no later than 31 July.\n"
        
        puts "\nYours sincerely,\n\nMinerva McGonagall\nDeputy Headmistress"

        prompt.select "" do |menu|
            menu.choice "Back to Main Menu", -> { display_main_menu }
        end
    end 

    def quiz_helper
        # check if user has a house
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
    end

    def retake_quiz_helper
        # delete user answers from useranswers table
        @user.delete_user_answers
        # then retake the quiz and re-sort the user
        take_quiz_and_sort
    end

    def spell_helper
        system 'clear'
        prompt.select "#{@user.username}'s Spell Book" do |menu|
            menu.choice "View All Spells", -> { display_spells }
            menu.choice "Favorited Spells", -> { view_favorite_spells }
            menu.choice "Back to Main Menu", -> { display_main_menu }
        end
    end

    ######################
    # Additional Methods #
    ######################

    def take_quiz_and_sort 
        @user_answers = []
        
        # Display the question and all of the responses for each question to the user using prompt
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
        system 'clear'
        display_house
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
        # Add the answer that the user chose and their id to the useranswers table
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
        # Display the number of people in your house
        
        # prompt back to main menu
        prompt.select "" do |menu|
            menu.choice "Back to Main Menu", -> { display_main_menu }
        end
    end 

    def display_spells
        #create an array of spells
        spell_list = Spell.list_of_spell_names
        #use prompt to display a menu of spell names
        spell_name = prompt.select("All Spells:", spell_list)
        #when user clicks on spell, have template to display spell information
        spell = Spell.get_spell_info(spell_name)
        system 'clear'
        puts "Spell name: ".bold +  "#{spell.name}" + " \nIncantation: ".bold + "#{spell.incantation}" + "\nDescription of Spell: ".bold + "#{spell.description}" 
        #where do we go after this?
        prompt.select "" do |menu|
            menu.choice "Add Spell to Favorites", -> { add_to_favorites(spell) }
            menu.choice  "Back to Spell Book", -> { spell_helper }
        end
    end

    def add_to_favorites spell
        # add spell id and user id to userspells table
        Userspell.create(user_id: user.id, spell_id: spell.id)
        # acknowledge that spell has been added
        puts "Spell added to Favorites!"
        sleep 1

        prompt.select "" do |menu|
            menu.choice  "Back to Spell Book", -> { spell_helper }
        end
    end 

    def view_favorite_spells
        system 'clear'
        user.reload
        # array of favorite spells from userspells
        favorite_spell_names = user.spells.map { |spell| spell.name }
        
        if favorite_spell_names.size > 0
            # make a prompt with names of spells 

            spell_name = prompt.select("List of Favorite Spells", favorite_spell_names)
            # display spell info
            spell = Spell.get_spell_info(spell_name)
            puts "Spell name: ".bold +  "#{spell.name}" + " \nIncantation: ".bold + "#{spell.incantation}" + "\nDescription of Spell: ".bold + "#{spell.description}" 
        else
            puts "You do not have any favorited spells yet!"
            sleep 1
        end 
        
        prompt.select "" do |menu|
            menu.choice  "Back to Spell Book", -> { spell_helper }
        end
    end 
end

class CLI
    @@prompt = TTY::Prompt.new
        #Welcomes user to THE VAULT - posts welcome message.
    def run 
        clear_console
        display_title
        puts "Hi Gamer! Welcome to THE VAULT, A place to rate, discuss and share your favorite GAMES"
        selection = @@prompt.select("Please Choose An Option", "Log-In", "Create A VAULT Account", active_color: :magenta)
    case selection
        when "Log-In"
            login_to_validate = login
            if login_to_validate != nil
            @current_user = login_to_validate
            main_menu
            end
        when "Create A VAULT Account"
            login_to_validate = create_user
            if login_to_validate != nil
            @current_user = login_to_validate
            puts "You've Just Joined The VAULT"
            main_menu
            end
        end
            @@prompt.keypress("ERR0R - VAULT MEMBER NOT FOUND! check again, right now it looks like you don't exist! Make an Account or Try again and check your Typing!")
        run
    end
            #create a new user/password 
    def create_user
        username = @@prompt.ask("Please Enter Your Desired Username: ", active_color: :magenta)
        password = @@prompt.ask("Please Enter Your Desired Password: ", active_color: :magenta)
        User.create(username: username, password: password)
    end
            #Logs user in or out
    def login
        username = @@prompt.ask("Enter your username: ", active_color: :magenta)
        password = @@prompt.mask("Enter your password: ")   #wanted password to be invisible, like a real app!
        User.find_by(username: username, password: password)  
    end
    #Shows the Vault menu, gives options to create a new review, show list of games owned by user, shows users past reviews
    def main_menu
       display_title
        selection = @@prompt.select("So, What are you here for?", "My Games List", "List My Reviews", "Check Out Other Games In The VAULT", "Review a Game", "Exit The VAULT", active_color: :magenta)
        if selection == "My Games List"
        puts "Feature not yet Available to the VAULT - We're working on it!"
            main_menu
        elsif selection == "List My Reviews"
            show_user_reviews
        elsif selection == "Check Out Other Games In The VAULT"
            list_games
        elsif selection == "Review a Game"
            review_game
        else #works because no other option = true, therefore executing exit 
            exit 
        end
        main_menu 
    end
         #enables user to see past reviews
    def show_user_reviews
        clear_console
        users_reviews = @current_user.reviews
        users_reviews.each_with_index do |review, index|
            puts "(" + (index + 1).to_s + ") " + review.data
        end
        selection = @@prompt.select("","Edit a Review", "Delete a Review", "Return to Main Menu", active_color: :magenta)
        if selection == "Edit a Review"
            edit_review
        elsif selection == "Delete a Review"
            delete_review 
        elsif selection == "Return to Main Menu"
            main_menu
        end
    end
            #enables user to post a review of a game
    def review_game
        clear_console
        display_title
        #Prints a list of every game and its description
        selection = @@prompt.select("Select the game you want to review", Game.all_names, active_color: :magenta)
        selected_game = Game.find_by(name: selection)
        content = @@prompt.ask("What do you want the VAULT to know?: ", active_color: :magenta)
        rating = @@prompt.ask("Please enter a number from 1 - 5: ", active_color: :magenta)
        ## Allow the logged in user to create a review for the game they select
        Review.create(content: content, rating: rating.to_i, game_id: selected_game.id, user_id: @current_user.id)
        @current_user = User.find(@current_user.id)  #bug i encountered, spoke to Tim, Joe told him it was to do with active record and how it saves things.
        puts "Your opinion has been stored in the VAULT"
    end
         #enable user to edit a previous review- override previous content and rating
    def edit_review
        clear_console
        display_title
        selection = @@prompt.select("Select the review you would like to Change", @current_user.map_reviews, active_color: :magenta)
        selected_review = Review.find_by(content: selection)
        content = @@prompt.ask("What do you want the Vault to know?: ", value: selected_review.content)
        rating = @@prompt.ask("Please enter a number from 1 - 5: ", value: selected_review.rating.to_s)
        selected_review.update(content: content, rating: rating )
        @current_user = User.find(@current_user.id)
        puts "Your Review Has Been Altered"
    end
            #delete a review 
    def delete_review
        clear_console
        display_title
        selection = @@prompt.select("Select the review you would like to Delete", @current_user.map_reviews, active_color: :magenta)
        selected_review = Review.find_by(content: selection)
        selected_review.destroy
        @current_user = User.find(@current_user.id) 
        puts "Your Review Has Been Ejected From The VAULT"
    end
        #clears terminal after every prompt so it looks prettier 
    def clear_console
        system "clear"
    end
        #select a game and see it's description
    def list_games
        selection = @@prompt.select("Current Games In The Vault Are", Game.all_names << "Return to Main Menu", active_color: :magenta)
        if selection == "Return to Main Menu"
            main_menu
        else
        selected_game = Game.find_by(name: selection)
        puts selected_game.description  #prompt.say
        list_games
        end
    end
    
    def display_title
        puts "
::::::::::: :::    ::: ::::::::::      :::     :::     :::     :::    ::: :::    ::::::::::: 
    :+:     :+:    :+: :+:             :+:     :+:   :+: :+:   :+:    :+: :+:        :+:     
    +:+     +:+    +:+ +:+             +:+     +:+  +:+   +:+  +:+    +:+ +:+        +:+     
    +#+     +#++:++#++ +#++:++#        +#+     +:+ +#++:++#++: +#+    +:+ +#+        +#+     
    +#+     +#+    +#+ +#+              +#+   +#+  +#+     +#+ +#+    +#+ +#+        +#+     
    #+#     #+#    #+# #+#               #+#+#+#   #+#     #+# #+#    #+# #+#        #+#     
    ###     ###    ### ##########          ###     ###     ###  ########  ########## ###             
        "
    end
end


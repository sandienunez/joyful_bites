class Cli

    def run #instance method 
        #binding.pry
        puts "  " #add some white spacing/format for user = aesthetically makes it prettier for user
        puts "Welcome to the Joyful Bites app! Where we cater to serve your dietary needs during this pandemic based on what's in your fridge! Let us take away the stress of meal prep ideas so you can fully enjoy your day!"
        puts "  "
        puts "Simply choose one ingredient you have in your kitchen and press enter."
        puts "  "
    
        @ingredient = gets.strip.downcase #or should i do chomp method
        Api.get_meals(@ingredient)  ## send query to API 
        ## display a list of meals to user 
        print_meals(Meal.all)
        ## present user w/ next steps
        prompt_recipe
        input = gets.strip.downcase 

        while input != 'exit'
            if input == 'list'
                print_meals(Meal.all)
                # go ahead and list my meals with this ingredient again
            elsif input.to_i > 0 && input.to_i <= Ingredient.find_by_ingredient(@ingredient).meals.length
                meal = Ingredient.find_by_ingredient(@ingredient).meals[input.to_i-1]
                Api.get_meal_details(meal) if !meal.recipe
                print_meal(meal)
            elsif input == "ingredient"
                prompt_ingredient
            else 
                puts "What did you say? Try typing that again please."
                puts "  "
            end
            prompt_recipe
            input = gets.strip.downcase 
        end
        puts "  "
        puts puts "Thank you for visiting the Joyful Bites app! Come back again soon."
    end

    def menu_meals(meals)
        puts "  "
        puts meal_details["title"]
    end

    def print_meals(meals)
        space 
        puts "  "
        puts "Are you ready? Behold these fantastic meal ideas below created with your fantastic #{@ingredient}!"
        puts "  "
        meals.each.with_index(1) do |meal, index|
            puts "#{index}. #{meal.meal_name}"
        end
        puts "  "
    end

    def print_meal(meal)
        puts meal.meal_name
        #puts meal.instructions 
        puts 
    end

    def prompt_recipe
        puts "  "
        puts "Type a number to see the recipe, type 'list' to see the list again, 'ingredient' to choose a new ingredient' or 'exit' to exit the app. "
    end

    def prompt_ingredient
        puts "  "
        puts "Type an ingredient to see the delicious meals you can make with it!"
        puts "  "
        @ingredient = gets.strip.downcase
        Api.get_meals(@ingredient)
        print_meals(Meal.all)
    end

    def space 
        puts "-----------------------------------------------------------------------------------------------------------------------------------------------"
        puts "  "
    end

    def print_meal(meal)
        spacer
        puts "#{meal.name} Recipe"
        spacer
        puts "#{meal.bowl}"
        spacer
        puts "Ingredients: "
        meal.ingredients.each_with_index do |ingredient, index|
            puts "#{ingredient}: #{meal.serving[index]}"
        end
        spacer 
        puts "Instructions: #{meal.instructions}"
    end

    def list_meal_recipes(meals)
            case meals
            when 1..10
                recipe
            else 
            "What did you say? Try typing that again please."
        end      
    end

    # def list_meal_ingredients 

    # end

end 


# def end_greeting
    #     puts "Thank you for visiting the Joyful Bites app! Come back again soon."
    # end

##if y: Yay! Amazing! Simply choose one ingredient you have in your kitchen and press enter.
##if n: Aw, we're sad to see you go. We'll see you next time. Have a Joyful day!!
## what about if they type yes? or type ghfh ? how can i help the user get back?


#convention for this cli file = to have run method = job is to execute flow of what app does 
###Cli file = handles input FROM my user and output TO my user 
###point of CLI class= to handle interactions w/ user
#command line = terminal 
#how user is interfacing with our application 

#1. = greet user (print)
#2.  = display/print numbered list of meals 
#3.  = user inputs the number of specific meal they want to know about
#4. = terminal prints meal recipe info 
#5. prints list of menu options (see list of meals or exit program)
#6. = user inputs instruction for next action 

#   #Api.get_meals(@ingredient)
#where we build our menuing 
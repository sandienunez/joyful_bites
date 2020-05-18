class Cli

    def run #instance method 
        a = Artii::Base.new
        #binding.pry
        puts "  " #add some white spacing/format for user = aesthetically makes it prettier for user
        puts "  "
        puts a.asciify('                               H E L L O !         ').green 
        puts a.asciify('                              H O  L  A !').blue
        puts a.asciify('                             B O N J O U R  !  ').magenta
        puts a.asciify('                                 K o n  n i c h i w a !  ')
        puts "🍉🍊 Welcome to the Joyful Bites app! Where we make your life so much easier during this pandemic based on what's in your fridge! Let us take away the stress of meal prep ideas so you can fully enjoy your life!🍓🍏".magenta
        puts "  "
        puts "🍍 Simply choose one or more 🍆 vegetable, 🍅 fruit, 🍎or poultry 🍌 ingredients you have in your kitchen, pantry or fridge and press enter. If you want dairy-free, gluten-free or vegan meal ideas, you can type 'Vegan GF' to receive back a curated list made just for you!".blue  
        puts "  "
    
        @ingredient = gets.strip.downcase #or should i do chomp method
        Api.get_meals(@ingredient)  ## send query to API 
        ## display a list of meals to user 
        print_meals(Ingredient.find_by_ingredient(@ingredient).meals)  #how can i just pass in meals for this current ingredient
        ## present user w/ next steps
        prompt_recipe
        input = gets.strip.downcase 

        while input != 'exit'
           #binding.pry
            if input == 'list'
                print_meals(Ingredient.find_by_ingredient(@ingredient).meals) 
                # go ahead and list my meals with this ingredient again
                # binding.pry
            elsif input.to_i > 0 && input.to_i <= Ingredient.find_by_ingredient(@ingredient).meals.length
                # binding.pry
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
  
        puts "       "
        puts "       "
        puts "       "
        puts a.asciify('     Thank     you     for     visiting      the').blue
        puts "  "
        puts a.asciify('                  Joyful      Bites      app  !').green
        puts "  "
        puts a.asciify('         Come     back     again     S O O N   !').magenta
        puts "        "
    end
    #  for visiting the Joyful Bites app! Come back again soon

    def menu_meals(meals)
        puts "  "
        puts meal_details["title"]
    end

    def spacer
        puts "-------------------------------------------------------------------------------------------------------------------------------"
        puts "  "
    end

    def print_meals(meals)
        self.spacer
        puts "  "
        puts "Are you ready? Behold these fantastic meal ideas below created with your fantastic #{@ingredient}!"
        puts "  "
        meals.each.with_index(1) do |meal, index|
            puts "#{index}. #{meal.meal_name}"
        end
        puts "  "
    end

    def print_meal(meal)
        #  binding.pry 
        puts "  "
        print "\n                                            T   H   I   N   K   I   N   G \n".blue + "[-----------------------------------------------------------------------------------------------------]".green
        puts "  "
        puts "Meal Idea:".magenta 
        puts meal.meal_name
        puts "  "
        puts "Ingredients needed for your recipe:".magenta
        # binding.pry 
        if meal.ingredients != nil
            meal.ingredients.each.with_index(1) do |ingredient, index|
            # binding.pry  
                puts "Step #{index}. #{ingredient}"
            end 
        end 
        puts "  "
        puts "Recipe Instructions:".magenta
        puts "  "
        #  binding.pry
        if meal.recipe != nil 
        puts meal.recipe
       
        end
        # binding.pry   
    end

    def prompt_recipe
        puts "  "
        puts "  "
        puts "  "
        puts "  "
        puts "Type a number to see the recipe, type 'list' to see the list again, 'ingredient' to choose a new ingredient' or 'exit' to exit the app.".blue
        puts "  "
        puts "  "
    end

    def get_meals 
    @ingredient
    end

    def prompt_ingredient
        puts "  "
        puts "Type an ingredient to see the delicious meals you can make with it!"
        puts "  "
        @ingredient = gets.strip.downcase
       if Ingredient.find_by_ingredient(@ingredient) == nil  #flipping logic other possibiltiity is add ! at the beg.
        Api.get_meals(@ingredient) 
       end
        print_meals(Ingredient.find_by_ingredient(@ingredient).meals)
    end

end

    

      # puts "Meal Idea: #{meal.meal_name}" 
     # puts meal.recipe.each.with_index(1) do |recipe, index|

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
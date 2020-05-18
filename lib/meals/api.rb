class Api
    def self.get_meals(ingredient)
        key = ENV.fetch('SPOONACULAR_API_KEY')
        url = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{ingredient}&apiKey=#{key}"
        response = Net::HTTP.get(URI(url)) #namespace class
   
        meals = JSON.parse(response)
        # binding.pry
        new_ingredient = Ingredient.new(ingredient)

    
    
        meals.each_with_index do |meal_details, index|
            new_meal = Meal.find_or_create_by_name(meal_details["title"])
             url = "https://api.spoonacular.com/recipes/#{meal_details["id"]}/analyzedInstructions?apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}" 
             new_meal.url=url 
            new_ingredient.meals << new_meal 
        end
    end 
        # binding.pry
        def self.get_meal_details(meal_object)
            response = Net::HTTP.get(URI(meal_object.url)) #namespace class
            recipe = JSON.parse(response)
            # binding.pry
            # binding.pry
            if recipe != []
              #binding.pry
            
            steps_hashes_array = recipe.first["steps"]
            steps = steps_hashes_array.map do |hash|
                hash["step"]
                # binding.pry
            end 
          
            ingredient_array = recipe.first["steps"].map do |recipe_hash|
                
                recipe_hash["ingredients"].map do |ingredient_hash|
                # binding.pry
                ingredient_hash["name"]
                end
        
            end 
            ingredient_array.flatten!
        meal_object.ingredients=ingredient_array 
            #   binding.pry
            recipe_string = steps.join
            meal_object.recipe=recipe_string
            else 
                puts "  "
                puts "Sorry, this recipe is still under development by the chef. Please try another number!"
            end
        end 

end 

 # names_hashes_array = ingredient.first["name"]
            #   binding.pry

 # ingredient_hash.each["name"]
       ###hash.each do |key, value|
    ## puts '# {key} : # {value}"
    ##end

      
        # new_meal.recipe=(recipe.first["steps"].first["step"])

        # ingredient_array_names = ingredient_array_of_hashes.map do |ingredient_hash|
        #     hash["name"]
        #binding.pry
    

    # def get_ingredient(ingredient)
    
        # ingredient_hash.collect do |ingredients|
        #     ingredients
        #new_meal.new_ingredient=(new_ingredient.first["id"].first["name"])
        # new_meal.each do ||
     

        # ingredient_array.collect 
        #binding.pry

   # def new_choice
        #     Api.meals.each do |meal|
        #           Api.delete(meals)
        #         end
        #       end

#new_meal = Meal.new(meal_details["title"]) get rid of 
# key = ENV.fetch('SPOONACULAR_API_KEY')
#url = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}"
#apples part changes  


##service/file class = COMMUNICATE w/ my api - going OUT to it,
    ## , getting my INFO, and RETURNING it

    ##get data from API here in this file

#def sel.get_meals method = 1.) what is my endpoint
#2.) How do I go to there and get what I need?
#3.) How do I handle that json and turn it into meaninful data? 
##4.) how do I make meal OBJECTS FROM that data?


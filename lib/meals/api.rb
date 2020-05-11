class Api
   def self.get_meals(ingredient)
    key = ENV.fetch('SPOONACULAR_API_KEY')
    url = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{ingredient}&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}"
    response = Net::HTTP.get(URI(url)) #namespace class
   
    meals = JSON.parse(response)
    new_ingredient = Ingredient.new(ingredient)
   #binding.pry
    
    meals.each_with_index do |meal_details, index|
        url = "https://api.spoonacular.com/recipes/#{meal_details["id"]}/analyzedInstructions?apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}" 
        #binding.pry
        response = Net::HTTP.get(URI(url)) #namespace class
        recipe = JSON.parse(response)
        # binding.pry
        new_meal = Meal.find_or_create_by_name(meal_details["title"])
        new_meal.recipe=(recipe.first["steps"].first["step"])
        ###binding.pry
        ingredient_hash = recipe.first["steps"].first["ingredients"]
        ingredient_hash.collect do |ingredients|
            ingredients
        end
        #new_meal.new_ingredient=(new_ingredient.first["id"].first["name"])
        # new_meal.each do ||
        new_ingredient.meals << new_meal 

        # ingredient_array.collect 

        #binding.pry


        end 

    end 
end
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


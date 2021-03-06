class Api
    def self.get_meals(ingredient)
        key = ENV.fetch('SPOONACULAR_API_KEY')
        url = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{ingredient}&apiKey=#{key}"
        response = Net::HTTP.get(URI(url)) 
   
        meals = JSON.parse(response)
        new_ingredient = Ingredient.new(ingredient)

    
    
        meals.each_with_index do |meal_details, index|
            new_meal = Meal.find_or_create_by_name(meal_details["title"])
             url = "https://api.spoonacular.com/recipes/#{meal_details["id"]}/analyzedInstructions?apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}" 
             new_meal.url=url 
            new_ingredient.meals << new_meal 
        end
    end 
     
        def self.get_meal_details(meal_object)
            response = Net::HTTP.get(URI(meal_object.url)) 
            recipe = JSON.parse(response)
            if recipe != []
    
            
            steps_hashes_array = recipe.first["steps"]
            steps = steps_hashes_array.map do |hash|
                hash["step"]
            end 
          
            ingredient_array = recipe.first["steps"].map do |recipe_hash|
                
                recipe_hash["ingredients"].map do |ingredient_hash|
                # binding.pry
                ingredient_hash["name"]
                end
        
            end 
            ingredient_array.flatten!
        meal_object.ingredients=ingredient_array 
            recipe_string = steps.join 
            meal_object.recipe=recipe_string
            else 
                puts "  "
                puts "Sorry, this recipe is still under development by the chef. Please try another number!"
            end
        end 

end 

 
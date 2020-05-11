class Meal 
    attr_accessor :meal_name, :ingredients, :recipe 

    @@all = []

    def initialize(meal_name, recipe=0) #nil =to make it optional cuz we don't wanna pass in last 2 
        @meal_name = meal_name 
        @ingredients = ingredients 
        @recipe = recipe 

        @@all << self 
    end

    def self.all 
        @@all 
    end

    def self.select_by_ingredient(ingredient)
        self.all.select {|meal| meal.ingredient == ingredient}
    end

    #  def self.find_or_create_by_name(ingredient)
    #         self.all.find do |meal| 
    #     end
    # end

    def self.find_by_name(name)
        self.all.find do |meal| 
        meal.meal_name == name
        end 
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end
    
    def self.create(name)
        meal = self.new(name) #created meal instance 
        meal
    end

end

## Meal Class = responsible for making meals 
##new meal objects are created and stored
###retrieve the meal the user requested 
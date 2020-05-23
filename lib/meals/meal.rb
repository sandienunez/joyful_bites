class Meal 
    attr_accessor :meal_name, :ingredients, :recipe, :url

    @@all = []

    def initialize(meal_name) 
        @meal_name = meal_name 
        @@all << self 
    end

    def self.all 
        @@all 
    end

    def self.select_by_ingredient(ingredient)
        self.all.select {|meal| meal.ingredient == ingredient}
    end

    def self.find_by_name(name)
        self.all.find do |meal| 
        meal.meal_name == name
        end 
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end
    
    def self.create(name)
        meal = self.new(name) 
        meal
    end

end


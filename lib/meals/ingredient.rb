class Ingredient
    attr_accessor :name, :meals 

    @@all = []

    def initialize(name)
        @name = name 
        @meals = [] ###will contain an array of Meal OBJECTS!
        @@all << self
    end

    def self.all #class method bc of self in front of all 
        @@all 
    end

    def self.find_by_ingredient(ingredient) #object relationship
        @@all.find {|i| i.name == ingredient}

    end

end 



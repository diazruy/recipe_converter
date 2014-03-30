class Recipe
  attr_accessor :name, :directions, :ingredients

  def initialize
    @ingredients = []
  end

  def <<(ingredient)
    ingredients << ingredient
  end
end

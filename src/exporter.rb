require 'json'

class Exporter

  def initialize
    @recipes = []
  end

  def add(recipe)
    @recipes << recipe
  end

  def size
    @recipes.size
  end

  def to_json
    {
      "rows" => recipes_json
    }
  end

  private

  def recipes_json
    @recipes.collect do |recipe|
      FoodPlannerRecipePresenter.new(recipe).to_json
    end
  end
end

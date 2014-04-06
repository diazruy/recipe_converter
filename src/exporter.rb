require 'json'
require_relative './food_planner_recipe_presenter'

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
    }.to_json
  end

  private

  def recipes_json
    id = 0
    @recipes.collect do |recipe|
      id += 1
      {"id" => id}.merge( FoodPlannerRecipePresenter.new(recipe).to_json)
    end
  end
end

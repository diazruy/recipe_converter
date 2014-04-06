require 'json'
require 'digest'
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
    @recipes.collect do |recipe|
      {"id" => id(recipe)}.merge( FoodPlannerRecipePresenter.new(recipe).to_json)
    end
  end

  def id(recipe)
    digest = Digest::SHA256.digest(recipe.name)
    puts recipe.name
    hex = Digest.hexencode(digest)
    prefix = hex[0...8]
    Integer(prefix, 16)
  end
end

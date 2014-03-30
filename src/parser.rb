require 'nokogiri'
require_relative './recipe'
require_relative './ingredient'
class Parser
  attr_reader :recipe

  def initialize(file)
    @xml = Nokogiri::XML(file)
    @recipe = Recipe.new
    build_recipe
  end

  private

  def build_recipe
    @recipe.name = name
    @recipe.directions = directions
    ingredients.each do |ingredient|
      ingredient = Ingredient.new

      @recipe.ingredients << ingredient
    end
  end

  def name
    @xml.css('Name').first.text
  end

  def directions
    @xml.css('Directions').first.text
  end

  def ingredients
    @xml.css('ParsedIngredient')
  end
end

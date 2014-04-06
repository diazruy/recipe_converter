require_relative '../src/exporter'

describe Exporter do
  subject(:exporter){ Exporter.new }

  describe "#add" do
    it "adds a recipe" do
      exporter.add(Recipe.new)
      expect(exporter.size).to eq(1)
    end
  end

  describe "#to_json" do
    let(:json){ JSON.load(File.open('./spec/fixtures/food_planner.json')) }
    it "exports the Food Planner JSON" do
      recipe = Recipe.new
      recipe.name = "Recipe Name"
      recipe.directions = "Recipe Instructions"

      ingredient = Ingredient.new
      ingredient.name = "Ingredient 1"
      ingredient.unit = "Ingredient Unit"
      ingredient.amount = "1"
      recipe.ingredients << ingredient

      ingredient = Ingredient.new
      ingredient.name = "Ingredient 2"
      ingredient.unit = "Ingredient Unit"
      ingredient.amount = "2"
      recipe.ingredients << ingredient

      exporter.add(recipe)
      expect(exporter.to_json).to eq(json)
    end
  end
end

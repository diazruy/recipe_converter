require_relative '../src/recipe'
require_relative '../src/ingredient'
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
    def ingredient(name, amount)
      Ingredient.new.tap do |ingredient|
        ingredient.name = name
        ingredient.unit = "Ingredient Unit"
        ingredient.amount = amount
      end
    end

    def recipe(name)
      Recipe.new.tap do |recipe|
        recipe.name = name
        recipe.directions = "Recipe Instructions"
        recipe.ingredients << ingredient("Ingredient 1", "1")
        recipe.ingredients << ingredient("Ingredient 2", "2")
      end
    end

    let(:json){ JSON.load(File.open('./spec/fixtures/food_planner.json')) }
    it "exports the Food Planner JSON" do
      exporter.add(recipe("Recipe Name 1"))
      exporter.add(recipe("Recipe Name 2"))
      parsed_json = JSON.parse(exporter.to_json)
      expect(parsed_json).to eq(json)
    end
  end
end

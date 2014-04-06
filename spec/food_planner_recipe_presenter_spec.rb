require_relative '../src/food_planner_recipe_presenter'

describe FoodPlannerRecipePresenter do
  describe "#to_json" do
    let(:recipe){ Recipe.new }
    before do
      recipe.name = "Recipe Name"
      recipe.directions = "Recipe Instructions"

      ingredient = Ingredient.new
      ingredient.name = "Ingredient 1"
      ingredient.amount = "1"
      recipe.ingredients << ingredient

      ingredient = Ingredient.new
      ingredient.name = "Ingredient 2"
      ingredient.amount = "2"
      recipe.ingredients << ingredient
    end

    subject(:json){ FoodPlannerRecipePresenter.new(recipe).to_json }

    it "URL escapes the title" do
      expect(json['title']).to eq("Recipe+Name")
    end

    it "URL escapes the instruction" do
      expect(json['instructions']).to eq("Recipe+Instructions")
    end

    it "URL escapes the ingredients with ## delimiters" do
      expect(json['ingredients']).to eq("1%23%23%23%23Ingredient+1%23%23%0A2%23%23%23%23Ingredient+2%23%23")
    end

    it "has tags" do
      expect(json).to have_key('tags')
    end

    it "has yield" do
      expect(json).to have_key('yield')
    end

    it "has yieldunit" do
      expect(json).to have_key('yieldunit')
    end
  end
end

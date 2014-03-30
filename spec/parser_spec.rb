require_relative '../src/parser'
describe Parser do
  let(:file){ File.open('./spec/fixtures/menu_planner.xml') }
  subject(:parser){ Parser.new(file) }

  describe "#recipe" do

    subject(:recipe){ parser.recipe }

    it "is a Recipe" do
      expect(recipe).to be_a(Recipe)
    end

    describe "the returned recipe" do
      its(:name){ should eq('Recipe Name') }
      its(:directions){ should eq('Recipe Directions') }
      its(:ingredients){ should have(1).item }

      describe "each ingredient" do
        subject(:ingredient){ recipe.ingredients.first }

        its(:name){ should eq('Ingredient Name') }
        its(:amount){ should eq(1) }
        its(:notes){ should eq('Ingredient Notes') }
      end
    end
  end
end

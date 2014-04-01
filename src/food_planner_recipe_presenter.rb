class FoodPlannerRecipePresenter

  attr_reader :recipe

  def initialize(recipe)
    @recipe = recipe
  end

  def to_json
    {
      'title' => CGI::escape(recipe.name),
      'instructions' => CGI::escape(recipe.directions),
      'ingredients' => CGI::escape(ingredients),
      'tags' => '',
      'yield' => '0',
      'yieldunit' => 'null'
    }
  end

  private

  def ingredients
    recipe.ingredients.collect do |ingredient|
      [
        ingredient.amount,
        ingredient.name,
        nil
      ].join('##')
    end.join("\n")
  end
end

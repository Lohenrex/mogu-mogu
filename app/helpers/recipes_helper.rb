# frozen_string_literal: true

module RecipesHelper
  def categories_for_select(categories)
    categories.sort_by(&:name).map { |category| [category.name, category.id] }
  end

  def ingredients_for_select(ingredients)
    ingredients.sort_by(&:name).map { |ingredient| [ingredient.name.capitalize, ingredient.name] }
  end

  def appliances_for_select(appliances)
    appliances.sort_by(&:name).map { |appliance| [appliance.name.capitalize, appliance.name] }
  end
end

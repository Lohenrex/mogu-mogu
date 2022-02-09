# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_user_ingredients, only: %i[index]
  before_action :set_doable_recipes, only: %i[index]

  def index; end

  private

  def set_user_ingredients
    @user_ingredients = current_user.inventory.map { |item| item.ingredient.name } if user_signed_in?
  end

  def set_doable_recipes
    return false unless user_signed_in?

    doable_recipes_ids = @user_ingredients.map do |ingredient|
      Recipe.get_recipe_which_has_ingredient(ingredient).pluck(:id)
    end.flatten.uniq

    @doable_recipes = Recipe.find(doable_recipes_ids)
  end
end

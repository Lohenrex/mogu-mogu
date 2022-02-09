# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    @user_ingredients = current_user.inventory.map { |item| item.ingredient.name }
    @latest_recipes = Recipe.last(3)
    set_doable_recipes
  end

  private

  def set_doable_recipes
    doable_recipes_ids = @user_ingredients.map do |ingredient|
      Recipe.with_ingredient(ingredient).pluck(:id)
    end.flatten.uniq

    @doable_recipes = Recipe.find(doable_recipes_ids)
  end
end

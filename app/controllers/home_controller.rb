# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    @user_ingredients = current_user.inventory.map { |item| item.ingredient.name }
    @latest_recipes = Recipe.last(3)
    @doable_recipes = find_doable_recipes
  end

  private

  def find_doable_recipes
    doable_recipes_ids = @user_ingredients.map do |ingredient|
      Recipe.with_ingredient(ingredient).pluck(:id)
    end.flatten.uniq

    Recipe.find(doable_recipes_ids)
  end
end

# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    @user_ingredients = current_user.inventory.map { |item| item.ingredient.name }

    doable_recipes_ids = @user_ingredients.map do |ingredient|
      Recipe.with_ingredient(ingredient).pluck(:id)
    end.flatten.uniq

    @doable_recipes = Recipe.find(doable_recipes_ids)

    @latest_recipes = Recipe.all.order(:updated_at).reverse_order.take(3)
  end
end

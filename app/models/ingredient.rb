# frozen_string_literal: true

class Ingredient < ApplicationRecord
  validates :name, uniqueness: true

  MEASURES = %w[cup oz ml fl oz
                g kg piece leaf
                pinch lb tsp tbsp]

  CATEGORIES = IngredientCategory.pluck("name").sort
end

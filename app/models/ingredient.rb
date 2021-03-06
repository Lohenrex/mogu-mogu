# frozen_string_literal: true

class Ingredient < ApplicationRecord
  validates :name, uniqueness: true

  MEASURES = %w[cup oz ml floz
                g kg piece leaf
                pinch lb tsp tbsp].freeze

  CATEGORIES = IngredientCategory.pluck("name").sort
end

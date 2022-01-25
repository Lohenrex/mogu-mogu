# frozen_string_literal: true

class Ingredient < ApplicationRecord
  validates :name, uniqueness: true

  MEASURES = %w[cup oz ml fl oz
                g kg piece leaf
                pinch lb tsp tbsp].map { |measure| [measure.capitalize, measure] }.sort

  CATEGORIES = %w[dairy fruits spices meats
                  flour alcohol cereals liquids
                  nuts vegetables other].map { |category| [category.capitalize, category] }.sort

  def grouped_ingredients
    CATEGORIES.map do |item|
      ingredients_in_category = Ingredient.where(category: item).order(name: :desc).pluck(:name)
      [item[0], [ingredients_in_category.map(&:capitalize), ingredients_in_category]]
    end.collect
  end
end

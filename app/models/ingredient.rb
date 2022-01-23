# frozen_string_literal: true

class Ingredient < ApplicationRecord
  validates :name, uniqueness: true

  CATEGORIES = [ "dairy", "fruits", "spices", "meats",
                "flour", "alcohol", "cereals", "liquids",
                "nuts", "vegetables", "other" ].map { |category| [category.capitalize, category] }.sort
end

# frozen_string_literal: true

class Ingredient < ApplicationRecord
  validates :name, uniqueness: true

  enum :category, { dairy: 0, fruits: 1,
                    spices: 2, meats: 3,
                    flour: 4, alcohol: 5,
                    cereals: 6, liquids: 7,
                    nuts: 8, vegetables: 9,
                    other: 10 }.sort.to_h
end

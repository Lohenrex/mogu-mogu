# frozen_string_literal: true

class Ingredient < ApplicationRecord
  validates :name, uniqueness: true
end

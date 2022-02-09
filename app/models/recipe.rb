# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :recipe_category
  belongs_to :user

  validates :name, :description, :picture, presence: true

  has_one_attached :steps_video
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  
  scope :with_ingredient, ->(ingredient) { where("recipes.ingredients->'needed' @> ?", [{ name: ingredient }].to_json) }
end

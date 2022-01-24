class InventoryController < ApplicationController
	def index
    @ingredients = Ingredient.all
  end
end

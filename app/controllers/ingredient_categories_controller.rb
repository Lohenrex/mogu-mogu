# frozen_string_literal: true

class IngredientCategoriesController < ApplicationController
  before_action :set_ingredient_category, only: %i[edit update destroy]

  # GET /ingredient_categories or /ingredient_categories.json
  def index
    @ingredient_categories = IngredientCategory.all
  end

  # GET /ingredient_categories/new
  def new
    @ingredient_category = IngredientCategory.new
  end

  # GET /ingredient_categories/1/edit
  def edit; end

  # POST /ingredient_categories
  def create
    @ingredient_category = IngredientCategory.new(ingredient_category_params)

    if @ingredient_category.save
      redirect_to ingredient_categories_url, notice: "Ingredient category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ingredient_categories/1 or /ingredient_categories/1.json
  def update
    if @ingredient_category.update(ingredient_category_params)
      redirect_to ingredient_categories_url, notice: "Ingredient category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /ingredient_categories/1 or /ingredient_categories/1.json
  def destroy
    @ingredient_category.destroy

    redirect_to ingredient_categories_url, notice: "Ingredient category was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient_category
    @ingredient_category = IngredientCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ingredient_category_params
    params.require(:ingredient_category).permit(:name)
  end
end

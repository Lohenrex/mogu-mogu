# frozen_string_literal: true

class RecipeCategoriesController < ApplicationController
  before_action :set_recipe_category, only: %i[edit update destroy]
  before_action :set_authorization

  # GET /recipe_categories
  def index
    @recipe_categories = RecipeCategory.all
  end

  # GET /recipe_categories/new
  def new
    @recipe_category = RecipeCategory.new
  end

  # GET /recipe_categories/1/edit
  def edit; end

  # POST /recipe_categories
  def create
    @recipe_category = RecipeCategory.new(recipe_category_params)

    if @recipe_category.save
      redirect_to recipe_categories_url, notice: "Recipe category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipe_categories/1
  def update
    if @recipe_category.update(recipe_category_params)
      redirect_to recipe_categories_url, notice: "Recipe category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipe_categories/1
  def destroy
    @recipe_category.destroy

    redirect_to recipe_categories_url, notice: "Recipe category was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_category
    @recipe_category = RecipeCategory.find(params[:id])
  end

  def set_authorization
    authorize RecipeCategory
  end

  # Only allow a list of trusted parameters through.
  def recipe_category_params
    params.require(:recipe_category).permit(:name)
  end
end

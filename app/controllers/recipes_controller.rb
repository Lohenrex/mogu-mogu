# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :set_recipe_categories, except: %i[index]
  before_action :set_ingredients, except: %i[index]
  before_action :set_appliances, except: %i[index]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show; end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params.merge(user_id: current_user.id))

    if @recipe.save
      @recipe.picture.attach(params[:picture])
      redirect_to recipe_url(@recipe), notice: "Recipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params.merge(user_id: current_user.id))
      @recipe.picture.attach(params[:picture])
      redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy

    redirect_to recipes_url, notice: "Recipe was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_recipe_categories
    @recipe_categories = RecipeCategory.all
  end

  def set_ingredients
    @ingredients = Ingredient.all
  end

  def set_appliances
    @appliances = Appliance.all
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    step_param = params[:recipe][:steps]
    filtered_params = params.require(:recipe).permit(:name, :description, :picture,
                                                     :ingredients, :appliances, :steps,
                                                     :recipe_category_id, :steps_video, :user_id)

    filtered_params.merge(steps: sanitize_steps(step_param))

    filtered_params
  end

  def sanitize_steps(param)
    param.split("\n").compact_blank if param.present?
  end
end

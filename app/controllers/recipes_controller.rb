# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :set_recipe_categories, except: %i[index]
  before_action :set_ingredients, except: %i[index]
  before_action :set_appliances, except: %i[index]
  before_action :set_ingredients_json, only: %i[show]

  # GET /recipes or /recipes.json
  def index
    @recipes = policy_scope(Recipe)
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
      attach_media
      redirect_to recipe_url(@recipe), notice: "Recipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params.merge(user_id: current_user.id))
      attach_media
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
    @recipe = authorize Recipe.find(params[:id])
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

  def set_ingredients_json
    ingredients_param = @recipe.ingredients
    @ingredients_json = JSON.parse(ingredients_param)["needed"]
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    step_param = params[:recipe][:steps]
    appliance_param = params[:recipe][:appliances]
    filtered_params = params.require(:recipe).permit(:name, :description, :picture,
                                                     :ingredients, :appliances, :steps,
                                                     :recipe_category_id, :steps_video, :user_id)

    filtered_params.merge(steps: sanitize_steps(step_param),
                          appliances: sanitize_appliances(appliance_param))
  end

  def sanitize_steps(param)
    param.split("\r\n").compact_blank if param.present?
  end

  def sanitize_appliances(param)
    param.split(",").compact_blank if param.present?
  end

  def attach_media
    @recipe.picture.attach(params[:picture])
    @recipe.steps_video.attach(params[:steps_video])
  end
end

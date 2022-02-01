# frozen_string_literal: true

class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[destroy]
  before_action :set_user, only: %i[index new]

  # GET /inventories
  def index
    @inventory = @user.inventory.includes(:ingredient)
  end

  # GET /inventories/new
  def new
    @ingredients_list = ingredients_for_select
    @inventory = Inventory.new
  end

  # POST /inventories
  def create
    @inventory = Inventory.new(inventory_params.merge(user_id: current_user.id))

    if @inventory.save
      redirect_to inventories_url, notice: "The ingredient was successfully added to your inventory!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy
    redirect_to inventories_url, notice: "The ingredient was removed from your inventory."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.require(:inventory).permit(:user_id, :ingredient_id)
  end

  def ingredients_not_in_inventory
    inventory = @user.inventory
    return Ingredient.all if inventory.nil?

    Ingredient.where.not(id: inventory.pluck(:ingredient_id))
  end

  def ingredients_for_select
    ingredients_not_in_inventory.sort_by(&:name).map { |ingredient| [ingredient.name, ingredient.id] }
  end
end

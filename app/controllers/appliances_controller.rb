# frozen_string_literal: true

class AppliancesController < ApplicationController
  before_action :set_appliance, only: %i[edit update destroy]

  # GET /appliances
  def index
    @appliances = Appliance.all
  end

  # GET /appliances/new
  def new
    @appliance = Appliance.new
  end

  # GET /appliances/1/edit
  def edit; end

  # POST /appliances
  def create
    @appliance = Appliance.new(appliance_params)

    if @appliance.save
      redirect_to appliances_url, notice: "Appliance was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appliances/1
  def update
    if @appliance.update(appliance_params)
      redirect_to appliances_url, notice: "Appliance was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /appliances/1
  def destroy
    @appliance.destroy

    redirect_to appliances_url, notice: "Appliance was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appliance
    @appliance = Appliance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appliance_params
    params.require(:appliance).permit(:name)
  end
end

class VaccinesController < ApplicationController
  before_action :set_pet

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)
  end

  private

  def vaccine_params
    params.require(:vaccine).permit(:name, :vaccination_date, :next_vaccination, :pet_id)
  end

  def set_pet
    @pet = Pet.find([:pet_id])
  end
end

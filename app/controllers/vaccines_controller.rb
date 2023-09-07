class VaccinesController < ApplicationController
  before_action :set_pet, only: %i[new create destroy edit revaccine]

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)
    @vaccine.pet = @pet
    if @vaccine.save!
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @vaccine = Vaccine.find_by(id: params[:id])
    @revaccine = @vaccine.dup
    @revaccine.id = nil
  end

  def revaccine
    @revaccine = Vaccine.new(vaccine_params)
    @revaccine.pet = @pet
    if @revaccine.save!
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def vaccine_params
    params.require(:vaccine).permit(:name, :vaccination_date, :revaccination_period)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end

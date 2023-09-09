class VaccinesController < ApplicationController
  before_action :set_pet, only: %i[index new create destroy edit revaccine]

  def index
    @vaccines = Vaccine.where(pet_id: @pet.id).order('next_vaccination ASC')
  end

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)
    date_string = helpers.string_to_date(@vaccine.vaccination_date, @vaccine.revaccination_period)
    date_string.strftime("%Y-%m-%d")
    @vaccine.next_vaccination = date_string
    @vaccine.pet = @pet
    if @vaccine.save!
      redirect_to pet_vaccines_path(@pet)
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
    date_string = helpers.string_to_date(@revaccine.vaccination_date, @revaccine.revaccination_period)
    date_string.strftime("%Y-%m-%d")
    @revaccine.next_vaccination = date_string
    @revaccine.pet = @pet
    if @revaccine.save!
      redirect_to pet_vaccines_path(@pet)
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

class VaccinesController < ApplicationController
  before_action :set_pet, only: %i[index new create edit revaccine]
  before_action :set_vaccine, only: %i[edit destroy]

  def index
    @vaccines = Vaccine.where(pet_id: @pet.id).order('vaccination_date DESC')
  end

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)
    date_string = helpers.string_to_date(@vaccine.vaccination_date, @vaccine.revaccination_period)
    unless date_string.nil?
      date_string.strftime("%Y-%m-%d")
      @vaccine.next_vaccination = date_string
    end
    @vaccine.pet = @pet
    if @vaccine.save!
      redirect_to pet_vaccines_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @revaccine = @vaccine.dup
    @revaccine.id = nil
  end

  def revaccine
    @vaccine = Vaccine.find_by(id: params[:vaccine][:id])
    @revaccine = Vaccine.new(vaccine_params)
    date_string = helpers.string_to_date(@revaccine.vaccination_date, @revaccine.revaccination_period)
    unless date_string.nil?
      date_string.strftime("%Y-%m-%d")
      @revaccine.next_vaccination = date_string
    end
    @revaccine.pet = @pet
    if @revaccine.save!
      @vaccine.update(revaccination: true)
      redirect_to pet_vaccines_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @vaccine.destroy
    redirect_to pet_vaccines_path(@vaccine.pet_id), notice: 'Vaccine was successfully deleted.'
  end

  private

  def vaccine_params
    params.require(:vaccine).permit(:name, :vaccination_date, :revaccination_period)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_vaccine
    @vaccine = Vaccine.find(params[:id])
  end
end

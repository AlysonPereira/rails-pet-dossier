class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :specie, :breed, :weight, :dob)
  end
end

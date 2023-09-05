class DossiersController < ApplicationController
  before_action :set_pet

  def new
    @dossier = Dossier.new
  end

  def index
    @dossiers = Dossier.all
  end

  def create
    @dossier = Dossier.new(dossier_params)
    @dossier.pet = @pet
    if @dossier.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
    @dossier = Dossier.find(params[:id])
  end

  def update
    @dossier = Dossier.find(params[:id])
    @dossier.update(dossier_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @dossier = Dossier.find(params[:id])
    @dossier.destroy
    redirect_to pet_path(@pet)
  end

  private

  def dossier_params
    params.require(:dossier).permit(:pet_id)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end

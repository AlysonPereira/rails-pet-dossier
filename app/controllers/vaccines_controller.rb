class VaccinesController < ApplicationController
  before_action :set_dossier

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)
  end

  private

  def vaccine_params
    params.require(:vaccine).permit(:name, :vaccination_date, :next_vaccination, :dossier_id)
  end

  def set_dossier
    @dossier = Dossier.find([:dossier_id])
  end
end

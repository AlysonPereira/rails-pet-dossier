class MedicinesController < ApplicationController
  before_action :set_dossier

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(medicine_params)
  end

  private

  def medicine_params
    params.require(:medicine).permit(:name, :dosage, :period, :unit, :start_date, :end_date, :dossier_id)
  end

  def set_dossier
    @dossier = Dossier.find(:dossier_id)
  end
end

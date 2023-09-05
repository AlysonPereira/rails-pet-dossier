class MedicinesController < ApplicationController
  before_action :set_pet

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(medicine_params)
  end

  private

  def medicine_params
    params.require(:medicine).permit(:name, :dosage, :period, :unit, :start_date, :end_date, :pet_id)
  end

  def set_pet
    @pet = Pet.find(:pet_id)
  end
end

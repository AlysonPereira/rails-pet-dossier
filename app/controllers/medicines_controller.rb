class MedicinesController < ApplicationController
  before_action :set_pet, only: %i[new create destroy]

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(medicine_params)
    @medicine.pet = @pet
    if @medicine.save!
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def medicine_params
    params.require(:medicine).permit(:name, :dosage, :period, :unit, :start_date, :end_date)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end

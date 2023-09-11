class MedicinesController < ApplicationController
  before_action :set_pet, only: %i[index new create]

  def index
    @medicines = Medicine.where(pet_id: @pet.id).order('start_date DESC')
  end

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(medicine_params)
    @medicine.pet = @pet
    if @medicine.save!
      redirect_to pet_medicines_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @medicine = Medicine.find(params[:id])
    @medicine.destroy
    redirect_to pet_medicines_path(@medicine.pet_id), notice: 'Medicine was successfully deleted.'
  end

    private

  def medicine_params
    params.require(:medicine).permit(:name, :dosage, :period, :unit, :start_date, :end_date)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end

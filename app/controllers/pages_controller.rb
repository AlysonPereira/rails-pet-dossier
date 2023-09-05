class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dossier
    @vaccines = Vaccine.all
    @medicines = Medicine.all
  end
end

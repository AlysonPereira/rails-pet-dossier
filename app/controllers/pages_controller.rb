class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dossier
    # Get all the vaccines where the next vaccination is not nil, revaccination is false and order them by next vaccination date
    @vaccines = Vaccine.where.not(next_vaccination: nil).where(revaccination: false).order(next_vaccination: :asc)

    @medicines = Medicine.where(end_treatment: false).order(start_date: :asc)
  end

  def landingpage
    @facts = Fact.all
  end
end

class Vaccine < ApplicationRecord
  belongs_to :dossier
  validates :name, presence: true
  validates :vaccination_date, presence: true
  validates :next_vaccination, presence: true
end

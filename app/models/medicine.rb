class Medicine < ApplicationRecord
  belongs_to :dossier
  validates :name, presence: true
  validates :dosage, presence: true
  validates :period, presence: true
  validates :unit, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end

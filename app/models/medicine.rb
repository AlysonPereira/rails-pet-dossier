class Medicine < ApplicationRecord
  belongs_to :pet
  UNIT = %w[mg g ml ul ul/L ul/Kg kg L drop(s) pill(s) n/a]
  validates :name, presence: true
  validates :dosage, presence: true
  validates :period, presence: true
  validates :unit, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end

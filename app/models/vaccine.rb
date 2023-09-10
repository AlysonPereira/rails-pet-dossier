class Vaccine < ApplicationRecord
  belongs_to :pet

  PERIOD = ["no", "in 1 week", "in 15 days", "in 1 month", "in 4 months", "in 6 months", "in 1 year"]
  validates :name, presence: true
  validates :vaccination_date, presence: true
  validates :revaccination_period, presence: true
end

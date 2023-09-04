class Dossier < ApplicationRecord
  belongs_to :pet
  has_many :vaccines
  has_many :medicines
end

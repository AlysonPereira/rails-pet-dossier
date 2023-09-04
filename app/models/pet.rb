class Pet < ApplicationRecord
  belongs_to :user
  has_one :dossier
  has_many :medicines, through: dossier
  has_many :vaccines, through: dossier
  validates :name, presence: true
  validates :specie, presence: true
end

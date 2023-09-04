class Pet < ApplicationRecord
  belongs_to :user
  has_one :dossier

  SPECIE = %w[Cat Dog Bird Turtle Fish Snake]
  has_many :medicines, through: :dossier
  has_many :vaccines, through: :dossier
  validates :name, presence: true
  validates :specie, presence: true
end

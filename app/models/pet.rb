class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  SPECIE = %w[Cat Dog Bird Turtle Fish Snake]
  has_many :medicines
  has_many :vaccines
  validates :name, presence: true
  validates :specie, presence: true
end

class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  SPECIE = %w[Cat Dog Bird Turtle Fish Snake]
  has_many :medicines, dependent: :destroy
  has_many :vaccines, dependent: :destroy
  validates :name, presence: true
  validates :specie, presence: true
end

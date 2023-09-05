class WishList < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  validates :title, presence: true
end

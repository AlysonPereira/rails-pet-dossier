class WishList < ApplicationRecord
  belongs_to :user
  has_many :products
  validates :title, presence: true
end

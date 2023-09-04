class Product < ApplicationRecord
  belongs_to :wish_list
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end

class Product < ApplicationRecord
  validates :code, presence: true
  validates :name, presence: true
  validates :price, presence: true

  has_many :basket_items
end

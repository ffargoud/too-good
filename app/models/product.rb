class Product < ApplicationRecord
  belongs_to :restaurant
  has_many :basket_products
  has_many :baskets, through: :basket_products
end

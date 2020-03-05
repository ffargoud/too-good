class Basket < ApplicationRecord
  belongs_to :restaurant
  has_many :basket_products
  has_many :order_baskets
end

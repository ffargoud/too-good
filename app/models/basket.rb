class Basket < ApplicationRecord
  belongs_to :restaurant
  has_many :basket_products, :order_baskets
end

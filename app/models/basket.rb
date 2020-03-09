class Basket < ApplicationRecord
  belongs_to :restaurant
  has_many :basket_products
  has_many :products, through: :basket_products
  has_many :order_baskets
  has_one_attached :photo
end

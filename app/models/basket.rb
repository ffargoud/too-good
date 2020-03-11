class Basket < ApplicationRecord
  belongs_to :restaurant
  has_many :basket_products, dependent: :destroy
  has_many :products, through: :basket_products, dependent: :nullify
  has_many :order_baskets
  has_one_attached :photo
end

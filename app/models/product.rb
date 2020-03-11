class Product < ApplicationRecord
  belongs_to :restaurant
  has_many :basket_products, dependent: :destroy
  has_many :baskets, through: :basket_products, dependent: :nullify
end

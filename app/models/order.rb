class Order < ApplicationRecord
  belongs_to :user
  has_many :order_baskets
  has_many :baskets, through: :order_baskets
end

class OrderBasket < ApplicationRecord
  belongs_to :order
  belongs_to :basket
end

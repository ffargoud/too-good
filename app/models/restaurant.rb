class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :basket
  has_one_attached :photo
end

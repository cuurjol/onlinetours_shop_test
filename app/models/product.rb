class Product < ApplicationRecord
  has_many :product_shops
  has_many :shops, through: :product_shops, dependent: :destroy
end

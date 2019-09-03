class Shop < ApplicationRecord
  has_many :product_shops
  has_many :products, through: :product_shops, dependent: :destroy
end

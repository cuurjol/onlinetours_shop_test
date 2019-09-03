class ProductShop < ApplicationRecord
  belongs_to :shop
  belongs_to :product

  validates :shop_id, uniqueness: { scope: :product_id }
end

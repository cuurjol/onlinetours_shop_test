class ProductShop < ApplicationRecord
  belongs_to :shop
  belongs_to :product

  # https://stackoverflow.com/questions/4123610/how-to-implement-a-unique-index-on-two-columns-in-rails
  # https://stackoverflow.com/questions/4870961/validate-uniqueness-of-multiple-columns
  validates :shop_id, uniqueness: { scope: :product_id }
end

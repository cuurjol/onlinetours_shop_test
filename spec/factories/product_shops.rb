FactoryBot.define do
  factory :product_shop do
    shop { Shop.all.sample }
    product { Product.all.sample }
    amount { rand(1..100) }
  end
end
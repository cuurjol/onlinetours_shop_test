5.times do
  Shop.create(name: Faker::Company.name, address: Faker::Address.street_address,
              city: Faker::Address.city, metro: Faker::Space.star_cluster)
end

50.times do
  product_name = [Faker::Food.fruits, Faker::Food.sushi, Faker::Food.vegetables, Faker::Food.ingredient].sample
  shop = Shop.all.sample
  product = Product.create(vendor_code: rand(1..200), name: product_name, weight: rand(1..20), size: rand(1..20),
                           color: Faker::Color.color_name, price: rand(1000..10_000))

  ProductShop.create(shop: shop, product: product, amount: rand(1..100))
end

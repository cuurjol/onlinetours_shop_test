FactoryBot.define do
  factory :product do
    vendor_code { rand(1..200) }
    name { [Faker::Food.fruits, Faker::Food.sushi, Faker::Food.vegetables, Faker::Food.ingredient].sample }
    weight { rand(1..20) }
    size { rand(1..20) }
    color { Faker::Color.color_name }
    price { rand(1000..10_000) }
  end
end
FactoryBot.define do
  factory :shop do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    metro { Faker::Space.star_cluster }
  end
end
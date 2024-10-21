FactoryBot.define do
  factory :catch do
    vessel
    species
    incidental { Faker::Boolean.boolean }
    weight { Faker::Number.decimal(l_digits: 2) }
    date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
    location { { lat: Faker::Address.latitude, lon: Faker::Address.longitude } }
  end
end

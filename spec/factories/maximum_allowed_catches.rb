FactoryBot.define do
  factory :maximum_allowed_catch do
    species
    detail { Faker::Lorem.sentence }
    weight { Faker::Number.decimal(l_digits: 2) }
    start_date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
  end
end

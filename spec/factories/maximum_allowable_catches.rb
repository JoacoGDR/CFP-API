FactoryBot.define do
  factory :maximum_allowable_catch do
    species
    weight { Faker::Number.decimal(l_digits: 2) }
    start_date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
  end
end

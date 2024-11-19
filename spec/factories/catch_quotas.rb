FactoryBot.define do
  factory :catch_quota do
    association :owner, factory: %i[vessel public_entity].sample
    species
    quota { Faker::Number.decimal(l_digits: 2) }
    start_date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
  end
end

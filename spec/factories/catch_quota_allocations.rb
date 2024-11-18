FactoryBot.define do
  factory :catch_quota_allocation do
    association :owner, factory: %i[vessel public_entity].sample
    species
    amount { Faker::Number.decimal(l_digits: 2) }
    allocation_date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
    detail { Faker::Lorem.sentence }
  end
end

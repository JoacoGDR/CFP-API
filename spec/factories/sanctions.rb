FactoryBot.define do
  factory :sanction do
    vessel
    sanction_type
    date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
    description { Faker::Lorem.sentence }
  end
end

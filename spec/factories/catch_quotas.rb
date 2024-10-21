FactoryBot.define do
  factory :catch_quota do
    owner { [vessel, public_entity].sample }
    catch_quota_allocation
    species
    quota { Faker::Number.decimal(l_digits: 2) }
    start_date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
  end
end

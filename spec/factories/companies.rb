FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    business_group
  end
end

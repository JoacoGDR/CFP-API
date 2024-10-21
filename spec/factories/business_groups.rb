FactoryBot.define do
  factory :business_group do
    name { Faker::Company.name }
  end
end

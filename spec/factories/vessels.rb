FactoryBot.define do
  factory :vessel do
    name { Faker::Name.name }
    registration_code { Faker::Alphanumeric.alpha(number: 6) }
    company
  end
end

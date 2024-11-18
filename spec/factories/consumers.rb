FactoryBot.define do
  factory :consumer do
    name { Faker::Internet.user_name }
    api_key { Faker::Alphanumeric.alphanumeric(number: 32) }
    api_secret { Faker::Alphanumeric.alphanumeric(number: 64) }
  end
end

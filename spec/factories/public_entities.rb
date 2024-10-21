FactoryBot.define do
  factory :public_entity do
    name { Faker::Address.country }
  end
end

FactoryBot.define do
  factory :species do
    name { Faker::Creature::Animal.name }
  end
end

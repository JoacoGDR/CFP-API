FactoryBot.define do
  factory :species do
    name { Faker::Creature::Animal.name }

    trait :with_quotas do
      transient do
        quotas_count { 5 }
      end

      after(:create) do |species, evaluator|
        create_list(:catch_quota, evaluator.quotas_count, species: species)
      end
    end
  end
end

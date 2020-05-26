FactoryBot.define do
    factory :category do
      name { "Test Category" }
      association :venue
    end
  end
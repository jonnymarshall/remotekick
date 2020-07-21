FactoryBot.define do
  factory :photo do
    featured { false }
    trait :is_featured do
      featured { true }
    end

    factory :photo_is_featured, traits: [:is_featured]
  end
end
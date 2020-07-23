FactoryBot.define do
  factory :photo do
    trait :is_featured do
      featured { true }
    end
    trait :attached_image do
      after(:build) do |culture|
        culture.image.attach(io: File.open(Rails.root.join('spec', 'support', 'assets', 'petr-sevcovic-594807-unsplash_1920X1280.jpg')),
            filename: 'petr-sevcovic-594807-unsplash_1920X1280.jpg',
            content_type: 'image/jpeg'
          )
      end
    end
    

    factory :photo_is_featured, traits: [:is_featured]
    factory :photo_with_attached_image, traits: [:attached_image]
  end
end
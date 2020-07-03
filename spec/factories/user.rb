FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email-#{n}@example.com"}
    sequence(:password) { |n| "password-#{n}"}
    first_name { "John" }
    last_name { "Doe" }
    confirmed_at { Time.now }
    trait :admin do
      admin { true }
    end
  end

  factory :admin_user, traits: [:admin]
end
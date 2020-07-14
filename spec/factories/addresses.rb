FactoryBot.define do
  factory :address do
    address { "18 Towngate, Highburton" }
    city { "Huddersfield" }
    postcode { "HD8 0QP" }
    country { "United Kingdom" }
    # country_code { "uk" }
    latitude { 53.618046 }
    longitude { 1.711510 }

    trait :only_lng_lat do
      address { nil }
    end

    trait :only_address do
      latitude { nil }
      longitude { nil }
    end

    factory :address_only_lng_lat, traits: [:only_lng_lat]
    factory :address_only_address, traits: [:only_address]
  end
end

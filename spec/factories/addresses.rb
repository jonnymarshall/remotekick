FactoryBot.define do
  factory :address do
    address { "155 Hyde Park Road" }
    city { "Leeds" }
    postcode { "LS6 1AZ" }
    country { "United Kingdom" }
    # country_code { "uk" }
    latitude { 53.618514 }
    longitude { -1.712789 }

    trait :only_lng_lat do
      address { nil }
    end

    trait :only_address do
      latitude { nil }
      longitude { nil }
    end

    trait :chiang_mai_address do
      latitude { 18.80117127010728 }
      longitude { 98.96564847010727 }
    end

    factory :address_only_lng_lat, traits: [:only_lng_lat]
    factory :address_only_lng_lat_chiang_mai, traits: [:only_lng_lat, :chiang_mai_address]
    factory :address_only_address, traits: [:only_address]
  end
end

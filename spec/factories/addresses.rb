FactoryBot.define do
  factory :address do
    address { "18 Towngate, Highburton" }
    city { "Huddersfield" }
    postcode { "HD8 0QP" }
    country { "United Kingdom" }
    # country_code { "uk" }
    latitude { 53.618046 }
    longitude { 1.711510 }
  end
end

FactoryBot.define do

  categories = ["Coffee Shop", "Bar", "Library", "Coworking Space"]
  factory :venue do
    name { "Some venue name" }
    description { "Some venue description" }
    address { "18 Towngate, Highburton, Huddersfield" }
    rating { rand(4) }
    upload_speed { rand(1000) }
    download_speed { rand(1000) }
    ping { rand(1000) }
    price { rand(2) }
    plug_sockets { rand(2) }
    busyness { rand(2) }
    comfort { rand(2) }
    has_wifi { [true, false].sample }
    air_conditioning { [true, false].sample }
    serves_food { [true, false].sample }
    wifi_restrictions { rand(4) }
    # latitude
    # longitude
    # foursquare_id
    category { categories.sample }
  end

  factory :no_wifi_venue do
    has_wifi { false }
  end
end
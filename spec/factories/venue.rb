FactoryBot.define do

  categories = ["Coffee Shop", "Bar", "Library", "Coworking Space"]
  
  factory :venue do
    name { "Some venue name" }
    description { "Some venue description" }
    rating { rand(4) }
    upload_speed { rand(1000) }
    download_speed { rand(1000) }
    ping { rand(1000) }
    price { rand(2) }
    plug_sockets { rand(2) }
    quietness { rand(2) }
    comfort { rand(2) }
    has_wifi { [true, false].sample }
    wifi_restrictions { rand(4) }
    # foursquare_id
    # category { categories.sample }
    trait :has_owner do
      after(:build) do |venue|
        # byebug
        FactoryBot.create(:venue_user, venue: venue, user: FactoryBot.create(:user), user_type: "owner")
      end
    end

    factory :venue_with_owner, traits: [:has_owner]
  end
end
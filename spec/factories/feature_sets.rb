FactoryBot.define do
  factory :feature_set do
    air_conditioning { [true, false].sample }
    serves_food { [true, false].sample }
  end
end

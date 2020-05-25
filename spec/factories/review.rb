FactoryBot.define do
  factory :review do
    content { "test" }
    rating { rand(4) }
    has_wifi { true }
  end
end
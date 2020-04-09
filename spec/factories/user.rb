FactoryBot.define do
  factory :user do
    email { "#{rand(1000000000000)}@gmail.com" }
    password { "password" }
  end
end
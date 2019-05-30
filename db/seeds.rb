# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#----------CLEAN DB----------
puts 'Cleaning database...'

Review.destroy_all
WifiSpeed.destroy_all
FeatureSet.destroy_all
CoffeeShop.destroy_all
User.destroy_all

#----------USER SEEDS----------
puts 'Creating users...'
user_attributes = [
  {
    first_name: 'John',
    last_name:  'Doe',
    email: 'johndoe@wifiwarriors.com',
    password: "coffee",
  },
  {
    first_name:         'Jane',
    last_name:  'Doe',
    email: 'janedoe@wifiwarriors.com',
    password: "coffee",
  },
]
User.create!(user_attributes)
puts 'Finished creating users.'


#----------COFFEE SHOP SEEDS----------

puts 'Creating coffee shops...'
coffee_shop_attributes = [
  {
    name: 'CAMP @ Maya',
    address: 'Chiang Mai 50300',
    description:  '24H coworking space on the 5th floor of MAYA shopping center',
    user: User.first
  },
  {
    name: "Ab'Petite Café",
    address: "Ab'Petite Café",
    description:  'Cosy little independent café',
    user: User.last
  },
  {
    name: "My Secret Cafe In Town",
    address: "My Secret Cafe In Town Chiang Mai",
    description:  'Cute and quiet café in the middle of old town',
    user: User.first
  },
  {
    name: "The Barn Eatery And Design",
    address: "The Barn Chiang Mai",
    description:  'Light, rustic and airy café',
    user: User.first
  }
]

# byebug

CoffeeShop.create!(coffee_shop_attributes)

puts 'Finished creating coffee shops.'


#----------REVIEWS SEEDS----------
puts 'Creating reviews...'

review_attributes = [
  {
    user: User.first,
    content: "This is the content of the review.",
    rating: rand(1..5)
  },
  {
    user: User.last,
    content: "This is the content of the review.",
    rating: rand(1..5)
  },
  {
    user: User.first,
    content: "This is the content of the review.",
    rating: rand(1..5)
  },
  {
    user: User.last,
    content: "This is the content of the review.",
    rating: rand(1..5)
  }
]

x = 0
review_attributes.each do |attributes|
  byebug
  review = Review.new(review_attributes[x])
  review.coffee_shop = CoffeeShop.find(x + 1)
  review.save
  x += 1
end

puts "Created #{Review.count} reviews..."


#----------FEATURE SET SEEDS----------
puts 'Creating feature sets...'

feature_set_attributes = [
  {
    serves_plant_milk: false,
    serves_food: false,
    serves_smoothies: true,
    air_conditioning: true,
    plug_sockets: 3,
    busyness: 3,
    comfort: 1,
  },
  {
    serves_plant_milk: false,
    serves_food: true,
    serves_smoothies: true,
    air_conditioning: true,
    plug_sockets: 2,
    busyness: 1,
    comfort: 3,
  },
  {
    serves_plant_milk: true,
    serves_food: true,
    serves_smoothies: true,
    air_conditioning: true,
    plug_sockets: 2,
    busyness: 2,
    comfort: 3,
  },
  {
    serves_plant_milk: true,
    serves_food: true,
    serves_smoothies: false,
    air_conditioning: true,
    plug_sockets: 2,
    busyness: 2,
    comfort: 3,
  }
]

x = 0
CoffeeShop.all.each do |coffee_shop|
  coffee_shop.feature_set = FeatureSet.new(feature_set_attributes[x])
  coffee_shop.feature_set.save
  x += 1
end

puts "Created #{FeatureSet.count} feature sets..."

#----------WIFI SPEED SEEDS----------
puts 'Creating wifi speeds...'

wifi_speed_attributes = [
  {
    download_speed: 4.93,
    upload_speed: 2.91,
    ping: 78
  },
  {
    download_speed: 10.79,
    upload_speed: 11.59,
    ping: 2
  },
  {
    download_speed: 73.25,
    upload_speed: 58.57,
    ping: 23
  },
  {
    download_speed: 64.42,
    upload_speed: 24.75,
    ping: 23
  }
]

x = 0
FeatureSet.all.each do |feature_set|
  feature_set.wifi_speed = WifiSpeed.new(wifi_speed_attributes[x])
  feature_set.wifi_speed.save
  x += 1
end

puts "Created #{WifiSpeed.count} wifi speeds..."


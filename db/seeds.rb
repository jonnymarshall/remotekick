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
CoffeeShop.destroy_all
User.destroy_all

#----------USER SEEDS----------
puts 'Creating users...'
user_attributes = [
  {
    first_name: 'Jonny',
    last_name:  'Marshall',
    email: 'jm@wifiwarriors.io',
    password: "coffee",
  },
  {
    first_name: 'Michael',
    last_name: 'Keller',
    email: 'mk@wifiwarriors.io',
    password: 'coffee',
  },
]
User.create!(user_attributes)

puts "Created #{User.count} users..."


#----------COFFEE SHOP SEEDS----------

puts 'Creating coffee shops...'
coffee_shop_attributes = [
  {
    name: 'CAMP @ Maya',
    description:  '24H coworking space on the 5th floor of MAYA shopping center',
    user: User.first,
    serves_plant_milk: false,
    serves_food: false,
    serves_smoothies: true,
    air_conditioning: true,
    wifi_restrictions: 2,
    latitude: 18.80117127010728,
    longitude: 98.96564847010727
  },
  {
    name: "Ab'Petite Café",
    description:  'Cosy little independent café',
    user: User.first,
    serves_plant_milk: false,
    serves_food: true,
    serves_smoothies: true,
    air_conditioning: true,
    wifi_restrictions: 0,
    latitude: 18.805657,
    longitude: 98.983306
  },
  {
    name: "My Secret Cafe In Town",
    description:  'Cute and quiet café in the middle of old town',
    user: User.first,
    serves_plant_milk: true,
    serves_food: true,
    serves_smoothies: true,
    air_conditioning: true,
    wifi_restrictions: 0,
    latitude: 18.788347,
    longitude: 98.983274
  },
  {
    name: "The Barn Eatery And Design",
    description:  'Light, rustic and airy café',
    user: User.first,
    serves_plant_milk: true,
    serves_food: true,
    serves_smoothies: false,
    air_conditioning: true,
    wifi_restrictions: 0,
    latitude: 18.787627,
    longitude: 98.966519
  },
  {
    name: "Cottontree",
    description:  'Bright, airy café behind MAYA shopping center',
    user: User.first,
    serves_plant_milk: true,
    serves_food: true,
    serves_smoothies: false,
    air_conditioning: true,
    wifi_restrictions: 0,
    latitude: 18.804544,
    longitude: 98.967806
  },
  {
    name: "Ombra Caffe",
    description:  'Cafe and popular coworking spot',
    user: User.first,
    serves_plant_milk: false,
    serves_food: true,
    serves_smoothies: true,
    air_conditioning: true,
    wifi_restrictions: 0,
    latitude: 18.800055,
    longitude: 98.974610
  },
  {
    name: "SS1254372",
    description:  'Cosy cafe with a homely feel',
    user: User.first,
    serves_plant_milk: true,
    serves_food: true,
    serves_smoothies: true,
    air_conditioning: true,
    wifi_restrictions: 0,
    latitude: 18.795085,
    longitude: 98.968436
  },
  {
    name: "Wake Up",
    description:  '24H cafe in the popular Nimman area',
    user: User.first,
    serves_plant_milk: false,
    serves_food: false,
    serves_smoothies: false,
    air_conditioning: true,
    wifi_restrictions: 4,
    latitude: 18.795085,
    longitude: 98.968436
  },
  {
    name: "Nine One Coffee",
    description:  'Small coffee shop in the popular Nimman area',
    user: User.first,
    serves_plant_milk: false,
    serves_food: false,
    serves_smoothies: false,
    air_conditioning: true,
    wifi_restrictions: 0,
    latitude: 18.795085,
    longitude: 98.966974
  },
  {
    name: "Wawee Bistro",
    description:  'Coffee chain serving food',
    user: User.first,
    serves_plant_milk: false,
    serves_food: true,
    serves_smoothies: false,
    air_conditioning: true,
    wifi_restrictions: 0,
    latitude: 18.789085,
    longitude: 98.990607
  }
]

CoffeeShop.create!(coffee_shop_attributes)

puts "Created #{CoffeeShop.count} coffee shops..."


#----------REVIEWS SEEDS----------
puts 'Creating Jonnys reviews...'

review_attributes = [{
    user: User.first,
    content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    rating: 2,
    plug_sockets: 2,
    busyness: 0,
    comfort: 0,
    download_speed: 4.93,
    upload_speed: 2.91,
    ping: 78
  },
  {
    user: User.first,
    content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    rating: 5,
    plug_sockets: 1,
    busyness: 2,
    comfort: 2,
    download_speed: 10.79,
    upload_speed: 11.59,
    ping: 2
  },
  {
    user: User.first,
    content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    rating: 4,
    plug_sockets: 1,
    busyness: 1,
    comfort: 2,
    download_speed: 73.25,
    upload_speed: 58.57,
    ping: 23
  },
  {
    user: User.first,
    content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    rating: 5,
    plug_sockets: 1,
    busyness: 1,
    comfort: 2,
    download_speed: 64.42,
    upload_speed: 24.75,
    ping: 23
  },
  {
    user: User.first,
    content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    rating: 4,
    plug_sockets: 0,
    busyness: 2,
    comfort: 1,
    download_speed: 73.25,
    upload_speed: 58.57,
    ping: 23
  },
  {
    user: User.first,
    content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    rating: 5,
    plug_sockets: 2,
    busyness: 1,
    comfort: 2,
    download_speed: 43.25,
    upload_speed: 32.61,
    ping: 22
  },
  # SS1254372
  {
    user: User.first,
    content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    rating: 5,
    plug_sockets: 2,
    busyness: 0,
    comfort: 1,
    download_speed: 161.03,
    upload_speed: 96.88,
    ping: 68
  },
  {
    user: User.first,
    content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    rating: 5,
    plug_sockets: 2,
    busyness: 2,
    comfort: 2,
    download_speed: 6.92,
    upload_speed: 0.85,
    ping: 5
  },
  {
    user: User.first,
    content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    rating: 5,
    plug_sockets: 2,
    busyness: 2,
    comfort: 2,
    download_speed: 85,
    upload_speed: 25,
    ping: 20
  },
  {
    user: User.first,
    content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    rating: 5,
    plug_sockets: 1,
    busyness: 1,
    comfort: 2,
    download_speed: 14.83,
    upload_speed: 163.66,
    ping: 2
  },
]

puts 'Applying Jonnys reviews to coffee shops'

x = 0

CoffeeShop.all.each do |coffee_shop|
  review = Review.new(review_attributes[x])
  review.coffee_shop = coffee_shop
  review.save
  x += 1
end

puts "Created #{Review.count} reviews..."

puts "Creating 10 additional reviews for coffee shop with ID: #{CoffeeShop.first.id}"

10.times do
  review = Review.new(review_attributes.sample)
  review.coffee_shop = CoffeeShop.first
  # byebug
  review.save
end

puts "Created 10 additional reviews for coffee shop with ID: #{CoffeeShop.first.id}"

#----------CLOUDINARY IMAGE SEEDS----------
# url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
# article = Article.new(title: 'NES', body: "A great console")
# article.remote_photo_url = url
# article.save

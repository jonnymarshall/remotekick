# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#----------CLEAN DB----------
puts 'Cleaning database...'
# WifiSpeed.destroy_all
# FeatureSet.destroy_all
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
  }
]

CoffeeShop.create!(coffee_shop_attributes)

puts "Created #{CoffeeShop.count} coffee shops..."


#----------REVIEWS SEEDS----------
puts 'Creating Jonnys reviews...'

review_attributes = [{
    user: User.first,
    content: "Hate this fucking place",
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
    content: "Love this fucking place",
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
    content: "Like this place",
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
    content: "Like this place",
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
    content: "Don't like this place",
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
    content: "Love this place",
    rating: 5,
    plug_sockets: 2,
    busyness: 1,
    comfort: 2,
    download_speed: 43.25,
    upload_speed: 32.61,
    ping: 22
  }
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

#----------CLOUDINARY IMAGE SEEDS----------
# url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
# article = Article.new(title: 'NES', body: "A great console")
# article.remote_photo_url = url
# article.save

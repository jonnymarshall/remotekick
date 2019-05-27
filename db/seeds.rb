# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#----------CLEAN DB----------
puts 'Cleaning database...'

CoffeeShop.destroy_all

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
  }
]
User.create!(user_attributes)
puts 'Finished creating users.'


#----------COFFEE SHOP SEEDS----------

puts 'Creating coffee shops...'
coffee_shop_attributes = [
  {
    name:         'CAMP @ Maya',
    description:  '24H coworking space on the 5th floor of MAYA shopping center',
    user: User.first
  },
  {
    name:         "Ab'Petite Café",
    description:  'Cosy little independent café',
    user: User.last
  }
]

CoffeeShop.create!(coffee_shop_attributes)
puts 'Finished creating coffee shops.'

# puts "Putting items in their places..."

# CoffeeShop.all.each do |coffee_shop|
#   fake_coordinates = coordinates.sample
#   coffee_shop[:latitude] = fake_coordinates[1]
#   coffee_shop[:longitude] = fake_coordinates[0]
#   item.save
# end

# puts "Created latitude and longitude for items..."


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
  }
]

CoffeeShop.all.each do |coffee_shop|
  reviews = Review.create(review_attributes)
  reviews.each do |review|
    review.coffee_shop = coffee_shop
    review.save
  end
end

puts "Created #{Review.count} reviews..."

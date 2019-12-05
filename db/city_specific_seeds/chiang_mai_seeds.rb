def create_chiang_mai_coffee_shops
  puts 'Creating chiang mai coffee shops...'
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
    },
    {
      name: "Wawee Coffee",
      description:  'Popular coffee chain',
      user: User.first,
      serves_plant_milk: false,
      serves_food: false,
      serves_smoothies: false,
      air_conditioning: true,
      wifi_restrictions: 0,
      latitude: 18.789689,
      longitude: 99.002409
    },
    {
      name: "Artisan Café",
      description:  'Coffee shop popular with digital nomads',
      user: User.first,
      serves_plant_milk: true,
      serves_food: true,
      serves_smoothies: true,
      air_conditioning: true,
      wifi_restrictions: 0,
      latitude: 18.776090,
      longitude: 98.982000
    },
    {
      name: "ADDICT CAFE",
      description:  'Small, cosy and relaxed cafe in Nimman',
      user: User.first,
      serves_plant_milk: false,
      serves_food: false,
      serves_smoothies: false,
      air_conditioning: true,
      wifi_restrictions: 0,
      latitude: 18.800859,
      longitude: 98.967540
    },
    {
      name: "Thesis Coffee",
      description:  'Large cafe and popular coworking space',
      user: User.first,
      serves_plant_milk: false,
      serves_food: true,
      serves_smoothies: true,
      air_conditioning: true,
      wifi_restrictions: 3,
      latitude: 18.807239,
      longitude: 98.957395
    },
    {
      name: "Only Coffee",
      description:  'Large cafe and popular coworking space',
      user: User.first,
      serves_plant_milk: true,
      serves_food: true,
      serves_smoothies: false,
      air_conditioning: true,
      wifi_restrictions: 0,
      latitude: 18.798354,
      longitude: 98.965053
    },
    {
      name: "Annista Cafe",
      description:  'Large cafe and popular coworking space',
      user: User.first,
      serves_plant_milk: false,
      serves_food: true,
      serves_smoothies: true,
      air_conditioning: true,
      wifi_restrictions: 0,
      latitude: 18.803645,
      longitude: 98.959728
    }
  ]
  CoffeeShop.create!(coffee_shop_attributes)

  puts "Created #{CoffeeShop.count} coffee shops..."
end


def create_chiang_mai_coffee_shop_reviews
  puts "Creating Jonny's chiang mai coffee shop reviews..."
  review_attributes = [{
    # Camp@MAYA
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 1,
      plug_sockets: 2,
      busyness: 0,
      comfort: 0,
      download_speed: 4.93,
      upload_speed: 2.91,
      ping: 78
    },
    # Ab'Petite Café
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 1,
      busyness: 2,
      comfort: 2,
      download_speed: 10.79,
      upload_speed: 11.59,
      ping: 2
    },
    {
      # My Secret Cafe In Town
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      plug_sockets: 1,
      busyness: 1,
      comfort: 2,
      download_speed: 73.25,
      upload_speed: 58.57,
      ping: 23
    },
    # The Barn Eatery And Design
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 1,
      busyness: 1,
      comfort: 2,
      download_speed: 64.42,
      upload_speed: 24.75,
      ping: 23
    },
    # Cottontree
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      plug_sockets: 0,
      busyness: 2,
      comfort: 1,
      download_speed: 73.25,
      upload_speed: 58.57,
      ping: 23
    },
    # Ombra Caffe
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
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
      rating: 4,
      plug_sockets: 2,
      busyness: 0,
      comfort: 1,
      download_speed: 161.03,
      upload_speed: 96.88,
      ping: 68
    },
    # Wake Up
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 2,
      busyness: 2,
      comfort: 2,
      download_speed: 6.92,
      upload_speed: 0.85,
      ping: 5
    },
    # Nine One Coffee
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 2,
      busyness: 2,
      comfort: 2,
      download_speed: 85,
      upload_speed: 25,
      ping: 20
    },
    # Wawee Bistro
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 1,
      busyness: 1,
      comfort: 2,
      download_speed: 14.83,
      upload_speed: 163.66,
      ping: 2
    },
    # Wawee coffee
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      plug_sockets: 2,
      busyness: 0,
      comfort: 2,
      download_speed: 76,
      upload_speed: 47,
      ping: 12
    },
    # Artisan cafe
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      plug_sockets: 1,
      busyness: 2,
      comfort: 1,
      download_speed: 258,
      upload_speed: 16.5,
      ping: 81
    },
  ]

  puts 'Applying Jonnys reviews to chiang mai coffee shops'

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
    review.save
  end

  puts "Created 10 additional reviews for coffee shop with ID: #{CoffeeShop.first.id}"
end

def melbourne_coffee_shop_attributes
  [
    {
      name: 'Mr Tulk',
      description:  'Light fare and coffee in a high-ceilinged, roomy cafe in the State Library, attracting uni students.',
      user: User.first,
      serves_plant_milk: true,
      serves_food: true,
      wifi_restrictions: 0,
      latitude: -37.8096094,
      longitude: 144.9624115
    },
    {
      name: "Cheeky Monkey",
      description:  'Classic brekkie, plus sandwiches and salads, in a casual, industrial cafe with pavement tables.',
      user: User.first,
      latitude: -37.7984796,
      longitude: 144.8100859
    },
    {
      name: "Seven Seeds Coffee Roasters",
      description:  'Airy, industrial-chic cafe and micro-roaster serving all-day brunch, salads and specialty teas.',
      user: User.first,
      latitude: -37.8028677,
      longitude: 144.9569323
    },
    {
      name: "Naughty Boy Cafe",
      description:  'Café',
      user: User.first,
      serves_plant_milk: true,
      serves_food: true,
      air_conditioning: true,
      wifi_restrictions: 0,
      latitude: -37.7844127,
      longitude: 144.9671893
    },
    {
      name: "The Queensberry Pour House",
      description:  'Café',
      user: User.first,
      latitude: -37.8042177,
      longitude: 144.9598333
    },
    {
      name: "Everyday Coffee",
      description:  'Café',
      user: User.first,
      serves_plant_milk: true,
      serves_food: true,
      air_conditioning: false,
      wifi_restrictions: 0,
      latitude: -37.7987609,
      longitude: 144.915152
    },
    {
      name: "Fourth Chapter",
      description:  'Cafe',
      user: User.first,
      serves_plant_milk: true,
      wifi_restrictions: 0,
      latitude: -37.8527938,
      longitude: 144.999051
    },
    {
      name: "Three Bags Full",
      description:  'Industrial-chic cafe with art gallery, prepping eclectic dishes, gourmet coffee and handmade sodas.',
      user: User.first,
      latitude: -37.8074648,
      longitude: 144.9943101
    },
    {
      name: "Avist Cafe",
      user: User.first,
      serves_plant_milk: true,
      serves_food: true,
      air_conditioning: false,
      wifi_restrictions: 0,
      latitude: -37.7983588,
      longitude: 144.9506491
    },
    {
      name: "Auction Rooms",
      description:  'Buzzing, rustic-chic cafe with a sunny courtyard, for coffee of the day and inventive breakfasts.',
      user: User.first,
      serves_plant_milk: false,
      serves_food: true,
      air_conditioning: true,
      wifi_restrictions: 0,
      latitude: -37.802497,
      longitude: 144.9472996
    }
  ]
end

def melbourne_coffee_shop_review_attributes
  [
    {
    # Mr Tulk
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 0,
      busyness: 0,
      comfort: 2,
      download_speed: 15.87,
      upload_speed: 18.65,
      ping: 169
    },
    # Cheeky Monkey
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    #   rating: 4,
    #   plug_sockets: 1,
    #   busyness: 2,
    #   comfort: 2,
    #   download_speed: 10.79,
    #   upload_speed: 11.59,
    #   ping: 2
    },
    #   # Seven Seeds Coffee Roasters
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    #   rating: 3,
    #   plug_sockets: 1,
    #   busyness: 1,
    #   comfort: 2,
    #   download_speed: 73.25,
    #   upload_speed: 58.57,
    #   ping: 23
    },
    # Naughty Boy Cafe
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 1,
      busyness: 1,
      comfort: 2,
      download_speed: 33.84,
      upload_speed: 15.54,
      ping: 19
    },
    # The Queensberry Pour House
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
    #   rating: 3,
    #   plug_sockets: 0,
    #   busyness: 2,
    #   comfort: 1,
    #   download_speed: 73.25,
    #   upload_speed: 58.57,
    #   ping: 23
    },
    # Everyday Coffee
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      plug_sockets: 1,
      busyness: 1,
      comfort: 1,
      download_speed: 35.21,
      upload_speed: 19.94,
      ping: 45
    },
    # Fourth Chapter
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      plug_sockets: 0,
      busyness: 2,
      comfort: 2,
      download_speed: 8.02,
      upload_speed: 0.6,
      ping: 25
    },
    # Three Bags Full
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      # rating: 4,
      # plug_sockets: 2,
      # busyness: 2,
      # comfort: 2,
      download_speed: 1.37,
      upload_speed: 0.93,
      ping: 93
    },
    # Avist Cafe
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 1,
      busyness: 2,
      comfort: 2,
      download_speed: 47.39,
      upload_speed: 18.9,
      ping: 6
    },
    # Auction Rooms
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 1,
      busyness: 1,
      comfort: 2,
      download_speed: 1.8,
      upload_speed: 0.35,
      ping: 44
    }
  ]
end

def create_melbourne_coffee_shops(melbourne_coffee_shop_attributes)
  puts 'Creating melbourne coffee shops...'
  CoffeeShop.create!(melbourne_coffee_shop_attributes)
  puts "Created #{CoffeeShop.count} coffee shops..."
end

def create_melbourne_coffee_shop_reviews(melbourne_coffee_shop_attributes, melbourne_coffee_shop_review_attributes)
  puts 'Applying Jonnys reviews to melbourne coffee shops'

  x = 0

  melbourne_coffee_shop_attributes.each do |coffee_shop|
    review = Review.new(melbourne_coffee_shop_review_attributes[x])
    review.coffee_shop = CoffeeShop.where(name: coffee_shop[:name])[0]
    review.save
    x += 1
  end

  puts "Created #{Review.count} reviews..."

  puts "Creating 10 additional reviews for Mr Tulk, with ID: #{CoffeeShop.where(name: "Mr Tulk").first.id}"

  10.times do
    review = Review.new(melbourne_coffee_shop_review_attributes.sample)
    review.coffee_shop = CoffeeShop.where(name: "Mr Tulk").first
    review.save
  end

  puts "Created 10 additional reviews for Mr Tulk, with ID: #{CoffeeShop.where(name: "Mr Tulk").first.id}"
end

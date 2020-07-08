def melbourne_venue_attributes
  [
    {
      name: 'Mr Tulk',
      description:  'Light fare and coffee in a high-ceilinged, roomy cafe in the State Library, attracting uni students.',
      user: User.first,
      # serves_plant_milk: true,
      # serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.8096094,
      longitude: 144.9624115
    },
    {
      name: "Cheeky Monkey",
      description:  'Classic brekkie, plus sandwiches and salads, in a casual, industrial cafe with pavement tables.',
      user: User.first,
      latitude: -37.824971,
      longitude: 144.994392
    },
    {
      name: "Seven Seeds Coffee Roasters",
      description:  'Airy, industrial-chic cafe and micro-roaster serving all-day brunch, salads and specialty teas.',
      user: User.first,
      has_wifi: false,
      latitude: -37.8028677,
      longitude: 144.9569323
    },
    {
      name: "Naughty Boy Cafe",
      description:  'Café',
      user: User.first,
      # serves_plant_milk: true,
      # serves_food: true,
      # air_conditioning: true,
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
      # serves_plant_milk: true,
      # serves_food: true,
      # air_conditioning: false,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.804355,
      longitude: 144.961175
    },
    {
      name: "Fourth Chapter",
      description:  'Cafe',
      user: User.first,
      # serves_plant_milk: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.8527938,
      longitude: 144.999051
    },
    {
      name: "Three Bags Full",
      description:  'Industrial-chic cafe with art gallery, prepping eclectic dishes, gourmet coffee and handmade sodas.',
      user: User.first,
      has_wifi: true,
      latitude: -37.8074648,
      longitude: 144.9943101
    },
    {
      name: "Avist Cafe",
      user: User.first,
      # serves_plant_milk: true,
      # serves_food: true,
      # air_conditioning: false,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.7983588,
      longitude: 144.9506491
    },
    {
      name: "Auction Rooms",
      description: 'Cafe',
      user: User.first,
      # serves_food: true,
      # air_conditioning: false,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.802264,
      longitude: 144.949499
    },
    {
      name: "Roobi Cafe",
      description: 'Cafe',
      user: User.first,
      # serves_food: true,
      # air_conditioning: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.808508,
      longitude: 144.948683
    },
    {
      name: "Olivier's Cafe",
      description: 'Restaurant',
      user: User.first,
      # serves_food: true,
      # air_conditioning: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.820310,
      longitude: 144.955268
    },
    {
      name: "Lucky 8 Cafe",
      description: 'Cafe',
      user: User.first,
      # serves_food: true,
      # air_conditioning: false,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.807208,
      longitude: 144.952543
    },
    {
      name: "Small Block",
      description: 'Cafe',
      user: User.first,
      # serves_food: true,
      # air_conditioning: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.774020,
      longitude: 144.971428
    },
    {
      name: "Chez Dré",
      description: 'Cafe',
      user: User.first,
      # serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.832448,
      longitude: 144.958186
    },
    {
      name: "Ink Hotel Melbourne Southbank",
      description: 'Hotel Cafe',
      user: User.first,
      # serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.824157,
      longitude: 144.962603
    },
    {
      name: "YBF Ventures",
      description: 'Co-working Space',
      user: User.first,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.815180,
      longitude: 144.958386
    },
    {
      name: "St Edmonds Cafe",
      description: 'Cafe',
      user: User.first,
      # air_conditioning: true,
      # serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.849286,
      longitude: 144.991868
    },
    {
      name: "Hannah",
      description: 'Cafe',
      user: User.first,
      # air_conditioning: false,
      # serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.867501,
      longitude: 144.990311
    },
    {
      name: "neighbours cafe",
      description: 'Modern Australian restaurant',
      user: User.first,
      # serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.865171,
      longitude: 144.990988
    },
    {
      name: "HOME Vegan Bar",
      description: 'Vegan restaurant',
      user: User.first,
      # serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.820072,
      longitude: 144.951301
    },
    {
      name: "Higher Ground",
      description: 'Cafe',
      user: User.first,
      # serves_food: true,
      has_wifi: false,
      wifi_restrictions: 0,
      latitude: -37.815706,
      longitude: 144.953098
    },
    {
      name: "Monk Bodhi Dharma",
      description: 'Coffee Shop',
      user: User.first,
      # serves_food: true,
      has_wifi: false,
      wifi_restrictions: 0,
      latitude: -37.867965,
      longitude: 144.990855
    },
    {
      name: "Glass Merchants",
      description: 'Cafe',
      user: User.first,
      # serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -37.868114,
      longitude: 144.993283
    }
  ]
end

def melbourne_venue_review_attributes
  [
    {
    # Mr Tulk
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 0,
      quietness: 0,
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
    #   quietness: 2,
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
    #   quietness: 1,
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
      quietness: 1,
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
    #   quietness: 2,
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
      quietness: 1,
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
      quietness: 2,
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
      # quietness: 2,
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
      quietness: 2,
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
      quietness: 1,
      comfort: 2,
      download_speed: 1.8,
      upload_speed: 0.35,
      ping: 44
    },
    # Roobi Cafe
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 5,
      plug_sockets: 0,
      quietness: 2,
      comfort: 2,
      download_speed: 45.78,
      upload_speed: 16.79,
      ping: 9
    },
    # Olivier's Cafe
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 5,
      plug_sockets: 2,
      quietness: 2,
      comfort: 2,
      download_speed: 29.38,
      upload_speed: 22.22,
      ping: 5
    },
    # Small Block
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 5,
      plug_sockets: 0,
      quietness: 2,
      comfort: 1,
      download_speed: 20.8,
      upload_speed: 5.09,
      ping: 5
    },
    # Chez Dré
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      download_speed: 0.89,
      upload_speed: 0.32,
      ping: 32
    },
    # Ink Hotel Melbourne Southbank
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 5,
      plug_sockets: 2,
      quietness: 2,
      comfort: 2,
      download_speed: 11.15,
      upload_speed: 14.27,
      ping: 4
    },
    # YBF Ventures
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 2,
      quietness: 1,
      comfort: 2,
      download_speed: 75.93,
      upload_speed: 72.9,
      ping: 4
    },
    # St Edmonds Cafe
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      plug_sockets: 0,
      quietness: 1,
      comfort: 2,
      download_speed: 10.93,
      upload_speed: 0.72,
      ping: 72
    },
    # Hannah
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 5,
      plug_sockets: 1,
      quietness: 2,
      comfort: 2,
      download_speed: 10.43,
      upload_speed: 0.31,
      ping: 21
    },
    # Neighbours Cafe
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 5,
      plug_sockets: 1,
      quietness: 2,
      comfort: 1,
      download_speed: 16.96,
      upload_speed: 0.55,
      ping: 10
    },
    # Home Vegan Cafe
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 5,
      plug_sockets: 2,
      quietness: 2,
      comfort: 2,
      download_speed: 21.6,
      upload_speed: 5.06,
      ping: 3
    },
    # Higher Ground
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      quietness: 1,
      comfort: 2,
    },
    # Monk Bodhi Dharma
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      quietness: 1,
      comfort: 1,
      plug_sockets: 0
    },
    # Glass Merchants
    {
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 4,
      quietness: 2,
      comfort: 2,
      plug_sockets: 0
    }
  ]
end

def create_melbourne_venues(melbourne_venue_attributes)
  puts 'Creating melbourne coffee shops...'
  Venue.create!(melbourne_venue_attributes)
  puts "Created #{Venue.count} coffee shops..."
end

def create_melbourne_venue_reviews(melbourne_venue_attributes, melbourne_venue_review_attributes)
  puts 'Applying Jonnys reviews to melbourne coffee shops'

  melbourne_venue_attributes.each_with_index do |venue, x|
    review = Review.new(melbourne_venue_review_attributes[x])
    review.venue = Venue.find_by(name: venue[:name])
    review.save
  end

  puts "Created #{Review.count} reviews..."
end

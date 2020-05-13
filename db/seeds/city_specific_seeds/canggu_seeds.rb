def canggu_venue_attributes
  [
    {
      name: 'Plant Cartel',
      description:  'Restaurant',
      user: User.first,
      serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -8.652600,
      longitude: 115.132407
    },
    {
      name: 'I Am Vegan Babe',
      description:  'Casual hangout preparing a westernized selection of plant-based food & drink.',
      user: User.first,
      serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -8.650961,
      longitude: 115.131852
    },
    {
      name: 'Cinta Cafe',
      description:  'Tempat nongkrong berkonsep tempat terbuka dengan menu yg unik, tersedia playground untuk anak-anak.',
      user: User.first,
      serves_food: true,
      has_wifi: true,
      wifi_restrictions: 0,
      latitude: -8.660134,
      longitude: 115.141088
    },
    # {
    #   name: 'Peleton Supershop',
    #   description:  'Tempat nongkrong berkonsep tempat terbuka dengan menu yg unik, tersedia playground untuk anak-anak.',
    #   user: User.first,
    #   serves_food: true,
    #   has_wifi: true,
    #   wifi_restrictions: 0,
    #   latitude: -8.660134,
    #   longitude: 115.141088
    # }
  ]
end

def canggu_venue_review_attributes
  [
    {
    # Plant Cartel
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      plug_sockets: 1,
      quietness: 2,
      comfort: 2,
      download_speed: 31.33,
      upload_speed: 5.7,
      ping: 44
    },
    {
    # I am vegan babe
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      plug_sockets: 1,
      quietness: 2,
      comfort: 1,
      download_speed: 2.87,
      upload_speed: 1.73,
      ping: 38
    },
    {
    # Cinta Cafe
      user: User.first,
      content: "#{Faker::TvShows::BojackHorseman.quote} #{Faker::TvShows::BojackHorseman.quote}",
      rating: 3,
      plug_sockets: 1,
      quietness: 2,
      comfort: 2,
      download_speed: 55.24,
      upload_speed: 88.11,
      ping: 3
    }
  ]
end

def create_canggu_venues(canggu_venue_attributes)
  puts 'Creating canggu coffee shops...'
  Venue.create!(canggu_venue_attributes)
  puts "Created #{Venue.count} coffee shops..."
end

def create_canggu_venue_reviews(canggu_venue_attributes, canggu_venue_review_attributes)
  puts 'Applying Jonnys reviews to canggu coffee shops'

  canggu_venue_attributes.each_with_index do |venue, x|
    review = Review.new(canggu_venue_review_attributes[x])
    review.venue = Venue.where(name: venue[:name])[0]
    review.save
  end

  puts "Created #{Review.count} reviews..."

  puts "Creating 10 additional reviews for Plant Cartel, with ID: #{Venue.where(name: "Plant Cartel").first.id}"

  10.times do
    review = Review.new(canggu_venue_review_attributes.sample)
    review.venue = Venue.where(name: "Plant Cartel").first
    review.save
  end

  puts "Created 10 additional reviews for Plant Cartel, with ID: #{Venue.where(name: "Plant Cartel").first.id}"
end

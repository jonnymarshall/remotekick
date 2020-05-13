def create_city_seeds
  puts 'Creating cities...'
  city_attributes = [
    {
      name: 'Chiang Mai',
    },
    {
      name: 'Melbourne',
    }
  ]

  City.create!(city_attributes)

  puts "Created #{City.count} cities..."
end

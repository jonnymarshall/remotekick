def create_user_seeds
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
end

def create_user_seeds
  puts 'Creating users...'
  user_attributes = [
    {
      first_name: 'Jonny',
      last_name:  'Marshall',
      email: 'jonny@remotekick.com',
      password: "coffee",
    },
  ]

  User.create!(user_attributes)

  puts "Created #{User.count} users..."
end

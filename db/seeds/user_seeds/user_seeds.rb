def create_user_seeds
  puts 'Creating users...'
  user_attributes = [
    {
      first_name: 'Jonny',
      last_name:  'Marshall',
      email: 'jonny@remotekick.com',
      password: "coffee",
      admin: true,
      confirmed_at: Time.now
    },
    {
      first_name: 'John',
      last_name:  'Doe',
      email: 'johndoe@gmail.com',
      password: "coffee",
      confirmed_at: Time.now
    }
  ]

  User.create!(user_attributes)

  puts "Created #{User.count} users..."
end
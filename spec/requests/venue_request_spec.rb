require 'rails_helper'

RSpec.describe 'Venues' do
  describe 'index' do
    user = User.create!(email: "#{rand(1000000000000)}@gmail.com", password: "password")
    required_validations = {name: "Some name", user: user}
    test_venue = Venue.create!(required_validations)
 
   it 'lists all the coffee shops when no params are given' do
     visit('/venues')
     expect(page).to have_content("Some name")
   end
 
  end
 end
require 'rails_helper'

RSpec.describe 'Venues' do
  describe 'index' do 
   it 'lists all the coffee shops when no params are given' do
     visit('/venues')
     expect(page).to have_content("Some name")
   end
 
  end
 end
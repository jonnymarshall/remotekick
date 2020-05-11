require 'rails_helper'

RSpec.describe 'Venues' do
  let!(:u) { create(:user) }
  let!(:ven) { create(:venue, user: u) }

  describe 'index' do 
   it 'lists all the coffee shops when no params are given' do
     visit('/venues')
     expect(page).to have_content("Some name")
   end
 
  end
 end
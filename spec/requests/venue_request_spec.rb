require 'rails_helper'

RSpec.describe 'Venues' do
  let!(:u) { create(:user) }
  let!(:ven) { create(:venue, user: u) }
  let!(:address) { create(:address, venue: ven) }

  describe 'index' do 
   it 'lists all the coffee shops when no params are given' do
     visit('/venues')
     expect(page).to have_content(ven.name)
   end
 
  end
 end
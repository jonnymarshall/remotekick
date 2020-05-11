require 'rails_helper'

RSpec.describe 'Show Venue' do
  let(:u) { create(:user) }
  let(:ven) { create(:venue, user: u) }
  

  describe 'showing a new venue' do
    it 'shows the venue' do
      visit venue_path(ven)
      expect(page).to have_content(ven.name)
    end
  end
end
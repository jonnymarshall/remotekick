require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:user) { create(:user) }
  let(:venue) { create(:venue, user: user) }
  let(:z) { create(:address, venue: venue) }

  describe 'address factories' do
    it 'must have valid data' do
      # byebug
      expect(z).to be_valid
    end
  end

  describe 'venue' do
    it { should belong_to(:venue) }
  end
end

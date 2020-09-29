require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:user) { create(:user) }
  let(:venue) { create(:venue, users: [user]) }
  

  describe 'address factories' do
    let(:address) { create(:address, venue: venue) }

    it 'must have valid data' do
      expect(address).to be_valid
    end
  end

  describe 'venue' do
    it { should belong_to(:venue) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:latitude) }
  end

  describe 'geocoder' do
    
    it 'should geocode an address with no latitude and longitude values' do
      address_only_address = create(:address_only_address, venue: venue)
      expect(address_only_address.latitude).to_not be_nil
      expect(address_only_address.longitude).to_not be_nil
    end

    it 'should reverse geocode an address with latitude and longitude values and no address' do
      address_only_lng_lat_chiang_mai = create(:address_only_lng_lat_chiang_mai, venue: venue)
      expect(address_only_lng_lat_chiang_mai.address).to_not be_nil
      address_only_lng_lat = create(:address_only_lng_lat, venue: venue)
      expect(address_only_lng_lat.address).to_not be_nil
    end
  end
end
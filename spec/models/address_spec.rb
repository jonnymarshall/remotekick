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

  describe 'geocoder', focus: true do
    
    it 'should geocode an address with no lng/lat values' do
      address_only_address = create(:address_only_address, venue: venue)
      expect(address_only_address.latitude).to_not be_nil
      expect(address_only_address.longitude).to_not be_nil
    end

    it 'should reverse geocode an address with lng/lat values' do
      address_only_lng_lat_chiang_mai = create(:address_only_lng_lat_chiang_mai, venue: venue)
      expect(address_only_lng_lat_chiang_mai.address).to_not be_nil
      address_only_lng_lat = create(:address_only_lng_lat, venue: venue)
      expect(address_only_lng_lat.address).to_not be_nil
    end

    it 'should not geocode if address and lng/lat supplied' do
      address = create(:address, venue: venue)
      expect(address.address).to eq("155 Hyde Park Road")
      expect(address.latitude).to eq(53.618514)
      expect(address.longitude).to eq(-1.712789)
    end

    it 'should re-reverse-geocode lng/lat if new address supplied' do
      address = create(:address, venue: venue)
      initial_longitude_value = address.longitude
      address.update(FactoryBot.attributes_for(:address_only_address_chiang_mai))
      expect(address.longitude).not_to eq(initial_longitude_value)
    end
  end
end
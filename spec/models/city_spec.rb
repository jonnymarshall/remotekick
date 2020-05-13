require 'rails_helper'

RSpec.describe Venue, focus: true do
  let(:city) { create(:city) }
  let(:u) { create(:user) }
  let(:ven) { create(:venue, user: u) }
  
  describe 'city factories' do
    it 'must have valid data' do
      expect(city).to be_valid
    end
  end

  # describe 'validations' do

    # describe 'name' do
      # it { should validate_uniqueness_of(:name).scoped_to(:country) }
    # end

    # describe 'lng lat' do
      # it 'should have lng lat' do
      # end
    # end

    # describe 'venues' do
    #   it { should have_many(:venues) }
    # end

  # end

end

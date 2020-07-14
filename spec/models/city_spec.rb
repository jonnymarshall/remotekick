require 'rails_helper'

RSpec.describe City do
  let(:city) { create(:city) }
  let(:u) { create(:user) }
  let(:ven) { create(:venue, user: u) }
  
  describe 'city factories' do
    it 'must have valid data' do
      expect(city).to be_valid
    end
  end

  describe 'validations' do
    # it { should validate_uniqueness_of(:name).scoped_to(:country) }
  end

end
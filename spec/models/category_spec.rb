require 'rails_helper'

RSpec.describe Category do
  let(:category) { create(:category) }
    
  describe 'category factories' do
    it 'must have valid data' do
      expect(category).to be_valid
    end
  end

  describe 'validations' do

    describe 'name' do
      it { should validate_uniqueness_of(:name) }
    end

  end

  describe 'associations' do
    it { should have_and_belong_to_many(:venues) }
  end

end
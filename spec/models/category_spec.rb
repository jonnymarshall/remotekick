require 'rails_helper'

RSpec.describe Category do
  let(:u) { create(:user) }
  let(:cat) { create(:category) }
  let(:ven) { create(:venue, user: u) }
    
  describe 'category factories' do
    it 'must have valid data' do
      expect(cat).to be_valid
    end
  end

  describe 'validations' do

    describe 'name' do
      it { should validate_uniqueness_of(:name) }
    end

  end

  describe 'associations' do
    it 'the category should belong to the venue' do
      ven.categories << cat
      expect(ven.categories).to eq([cat])
    end

    it 'the venue should belong to the category' do
      ven.categories << cat
      expect(cat.venues).to eq([ven])
    end
    
  end

end

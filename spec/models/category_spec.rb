require 'rails_helper'

RSpec.describe Category, focus: true do
  let(:u) { create(:user) }
  let(:cat) { create(:category) }
  let(:ven) { create(:venue, user: u) }
    
  describe 'category factories' do
    it 'must have valid data' do
      expect(cat).to be_valid
    end
  end

  describe 'validations' do

    # describe 'name' do
    #   it { should validate_uniqueness_of(:name) }
    # end

  end

  describe 'associations' do
    it 'the category should belong to a venue' do
      byebug
      # ven.categories << cat
      # ven.save!
      # ven.should belong_to(cat)
    end

    it 'the venue should belong to the category' do
      #   ven << cat
      #   ven.save!
      #   cat.should belong_to(ven)
      # end
    end
    
  end

end

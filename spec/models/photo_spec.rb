require 'rails_helper'

RSpec.describe Photo, type: :model do
  let(:u) { create(:user) }
  let(:ven) { create(:venue, user: u) }
  let(:photo) { create(:photo, imageable: ven) }
  let(:photo_is_featured) { create(:photo, imageable: ven) }

  describe 'photo factories' do
    it 'must have valid data' do      
      expect(photo).to be_valid
      expect(photo_is_featured).to be_valid
    end
  end


  describe 'validations' do
    it { should belong_to(:imageable) }
  end
end

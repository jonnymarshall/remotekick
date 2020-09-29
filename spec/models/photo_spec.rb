require 'rails_helper'

RSpec.describe Photo, type: :model do
  let(:u) { create(:user) }
  let(:ven) { create(:venue, users: [u]) }
  let!(:photo) { create(:photo, imageable: ven) }
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

  describe 'attached image' do
    it 'should be an instance of ActiveStorage::Attached' do
      photo_with_image = create(:photo_with_attached_image, imageable: ven)
      expect(photo_with_image.image).to be_an_instance_of(ActiveStorage::Attached::One)
    end
  end

  describe 'callbacks' do
    it 'should mark itself as featured if it is the only photo for the venue' do
      expect(photo.featured).to be true
    end

    it 'should not mark itself as featured if it is not the only photo for the venue' do
      photo_not_featured = create(:photo, imageable: ven)
      expect(photo_not_featured.featured).to be false
    end
  end
end

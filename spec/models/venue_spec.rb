require 'rails_helper'

RSpec.describe Venue do
  let(:u) { create(:user) }
  let(:ven) { create(:venue, user: u) }
  
  describe 'venue factories' do
    it 'must have valid data' do
      expect(ven).to be_valid
      expect(u).to be_valid
    end
  end

  describe 'validations' do

    describe 'name' do
      it { should validate_uniqueness_of(:name).scoped_to(:user_id) }

      # it 'must be under 27 characters' do
      #   ven.name = "X" * 26
      #   expect(ven).to be_valid
      #   ven.name = "X" * 27
      #   expect(ven).to_not be_valid
      # end
    end

    describe 'description' do
      it 'can be blank' do
        ven.description = nil
        expect(ven).to be_valid
        ven.description = ""
        expect(ven).to be_valid
      end

      # it 'must be under 68 characters' do
      #   ven.description = "X" * 68
      #   expect(ven).to be_valid
      #   ven.description = "X" * 69
      #   expect(ven).to_not be_valid
      # end
    end

    describe 'user' do
      it { should belong_to(:user) }
    end
  end

  describe 'data integrity' do

    describe 'rating' do
      let!(:rev1) { create(:review, user: u, venue: ven, rating: 4) }
      let!(:rev2) { create(:review, user: u, venue: ven, rating: 1) }

      describe 'averaging' do
        it 'must be an average of all reviews' do
          expect(ven.reviews.count).to eql(2)
          expect(ven.reviews.first.rating + ven.reviews.last.rating).to eql(5)
          expect(ven.rating).to eql(2.5)
        end

        it 'must update average after new review is created' do
          create(:review, user: u, venue: ven, rating: 1)
          expect(ven.rating).to eql(2.to_f)
        end

        it 'must update average after a review is updated' do
          rev2.update!(rating: 2)
          expect(ven.rating).to eql(3.to_f)
        end

        it 'must update average after a review is destroyed' do
          rev2.destroy!
          expect(ven.rating).to eql(4.to_f)
        end
      end
    end

    describe 'has_wifi' do
      let!(:rev1) { create(:review, user: u, venue: ven, content: "rev1") }
      describe 'truthy/falsy value if only one review is given' do
        it 'accepts truthy/falsy value from review as truth' do
          expect(ven.has_wifi).to be true
        end
      end

      describe 'updating truthy/falsy values if the last two review values are not the same' do
        let!(:rev2) { create(:review, user: u, venue: ven, content: "rev2", has_wifi: false) }
        describe 'truthy/falsy venue values' do
          it 'should not update' do
            expect(ven.has_wifi).to be true
          end
        end

        describe 'truthy/falsy venue values if the last two review values are the same' do
          let!(:rev3) { create(:review, user: u, venue: ven, has_wifi: false) }
          it 'should update' do
            expect(ven.has_wifi).to be false
          end
        end

      end
    end

    # describe 'feature_set' do
    #   let!(:rev1) { create(:review, user: u, venue: ven, content: "rev1") }

    #   describe 'truthy/falsy value if only one review is given' do
    #     it 'accepts truthy/falsy value from review as truth' do
    #       expect(ven.feature_set.serves_food).to be true
    #     end
    #   end

    #   describe 'updating truthy/falsy values if the last two review values are not the same' do
    #     let!(:rev2) { create(:review, user: u, venue: ven, content: "rev2", has_wifi: false) }
    #     describe 'truthy/falsy venue values' do
    #       it 'should not update' do
    #         expect(ven.has_wifi).to be true
    #       end
    #     end

    #     describe 'truthy/falsy venue values if the last two review values are the same' do
    #       let!(:rev3) { create(:review, user: u, venue: ven, content: "rev3", has_wifi: true) }
    #       it 'should update' do
    #         expect(ven.has_wifi).to be true
    #       end
    #     end

    #   end
    # end
    
  end

  describe 'scopes' do

    describe 'has_wifi' do
      
      it 'returns an ActiveRecord::Relation of venues which have wifi' do
        has_wifi = FactoryBot.create(:venue, user: u, has_wifi: true)
        also_has_wifi = FactoryBot.create(:venue, user: FactoryBot.create(:user), has_wifi: true)
        does_not_have_wifi = FactoryBot.create(:venue, user: FactoryBot.create(:user), has_wifi: false)
        also_does_not_have_wifi = FactoryBot.create(:venue, user: FactoryBot.create(:user), has_wifi: false)
        
        expect(Venue.has_wifi).to eq([has_wifi, also_has_wifi])
      end
    end

    describe 'location', focus: true do
      
      it 'returns an ActiveRecord::Relation of venues which have addresses near given location' do
        leeds_address = FactoryBot.create(:address, venue: ven)
        chiang_mai_venue = create(:venue, user: create(:user) )
        chiang_mai_address = FactoryBot.create(:address_full_chiang_mai, venue: chiang_mai_venue)
        
        expect(Venue.location("Chiang Mai")).to eq([chiang_mai_venue])
      end
    end

  end

  describe 'photo methods' do

    let!(:photo_belonging_to_venue) { create(:photo, imageable: ven) }

    describe 'all_photos' do
      it 'returns an array of all images of the venue (venue and reviews)' do
        review = create(:review, user: u, venue: ven, rating: 4)
        photo_belonging_to_review = create(:photo, imageable: review)
        
        expect(ven.all_photos).to eq([photo_belonging_to_venue, photo_belonging_to_review])
      end
    end

    describe 'featured_photo' do
      it 'returns featured photo for venue' do
        unfeatured_photo_belonging_to_venue = create(:photo, imageable: ven)
        expect(ven.featured_photo).to eq(photo_belonging_to_venue)
      end
    end

  end
end

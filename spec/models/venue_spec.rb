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
      it { should validate_presence_of(:name)}
      it { should validate_uniqueness_of(:name).scoped_to(:user_id) }

      it 'must be under 27 characters' do
        ven.name = "X" * 26
        expect(ven).to be_valid
        ven.name = "X" * 27
        expect(ven).to_not be_valid
      end
    end

    describe 'description' do
      it 'can be blank' do
        ven.description = nil
        expect(ven).to be_valid
        ven.description = ""
        expect(ven).to be_valid
      end

      it 'must be under 68 characters' do
        ven.description = "X" * 68
        expect(ven).to be_valid
        ven.description = "X" * 69
        expect(ven).to_not be_valid
      end
    end

    describe 'user' do
      it { should belong_to(:user) }
    end

    describe 'rating' do
      let!(:rev1) { create(:review, user: u, venue: ven, rating: 4) }
      let!(:rev2) { create(:review, user: u, venue: ven, rating: 1) }
      
      describe 'venue factories' do
        it 'must have valid data' do
          expect(rev1).to be_valid
          expect(rev2).to be_valid
        end
      end

      it 'must be an average of all reviews' do
        expect(ven.reviews.count).to eql(2)
        expect(ven.reviews.first.rating + ven.reviews.last.rating).to eql(5)
        expect(ven.rating).to eql(2.5)
      end
    end

    describe 'truthy/falsy values' do
      let!(:rev1) { create(:review, user: u, venue: ven, content: "rev1", has_wifi: true) }

      describe 'venue factories' do
        it 'must have valid data' do
          expect(rev1).to be_valid
        end
      end

      describe 'truthy/falsy value if only one review is given' do
        it 'truthy/falsy value from review is taken as truth' do
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
          let!(:rev3) { create(:review, user: u, venue: ven, content: "rev3", has_wifi: false) }
          it 'should update' do
            expect(ven.has_wifi).to be false
          end
        end

      end
    end
  end

  describe 'scopes' do

    describe 'serves_food' do
      
      it 'returns an ActiveRecord::Relation of venues which serve food' do
        serves_food = FactoryBot.create(:venue, user: u, serves_food: true)
        also_serves_food = FactoryBot.create(:venue, user: FactoryBot.create(:user), serves_food: true)
        does_not_serve_food = FactoryBot.create(:venue, user: FactoryBot.create(:user), serves_food: false)
        may_not_serve_food = FactoryBot.create(:venue, user: FactoryBot.create(:user), serves_food: false)
        
        expect(Venue.serves_food).to eq([serves_food, also_serves_food])
      end
    end

  end
end

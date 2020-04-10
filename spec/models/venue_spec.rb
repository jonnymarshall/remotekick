require 'rails_helper'

RSpec.describe Venue do
  let(:u) { create(:user) }
  let(:v) { create(:venue, user: u) }

  
  describe 'validations' do

    describe 'venue factory' do
      it 'must have valid data' do
        expect(v).to be_valid
      end
    end

    describe 'name' do
      it 'must be present' do
        v.name = nil
        expect(v).to_not be_valid
      end

      it 'must not be an empty string' do
        v.name = ""
        expect(v).to_not be_valid
      end

      it 'must be under 27 characters' do
        v.name = "X" * 26
        expect(v).to be_valid
        v.name = "X" * 27
        expect(v).to_not be_valid
      end
    end

    describe 'description' do
      it 'can be blank' do
        v.description = nil
        expect(v).to be_valid
        v.description = ""
        expect(v).to be_valid
      end

      it 'must be under 68 characters' do
        v.description = "X" * 68
        expect(v).to be_valid
        v.description = "X" * 69
        expect(v).to_not be_valid
      end
    end

    describe 'user' do
      it 'must be present' do
        
        v.user = nil
        expect(v).to_not be_valid
      end
    end
    

  end

  describe 'scopes' do

    # describe 'serves_food' do
      
    #   it 'returns an ActiveRecord::Relation of venues which serve food' do
    #     serves_food = described_class.create(required_validations.merge(serves_food: true))
    #     also_serves_food = described_class.create(required_validations.merge(serves_food: true))
    #     does_not_serve_food = described_class.create(required_validations.merge(serves_food: false))
    #     may_not_serve_food = described_class.create(required_validations.merge(serves_food: nil))
        
    #     expect(described_class.serves_food).to contain_exactly(
    #       serves_food,
    #       also_serves_food
    #     )
    #   end
    # end

  end
end

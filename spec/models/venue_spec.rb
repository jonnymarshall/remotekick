require 'rails_helper'

RSpec.describe Venue do
  user = User.create(email: "#{rand(1000000000000)}@gmail.com", password: "password")
  required_validations = {name: "Some name", user: user}
  subject { described_class.new(required_validations) }

  describe 'validations' do

    describe 'name' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.name = nil
        expect(subject).to_not be_valid
      end
    end

    describe 'user' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.user = nil
        expect(subject).to_not be_valid
      end
    end

  end

  describe 'scopes' do

    describe 'serves_food' do
      
      it 'returns an ActiveRecord::Relation of venues which serve food' do
        serves_food = described_class.create(required_validations.merge(serves_food: true))
        also_serves_food = described_class.create(required_validations.merge(serves_food: true))
        does_not_serve_food = described_class.create(required_validations.merge(serves_food: false))
        may_not_serve_food = described_class.create(required_validations.merge(serves_food: nil))
        
        expect(described_class.serves_food).to contain_exactly(
          serves_food,
          also_serves_food
        )
      end
    end

    describe 'user' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.user = nil
        expect(subject).to_not be_valid
      end
    end

  end
end

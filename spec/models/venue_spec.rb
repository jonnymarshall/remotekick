require 'rails_helper'

RSpec.describe Venue, type: :model do

  context 'stupid_test' do
    let(:venue) { Venue.new(name: "Some name")}

    it 'must pass this useless test' do
      expect(venue.name).to eq('Some name')
    end

  end
end

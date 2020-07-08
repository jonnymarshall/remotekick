require 'rails_helper'

RSpec.describe FeatureSet, type: :model do
  let(:user) { create(:user) }
  let(:venue) { create(:venue, user: user) }
  let(:feature_set) { create(:feature_set, venue: venue) }

  describe 'feature_set factories' do
    it 'must have valid data' do
      expect(feature_set).to be_valid
    end
  end

  describe 'venue' do
    it { should belong_to(:venue) }
  end
end

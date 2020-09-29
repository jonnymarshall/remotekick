require 'rails_helper'

RSpec.describe VenuePolicy, type: :policy do
  context "authenticated user" do

    let(:u) { create(:user) }
    let!(:ven) { create(:venue, users: [create(:user)]) }

    before do
      sign_in u
    end
  end


  # let(:user) { User.new }

  # subject { described_class }

  # permissions ".scope" do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end

  # permissions :show? do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end

  # permissions :create? do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end

  # permissions :update? do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end

  # permissions :destroy? do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end
end

require 'rails_helper'

RSpec.describe PhotosController do

  describe "guest user" do
    let(:u) { create(:user) }
    let(:venue) { create(:venue, users: [create(:user)]) }
    let(:address) { create(:address, venue: venue) }
    let!(:photo) { create(:photo, imageable: venue) }
  
    context "authenticated user" do
      let(:u) { create(:user) }

      before do
        sign_in u
      end

      describe "POST destroy" do
        # it "redirects to venue" do
        #   delete :destroy, params: { id: photo.id, venue_id: venue.id }
        #   expect(response).to redirect_to(edit_venue_path(venue))
        # end
    
        it "deletes venue from database" do
          delete :destroy, params: { id: photo.id, venue_id: venue.id }
          expect(Photo.exists?(photo.id)).to eq false
        end
      end
      
    end
  end
end
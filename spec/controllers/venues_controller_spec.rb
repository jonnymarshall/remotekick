require 'rails_helper'

RSpec.describe VenuesController do

  describe "guest user" do
  let(:u) { create(:user) }
  let!(:ven) { create(:venue, user: create(:user)) }

    describe "GET index" do
      it "renders :index template" do
        get :index
        expect(assigns(:venues)).to match_array([ven])
      end
    end
  
    describe "GET show" do
      it "renders :show template" do
        get :show, params: { id: ven.id }
        expect(response).to render_template(:show)
      end
  
      it "assigns venue to @venue" do
        get :show, params: { id: ven.id }
        expect(assigns(:venue)).to eq(ven)
      end
    end

    describe "GET new" do
      it "redirects to login page" do
        get :new
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "GET edit" do
      it "redirects to login page" do
        get :edit, params: { id: ven.id }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "POST create" do
      let(:valid_data) { FactoryBot.attributes_for(:venue) }
      it "redirects to login page" do
        post :create, params: { venue: valid_data }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "PUT update" do
      let(:valid_data) { FactoryBot.attributes_for(:venue, name: "New name") }
      it "redirects to login page" do
        put :update, params: { id: ven.id, venue: valid_data }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "DELETE destroy" do
      it "redirects to login page" do
        delete :destroy, params: { id: ven.id }
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "authenticated user" do
    let(:u) { create(:user) }

    before do
      sign_in u
    end

    context "is not the owner of the venue" do
      let!(:ven) { create(:venue, user: create(:user)) }

      describe "GET edit" do
        it "redirects to venues page" do
          get :edit, params: { id: ven.id }
          expect(response).to redirect_to(venues_path)
        end
      end
  
      describe "PUT update" do
        let(:valid_data) { FactoryBot.attributes_for(:venue, name: "New name") }
        it "redirects to venues page" do
          put :update, params: { id: ven.id, venue: valid_data }
          expect(response).to redirect_to(venues_path)
        end
      end
  
      describe "DELETE destroy" do
        it "redirects to venues page" do
          delete :destroy, params: { id: ven.id }
          expect(response).to redirect_to(venues_path)
        end
      end
    end
    
    context "is the owner of the venue" do
      let!(:ven) { create(:venue, user: u) }
      
      describe "GET edit" do
    
        it "renders :edit template" do
          get :edit, params: { id: ven.id }
          expect(response).to render_template(:edit)
        end
    
        it "assigns the requested venue" do
          get :edit, params: { id: ven.id }
          expect(assigns(:venue)).to eq(ven)
        end
      end
    
      describe "PUT update" do
        let(:valid_data) { FactoryBot.attributes_for(:venue, name: "New name") }
        
        describe "valid data" do
          it "redirects to venues#show" do
            put :update, params: { id: ven.id, venue: valid_data }
            expect(response).to redirect_to(venue_path(assigns[:venue]))
          end
    
          it "updates venue in database" do
            put :update, params: { id: ven.id, venue: valid_data }
            ven.reload
            expect(ven.name).to eq("New name")
          end
        end
    
        describe "invalid data" do
          let(:invalid_data) { FactoryBot.attributes_for(:venue, name: nil, description: "New description") }
      
          it "redirects :edit template" do
            put :update, params: { id: ven.id, venue: invalid_data }
            expect(response).to render_template(:edit)
          end
      
          it "doesn't update venue in database" do
            put :update, params: { id: ven.id, venue: invalid_data }
            ven.reload
            expect(ven.description).not_to eq("New description")
          end
        end
    
        describe "POST destroy" do
          it "redirects to venues#index" do
            delete :destroy, params: { id: ven.id }
            expect(response).to redirect_to(venues_path)
          end
      
          it "deletes venue from database" do
            delete :destroy, params: { id: ven.id }
            expect(Venue.exists?(ven.id)).to eq false
          end
        end
    
      end
    end
  end
end
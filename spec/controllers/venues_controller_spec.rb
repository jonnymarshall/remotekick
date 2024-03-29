require 'rails_helper'

RSpec.describe VenuesController do

  describe "guest user" do
  let(:u) { create(:user) }
  let!(:ven) { create(:venue, users: [create(:user)]) }
  let!(:address) { create(:address, venue: ven) }

    describe "GET index" do
      it "renders :index template" do
        get :index
        expect(assigns(:venues)).to match_array([ven])
        expect(response).to render_template(:index)
      end

      it "redirects to cities#index if no venues are found" do
        ven.destroy!
        get :index
        expect(assigns(:venues)).to match_array([])
        expect(response).to redirect_to(cities_path)
      end
    end
  
    describe "GET show" do
      it "renders :show template" do
        get :show, params: { id: ven.to_param }
        expect(response).to render_template(:show)
      end
  
      it "assigns venue to @venue" do
        get :show, params: { id: ven.to_param }
        expect(assigns(:venue)).to eq(ven)
      end
    end

    describe "GET new" do
      it "redirects to login page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET edit" do
      it "redirects to login page" do
        get :edit, params: { id: ven.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST create" do
      let(:valid_data) { FactoryBot.attributes_for(:venue) }
      it "redirects to login page" do
        post :create, params: { venue: valid_data }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "PUT update" do
      let(:valid_data) { FactoryBot.attributes_for(:venue, name: "New name") }
      it "redirects to login page" do
        put :update, params: { id: ven.id, venue: valid_data }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "DELETE destroy" do
      it "redirects to login page" do
        delete :destroy, params: { id: ven.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context "authenticated user" do
    let(:u) { create(:user) }

    before do
      sign_in u
    end

    context "is not the owner of the venue" do

      context "an owner exists for the venue" do
        let!(:ven) { create(:venue_with_owner) }
        let!(:ven_usr) { create(:venue_user, user: u, venue: ven) }
        
        describe "GET edit" do
          it "redirects to show page" do
            get :edit, params: { id: ven.id }
            expect(response).to redirect_to(venue_path(ven))
          end
        end
    
        describe "PUT update" do
          let(:valid_data) { FactoryBot.attributes_for(:venue, name: "New name") }
          it "does not update" do
            put :update, params: { id: ven.id, venue: valid_data }
            expect(ven.name).to eq("Some venue name")
          end
  
          it "redirects to show page" do
            put :update, params: { id: ven.id, venue: valid_data }
            expect(response).to redirect_to(venue_path(ven))
          end
        end
    
        describe "DELETE destroy" do
          it "does not destroy" do
            delete :destroy, params: { id: ven.id }
            expect(Venue.exists?(ven.id)).to eq true
          end
  
          it "redirects to show page" do
            delete :destroy, params: { id: ven.id }
            expect(response).to redirect_to(venue_path(ven))
          end
        end
      end

      context "an owner does not exist for the venue" do

        context "the current user is the user who added the venue" do
          let!(:ven) { create(:venue, users: [u]) }

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

        context "the current user is not the user who added the venue" do
          let!(:ven) { create(:venue, users: [create(:user)]) }

          describe "GET edit" do
            it "redirects to show page" do
              get :edit, params: { id: ven.id }
              expect(response).to redirect_to(venue_path(ven))
            end
          end
      
          describe "PUT update" do
            let(:valid_data) { FactoryBot.attributes_for(:venue, name: "New name") }
            it "does not update" do
              put :update, params: { id: ven.id, venue: valid_data }
              expect(ven.name).to eq("Some venue name")
            end
    
            it "redirects to show page" do
              put :update, params: { id: ven.id, venue: valid_data }
              expect(response).to redirect_to(venue_path(ven))
            end
          end
      
          describe "DELETE destroy" do
            it "does not destroy" do
              delete :destroy, params: { id: ven.id }
              expect(Venue.exists?(ven.id)).to eq true
            end
    
            it "redirects to show page" do
              delete :destroy, params: { id: ven.id }
              expect(response).to redirect_to(venue_path(ven))
            end
          end
        end
      
      end
    end
    
    context "is the owner of the venue" do
      let!(:ven) {create(:venue)}
      let!(:address) {create(:address, venue: ven)}
      let!(:ven_usr) { create(:venue_user, user: u, venue: ven, user_type: "owner") }
      
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
        
        describe "valid data" do
          describe "venue only" do

            let(:valid_data) { FactoryBot.attributes_for(:venue, name: "New name") }
            
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

          describe "venue with address" do

            let(:valid_data) { FactoryBot.attributes_for(:venue, name: "New name", address_attributes: FactoryBot.attributes_for(:address, city: "New city name")) }
            
            it "redirects to venues#show" do
              put :update, params: { id: ven.id, venue: valid_data }
              expect(response).to redirect_to(venue_path(assigns[:venue]))
            end
      
            it "updates address in database" do
              put :update, params: { id: ven.id, venue: valid_data }
              ven.reload
              expect(ven.address.city).to eq("New city name")
            end
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
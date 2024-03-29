require 'rails_helper'
require_relative '../support/new_venue_form'
require_relative '../support/login_form'

RSpec.describe 'Create Venue' do
  let(:new_venue_form) { NewVenueForm.new }

  describe 'adding a new venue' do

    describe "guest user" do
      it 'requires sign in' do
        new_venue_form.visit_page
        expect(page).to have_current_path(new_user_session_path)
      end
    end

    describe "authenticated user" do
      let(:u) { create(:user) }
      let(:login_form) { LoginForm.new }

      before do
        login_form.visit_page(new_user_session_path).login_as(u)
      end

      it 'successfully adds a new venue', focus: true do
        new_venue_form.visit_page.fill_in_with.submit
        expect(page).to have_content 'Test'
      end
  
      it 'cannot create venue with invalid data' do
        new_venue_form.visit_page.submit
        expect(page).to have_current_path(venues_path)
        # expect(flash[:error]).to eq "Buying our stuff failed :-("
      end
    end
  end
end

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

      it 'successfully adds a new venue' do
        new_venue_form.visit_page.fill_in_with.submit
        expect(page).to have_content 'Test'
      end

      ## TEST ONLY
      # it 'sends an email' do
      #   new_venue_form.visit_page.fill_in_with.submit

      #   expect(ActionMailer::Base.deliveries.count).to eq(1)
      #   expect(ActionMailer::Base.deliveries.last.to).to include(u.email)
      # end
      ## TEST ONLY
  
      it 'cannot create venue with invalid data' do
        new_venue_form.visit_page.submit
        expect(page).to have_current_path(venues_path)
      end
    end
  end
end

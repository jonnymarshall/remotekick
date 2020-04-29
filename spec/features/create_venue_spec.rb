require 'rails_helper'
require_relative '../support/new_venue_form'

RSpec.describe 'Create Venue' do
  let(:u) { create(:user) }
  let(:new_venue_form) { NewVenueForm.new }

  def sign_in_user
    visit new_user_session_path
    within("#log_in_form") do
      fill_in 'user[email]', with: u.email
      fill_in 'user[password]', with: u.password
    end
    click_button 'Log in'
  end

  describe 'adding a new venue' do
    it 'requires sign in' do
      new_venue_form.visit_page
      expect(page).to have_current_path(new_user_session_path)
    end

   
    it 'successfully adds a new venue' do
      sign_in_user
      new_venue_form.visit_page.fill_in_with.submit
      expect(page).to have_content 'Test'
    end

    it 'cannot create venue with invalid data' do
      sign_in_user
      new_venue_form.visit_page.submit
      expect(page).to have_current_path(venues_path)
    end
  end
end

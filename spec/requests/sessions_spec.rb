require 'rails_helper'

RSpec.describe "user sessions" do
  let(:u) { create(:user) }
  let(:new_user) { build_stubbed(:user) }

  it "sends a confirmation link when user signs up"  do
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'user[first_name]', with: new_user.first_name
      fill_in 'user[last_name]', with: new_user.last_name
      fill_in 'user[email]', with: new_user.email
    end
    click_button 'Sign up'
    expect(page).to have_content 'confirmation link'
  end

  it "logs a user in" do
    visit '/users/sign_in'
    within("#log_in_form") do
      fill_in 'user[email]', with: u.email
      fill_in 'user[password]', with: u.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  it "allows a user to change their password" do
    sign_in u
    visit '/users/edit'
    within("#edit_user") do
      fill_in 'user[password]', with: "new password"
      fill_in 'user[password_confirmation]', with: "new password"
      fill_in 'user[current_password]', with: u.password
    end
    click_button 'Save changes'
    u.reload
    expect(page).to have_content 'Your account has been updated successfully'
    expect(u.valid_password?('new password')).to be true
  end
end
require 'rails_helper'

RSpec.describe "user sessions" do
  let(:u) { create(:user) }

  it "signs a user up" do
    visit '/users/sign_up'
    within("#sign_up_form") do
      fill_in 'user[email]', with: "#{rand(1000000000000)}@example.com"
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome'
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
    within("#edit_user_form") do
      fill_in 'user[email]', with: u.email
      fill_in 'user[password]', with: "new password"
      fill_in 'user[password_confirmation]', with: "new password"
      fill_in 'user[current_password]', with: u.password
    end
    find_by_id('save_account_changes').click
    u.reload
    expect(u.valid_password?('new password')).to be true
    expect(page).to have_content 'Your account has been updated successfully'
  end
  
end
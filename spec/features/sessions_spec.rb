require 'rails_helper'

RSpec.describe "the signin process", type: :feature do
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
end


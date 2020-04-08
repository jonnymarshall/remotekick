require 'rails_helper'

RSpec.describe "the signin process", type: :feature do
  before :each do
    User.new(email: 'user@example.com', password: 'password')
  end

  it "signs a user up" do
    visit '/users/sign_up'
    within("#sign_up_form") do
      fill_in 'user[email]', with: 'test@gmail.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome'
  end

  # it "logs a user in" do
  #   visit '/users/sign_in'
  #   within("#log_in_form") do
  #     fill_in 'user[email]', with: 'jonny@remotekick.com'
  #     fill_in 'user[password]', with: 'coffee'
  #   end
  #   click_button 'Log in'
  #   expect(page).to have_content 'Signed in successfully'
  # end
end


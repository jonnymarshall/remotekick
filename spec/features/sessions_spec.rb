require 'rails_helper'

describe "the signin process", type: :feature do
  before :each do
    User.new(email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    visit '/users/sign_up'
    within("#sign_up_form") do
      fill_in 'user[email]', with: 'test@gmail.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome'
  end
end


require 'rails_helper'

RSpec.describe 'Home features' do

  it 'loads content' do
    visit ('/')
    expect(page).to have_css('.hero-logo')
  end

end

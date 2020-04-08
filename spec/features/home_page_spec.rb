require 'rails_helper'

feature 'Correct pages are displayed' do

  scenario 'homepage loads' do
    visit ('/')
    expect(page).to have_content('Remote working. On caffeine.')
  end

end

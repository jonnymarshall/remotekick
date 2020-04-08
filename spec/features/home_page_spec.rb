require 'rails_helper'

RSpec.describe 'Homepage' do

  it 'loads content' do
    visit ('/')
    expect(page).to have_content('Remote working. On caffeine.')
  end

end

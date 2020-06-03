class NewVenueForm
  include Capybara::DSL

  def visit_page
    visit '/venues/new'
    self
  end

  def fill_in_with(params = {})
    fill_in 'venue[location]', with: params.fetch(:location, 'London')
    fill_in 'venue[name]', with: params.fetch(:name, 'Test Name')
    fill_in 'venue[description]', with: params.fetch(:description, 'Lovely place this')
    fill_in 'venue[address]', with: params.fetch(:address, '16 Hercules Street, London, N76AS')
    check 'venue[has_wifi]'
    select '2', from: 'venue[wifi_restrictions]'
    self
  end

  def submit
    click_on('Submit')
    self
  end
end
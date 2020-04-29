class NewVenueForm
  include Capybara::DSL

  def visit_page
    visit '/venues/new'
    self
  end

  def fill_in_with(params = {})
    # location: "x",
    # name: "y",
    fill_in 'venue[location]', with: params.fetch(:location, 'London')
    fill_in 'venue[name]', with: "Test"
    fill_in 'venue[description]', with: "Lovely place this"
    fill_in 'venue[address]', with: "16 Hercules Street, London, N76AS"
    check 'venue[has_wifi]'
    select '2', from: 'venue[wifi_restrictions]'
    self
  end

  def submit
    click_on('Submit new listing')
    self
  end
end
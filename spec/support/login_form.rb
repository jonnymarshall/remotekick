class LoginForm
  include Capybara::DSL

  def visit_page(path)
    visit path
    self
  end

  def login_as(u)
    within("#log_in_form") do
      fill_in 'user[email]', with: u.email
      fill_in 'user[password]', with: u.password
    end
    click_button 'Log in'
    self
  end

end
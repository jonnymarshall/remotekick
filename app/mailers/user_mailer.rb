class UserMailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  include Rails.application.routes.url_helpers
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
  # If there is an object in your application that returns a contact email, you can use it as follows
  # Note that Devise passes a Devise::Mailer object to your proc, hence the parameter throwaway (*).
  # default from: "->(*) { Class.instance.email_address }"
  layout 'mailer'

  def confirmation_instructions(record, token, opts={})
    headers["Custom-header"] = "Bar"
    @root_path = root_path
    @fist_name = record[:first_name]
    super
  end

end
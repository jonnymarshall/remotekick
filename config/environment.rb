# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end

Rails.application.configure do

  # ActionMailer
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.preview_path = "#{Rails.root}/spec/mailers/previews"
  config.action_mailer.show_previews = true

  config.action_mailer.smtp_settings = {
    :address              => "mail.privateemail.com",
    :port                 => 587,
    :user_name            => ENV['REMOTEKICK_EMAIL_USERNAME'],
    :password             => ENV['REMOTEKICK_EMAIL_PASSWORD'],
    :authentication       => :plain,
    :enable_starttls_auto => true
  }
end
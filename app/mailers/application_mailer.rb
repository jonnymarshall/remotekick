class ApplicationMailer < ActionMailer::Base
  include Rails.application.routes.url_helpers
  
  default from: 'remotekick <team@remotekick.com>'
  layout 'mailer'
end

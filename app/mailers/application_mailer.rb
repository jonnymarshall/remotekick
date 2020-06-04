class ApplicationMailer < ActionMailer::Base
  # default from: 'team@remotekick.com'
  default from: 'remotekick <team@remotekick.com>'
  layout 'mailer'
end

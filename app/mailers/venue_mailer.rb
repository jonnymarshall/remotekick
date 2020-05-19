class VenueMailer < ApplicationMailer
  def new_venue_listed(user:)
    mail(to: user.email, subject: "new venue added!")
  end
end
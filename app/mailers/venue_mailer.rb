class VenueMailer < ApplicationMailer
  def new_venue_listed(user:, venue:)
    @user = user
    @venue = venue
    mail(
      to: user.email,
      subject: "Thanks for adding #{venue.name} on Remotekick",
      body: "some body")
  end
end
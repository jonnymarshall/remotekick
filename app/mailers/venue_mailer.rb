class VenueMailer < ApplicationMailer
  def new_venue_listed(user:, venue:)
    @user = user
    @venue = venue
    @venue_url = venue_path(venue)
    @root_path = root_path
    @new_review_path = new_venue_review_path(venue)
    mail(
      to: user.email,
      subject: "#{venue.name} is now live on remotekick!")
  end
end
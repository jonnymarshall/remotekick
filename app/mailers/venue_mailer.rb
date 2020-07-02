class VenueMailer < ApplicationMailer
  
  def new_venue_listed(user:, venue:)
    assign_user_and_venue(user: user, venue: venue)
    assign_paths(user: user, venue: venue)

    mail(
      to: user.email,
      subject: "#{venue.name} is now live on remotekick!")
  end

  private

  def assign_user_and_venue(user:, venue:)
    @user = user
    @venue = venue
  end

  def assign_paths(user:, venue:)
    @root_path = root_url
    @venue_url = url_for venue
    @edit_venue_url = edit_venue_url(venue)
    @new_venue_review_url = new_venue_review_url(venue)
  end
end
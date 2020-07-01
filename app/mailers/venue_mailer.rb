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
    if Rails.env.production?
      @root_path = "http://#{ENV['DOMAIN']}"
    else
      @root_path = "http://#{ENV['LOCAL_DOMAIN']}"
    end
    
    byebug
    @venue_url = URI.join(@root_path, venue_path(venue)).to_s
    @edit_venue_url = URI.join(@root_path, edit_venue_path(venue)).to_s
    @new_venue_review_path = URI.join(@root_path, new_venue_review_path(venue)).to_s
  end
end
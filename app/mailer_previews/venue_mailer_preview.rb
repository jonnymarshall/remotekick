class VenueMailerPreview < ActionMailer::Preview
  def new_venue_listed
    VenueMailer.new_venue_listed
  end
end
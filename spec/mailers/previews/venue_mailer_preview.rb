class VenueMailerPreview < ActionMailer::Preview
  def new_venue_listed
    user = FactoryBot.build_stubbed(:user)
    venue = FactoryBot.build_stubbed(:venue)
    VenueMailer.new_venue_listed(user: user, venue: venue)
  end
end
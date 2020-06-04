class VenueMailerPreview < ActionMailer::Preview
  def new_venue_listed
    user = FactoryBot.build(:user)
    venue = FactoryBot.build(:venue)
    VenueMailer.new_venue_listed(user: user, venue: venue)
  end
end
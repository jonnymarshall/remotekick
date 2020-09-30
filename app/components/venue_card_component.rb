class VenueCardComponent < ViewComponent::Base
  def initialize(venue_card:)
    @venue_card = venue_card
  end
end
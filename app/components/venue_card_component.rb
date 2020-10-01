class VenueCardComponent < ViewComponent::Base
  def initialize(venue_card:, is_column_wrapped: false)
    @venue_card = venue_card
    @is_column_wrapped = is_column_wrapped
  end
end
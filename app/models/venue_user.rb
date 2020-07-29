class VenueUser < ApplicationRecord
  has_one :venue
  has_one :user
end

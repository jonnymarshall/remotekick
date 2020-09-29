class VenueUser < ApplicationRecord
  enum user_type: [ :guest, :employee, :owner ]

  belongs_to :venue
  belongs_to :user
end
class VenueUser < ApplicationRecord
  enum user_type: [ :guest, :publisher, :employee, :owner ]

  belongs_to :venue
  belongs_to :user
end
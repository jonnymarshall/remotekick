class OpeningHourSet < ApplicationRecord
  belongs_to :coffee_shop
  has_many :opening_hours
end

class FeatureSet < ApplicationRecord
  belongs_to :coffee_shop
  has_one :wifi_speed
end

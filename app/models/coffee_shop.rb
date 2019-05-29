class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one :feature_set
  has_one :wifi_speed, through: :feature_sets

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

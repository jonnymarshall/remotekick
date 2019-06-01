class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one :feature_set, dependent: :destroy
  has_one :wifi_speed, through: :feature_sets, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

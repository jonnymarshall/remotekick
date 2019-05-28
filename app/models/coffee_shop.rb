class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one :feature_set
  has_one :wifi_speed, through: :feature_sets
end

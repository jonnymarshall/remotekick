class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode


  scope :serves_plant_milk, -> { where(serves_plant_milk: true) }
  scope :serves_food, -> { where(serves_food: true) }
  scope :serves_smoothies, -> { where(serves_smoothies: true) }
  scope :air_conditioning, -> { where(air_conditioning: true) }
  # scope :wifi_restrictions, -> hours { where(wifi_restrictions: hours) }
  scope :no_wifi_restrictions, -> hours { where("wifi_restrictions = 0", hours) }
  # scope :by_degree, -> degree { where(degree: degree) }
  scope :by_comfort, -> number { where("comfort >= ?", number) }
  scope :by_busyness, -> number { where("busyness <= ?", number) }
  scope :by_plug_sockets, -> number { where("comfort >= ?", number) }
end

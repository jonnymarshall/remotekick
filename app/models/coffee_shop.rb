class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :serves_plant_milk, -> { where(serves_plant_milk: true) }
  scope :serves_food, -> { where(serves_food: true) }
  scope :serves_smoothies, -> { where(serves_smoothies: true) }
  scope :air_conditioning, -> { where(air_conditioning: true) }
  # scope :by_wifi_restrictions, -> wifi_restrictions { where(wifi_restrictions: wifi_restrictions) }
end

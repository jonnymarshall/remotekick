class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :review_photos, through: :reviews

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  scope :address, -> address_search { where("address ILIKE ?", "%#{address_search}%") }
  scope :rating, -> number { where("rating >= ?", number) }
  scope :serves_plant_milk, -> { where(serves_plant_milk: true) }
  scope :serves_food, -> { where(serves_food: true) }
  scope :serves_smoothies, -> { where(serves_smoothies: true) }
  scope :air_conditioning, -> { where(air_conditioning: true) }
  scope :no_wifi_restrictions, -> hours { where(wifi_restrictions: hours) }
  scope :by_comfort, -> number { where("comfort >= ?", number) }
  scope :by_busyness, -> number { where("busyness >= ?", number) }
  scope :by_plug_sockets, -> number { where("plug_sockets >= ?", number) }
end

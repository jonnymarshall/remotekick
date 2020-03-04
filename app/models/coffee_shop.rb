class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :review_photos, through: :reviews
  has_one :opening_hour_set, dependent: :destroy
  has_one :cover_photo, dependent: :destroy
  has_many :opening_hours, through: :opening_hour_set

  validates :foursquare_id, uniqueness: true, allow_blank: true

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  # scope :location, -> address_search { near(address_search) }
  scope :rating, -> number { where("rating >= ?", number) }
  scope :upload_speed, -> number { where("upload_speed >= ?", number) }
  scope :serves_plant_milk, -> { where(serves_plant_milk: true) }
  scope :serves_food, -> { where(serves_food: true) }
  scope :serves_smoothies, -> { where(serves_smoothies: true) }
  scope :air_conditioning, -> { where(air_conditioning: true) }
  scope :comfort, -> number { where("comfort >= ?", number) }
  scope :busyness, -> number { where("busyness >= ?", number) }
  scope :plug_sockets, -> number { where("plug_sockets >= ?", number) }
  scope :has_wifi, -> boolean { where("has_wifi = ?", boolean) if boolean == "1" }
  scope :no_wifi_restrictions, -> hours { where("wifi_restrictions < ?", hours) if hours > "0" }
end

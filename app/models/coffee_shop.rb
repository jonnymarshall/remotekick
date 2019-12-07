class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :review_photos, through: :reviews
  has_one :opening_hour_set, dependent: :destroy
  has_many :opening_hours, through: :opening_hour_set

  validates :foursquare_id, uniqueness: true, allow_blank: true

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  # scope :address, -> address_search { where("address ILIKE ?", "%#{address_search}%") }
  # scope :address, -> address_search { near(address_search) }
  scope :location, -> address_search { near(address_search) }
  scope :rating, -> number { where("rating >= ?", number) }
  scope :upload_speed, -> number { where("upload_speed >= ?", number) }
  scope :serves_plant_milk, -> { where(serves_plant_milk: true) }
  scope :serves_food, -> { where(serves_food: true) }
  scope :serves_smoothies, -> { where(serves_smoothies: true) }
  scope :air_conditioning, -> { where(air_conditioning: true) }
  scope :comfort, -> number { where("comfort >= ?", number) }
  scope :busyness, -> number { where("busyness >= ?", number) }
  scope :plug_sockets, -> number { where("plug_sockets >= ?", number) }
  scope :no_wifi_restrictions, -> hours do
    # if checkbox is unchecked, show all the results (greater than or equal to 0 wifi_restrictions)
    if hours == "0"
      where("wifi_restrictions >= ?", hours)
    # else if checkbox is checked, show only the results with 0 (less than 1) wifi_restrictions
    else
      where("wifi_restrictions < ?", hours)
    end
  end
end

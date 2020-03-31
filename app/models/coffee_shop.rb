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
  # scope :location, -> location { near(location) }
  scope :rating, -> number { where("rating >= ?", number) }
  scope :upload_speed, -> number { where("upload_speed >= ?", number) if number > "0" }
  scope :serves_plant_milk, -> { where(serves_plant_milk: true) }
  scope :serves_food, -> { where(serves_food: true) }
  scope :serves_smoothies, -> { where(serves_smoothies: true) }
  scope :air_conditioning, -> { where(air_conditioning: true) }
  scope :comfort, -> number { where("comfort >= ?", number) }
  scope :busyness, -> number { where("busyness >= ?", number) }
  scope :plug_sockets, -> number { where("plug_sockets >= ?", number) }
  scope :has_wifi, -> boolean { where("has_wifi = ?", boolean) if boolean == "1" }
  scope :no_wifi_restrictions, -> hours { where("wifi_restrictions < ?", hours) if hours > "0" }

  def merge_review_values(review)
    # run the update method on coffee shops to reflect new rating values
  updated_values = {
      rating: recalculate_value("rating", review.rating),
      plug_sockets: recalculate_value("plug_sockets", review.plug_sockets),
      comfort: recalculate_value("comfort", review.comfort),
      busyness: recalculate_value("busyness", review.busyness),
      upload_speed: recalculate_value("upload_speed", review.upload_speed),
      download_speed: recalculate_value("download_speed", review.download_speed),
      ping: recalculate_value("ping", review.ping),
      serves_plant_milk: update_boolean_value("serves_plant_milk", review.serves_plant_milk),
      serves_food: update_boolean_value("serves_food", review.serves_food),
      serves_smoothies: update_boolean_value("serves_smoothies", review.serves_smoothies),
      air_conditioning: update_boolean_value("air_conditioning", review.air_conditioning),
      has_wifi: update_boolean_value("has_wifi", review.has_wifi)
    }
    update(updated_values)
  end

  private

  def location_and_distance(loation, distance)
    byebug
  end

  def recalculate_value(param_name, value)
    # assign existing value based on a dynamic active record query for param_name
    coffee_shop_value = send(param_name)
    # apply the rating as-is if no existing ratings, otherwise recalculate average if we have a value
    if value && coffee_shop_value
      (coffee_shop_value + value) / 2
    elsif value && coffee_shop_value.nil?
      value
    else
      coffee_shop_value
    end
  end

  def update_boolean_value(param_name, value)
    # assign existing value based on a dynamic active record query for param_name
    coffee_shop_boolean_value = send(param_name)
    # return the new value if one was given, otherwise return the existing value
    value ? value : coffee_shop_boolean_value
  end

end

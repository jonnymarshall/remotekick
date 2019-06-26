class Review < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_shop
  has_many :review_photos, dependent: :destroy
  validates_numericality_of :rating, greater_than_or_equal_to: 0, less_than_or_equal_to: 4
  validates_numericality_of :plug_sockets, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, allow_blank: true
  validates_numericality_of :comfort, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, allow_blank: true
  validates_numericality_of :busyness, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, allow_blank: true
  validates_numericality_of :upload_speed, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000, allow_blank: true
  validates_numericality_of :download_speed, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000, allow_blank: true
  validates_numericality_of :ping, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000, allow_blank: true

  accepts_nested_attributes_for :review_photos
  after_create :update_coffee_shop_values
end

private

def update_coffee_shop_values
  # run the update method on coffee shops to reflect new rating values
  averageable_values = {
    rating: rating,
    plug_sockets: plug_sockets,
    comfort: comfort,
    busyness: busyness,
    upload_speed: upload_speed,
    download_speed: download_speed,
    ping: ping
  }

  boolean_values = {
    serves_plant_milk: serves_plant_milk,
    serves_food: serves_food,
    serves_smoothies: serves_smoothies,
    air_conditioning: air_conditioning
  }

  averageable_values.each do |key, value|
    coffee_shop.update(key => recalculate_value(key, value)) if !value.nil?
  end

  boolean_values.each do |key, value|
    coffee_shop.update(key => value) if !value.nil?
  end
end

def recalculate_value(key, value)
  # assign coffee shop value based on a dynamic method call for each key in averageable_values
  coffee_shop_value = coffee_shop.send(key)
  # apply the rating as-is if no existing ratings, otherwise recalculate average
  coffee_shop_value.nil? ? value : (coffee_shop_value + value) / 2
end

def coffee_shop
  review.coffee_shop
end

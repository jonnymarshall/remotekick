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
  # validates_uniqueness_of :user_id, :scope => :coffee_shop_id
  accepts_nested_attributes_for :review_photos
  after_create :update_coffee_shop_values
end

private

def update_coffee_shop_values
  # raise
  # run the update method on coffee shops to reflect new rating values
  updated_values = {
    rating: recalculate_value("rating", rating),
    plug_sockets: recalculate_value("plug_sockets", plug_sockets),
    comfort: recalculate_value("comfort", comfort),
    busyness: recalculate_value("busyness", busyness),
    upload_speed: recalculate_value("upload_speed", upload_speed),
    download_speed: recalculate_value("download_speed", download_speed),
    ping: recalculate_value("ping", ping),
    serves_plant_milk: update_boolean_value("serves_plant_milk", serves_plant_milk),
    serves_food: update_boolean_value("serves_food", serves_food),
    serves_smoothies: update_boolean_value("serves_smoothies", serves_smoothies),
    air_conditioning: update_boolean_value("air_conditioning", air_conditioning)
  }
  # byebug
  coffee_shop.update(updated_values)
end

def recalculate_value(param_name, value)
  # assign existing value based on a dynamic active record query for param_name
  coffee_shop_value = coffee_shop.send(param_name)
  # apply the rating as-is if no existing ratings, otherwise recalculate average if we have a value
  if value && !coffee_shop_value.nil?
    (coffee_shop_value + value) / 2
  elsif value && coffee_shop_value.nil?
    value
  else
    coffee_shop_value
  end
end

def update_boolean_value(param_name, value)
  # assign existing value based on a dynamic active record query for param_name
  coffee_shop_boolean_value = coffee_shop.send(param_name)
  # return the new value if one was given, otherwise return the existing value
  value ? value : coffee_shop_boolean_value
end
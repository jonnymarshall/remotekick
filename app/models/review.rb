class Review < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_shop
  has_many :review_photos, dependent: :destroy
  validates :content, :rating, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :plug_sockets, numericality: { less_than_or_equal_to: 2 }
  validates :comfort, numericality: { less_than_or_equal_to: 2 }
  validates :busyness, numericality: { less_than_or_equal_to: 2 }

  accepts_nested_attributes_for :review_photos
  after_create :update_coffee_shop_values
end

private

def update_coffee_shop_values
  # run the update method on coffee shops to reflect new rating values
  review_values = {
    rating: rating,
    plug_sockets: plug_sockets,
    comfort: comfort,
    busyness: busyness,
    upload_speed: upload_speed,
    download_speed: download_speed,
    ping: ping
  }

  review_values.each do |key, value|
    coffee_shop.update(key => recalculate_value(key, value)) if !value.nil?
  end
end

def recalculate_value(key, value)
  # assign coffee shop value based on a dynamic method call for each key in review_values
  coffee_shop_value = coffee_shop.send(key)
  # apply the rating as-is if no existing ratings, otherwise recalculate average
  coffee_shop_value.nil? ? value : (coffee_shop_value + value) / 2
end

def coffee_shop
  review.coffee_shop
end

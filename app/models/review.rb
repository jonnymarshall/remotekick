class Review < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_shop
  validates :content, :rating, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :plug_sockets, numericality: { less_than_or_equal_to: 2 }
  validates :comfort, numericality: { less_than_or_equal_to: 2 }
  validates :busyness, numericality: { less_than_or_equal_to: 2 }

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
  # coffee_shop.update(rating: recalculate_value(rating)) if rating
  # coffee_shop.update(plug_sockets: recalculate_value(plug_sockets)) if plug_sockets
  # coffee_shop.update(comfort: recalculate_value(comfort)) if comfort
  # coffee_shop.update(busyness: recalculate_value(busyness)) if busyness
  # coffee_shop.update(upload_speed: recalculate_value(upload_speed)) if upload_speed
  # coffee_shop.update(download_speed: recalculate_value(download_speed)) if download_speed
  # coffee_shop.update(ping: recalculate_value(ping)) if ping
end

def recalculate_value(key, value)
  # apply the rating as-is if no existing ratings, otherwise recalculate average
  # byebug
  case key
  when :rating
    coffee_shop.rating.nil? ? value : (coffee_shop.rating + value) / 2
  when :plug_sockets
    coffee_shop.plug_sockets.nil? ? value : (coffee_shop.plug_sockets + value) / 2
  when :comfort
    coffee_shop.comfort.nil? ? value : (coffee_shop.comfort + value) / 2
  when :busyness
    coffee_shop.busyness.nil? ? value : (coffee_shop.busyness + value) / 2
  when :upload_speed
    coffee_shop.upload_speed.nil? ? value : (coffee_shop.upload_speed + value) / 2
  when :download_speed
    coffee_shop.download_speed.nil? ? value : (coffee_shop.download_speed + value) / 2
  when :ping
    coffee_shop.ping.nil? ? value : (coffee_shop.ping + value) / 2
  end
end

def coffee_shop
  review.coffee_shop
end

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
  coffee_shop.update(rating: recalculate_value(rating))
  coffee_shop.update(plug_sockets: recalculate_value(plug_sockets))
  coffee_shop.update(comfort: recalculate_value(comfort))
  coffee_shop.update(busyness: recalculate_value(busyness))
  coffee_shop.update(upload_speed: recalculate_value(upload_speed))
  coffee_shop.update(download_speed: recalculate_value(download_speed))
  coffee_shop.update(ping: recalculate_value(ping))
end

def recalculate_value(value)
  # apply the rating as-is if no existing ratings, otherwise recalculate average
  coffee_shop.rating.nil? ? value : (coffee_shop.rating + value) / 2
  coffee_shop.plug_sockets.nil? ? value : (coffee_shop.plug_sockets + value) / 2
  coffee_shop.comfort.nil? ? value : (coffee_shop.comfort + value) / 2
  coffee_shop.busyness.nil? ? value : (coffee_shop.busyness + value) / 2
  coffee_shop.upload_speed.nil? ? value : (coffee_shop.upload_speed + value) / 2
  coffee_shop.download_speed.nil? ? value : (coffee_shop.download_speed + value) / 2
  coffee_shop.ping.nil? ? value : (coffee_shop.ping + value) / 2
end

def coffee_shop
  review.coffee_shop
end

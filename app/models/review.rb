class Review < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_shop
  validates :content, :rating, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :plug_sockets, numericality: { less_than_or_equal_to: 2 }
  validates :comfort, numericality: { less_than_or_equal_to: 2 }
  validates :busyness, numericality: { less_than_or_equal_to: 2 }

  after_create :update_coffee_shop_ratings
end

private

def update_coffee_shop_ratings
  coffee_shop.update(rating: recalculate_rating(rating))
  coffee_shop.update(plug_sockets: recalculate_rating(plug_sockets))
  coffee_shop.update(comfort: recalculate_rating(comfort))
  coffee_shop.update(busyness: recalculate_rating(busyness))
end

def recalculate_rating(value)
  # apply the rating as-is if no existing ratings, otherwise recalculate average
  coffee_shop.rating.nil? ? value : (coffee_shop.rating + value) / 2
  coffee_shop.plug_sockets.nil? ? value : (coffee_shop.plug_sockets + value) / 2
  coffee_shop.comfort.nil? ? value : (coffee_shop.comfort + value) / 2
  coffee_shop.busyness.nil? ? value : (coffee_shop.busyness + value) / 2
end

def coffee_shop
  review.coffee_shop
end

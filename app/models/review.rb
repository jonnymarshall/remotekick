class Review < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_shop
  validates :content, :rating, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5 }

  after_create :update_coffee_shop_rating
end

private

def update_coffee_shop_rating
  coffee_shop.update(rating: recalculate_rating)
end

def recalculate_rating
  coffee_shop.rating.nil? ? coffee_shop.rating = rating : (coffee_shop.rating + rating) / 2
end

def coffee_shop
  review.coffee_shop
end

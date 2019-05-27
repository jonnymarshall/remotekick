class Review < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_shop
  validates :content, :rating, presence: true
end

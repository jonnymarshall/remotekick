class Photo < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_one_attached :image
end
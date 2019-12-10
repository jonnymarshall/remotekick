class CoverPhoto < ApplicationRecord
  belongs_to :coffee_shop
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end

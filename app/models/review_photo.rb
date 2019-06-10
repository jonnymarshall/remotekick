class ReviewPhoto < ApplicationRecord
  belongs_to :review
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end

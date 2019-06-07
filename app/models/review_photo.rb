class ReviewPhoto < ApplicationRecord
  belongs_to :review

  mount_uploader :photo, PhotoUploader
end

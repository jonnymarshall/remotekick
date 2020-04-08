class CoverPhoto < ApplicationRecord
  belongs_to :venue
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end

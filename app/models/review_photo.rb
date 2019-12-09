class ReviewPhoto < ApplicationRecord
  belongs_to :review
  validates :photo, presence: true
  # after_create :set_as_cover_photo_if_blank

  mount_uploader :photo, PhotoUploader

  # private

  # def set_as_cover_photo_if_blank
  #   unless this_instance.review.coffee_shop.cover_photo
  #     this_instance.review.coffee_shop.cover_photo = this_instance
  #   end
  # end

  # def this_instance
  #   self
  # end
end

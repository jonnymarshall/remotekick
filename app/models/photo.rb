class Photo < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :imageable, polymorphic: true
  has_one_attached :image

  after_create :set_as_featured_image, if: :photo_is_first_for_venue

  def set_as_featured_image
    self.update!(featured: true)
    self.imageable.photos.reload
  end

  private

  def photo_is_first_for_venue
    self.imageable.photos.reload
    self.imageable_type == "Venue" ? self.imageable.all_photos.length == 1 : !self.imageable.venue.all_photos.length == 1
  end
end
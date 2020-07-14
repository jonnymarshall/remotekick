class Address < ApplicationRecord
  belongs_to :venue
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :longitude_latitude_supplied_without_address? ? :reverse_geocode : :geocode

  private

  def longitude_latitude_supplied_without_address?
    self.latitude.present? && self.longitude.present? && !self.address.present?
  end
end
class Address < ApplicationRecord
  belongs_to :venue

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode_self


  def geocode_self
    longitude_latitude_supplied_without_address? ? self.reverse_geocode : self.geocode
  end

  private

  def longitude_latitude_supplied_without_address?
    self.latitude.present? && self.longitude.present? && !self.address.present?
  end
end
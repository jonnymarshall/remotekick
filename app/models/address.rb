class Address < ApplicationRecord
  belongs_to :venue
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude
  before_validation :geocode_self


  def geocode_self
    if longitude_latitude_supplied?
      self.reverse_geocode if address.nil?
    else
      self.geocode
    end
  end

  def full_address
    [address, city, postcode, country].compact.join(', ')
  end

  private

  def longitude_latitude_supplied?
    self.latitude.present? && self.longitude.present?
  end

end
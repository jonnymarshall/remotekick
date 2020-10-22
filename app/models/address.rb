class Address < ApplicationRecord
  belongs_to :venue
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude
  before_validation :geocode_self


  def geocode_self
    # Create handling
    if !longitude_latitude_exist? && !address.nil? && address_was == nil
      self.geocode
    elsif longitude_latitude_exist? && address.nil? && longitude_was == nil
      self.reverse_geocode
    # Update handling
    elsif address_changed? && !address_was == nil
      self.geocode
    elsif longitude_changed? && !longitude_was == nil
      self.reverse_geocode
    end
  end

  def full_address
    [address, city, postcode, country].compact.join(', ')
  end

  private

  def longitude_latitude_exist?
    self.latitude.present? && self.longitude.present?
  end

end
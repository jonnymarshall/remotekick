class Address < ApplicationRecord
  belongs_to :venue
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :address_parser
  reverse_geocoded_by :latitude, :longitude
  before_validation :geocode_self


  def geocode_self
    # Create handling
    if !longitude_latitude_exist? && !address.nil? && address_was == nil
      self.geocode
    elsif longitude_latitude_exist? && address.nil? && longitude_was == nil
      self.reverse_geocode
    # Update handling
    elsif address_changed? && address_was.present?
      self.geocode
    elsif longitude_changed? && longitude_was.present?
      self.reverse_geocode
    end
  end

  def address_parser
    if postcode
      postcode
    elsif address && city && country
      [address, city, country].compact.join(', ')
    elsif address && city
      [address, city].compact.join(', ')
    elsif address
      address
    end
  end

  private

  def longitude_latitude_exist?
    self.latitude.present? && self.longitude.present?
  end

end
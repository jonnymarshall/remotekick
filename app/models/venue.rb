class Venue < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :review_photos, through: :reviews
  belongs_to :owner, class_name: 'User', optional: true
  has_one :cover_photo, dependent: :destroy
  has_and_belongs_to_many :categories
  has_many :opening_hours

  validates :foursquare_id, uniqueness: true, allow_blank: true
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
  # validates :description, length: { maximum: 68 }, allow_blank: true
  
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  scope :location, -> location { near(location) }
  scope :rating, -> number { where("rating >= ?", number) }
  scope :upload_speed, -> number { where("upload_speed >= ?", number) if number > "0" }
  scope :serves_food, -> { where(serves_food: true) }
  scope :air_conditioning, -> { where(air_conditioning: true) }
  scope :comfort, -> number { where("comfort >= ?", number) }
  scope :quietness, -> number { where("quietness >= ?", number) }
  scope :plug_sockets, -> number { where("plug_sockets >= ?", number) }
  scope :has_wifi, -> boolean { where("has_wifi = ?", boolean) if boolean == "1" }
  scope :no_wifi_restrictions, -> hours { where("wifi_restrictions < ?", hours) if hours > "0" }

  def update_values(
      review,
      attributes_to_average = [],
      attribues_to_truth_check = [],
      averaged_values = {},
      truth_checked_values = {}
    )

    # Sort attributes into seperate arrays for averaging or truth checking
    review.attributes.each do |k, val|
      attributes_to_average << k if attr_is_averageable?(k) && val != nil
      attribues_to_truth_check << [k,val] if attr_is_boolean?(k) && val != nil
    end
    
    # Recalculate averages for all averageable values which were present in review
    attributes_to_average.each do |attribute|
      averaged_values[attribute] = calculate_average(attribute)
    end

    # Assign new true/false value if the value passes truth checking
    attribues_to_truth_check.each do |boolean_key_value_pair|
      k, val = boolean_key_value_pair[0], boolean_key_value_pair[1]
      truth_checked_values[k] = val if val_truth_checked?(k, val)
    end
    
    # Merge hashes of values to update
    updated_values = averaged_values.merge(truth_checked_values)

    # Update values
    update(updated_values)
  end

  def has_owner?
    self.owner.present?
  end

  private

  def attr_is_averageable?(k)
    averageable_values = ["rating", "plug_sockets", "comfort", "quietness", "upload_speed", "download_speed", "ping"]
    averageable_values.include?(k) ? true : false
  end

  def attr_is_boolean?(k)
    boolean_values = ["serves_food", "air_conditioning", "has_wifi"]
    boolean_values.include?(k) ? true : false
  end

  def calculate_average(attribute)
    self.reviews.average(attribute.to_sym)
  end

  def val_truth_checked?(attribute, value)
    self.reviews.count == 1 || self.reviews[-2].send(attribute) == value ? true : false
  end

end
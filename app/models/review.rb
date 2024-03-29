class Review < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_many :photos, as: :imageable
  accepts_nested_attributes_for :photos

  validates_numericality_of :rating, greater_than_or_equal_to: 0, less_than_or_equal_to: 4
  validates_numericality_of :plug_sockets, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, allow_blank: true
  validates_numericality_of :comfort, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, allow_blank: true
  validates_numericality_of :quietness, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, allow_blank: true
  validates_numericality_of :upload_speed, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000, allow_blank: true
  validates_numericality_of :download_speed, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000, allow_blank: true
  validates_numericality_of :ping, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000, allow_blank: true
  # validates_uniqueness_of :user_id, :scope => :venue_id
  after_commit :update_venue_values, on: [:create, :update, :destroy], if: :associated_venue_exists?

  private

  def update_venue_values
    venue.reload
    venue.update_values(self)
  end

  def associated_venue_exists?
    Venue.exists?(id: venue.id)
  end
end
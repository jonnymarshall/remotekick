class City < ApplicationRecord
  has_many :venues
  validates_uniqueness_of :name
end

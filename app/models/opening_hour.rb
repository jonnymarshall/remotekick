class OpeningHour < ApplicationRecord
  belongs_to :opening_hour_set
  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday]
end

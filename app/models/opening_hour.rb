class OpeningHour < ApplicationRecord
  belongs_to :venue
  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday]
end

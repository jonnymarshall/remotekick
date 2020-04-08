class AddVenueToOpeningHours < ActiveRecord::Migration[5.2]
  def change
    add_reference :opening_hours, :venue, foreign_key: true
  end
end

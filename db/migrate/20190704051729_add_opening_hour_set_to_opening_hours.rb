class AddOpeningHourSetToOpeningHours < ActiveRecord::Migration[5.2]
  def change
    add_reference :opening_hours, :opening_hour_set, foreign_key: true
  end
end

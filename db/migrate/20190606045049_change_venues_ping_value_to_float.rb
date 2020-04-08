class ChangeVenuesPingValueToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :venues, :ping, :float
  end
end

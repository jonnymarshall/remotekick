class AddHasWifiToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :has_wifi, :boolean
  end
end

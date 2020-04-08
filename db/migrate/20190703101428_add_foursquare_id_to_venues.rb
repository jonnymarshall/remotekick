class AddFoursquareIdToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :foursquare_id, :string
  end
end

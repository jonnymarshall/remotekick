class RemoveAddressAttributesFromVenues < ActiveRecord::Migration[6.0]
  def change
    remove_column :venues, :address
    remove_column :venues, :longitude
    remove_column :venues, :latitude
  end
end

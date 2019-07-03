class AddFoursquareIdToCoffeeShops < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_shops, :foursquare_id, :string
  end
end

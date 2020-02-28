class AddHasWifiToCoffeeShops < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_shops, :has_wifi, :boolean
  end
end

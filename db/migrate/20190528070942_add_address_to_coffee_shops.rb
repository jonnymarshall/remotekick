class AddAddressToCoffeeShops < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_shops, :address, :string
  end
end

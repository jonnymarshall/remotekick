class AddCoordiantesToCoffeeShops < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_shops, :latitude, :float
    add_column :coffee_shops, :longitude, :float
  end
end

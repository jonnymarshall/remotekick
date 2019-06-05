class ChangeCoffeeShopsIntegerValuesToFloats < ActiveRecord::Migration[5.2]
  def change
    change_column :coffee_shops, :busyness, :float
    change_column :coffee_shops, :comfort, :float
    change_column :coffee_shops, :plug_sockets, :float
  end
end

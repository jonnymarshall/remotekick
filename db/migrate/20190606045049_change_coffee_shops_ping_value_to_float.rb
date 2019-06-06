class ChangeCoffeeShopsPingValueToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :coffee_shops, :ping, :float
  end
end

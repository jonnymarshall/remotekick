class AddCoffeeShopIdToOpeningHourSets < ActiveRecord::Migration[5.2]
  def change
    add_reference :opening_hour_sets, :coffee_shop, foreign_key: true
  end
end

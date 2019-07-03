class AddCoffeeShoptoOpeningHours < ActiveRecord::Migration[5.2]
  def change
    add_reference :opening_hours, :coffee_shop, foreign_key: true
  end
end

class RemoveCoffeeShopFromOpeningHours < ActiveRecord::Migration[5.2]
  def change
    remove_column :opening_hours, :coffee_shop_id
  end
end

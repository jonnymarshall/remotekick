class AddCoffeeShopToCoverPhoto < ActiveRecord::Migration[5.2]
  def change
    add_reference :cover_photos, :coffee_shop, foreign_key: true
  end
end

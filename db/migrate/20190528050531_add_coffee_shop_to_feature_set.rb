class AddCoffeeShopToFeatureSet < ActiveRecord::Migration[5.2]
  def change
    add_reference :feature_sets, :coffee_shop, foreign_key: true
  end
end

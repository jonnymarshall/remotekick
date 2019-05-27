class AddCoffeeShopToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :coffee_shop, foreign_key: true
  end
end

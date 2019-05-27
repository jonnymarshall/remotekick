class AddUserToCoffeeShop < ActiveRecord::Migration[5.2]
  def change
    add_reference :coffee_shops, :user, foreign_key: true
  end
end

class ChangeCoffeeShopsRatingToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :coffee_shops, :rating, :float
  end
end

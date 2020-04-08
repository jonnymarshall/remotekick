class RemoveBooleanValuesFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :serves_plant_milk
    remove_column :reviews, :serves_smoothies
  end
end

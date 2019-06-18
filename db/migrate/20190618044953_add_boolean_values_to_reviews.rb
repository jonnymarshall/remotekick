class AddBooleanValuesToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :serves_plant_milk, :boolean
    add_column :reviews, :serves_smoothies, :boolean
    add_column :reviews, :serves_food, :boolean
    add_column :reviews, :air_conditioning, :boolean
  end
end

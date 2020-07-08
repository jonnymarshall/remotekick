class RemoveFeaturesFromVenues < ActiveRecord::Migration[6.0]
  def change
    remove_column :venues, :air_conditioning
    remove_column :venues, :serves_food
  end
end

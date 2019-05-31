class CreateCoffeeShops < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_shops do |t|
      t.string :name
      t.string :description
      t.string  :address
      t.integer :rating
      t.float :upload_speed
      t.float :download_speed
      t.integer :ping
      t.integer :price
      t.boolean :serves_plant_milk
      t.boolean :serves_food
      t.boolean :serves_smoothies
      t.boolean :serves_plant_milk
      t.integer :plug_sockets
      t.integer :busyness
      t.integer :comfort
      t.boolean :air_conditioning
      t.integer :wifi_restrictions

      t.timestamps
    end
  end
end

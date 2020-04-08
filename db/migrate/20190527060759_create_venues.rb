class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :description
      t.string  :address
      t.integer :rating
      t.float :upload_speed
      t.float :download_speed
      t.integer :ping
      t.integer :price
      t.boolean :serves_food
      t.integer :plug_sockets
      t.integer :busyness
      t.integer :comfort
      t.boolean :air_conditioning
      t.integer :wifi_restrictions

      t.timestamps
    end
  end
end

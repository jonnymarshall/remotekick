class CreateFeatureSets < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_sets do |t|
      t.integer :price
      t.boolean :serves_plant_milk
      t.boolean :serves_food
      t.boolean :serves_smoothies
      t.boolean :serves_plant_milk
      t.integer :plug_sockets
      t.integer :busyness
      t.integer :comfort

      t.timestamps
    end
  end
end

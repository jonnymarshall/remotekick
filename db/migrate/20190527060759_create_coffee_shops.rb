class CreateCoffeeShops < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_shops do |t|
      t.string :name
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end

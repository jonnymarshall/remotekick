class CreateFeatureSets < ActiveRecord::Migration[6.0]
  def change
    create_table :feature_sets do |t|
      t.belongs_to :venue
      t.boolean :air_conditioning
      t.boolean :serves_food

      t.timestamps
    end
  end
end

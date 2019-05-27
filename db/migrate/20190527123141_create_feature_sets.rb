class CreateFeatureSets < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_sets do |t|

      t.timestamps
    end
  end
end

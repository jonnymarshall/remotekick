class CreateOpeningHourSets < ActiveRecord::Migration[5.2]
  def change
    create_table :opening_hour_sets do |t|

      t.timestamps
    end
  end
end

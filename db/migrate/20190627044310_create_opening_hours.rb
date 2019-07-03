class CreateOpeningHours < ActiveRecord::Migration[5.2]
  def change
    create_table :opening_hours do |t|

      t.timestamps
      # 1 = Monday, 7 = Friday
      t.integer :day
      # format = "HH:MM:SS"
      t.time :open
      t.time :close
    end
  end
end

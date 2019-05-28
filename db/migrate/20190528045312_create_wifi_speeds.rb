class CreateWifiSpeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :wifi_speeds do |t|
      t.integer :upload_speed
      t.integer :download_speed
      t.integer :ping

      t.timestamps
    end
  end
end

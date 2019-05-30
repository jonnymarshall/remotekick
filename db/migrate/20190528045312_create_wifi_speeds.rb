class CreateWifiSpeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :wifi_speeds do |t|
      t.float :upload_speed
      t.float :download_speed
      t.integer :ping

      t.timestamps
    end
  end
end

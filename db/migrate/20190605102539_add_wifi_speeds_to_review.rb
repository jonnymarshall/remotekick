class AddWifiSpeedsToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :upload_speed, :float
    add_column :reviews, :download_speed, :float
    add_column :reviews, :ping, :float
  end
end

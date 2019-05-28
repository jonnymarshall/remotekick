class AddFeatureSetToWifiSpeed < ActiveRecord::Migration[5.2]
  def change
    add_reference :wifi_speeds, :feature_set, foreign_key: true
  end
end

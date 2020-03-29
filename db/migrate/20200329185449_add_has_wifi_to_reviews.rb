class AddHasWifiToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :has_wifi, :boolean
  end
end

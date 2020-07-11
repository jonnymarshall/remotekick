class RemoveAddressFromVenue < ActiveRecord::Migration[6.0]
  def change
    remove_column :venues, :address
  end
end

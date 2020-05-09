class AddIndexToVenues < ActiveRecord::Migration[6.0]
  def change
    add_index :venues, [:latitude, :longitude]
  end
end

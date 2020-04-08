class AddVenueToCoverPhoto < ActiveRecord::Migration[5.2]
  def change
    add_reference :cover_photos, :venue, foreign_key: true
  end
end

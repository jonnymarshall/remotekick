class CreateCoverPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :cover_photos do |t|

      t.timestamps
    end
  end
end

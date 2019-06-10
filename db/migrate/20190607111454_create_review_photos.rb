class CreateReviewPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :review_photos do |t|
      t.string :photo

      t.timestamps
    end
  end
end

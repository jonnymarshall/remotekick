class AddPhotoToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :photo, :string
  end
end

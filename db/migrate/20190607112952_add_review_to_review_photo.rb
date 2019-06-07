class AddReviewToReviewPhoto < ActiveRecord::Migration[5.2]
  def change
    add_reference :review_photos, :review, foreign_key: true
  end
end

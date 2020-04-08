class AddVenueToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :venue, foreign_key: true
  end
end

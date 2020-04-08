class ChangeVenuesRatingToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :venues, :rating, :float
  end
end

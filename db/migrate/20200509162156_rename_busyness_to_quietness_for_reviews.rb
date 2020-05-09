class RenameBusynessToQuietnessForReviews < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :busyness, :quietness
  end
end

class AddCategoryToVenues < ActiveRecord::Migration[6.0]
  def change
    add_reference :venues, :category, foreign_key: true
  end
end

class AddCategoryToVenues < ActiveRecord::Migration[6.0]
  def change
    add_reference :venues, :owner, foreign_key: { to_table: :users }
  end
end

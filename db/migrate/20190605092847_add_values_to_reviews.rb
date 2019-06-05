class AddValuesToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :busyness, :float
    add_column :reviews, :comfort, :float
    add_column :reviews, :plug_sockets, :float
  end
end

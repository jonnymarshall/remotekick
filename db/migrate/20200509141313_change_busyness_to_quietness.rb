class ChangequietnessToQuietness < ActiveRecord::Migration[6.0]
  def change
    rename_column :venues, :quietness, :quietness
  end
end

class ChangeBusynessToQuietness < ActiveRecord::Migration[6.0]
  def change
    rename_column :venues, :busyness, :quietness
  end
end

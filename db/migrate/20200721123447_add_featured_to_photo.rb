class AddFeaturedToPhoto < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :featured, :boolean, :default => false
  end
end

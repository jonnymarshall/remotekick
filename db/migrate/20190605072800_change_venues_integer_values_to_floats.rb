class ChangeVenuesIntegerValuesToFloats < ActiveRecord::Migration[5.2]
  def change
    change_column :venues, :quietness, :float
    change_column :venues, :comfort, :float
    change_column :venues, :plug_sockets, :float
  end
end

class DropWifiSpeedsTable < ActiveRecord::Migration[5.2]
  def change
    def up
        drop_table :wifi_speeds
      end

      def down
        raise ActiveRecord::IrreversibleMigration
      end
  end
end

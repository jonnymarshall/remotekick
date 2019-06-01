class DropFeatureSetsTable < ActiveRecord::Migration[5.2]
  def change
    def up
        drop_table :feature_sets
      end

      def down
        raise ActiveRecord::IrreversibleMigration
      end
  end
end

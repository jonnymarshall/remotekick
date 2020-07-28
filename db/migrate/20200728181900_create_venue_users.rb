class CreateVenueUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_types do |t|
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
    end
  end
end

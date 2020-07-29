class CreateVenueUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :venue_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.integer :user_type, default: 0
    end
  end
end

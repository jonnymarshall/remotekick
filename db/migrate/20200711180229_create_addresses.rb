class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.belongs_to :venue
      t.string :address
      t.string :city
      t.string :country
      t.string :postcode
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

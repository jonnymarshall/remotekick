class CreateVenuesAndCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_venues, id: false do |t|
      t.belongs_to :venue
      t.belongs_to :category
    end
  end
end
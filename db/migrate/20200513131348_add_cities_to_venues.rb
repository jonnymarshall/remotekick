class AddCitiesToVenues < ActiveRecord::Migration[6.0]
  def change
    add_reference :venues, :city, foreign_key: true
  end
end

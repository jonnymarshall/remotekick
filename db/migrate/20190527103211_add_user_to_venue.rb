class AddUserToVenue < ActiveRecord::Migration[5.2]
  def change
    add_reference :venues, :user, foreign_key: true
  end
end

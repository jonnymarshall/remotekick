class AddAirConditioningToFeatureSet < ActiveRecord::Migration[5.2]
  def change
    add_column :feature_sets, :air_conditioning, :boolean
  end
end

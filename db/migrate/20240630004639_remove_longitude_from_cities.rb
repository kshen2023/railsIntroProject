class RemoveLongitudeFromCities < ActiveRecord::Migration[7.1]
  def change
    remove_column :cities, :longitude, :float
  end
end

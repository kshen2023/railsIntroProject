class AddCityAreaToCities < ActiveRecord::Migration[7.1]
  def change
    add_column :cities, :city_area, :float
  end
end

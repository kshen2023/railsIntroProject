class CreateCityRaces < ActiveRecord::Migration[7.1]
  def change
    create_table :city_races do |t|
      t.references :city, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true

      t.timestamps
    end
  end
end

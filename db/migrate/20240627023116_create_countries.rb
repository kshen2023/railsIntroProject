class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :country_name
      t.string :continent
      t.integer :population

      t.timestamps
    end
  end
end

class AddRacePopulationToRaces < ActiveRecord::Migration[7.1]
  def change
    add_column :races, :race_population, :integer
  end
end

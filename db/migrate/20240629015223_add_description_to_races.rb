class AddDescriptionToRaces < ActiveRecord::Migration[7.1]
  def change
    add_column :races, :description, :text
  end
end

class AddDescriptionToRacesLanguages < ActiveRecord::Migration[7.1]
  def change
    add_column :races, :description, :text
    add_column :languages, :description, :text
  end
end

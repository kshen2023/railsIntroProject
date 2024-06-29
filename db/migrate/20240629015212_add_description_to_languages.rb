class AddDescriptionToLanguages < ActiveRecord::Migration[7.1]
  def change
    add_column :languages, :description, :text
  end
end

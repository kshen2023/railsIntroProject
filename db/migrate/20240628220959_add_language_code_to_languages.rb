class AddLanguageCodeToLanguages < ActiveRecord::Migration[7.1]
  def change
    add_column :languages, :language_code, :string
  end
end

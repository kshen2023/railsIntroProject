class Language < ApplicationRecord
  has_and_belongs_to_many :countries, join_table: 'country_languages'

  validates :language_name, presence: true
  validates :language_code, presence: true
end

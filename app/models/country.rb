class Country < ApplicationRecord
  has_many :cities
  has_and_belongs_to_many :languages, join_table: 'country_languages'
end

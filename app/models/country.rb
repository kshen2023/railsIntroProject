class Country < ApplicationRecord
  has_many :cities
  has_and_belongs_to_many :languages, join_table: 'country_languages'

  validates :country_name, presence: true
  validates :continent, presence: true
  validates :population, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

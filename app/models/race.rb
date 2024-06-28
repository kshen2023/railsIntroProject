class Race < ApplicationRecord
  has_and_belongs_to_many :cities, join_table: 'city_races'

  validates :race_name, presence: true
  validates :race_population, presence: true
end

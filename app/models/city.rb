class City < ApplicationRecord
  belongs_to :country
  has_and_belongs_to_many :races, join_table: 'city_races'

  validates :city_name, presence: true
  validates :country, presence: true
  validates :city_area, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end

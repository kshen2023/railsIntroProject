class City < ApplicationRecord
  belongs_to :country
  has_and_belongs_to_many :races, join_table: 'city_races'

  validates :city_name, presence: true, uniqueness: { scope: :country_id }
  validates :country, presence: true
end

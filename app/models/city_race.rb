class CityRace < ApplicationRecord
  belongs_to :city
  belongs_to :race

  validates :city_id, presence: true
  validates :race_id, presence: true
end

class City < ApplicationRecord
  belongs_to :country
  has_and_belongs_to_many :races, join_table: 'city_races'

  validates :city_name, presence: true
  validates :country, presence: true
  validates :city_area, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["city_area", "city_name", "country_id", "created_at", "id", "id_value", "latitude", "longitude", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["country", "races"]
  end


end

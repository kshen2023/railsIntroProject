class Race < ApplicationRecord
  has_and_belongs_to_many :cities, join_table: 'city_races'

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "race_name", "race_population", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["cities"]
  end
  validates :race_name, presence: true
  validates :race_population, presence: true
  validates :description, presence: true
end

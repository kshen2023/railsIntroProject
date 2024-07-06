class Country < ApplicationRecord
  has_many :cities
  has_and_belongs_to_many :languages, join_table: 'country_languages'

  def self.ransackable_associations(auth_object = nil)
    ["cities", "languages"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["continent", "country_name", "created_at", "id", "id_value", "population", "updated_at"]
  end
  has_one_attached :image

  validates :country_name, presence: true
  validates :continent, presence: true
  validates :population, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

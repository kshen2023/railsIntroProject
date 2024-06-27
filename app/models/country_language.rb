class CountryLanguage < ApplicationRecord
  belongs_to :country
  belongs_to :language

  validates :country_id, presence: true
  validates :language_id, presence: true
end

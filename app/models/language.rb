class Language < ApplicationRecord
  has_and_belongs_to_many :countries, join_table: 'country_languages'
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "language_code", "language_name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["countries"]
  end
  validates :language_name, presence: true
  validates :language_code, presence: true
  validates :description, presence: true
end

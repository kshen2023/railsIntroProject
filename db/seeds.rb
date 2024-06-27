# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
require 'csv'
require 'faker'

# Helper method to load CSV data
def load_csv_data(file_path)
  CSV.read(file_path, headers: true)
end

# Seed Countries from CSV
country_data = load_csv_data(Rails.root.join('db', 'seeds', 'countries.csv'))
country_data.each do |row|
  # Check if country with the same name already exists
  unless Country.exists?(country_name: row['country_name'])
    Country.create!(
      country_name: row['country_name'],
      continent: row['continent'],
      population: row['population']
    )
  end
end

# Seed Cities from CSV
city_data = load_csv_data(Rails.root.join('db', 'seeds', 'cities.csv'))
city_data.each do |row|
  # Check if city with the same name and country already exists
  country = Country.find_by(country_name: row['country_name'])
  unless City.exists?(city_name: row['city_name'], country: country)
    City.create!(
      city_name: row['city_name'],
      country: country
    )
  end
end

# Seed Languages with Faker (ensure unique language names)
languages_created = []
10.times do
  language_name = Faker::Nation.language
  unless Language.exists?(language_name: language_name)
    Language.create!(language_name: language_name)
    languages_created << language_name
  end
end

# Seed Races with Faker (ensure unique race names)
races_created = []
10.times do
  race_name = Faker::Demographic.race
  unless Race.exists?(race_name: race_name)
    Race.create!(race_name: race_name)
    races_created << race_name
  end
end

# Seed CountryLanguages with Faker
Country.all.each do |country|
  Language.all.sample(2).each do |language|
    CountryLanguage.create!(
      country: country,
      language: language
    )
  end
end

# Seed CityRaces with Faker
City.all.each do |city|
  Race.all.sample(2).each do |race|
    CityRace.create!(
      city: city,
      race: race
    )
  end
end

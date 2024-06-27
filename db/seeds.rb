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
  Country.create!(
    country_name: row['country_name'],
    continent: row['continent'],
    population: row['population']
  )
end

# Seed Cities from CSV
city_data = load_csv_data(Rails.root.join('db', 'seeds', 'cities.csv'))
city_data.each do |row|
  country = Country.find_by(country_name: row['country_name'])
  City.create!(
    city_name: row['city_name'],
    country: country
  )
end

# Seed Languages with Faker
10.times do
  Language.create!(language_name: Faker::Nation.language)
end

# Seed Races with Faker
10.times do
  Race.create!(race_name: Faker::Demographic.race)
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

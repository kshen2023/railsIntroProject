# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(email: 'kshen@rrc.ca', password: 'password', password_confirmation: 'password') if Rails.env.development?
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
    city_area: row['city_area'],
    latitude: row['latitude'],
    longitude: row['longitude'],
    country: country
  )
end

# Seed Languages with Faker
10.times do
  language_code = Faker::Nation.language
  language_code = 'en' if language_code.blank?  # 处理语言代码为空的情况，或者使用其他默认值

  Language.create!(
    language_name: Faker::Nation.language,
    language_code: language_code,
    description: Faker::Lorem.sentence # 添加描述字段
  )
end

10.times do
  race_name = Faker::Demographic.race
  race_population = Faker::Number.within(range: 10000..1000000)  # 用于模拟种族人口的随机数值

  Race.create!(
    race_name: race_name,
    race_population: race_population,
    description: Faker::Lorem.sentence # 添加描述字段
  )
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
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

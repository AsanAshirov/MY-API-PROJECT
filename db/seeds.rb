# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Earthquake.destroy_all
User.destroy_all

user1 = User.create!(email: "email@user.com", "password": "password", "password_confirmation": "password")

# Create sample data
1000.times do |index|
  Earthquake.create!(
    date: Faker::Date.backward(days: 365 * 5),
    time: Faker::Time.backward(days: 365 * 5),
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    location: Faker::Address.city,
    depth: rand(1.0..700.0),
    user: user1
  )
end


puts "Created User: #{user1.email}"
puts "Seeded 1000 earthquake records."
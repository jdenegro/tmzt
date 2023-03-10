require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Movie.destroy_all

puts 'Creating 15 fake movies...'

15.times do
  movie = Movie.create(
    title: Faker::Movie.title,
    year: Faker::Date.between(from: 30.years.ago, to: Date.today),
    genre: Faker::Book.genre,
    overview: Faker::Lorem.paragraph,
    rating: rand(1..10)
  )
  movie.save!
end
puts "That's all!!"

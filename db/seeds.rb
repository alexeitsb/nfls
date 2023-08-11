
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Adding a Super User
puts "Creating a Super User..."
User.create(email: "alexeitsb@gmail.com", password: "123456", role: 1)
puts "Super User created!"
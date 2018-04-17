# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category

Category.destroy_all

category_list = [
  { name: "WOW"},
  { name: "SC2"},
  { name: "D3"},
  { name: "Hearth Stone"},
  { name: "HOTS"},
  { name: "OW"}
]

category_list.each do |category|
  Category.create( name: category[:name])
  puts "Category #{category[:name]} created!"
end
puts "Category #{Category.all.size} created!"

# Default

User.create(
  email: "admin@example.com",
  password: "12345678",
  name: "Admin",
  role: "admin"
)
puts "Default Admin created!"
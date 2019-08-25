# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  uid = 8.times.map { SecureRandom.random_number(10) }.join
  provider = "twitter"
  name = Faker::Games::Pokemon.name
  location = Faker::Address.city
  admin = Faker::Boolean.boolean
  email = "#{uid}-twitter@example.com"
  User.create!(email: email,
               uid: uid,
               provider: provider,
               name: name,
               location: location,
               admin: admin,
               password: 'valid_password'
               )
end

20.times do |n|
  title = Faker::Food.ingredient
  content = Faker::Lorem.paragraph
  Blog.create!(title: title,
               content: content,
               user_id: "1"
               )
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Interaction.destroy_all
User.create!(email: 'claudio@claudio.com', password: '123456', bio: 'Aqui la bio de prueba')
20.times do
  User.create!(email: Faker::Internet.email, password: '123456', bio: Faker::BackToTheFuture.quote, picture: Faker::LoremPixel.image)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
City.destroy_all
Tag.destroy_all
JoinTag.destroy_all
Gossip.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all


10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

user = User.create(first_name:Faker::Name.first_name  , last_name: Faker::Name.last_name , description: Faker::Quote.famous_last_words , email: 'admin@admin.fr', age: rand(18..78), city_id: Faker::Number.within(range: City.first.id..City.last.id), password: "password")


10.times do
 user = User.create(first_name:Faker::Name.first_name  , last_name: Faker::Name.last_name , description: Faker::Quote.famous_last_words , email: Faker::Internet.email, age: rand(18..78), city_id: Faker::Number.within(range: City.first.id..City.last.id), password: "password")
  user.errors
end

20.times do
 Gossip.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, user_id: Faker::Number.within(range: User.first.id..User.last.id))
end

100.times do
  Comment.create(content: Faker::Lorem.paragraph,user_id: Faker::Number.within(range: User.first.id..User.last.id),gossip_id: Faker::Number.within(range: Gossip.first.id..Gossip.last.id))
end
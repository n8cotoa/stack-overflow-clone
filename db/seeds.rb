# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all
Response.destroy_all

user_type = ['admin', 'user']

30.times do
  random_permission = user_type.shuffle.first
  first_name = Faker::Internet.unique.username(8)
  User.create!(name: first_name,
               email: Faker::Internet.free_email(first_name),
               password: 'password',
               permission: random_permission)
end

first_user = User.all.first.id
last_user = User.all.last.id

200.times do
  random_user = Random.rand(first_user..last_user)
  Post.create!(title: Faker::Hipster.sentence,
               body: Faker::Hipster.paragraph,
               user_id: random_user)
end

first_post = Post.all.first.id
last_post = Post.all.last.id

1000.times do
  random_user = Random.rand(first_user..last_user)
  random_post = Random.rand(first_post..last_post)
  Response.create!(comment: Faker::VForVendetta.quote,
                   user_id: random_user,
                   post_id: random_post)
end

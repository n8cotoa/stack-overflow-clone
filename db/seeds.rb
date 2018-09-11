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
  post = Post.create!(title: Faker::Hipster.sentence,
                      body: Faker::Hipster.paragraph,
                      user_id: random_user)
  created = Faker::Time.between(4.days.ago, Date.today, :morning)
  post.update(:created_at => created, :updated_at => Faker::Time.between(created, Date.today, :evening))
end

first_post = Post.all.first.id
last_post = Post.all.last.id

1000.times do
  random_user_id = Random.rand(first_user..last_user)
  random_post_id = Random.rand(first_post..last_post)
  random_post = Post.find(random_post_id)
  Response.create!(comment: Faker::VForVendetta.quote,
                   user_id: random_user_id,
                   post_id: random_post_id,
                   created_at: Faker::Time.between(random_post.created_at, Date.today, :evening))
end

first_response_id = Response.all.first.id
last_response_id = Response.all.last.id

10000.times do
  random_user_id = Random.rand(first_user..last_user)
  random_response_id = Random.rand(first_response_id..last_response_id)
  Vote.create!(user_id: random_user_id,
               response_id: random_response_id,
               count: 1)
end

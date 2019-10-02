# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Krista Loven", email: "krista.loven.87@gmail.com")
 
5.times do
  Blog.create(
    title: Faker::Hipster.sentence(word_count: 5),
    content: Faker::Hipster.paragraph(sentence_count: 15),
    likes: 0,
    user_id: 1
  )
end
 
8.times do
  Comment.create(
    commentator: Faker::FunnyName.name,
    content: Faker::Hipster.sentence(word_count: 7),
    blog_id: rand(1..5)
  )
end
 
10.times do
  Tag.create(tag_name: Faker::Hipster.word)
end
 
20.times do
  BlogTag.create(
    blog_id: rand(1..5),
    tag_id: rand(1..10)
  )
end

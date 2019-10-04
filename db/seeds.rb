# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 
User.create(name: "Krista Loven", email: "krista.loven.87@gmail.com", password: "1234", password_confirmation: "1234")

15.times do
  Blog.create(
    title: Faker::Hipster.sentence(word_count: 5),
    subtitle: Faker::Hipster.paragraph(sentence_count: 3),
    content: Faker::Hipster.paragraphs(number: 10),
    likes: 0,
    user_id: 1
  )
end
 
30.times do
  Comment.create(
    commentator: Faker::FunnyName.name,
    content: Faker::Hipster.sentence(word_count: 7),
    blog_id: rand(1..15)
  )
end
 
30.times do
  Tag.create(tag_name: Faker::Hipster.word)
end
 
40.times do
  BlogTag.create(
    blog_id: rand(1..15),
    tag_id: rand(1..30)
  )
end

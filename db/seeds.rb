# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

10.times do
  User.create!(username:Faker::Internet.user_name, email:Faker::Internet.free_email, password:"awesome", bio:FFaker::HipsterIpsum.paragraph )
end

User.all.each do |user|
  user.ideas.create!(title:Faker::Hacker.say_something_smart, description:Faker::Lorem.sentence(3) )
end

Idea.all.each do |idea|
  rand(5).times do
    idea.comments.create!(text:Faker::Hacker.say_something_smart, author:User.all.sample )
  end

  rand(10).times do
    idea.votes.create!(voter: User.all.sample)
  end
end

Comment.all.each do |comment|
  rand(10).times do
    comment.votes.create!(voter:User.all.sample)
  end
end

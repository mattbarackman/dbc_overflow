# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "foobaar")
end

@users = User.all
@users.each do |user|
  5.times do
    user.questions << Question.create(title: Faker::Lorem.words,
                    content: Faker::Lorem.sentence)
  end
end

@questions = Question.all
@questions.each do |qt|
  6.times do 
    user = User.all.sample
    answer = Answer.create(content: Faker::Lorem.sentence)
    answer.question = qt
    answer.user = user
    answer.save
  end
end


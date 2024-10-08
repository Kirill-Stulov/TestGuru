# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Categories
programming = Category.create!(title: 'Programming') # is a class method provided by Active Record, Rails' ORM.
web_dev = Category.create!(title: 'Web Development')

# Create Users
john = User.create!(name: 'John', email: 'john@smth.com')
jane = User.create!(name: 'Jane', email: 'jane@smth.com')

# Create Tests
ruby_test = Test.create!(title: 'Ruby Basics', level: 1, category: programming, author: john)
rails_test = Test.create!(title: 'Rails Fundamentals', level: 1, category: web_dev, author: jane)
ruby_test2 = Test.create!(title: 'Ruby Advanced', level: 2, category: programming, author: john)

# Create questions
q1 = Question.create!(body: 'What is instance method in Ruby?', test: ruby_test)
q2 = Question.create!(body: 'What is MVC in Rails?', test: rails_test)

# Create answers
Answer.create!(body: 'Is a type of variable which starts with an @ symbol', correct: true, question: q1)
Answer.create!(body: 'There is only class variable in Ruby', correct: false, question: q1)
Answer.create!(body: 'Model-View-Controller architecture', correct: true, question: q2)
Answer.create!(body: 'Multiple Virtual Comp', correct: false, question: q2)

# Create UserTests (tests passed by users)
UserTest.create!(status: 'completed', user: john, test: ruby_test)
UserTest.create!(status: 'in_progress', user: jane, test: rails_test)
UserTest.create!(status: 'completed', user: john, test: ruby_test2)

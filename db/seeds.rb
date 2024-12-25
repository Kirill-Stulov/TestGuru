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
programming = Category.find_or_create_by!(title: 'Programming') # is a class method provided by Active Record, Rails' ORM.
web_dev = Category.find_or_create_by!(title: 'Web Development')

# Create Users
john = User.find_or_create_by!(name: 'John', email: 'john@smth.com')
jane = User.find_or_create_by!(name: 'Jane', email: 'jane@smth.com')

# Create Tests
ruby_test = Test.find_or_create_by!(title: 'Ruby Basics', level: 1, category: programming, author: john)
rails_test = Test.find_or_create_by!(title: 'Rails Fundamentals', level: 1, category: web_dev, author: jane)
ruby_test2 = Test.find_or_create_by!(title: 'Ruby Advanced', level: 2, category: programming, author: john)
ruby_test3 = Test.find_or_create_by!(title: 'Ruby Advanced 2', level: 2, category: programming, author: john)


# Create questions
q1 = Question.find_or_create_by!(body: 'What is instance method in Ruby?', test: ruby_test)
q2 = Question.find_or_create_by!(body: 'What is MVC in Rails?', test: rails_test)

# Create answers
Answer.find_or_create_by!(body: 'Is a type of variable which starts with an @ symbol', correct: true, question: q1)
Answer.find_or_create_by!(body: 'There is only class variable in Ruby', correct: false, question: q1)
Answer.find_or_create_by!(body: 'Model-View-Controller architecture', correct: true, question: q2)
Answer.find_or_create_by!(body: 'Multiple Virtual Comp', correct: false, question: q2)

# Create UserTests (tests passed by users)
UserTest.find_or_create_by!(status: 'completed', user: john, test: ruby_test)
UserTest.find_or_create_by!(status: 'in_progress', user: jane, test: rails_test)
UserTest.find_or_create_by!(status: 'completed', user: john, test: ruby_test2)
UserTest.find_or_create_by!(status: 'in_progress', user: john, test: rails_test)

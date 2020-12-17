# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories_title = ['Backend', 'Frontend', 'Mobile Development', 'Machine Learning']
categories = categories_title.map { |category| Category.create!([{ title: category }]) }.flatten

admin = User.create!([{ first_name: 'Admin', last_name: 'Admin', email: 'admin@test.com', password: '123456' }])

tests = Test.create!([
                       { title: 'Ruby on Rails', level: 1, category_id: categories[0].id, author: admin[0] },
                       { title: 'Html', level: 0, category_id: categories[1].id, author: admin[0] },
                       { title: 'Python', level: 2, category_id: categories[3].id, author: admin[0] },
                       { title: 'C++', level: 3, category_id: categories[0].id, author: admin[0] }
                     ])

questions = Question.create!([
                               { body: 'Question 1 ?', test_id: tests[0].id },
                               { body: 'Question 2 ?', test_id: tests[1].id },
                               { body: 'Question 5 ?', test_id: tests[2].id },
                               { body: 'Question 3 ?', test_id: tests[3].id },
                               { body: 'Question 4 ?', test_id: tests[0].id }
                             ])

Answer.create!([
                 { body: 'Answer 1', correct: true, question_id: questions[0].id },
                 { body: 'Answer 2', correct: true, question_id: questions[1].id },
                 { body: 'Answer 3', correct: false, question_id: questions[4].id },
                 { body: 'Answer 4', correct: true, question_id: questions[3].id },
                 { body: 'Answer 5', correct: false, question_id: questions[2].id },
                 { body: 'Answer 6', correct: true, question_id: questions[0].id },
                 { body: 'Answer 7', correct: false, question_id: questions[1].id }
               ])

User.create!([{ email: 'admin@admin.com',
                password: '123456',
                password_confirmation: '123456',
                type: 'Admin',
                first_name: 'Admin',
                last_name: 'Admin' }])

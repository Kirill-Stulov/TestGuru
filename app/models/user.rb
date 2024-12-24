class User < ApplicationRecord
  # инстанс-метод в модели User, который принимает в качестве аргумента значение уровня
  #  сложности и возвращает список всех Тестов, которые проходит или когда-либо проходил пользователь на этом уровне сложности
  # def user_test(level)
  #   result = ActiveRecord::Base.connection.exec_query(
  #     "SELECT tests.title, categories.title as category, tests.level, user_tests.status
  #      FROM user_tests
  #      JOIN tests ON user_tests.test_id = tests.id
  #      JOIN categories ON tests.category_id = categories.id
  #      WHERE user_tests.user_id = ? AND tests.level = ?",
  #     'SQL',
  #     [self.id, level]
  #   )
  #   result.map { |r| "Title: #{r['title']}, Category: #{r['category']}, Level: #{r['level']}, Status: #{r['status']}" }
  # end
  # When a user takes a test, a new record is created in the user_tests table
  #  that stores both the test_id and user_id. This test_id in user_tests matches
  #  the id of the actual test in the tests table.
  # Full description: onenote:///C:\Users\xxx\Курсы.one#Как%20работает%20метод%20user_test(level)%20из%20user.rb

  # переделал этот метод через ActiveRecord
  def user_test(level)
    Test.joins(:category, :user_tests)
      .where(user_tests: { user_id: id }, level: level)
      .select('tests.title, categories.title as category, tests.level, user_tests.status')
  end
end

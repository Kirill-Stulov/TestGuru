class User < ApplicationRecord
  # инстанс-метод в модели User, который принимает в качестве аргумента значение уровня
  #  сложности и возвращает список всех Тестов, которые проходит или когда-либо проходил пользователь на этом уровне сложности
  # When a user takes a test, a new record is created in the user_tests table
  #  that stores both the test_id and user_id. This test_id in user_tests matches
  #  the id of the actual test in the tests table.
  # Full description: onenote:///C:\Users\xxx\Курсы.one#Как%20работает%20метод%20user_test(level)%20из%20user.rb

  # переделал этот метод через ActiveRecord
  def user_test(level)
    Test
      .joins(:user_tests)
      .where(user_tests: { user_id: id }, level: level)
  end
end

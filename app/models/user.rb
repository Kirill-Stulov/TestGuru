class User < ApplicationRecord
  # инстанс-метод в модели User, который принимает в качестве аргумента значение уровня
  #  сложности и возвращает список всех Тестов, которые проходит или когда-либо проходил пользователь на этом уровне сложности
  def user_test(level)
    result = ActiveRecord::Base.connection.exec_query(
      "SELECT tests.title, categories.title as category, tests.level, user_tests.status
       FROM user_tests
       JOIN tests ON user_tests.test_id = tests.id
       JOIN categories ON tests.category_id = categories.id
       WHERE user_tests.user_id = ? AND tests.level = ?",
      'SQL',
      [self.id, level]
    )
    result.map { |r| "Title: #{r['title']}, Category: #{r['category']}, Level: #{r['level']}, Status: #{r['status']}" }
  end
  # When a user takes a test, a new record is created in the user_tests table
  #  that stores both the test_id and user_id. This test_id in user_tests matches
  #  the id of the actual test in the tests table.
end
# 1. Method Definition: def user_test(level) - Defines an instance method that will be available
  #  on any User object, taking a difficulty level as parameter
# 2. Query Execution and Assignment: result = ActiveRecord::Base.connection.exec_query(
  # ActiveRecord::Base.connection - Gets direct access to the database connection
  # exec_query - A low-level method that executes raw SQL directly against the database
  # Used when we need precise control over the SQL query or want to optimize performance
  # Preferred over other ActiveRecord methods when we need complex joins or specific data formatting
  # Returns a result object containing the raw data from database
# 3. SELECT Statement: "SELECT tests.title, categories.title as category, tests.level, user_tests.status"
  # Precisely specifies which columns we want from each table
  # tests.title: retrieves the name of each test from tests table
  # categories.title as category: gets category name and gives it an alias for clearer reference. Without it, we'd have two columns named 'title' which would be confusing.
    # When we write "categories.title as category" in the SELECT statement, we're telling SQL to take the 'title' column from the 'categories' table and give it the name 'category' in our result set. That's why in our result mapping we can use r['category'] to access this value. Meanwhile, tests.title remains as 'title' in our results, which we access with r['title']. This makes our code cleaner and more intuitive to work with.
  # tests.level: extracts the difficulty level of each test
  # user_tests.status: pulls the completion status of each test attempt
# 4. FROM Statement: "FROM user_tests"
  # Establishes user_tests as the primary table
  # This table contains the core data about test attempts
  # Acts as the junction table connecting users with their test attempts
# 5. First JOIN: "JOIN tests ON user_tests.test_id = tests.id"
  # Creates a connection between test attempts and actual test details
  # Matches each test_id in user_tests with its corresponding full test record in tests table
  # Enables access to all test information for each attempt
# 6. Second JOIN: "JOIN categories ON tests.category_id = categories.id"
  # Links each test with its category information
  # Establishes relationship between tests and their respective categories
  # Allows retrieval of category details for each test
# 7. WHERE Clause: "WHERE user_tests.user_id = ? AND tests.level = ?"
  # Filters results based on two specific conditions
  # Question marks act as secure placeholders to prevent SQL injection
  # Ensures we only get tests for the specific user at the specified level
# 8. Query Parameters: 'SQL', [self.id, level]
  # 'SQL' serves as an identifier for the query type
  # self.id provides the current user's ID to replace first placeholder
  # level parameter fills the second placeholder for difficulty filtering
# 9. Result Formatting: result.map { |r| "Title: #{r['title']}, Category: #{r['category']}, Level: #{r['level']}, Status: #{r['status']}" }
  # Transforms raw database results into readable strings
  # Creates formatted output for each test record
  # Combines all relevant information into a single string per test
  # Returns an array of these formatted strings


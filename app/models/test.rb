class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  # метод класса в модели Test, который возвращает отсортированный по убыванию массив названий всех Тестов,
	# у которых Категория называется определённым образом (название категории передается в метод в качестве аргумента). 
	
  # Иными словами: В этом методе категория передается в качестве параметра и он возвращает результат 
  # в виде массива названий всех тестов в данной категории, отсортированного по убыванию
  # Full description: onenote:///C:\Users\xxx\Desktop\xxx\One\Курсы.one#Как%20работает%20метод%20self.category_titles(category)%20из%20test.rb
  def self.category_titles(category)
    result = ActiveRecord::Base.connection.exec_query(
      "SELECT tests.title
       FROM tests
       JOIN categories ON tests.category_id = categories.id
       WHERE categories.title = ?",
      'SQL',
      [category]
    )
    result.map { |r| r['title'] }.sort_by(&:length).reverse # сортировка результата по убыванию
    # result.map { |r| "Title: #{r['title']}" }.sort_by(&:length).reverse # вариант с текстовым описанием
  end
end

class Test < ApplicationRecord
  # метод класса в модели Test, который возвращает отсортированный по убыванию массив названий всех Тестов,
	# у которых Категория называется определённым образом (название категории передается в метод в качестве аргумента). 
	
  # Иными словами: В этом методе категория передается в качестве параметра и он возвращает результат 
  # в виде массива названий всех тестов в данной категории, отсортированного по убыванию
  # Full description: onenote:///C:\Users\xxx\Desktop\xxx\One\Курсы.one#Как%20работает%20метод%20self.category_titles(category)%20из%20test.rb
  # переделал этот метод через ActiveRecord
  def self.sorted_by_category(category_name)
    Test.from('tests, categories')
      .where(categories: { title: category_name })
      .where('tests.category_id = categories.id')
      .order(title: :desc)
      .pluck(:title)
  end
end

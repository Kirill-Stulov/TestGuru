class AddForeignKeyToTestsCategories < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :tests, :categories
  end
end

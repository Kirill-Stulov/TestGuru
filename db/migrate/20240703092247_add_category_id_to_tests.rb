class AddCategoryIdToTests < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :category_id, :integer
  end
end

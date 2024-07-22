class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 1
      t.integer :category_id
      t.integer :test_author_id # adding column with test author id

      t.timestamps
    end
  end
end

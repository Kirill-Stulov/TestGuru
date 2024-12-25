class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :title, limit: 60, null: false

      t.timestamps
    end
  end
end

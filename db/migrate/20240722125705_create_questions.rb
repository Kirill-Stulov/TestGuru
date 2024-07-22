class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title, limit: 100, null: false
      t.text :body, limit: 600, null: false
      t.integer :test_id

      t.timestamps
    end
  end
end

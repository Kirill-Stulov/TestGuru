class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :body, limit: 600, null: false
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end

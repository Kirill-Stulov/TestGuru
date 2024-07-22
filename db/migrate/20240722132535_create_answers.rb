class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.text :body, limit: 1000, null: false
      t.boolean :correct, default: false
      t.integer :question_id

      t.timestamps
    end
  end
end

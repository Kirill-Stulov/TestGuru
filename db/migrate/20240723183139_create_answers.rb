class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.text :body, limit: 1000, null: false
      t.boolean :correct, null: false, default: false
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end

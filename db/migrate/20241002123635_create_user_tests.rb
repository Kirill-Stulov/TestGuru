class CreateUserTests < ActiveRecord::Migration[7.1]
  def change
    create_table :user_tests do |t|
      t.string :status, limit: 15, null: false
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :test, null: false, foreign_key: { to_table: :tests }

      t.timestamps
    end
  end
end

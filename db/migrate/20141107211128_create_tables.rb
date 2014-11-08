class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.datetime :started_at
      t.datetime :finished_at
      t.timestamps
    end
    create_table :questions do |t|
      t.string :question
    end
    create_table :answers do |t|
      t.string :url
      t.references :question
      t.boolean :correct
    end
    create_table :question_users do |t|
      t.references :user
      t.references :question
      t.references :answer
    end

    add_index :questions, :question, unique: true
    add_index :answers, :question_id
    add_index :question_users, :question_id
    add_index :question_users, [:user_id, :question_id], unique: true
  end
end

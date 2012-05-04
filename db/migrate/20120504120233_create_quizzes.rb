class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :score
      t.string :genre
      t.integer :user_id

      t.timestamps
    end
  end
end

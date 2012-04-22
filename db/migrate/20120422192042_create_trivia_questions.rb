class CreateTriviaQuestions < ActiveRecord::Migration
  def change
    create_table :trivia_questions do |t|
      t.string :defenition
      t.string :level
      t.string :answer
      t.integer :artist_id

      t.timestamps
    end
  end
end

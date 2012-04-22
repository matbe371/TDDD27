class CreateSongQuestions < ActiveRecord::Migration
  def change
    create_table :song_questions do |t|
      t.string :defenition
      t.string :level
      t.string :answer
      t.integer :song_id

      t.timestamps
    end
  end
end

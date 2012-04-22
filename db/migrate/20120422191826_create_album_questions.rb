class CreateAlbumQuestions < ActiveRecord::Migration
  def change
    create_table :album_questions do |t|
      t.string :defenition
      t.string :level
      t.string :answer
      t.integer :album_id

      t.timestamps
    end
  end
end

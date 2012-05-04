class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_number
      t.string :answer
      t.integer :quiz_id

      t.timestamps
    end
  end
end

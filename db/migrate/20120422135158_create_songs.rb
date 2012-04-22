class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :youtube_url
      t.integer :artist_id

      t.timestamps
    end
  end
end

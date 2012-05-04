class CreatePlaylistItems < ActiveRecord::Migration
  def change
    create_table :playlist_items do |t|
      t.integer :position
      t.string :item_artist
      t.string :item_song
      t.integer :playlist_id

      t.timestamps
    end
  end
end

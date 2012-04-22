class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :youtube_url
      t.integer :artist_id

      t.timestamps
    end
  end
end

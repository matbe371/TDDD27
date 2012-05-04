# == Schema Information
#
# Table name: playlist_items
#
#  id               :integer         not null, primär nyckel
#  playlist_id      :integer         not null, relationsnyckel
#  item_artist      :string(255)
#  item_song        :string(255)
#  position         :integer
#  created_at :datetime
#  updated_at :datetime
#

class PlaylistItem < ActiveRecord::Base
  
  #Relationer
  belongs_to :playlist
  
  #Klassvariabler
  attr_accessible :item_artist, :item_song, :position, :playlist_id
end

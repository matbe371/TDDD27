# == Schema Information
#
# Table name: playlists
#
#  id               :integer         not null, primär nyckel
#  quiz_id          :integer         not null, relationsnyckel
#

class Playlist < ActiveRecord::Base
  
  #Relationer
  belongs_to :quiz
  has_many :playlist_items
  
  #Klassvariabler
  attr_accessible :quiz_id
end

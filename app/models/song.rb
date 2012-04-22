#
# Table name: artists
#
#  id               :integer         not null, primär nyckel
#  artist_id        :integer         not null, relationsnyckel
#  title            :string(255)
#  youtube_url      :string(255)
#  created_at :datetime
#  updated_at :datetime
#


class Song < ActiveRecord::Base
  
  #Förhållanden
  belongs_to :artist
  
  #Klassvariabler
  attr_accessible :artist_id, :title, :youtube_url
  
  #Valideringar
  validates :title, :presence => true,
                   :length   => { :maximum => 50 } 
                   
  validates :youtube_url, :presence => true,
                   :length   => { :maximum => 70 } 
                   
  validates :artist_id, :presence => true
end

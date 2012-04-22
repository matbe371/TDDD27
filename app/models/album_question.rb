# == Schema Information
#
# Table name: artists
#
#  id               :integer         not null, primär nyckel
#  album_id         :integer         not null, relationsnyckel
#  defenition       :string(255)
#  answer           :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class AlbumQuestion < ActiveRecord::Base
  
  #Förhållanden
  belongs_to :album
  
  #Klassvariabler
  attr_accessible :album_id, :answer, :defenition, :level
  
  #Valideringar
  validates :album_id, :presence => true
  
  validates :answer, :presence => true,
                          :length   => { :maximum => 50 }
                          
  validates :defenition, :presence => true,
                          :length   => { :maximum => 400 } 
  
end

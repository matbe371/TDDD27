# == Schema Information
#
# Table name: song_questions
#
#  id               :integer         not null, primär nyckel
#  song_id         :integer         not null, relationsnyckel
#  defenition       :string(255)
#  answer           :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class SongQuestion < ActiveRecord::Base
  
  #Förhållanden
  belongs_to :song
  
  #Klassvariabler
  attr_accessible :answer, :defenition, :level, :song_id
  
  #Valideringar
  validates :song_id, :presence => true
  
  validates :answer, :presence => true,
                          :length   => { :maximum => 50 }
                          
  validates :defenition, :presence => true,
                          :length   => { :maximum => 400 } 
 
  validates :level, :presence => true,
                    :inclusion => { :in => ["easy", "medium", "hard"]}  
  
end

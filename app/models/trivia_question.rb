#
# Table name: trivia_questions
#
#  id               :integer         not null, primär nyckel
#  artist_id        :integer         not null, relationsnyckel
#  defenition       :string(255)
#  answer           :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TriviaQuestion < ActiveRecord::Base
  
  #Förhållanden
  belongs_to :artist
  
  #Klassvariabler
  attr_accessible :answer, :artist_id, :defenition, :level
  
  #Valideringar
  validates :artist_id, :presence => true
  
  validates :answer, :presence => true,
                          :length   => { :maximum => 50 }
                          
  validates :defenition, :presence => true,
                          :length   => { :maximum => 400 }  

  validates :level, :presence => true,
                    :inclusion => { :in => ["easy", "medium", "hard"]} 
end

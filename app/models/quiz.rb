# == Schema Information
#
# Table name: quizzes
#
#  id               :integer         not null, primär nyckel
#  user_id          :integer         not null, relationsnyckel
#  genre            :string(255)
#  score  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Quiz < ActiveRecord::Base
  
  #Relationer
  belongs_to :user
  has_many: :answers, :playlists
  
  #Klassvariabler
  attr_accessible :genre, :score, :user_id
end

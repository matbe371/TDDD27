# == Schema Information
#
# Table name: answers
#
#  id               :integer         not null, primär nyckel
#  quiz_id          :integer         not null, relationsnyckel
#  answer           :string(255)
#  question_number  :integer
#  created_at :datetime
#  updated_at :datetime
#


class Answer < ActiveRecord::Base
  
  #Relationer
  belongs_to :quiz
  
  #Klassvariabler
  attr_accessible :answer, :question_number, :quiz_id
  
end

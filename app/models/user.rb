# == Schema Information
#
# Table name: users
#
#  id               :integer         not null, primär nyckel
#  username         :string(255)
#  password         :string(255)
#  mail             :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  
  #Relationer
  has_many :quizzes
  
  #Klassvariabler
  attr_accessible :mail, :password, :username
  
  #Valideringar
  validates :username, :presence => true,
                   :length   => { :maximum => 50 }
  
  #TODO kryptera lösenord.                 
  validates :password, :presence => true,
                 :length   => { :maximum => 50 }  
  
  #Email valideras enligt regex-standrad
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
                
  validates :mail, :presence => true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } #varje e-mailadress i databasen skall vara unik. Gör ej skilnad på gemener och versaler.
end

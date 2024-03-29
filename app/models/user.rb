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
  attr_accessible :mail, :password, :username, :password_confirmation
  
  #Gör så att användarens lösenord ej kommer synas i databasen, utan bara det krypterade. 
  #Metoden authenticate kan användas för att verifiera användare vid inloggning.
  has_secure_password
  
  #Metoder som skall köra innan en ny amvändare sparas i databasen.
  before_save { |user| user.mail = mail.downcase } #Gör så att mailaddressen består bara av versaler.
  before_save :create_remember_token #Anropar medlemsfunktionen nedan. 
  
  #Valideringar
  validates :username, :presence => true,
                   :length   => { :minimum => 4 }
  
  #TODO kryptera lösenord.                 
  validates :password, :presence => true,
                 :length   => { :minimum => 6 }  
  
  #Email valideras enligt regex-standrad
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
                
  validates :mail, :presence => true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } #varje e-mailadress i databasen skall vara unik. Gör ej skilnad på gemener och versaler.
  
  validates :password_confirmation, presence: true
                    
  private

    #Metod för att skapa ett tecken som används vid sessionshanteringen av användaren.
    def create_remember_token
      
      #Skapar ett tecken för den aktuella användaren mha UTF8-generering.
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

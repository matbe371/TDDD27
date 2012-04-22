# == Schema Information
#
# Table name: artists
#
#  id         :integer         not null, pimär nyckel
#  name       :string(255)
#  genre      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Artist < ActiveRecord::Base
  
  #Förhållanden
  has_many :albums
  has_many :songs
  
  #Klassvariabler
  attr_accessible :genre, :name 
  
  #Ser till så att artisten har ett namn. Dessuom ej längre än 50 tecken.
  validates :name, :presence => true,
                   :length   => { :maximum => 50 } 
                   
  #Ser till så att genren finns och tillhör någon av de givna.
  validates :genre, :presence => true,
                    :inclusion => { :in => ["Rock", "Pop", "Metal", "Folk", "Country", "Reggae", "Hip-Hop", "Electronic",  "Indie", "Funk", "Jazz", "Blues", "RnB"]}
                   
end

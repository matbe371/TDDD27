class StaticPagesController < ApplicationController
  def home
    @title = "Home"
  end
  def instructions
    @title = "How to play"
  end
  
  def new
    @title = "Site content"
    @no_of_artists = Artist.count
    @artist = Artist.all
    @artist.sort! { |a,b| a.name.downcase <=> b.name.downcase }
    @no_of_songs = Song.count
    @songs = Song.all
    @songs.sort! { |a,b| a.title.downcase <=> b.title.downcase }
    @no_of_albums = Album.count
    @albums = Album.all
    @albums.sort! { |a,b| a.title.downcase <=> b.title.downcase }
  end
  
  def confirmed
    @title = "Confimred"
  end
  
  def fail 
    @title = "Failed"
  end
end

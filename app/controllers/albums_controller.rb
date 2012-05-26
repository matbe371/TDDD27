class AlbumsController < ApplicationController
  def step1
    @title = "New album - step 1"
    @no_of_artists = Artist.count
    @artists = Artist.all
    @artists.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end
  
  def new
    @title = "New album - step 2"
    @album = Album.new
    @artist_id = params[:artist_id]
  end

  def create
    @album = Album.new(params[:album])
    
    #Om allt är korrekt sparas användaren och omlokaliseras till sin nyskapade sida. Annars hamnar han på felmeddelande-sidan.
    if @album.save
      #Omdiregerar användaren.
      redirect_to confimrmed_path
    else
      redirect_to fail_path
    end
  end
end

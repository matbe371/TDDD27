class SongsController < ApplicationController
  def step1
    @title = "New song - step 1"
    @no_of_artists = Artist.count
    @artists = Artist.all
    @artists.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end
  
  def new
    @title = "New song - step 2"
    @song = Song.new
    @artist_id = params[:artist_id]
  end

  def create
     #Artist-objektet fås via parametrarna som skickas med via POST från formuläret.
    @song = Song.new(params[:song])
    
    #Om allt är korrekt sparas användaren och omlokaliseras till sin nyskapade sida. Annars hamnar han på felmeddelande-sidan.
    if @song.save
      #Omdiregerar användaren.
      redirect_to confimrmed_path
    else
      redirect_to fail_path
    end
  end
end

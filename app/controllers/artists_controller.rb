class ArtistsController < ApplicationController
  def create
    #Artist-objektet fås via parametrarna som skickas med via POST från formuläret.
    @artist = Artist.new(params[:artist])
    
    #Om allt är korrekt sparas användaren och omlokaliseras till sin nyskapade sida. Annars hamnar han på felmeddelande-sidan.
    if @artist.save
      #Omdiregerar användaren.
      redirect_to confimrmed_path
    else
      redirect_to fail_path
    end
  end

  def new
    @title = "Add artist"
    @artist = Artist.new
  end
end

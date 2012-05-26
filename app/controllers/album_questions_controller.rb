class AlbumQuestionsController < ApplicationController
  def step1
    @title = "Add album question step 1"
    @no_of_albums = Album.count
    @albums = Album.all
    @albums.sort! { |a,b| a.title.downcase <=> b.title.downcase }
  end
  
  def new
    @title = "Add album question step 2"
    @album_question = AlbumQuestion.new
    @album_id = params[:album_id]
  end

  def create
    #Fråge-objektet fås via parametrarna som skickas med via POST från signin-formuläret.
    @album_question = AlbumQuestion.new(params[:album_question])
    
    #Om allt är korrekt sparas frågan och användaren omlokaliseras. Anars hamnar han återigen på frågesidan.
    if @album_question.save
      redirect_to confimrmed_path
    else
      redirect_to fail_path
    end
  end
end

class SongQuestionsController < ApplicationController
  def step1
    @title = "Add song question step 1"
    @no_of_songs = Song.count
    @songs = Song.all
    @songs.sort! { |a,b| a.title.downcase <=> b.title.downcase }
  end
  
  def new
    @title = "Add song question step 2"
    @song_question = SongQuestion.new
    @song_id = params[:song_id]
  end

  def create
    #Fråge-objektet fås via parametrarna som skickas med via POST från signin-formuläret.
    @song_question = SongQuestion.new(params[:song_question])
    
    #Om allt är korrekt sparas frågan och användaren omlokaliseras. Anars hamnar han återigen på frågesidan.
    if @song_question.save
      redirect_to confimrmed_path
    else
      redirect_to fail_path
    end
  end
end

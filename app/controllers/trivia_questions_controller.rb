class TriviaQuestionsController < ApplicationController
  def step1
    @title = "New trivia - step 1"
    @no_of_artists = Artist.count
    @artists = Artist.all
    @artists.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end
  
  def new
    @title = "Add question"
    @artist_id = params[:artist_id]
    
    @trivia_question = TriviaQuestion.new
  end

  def create
    #Fråge-objektet fås via parametrarna som skickas med via POST från signin-formuläret.
    @question = TriviaQuestion.new(params[:trivia_question])
    
    #Om allt är korrekt sparas frågan och användaren omlokaliseras. Anars hamnar han återigen på frågesidan.
    if @question.save
      redirect_to confimrmed_path
    else
      redirect_to fail_path
    end
  end
end

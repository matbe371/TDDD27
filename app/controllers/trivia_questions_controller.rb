class TriviaQuestionsController < ApplicationController
  def show
    @title = "Song Question"
    db_question = TriviaQuestion.find(params[:id])
    @question = db_question.defenition
    @artist = db_question.artist.name
    @youtube_src = "http://www.youtube.com/v/#{db_question.artist.songs.first.youtube_url}&showinfo=0"
  end
end

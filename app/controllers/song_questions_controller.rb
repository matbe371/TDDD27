class SongQuestionsController < ApplicationController
  def show
    @title = "Song Question"
    db_question = SongQuestion.find(params[:id])
    @question = db_question.defenition
    @artist = db_question.song.artist.name
    @youtube_src = "http://www.youtube.com/v/#{db_question.song.youtube_url}&showinfo=0"
  end
end

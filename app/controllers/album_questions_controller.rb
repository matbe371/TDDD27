class AlbumQuestionsController < ApplicationController
  def show
    @title = "Song Question"
    db_question = AlbumQuestion.find(params[:id])
    @question = db_question.defenition
    @artist = db_question.album.artist.name
    @youtube_src = "http://www.youtube.com/v/#{db_question.album.youtube_url}&showinfo=0"
  end
end

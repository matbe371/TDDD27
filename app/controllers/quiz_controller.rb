class QuizController < ApplicationController
  def play
    @title = "Play Quiz"
  end

  def result
    @title = "Quiz results"
  end
end

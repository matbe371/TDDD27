class StaticPagesController < ApplicationController
  def home
    @title = "Home"
  end
  def instructions
    @title = "How to play"
  end
end

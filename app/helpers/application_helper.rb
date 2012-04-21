module ApplicationHelper
  
  # Retunerar en titel på sidan.
  def title
    base_title = "Tune Sience"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}" #@title 
    end
  end
end

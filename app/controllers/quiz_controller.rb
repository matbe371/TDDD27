class QuizController < ApplicationController
  def play
    @title = "Play Quiz"
    
    number_of_artists = Artist.count #Antalet artister i databasen.
    first_artist_id = Artist.first.id 

    @artists = Array.new
           
    #Fyller arrayen med sex st slumpmässiga, unika tal.
    for i in 0..5  
      random = rand((number_of_artists+1)-first_artist_id) + first_artist_id #Skapar ett slumpat tal baretar på antalen artister i databasen
      
      if @artists.include? random
        
        while @artists.include? random
          random = rand(number_of_artists-first_artist_id) + first_artist_id
        end
          @artists.push(random)
      else
        @artists.push(random)
      end
    end
    
    @easy_questions = Array.new
    @medium_questions = Array.new
    @hard_questions = Array.new
    
    
    
    #Skapar de sex artister som kommer synas på sidan.
    @artist1 = Artist.find(@artists[0])
    @artist2 = Artist.find(@artists[1])
    @artist3 = Artist.find(@artists[2])
    @artist4 = Artist.find(@artists[3])
    @artist5 = Artist.find(@artists[4])
    @artist6 = Artist.find(@artists[5])
    
    
  end

  def result
    @title = "Quiz results"
  end
end

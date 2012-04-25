class QuizController < ApplicationController
  def play
    
    #Titel på sidan
    @title = "Pick question" 
    
    #Array som håller koll på vilka artister som är med i frågeomgången.
    featured_artists = Array.new
    
    #Arrayer för frågor som är med i frågeomgången. Två av varje nivå. Instansvariabler som kommer finnas tillgängliga i vyn.
    @easy_questions = Array.new
    @medium_questions = Array.new
    @hard_questions = Array.new
    
    #Arrayer som håller koll på informationen om frågorna på olika nivåer.
    @easy_info = Array.new
    @medium_info = Array.new
    @hard_info = Array.new
    
    #Arrayer som innehåller information om ULR till YouTube, som används för att generera thumbnails.
    @url_array_easy = Array.new
    @url_array_medium = Array.new
    @url_array_hard = Array.new
    
    
    #***STEG 1 - Slumpar två triviafrågor***
   
    number_of_trivia_questions = TriviaQuestion.count #Antalet triviafrågor i databasen.
    first_trivia_question_id = TriviaQuestion.first.id #ID på fråga nummer ett. 
    
    #Loopar två varv för att ta fram två triviafrågor.
    for i in 0..1
      
      #Slumpar ett random-nummer baserat på antalet frågor i databasen och hämtar frågan med detta id.
      random = rand((number_of_trivia_questions+1)-first_trivia_question_id) + first_trivia_question_id
      question = TriviaQuestion.find(random)
     
      #Om artisten har förekommit i en tidigare fråga eller frågan redan har förekommit i samma omgång slumpas en ny fram.
      while featured_artists.include? question.artist.id 
        random = rand((number_of_trivia_questions+1)-first_trivia_question_id) + first_trivia_question_id
        question = TriviaQuestion.find(random)
      end
      
      #Stoppar in värden i minnesarrayerna.
      featured_artists.push(question.artist.id) 
      
      thumbnail_src = "http://img.youtube.com/vi/#{question.artist.songs.find(question.artist.id).youtube_url}/2.jpg"
      
      #Stoppar in frågan i rätt array, baserat på svårighetsgraden.
      if question.level == "easy"
        @easy_questions.push(question)
        @easy_info.push(question.artist.name)
        @easy_info.push("Trivia")
        @url_array_easy.push(thumbnail_src)
      elsif question.level == "medium"
        @medium_questions.push(question)
        @medium_info.push(question.artist.name)
        @medium_info.push("Trivia")
        @url_array_medium.push(thumbnail_src)
      elsif question.level == "hard"
        @hard_questions.push(question)
        @hard_info.push(question.artist.name)
        @hard_info.push("Trivia")
        @url_array_hard.push(thumbnail_src)
      end
      
    end
    
    #***STEG 2 - Slumpar två sångfrågor***
    #Algoritmen är liknande, men nu tillkommer även en koll om arrayen för frågenivån är full.
    
    number_of_song_questions = SongQuestion.count #Antalet sångfrågor i databasen.
    first_song_question_id = SongQuestion.first.id #ID på fråga nummer ett. 
    
    for i in 0..1
      
      random = rand((number_of_song_questions+1)-first_song_question_id) + first_song_question_id
      question = SongQuestion.find(random)
      
      
      #Här tillkommer ett villkor som kollar om frågearrayerna redan är fullsatta.
      while (featured_artists.include? question.song.artist.id) || (question.level == "easy" && @easy_questions.size == 2) || (question.level == "medium" && @medium_questions.size == 2) || (question.level == "hard" && @hard_questions.size == 2) 
        random = rand((number_of_song_questions+1)-first_song_question_id) + first_song_question_id
        question = SongQuestion.find(random)
      end
      
      featured_artists.push(question.song.artist.id) 
      
      thumbnail_src = "http://img.youtube.com/vi/#{question.song.youtube_url}/2.jpg"

      if question.level == "easy"
        @easy_questions.push(question)
        @easy_info.push(question.song.artist.name)
        @easy_info.push("Song")
        @url_array_easy.push(thumbnail_src)
      elsif question.level == "medium"
        @medium_questions.push(question)
        @medium_info.push(question.song.artist.name)
        @medium_info.push("Song")
        @url_array_medium.push(thumbnail_src)
      elsif question.level == "hard"
        @hard_questions.push(question)
        @hard_info.push(question.song.artist.name)
        @hard_info.push("Song")
        @url_array_hard.push(thumbnail_src)
      end
    end
    
    
    #***STEG 3 - Slumpar två albumfrågor***
    #Algoritmen är liknande den för sångfrågor.
    
    number_of_album_questions = AlbumQuestion.count #Antalet albumfrågor i databasen.
    first_album_question_id = AlbumQuestion.first.id #ID på fråga nummer ett. 
    
    for i in 0..1
      
      random = rand((number_of_album_questions+1)-first_album_question_id) + first_album_question_id
      question = AlbumQuestion.find(random)
      
      while (featured_artists.include? question.album.artist.id) || (question.level == "easy" && @easy_questions.size == 2) || (question.level == "medium" && @medium_questions.size == 2) || (question.level == "hard" && @hard_questions.size == 2) 
        random = rand((number_of_album_questions+1)-first_album_question_id) + first_album_question_id
        question = AlbumQuestion.find(random)  
      end
      
      #Stoppar in värden i minnesarrayerna.
      featured_artists.push(question.album.artist.id) 
      
      thumbnail_src = "http://img.youtube.com/vi/#{question.album.youtube_url}/2.jpg"
      
      #Stoppar in frågan i rätt array, baserat på svårighetsgraden.
      if question.level == "easy"
        @easy_questions.push(question)
        @easy_info.push(question.album.artist.name)
        @easy_info.push("Album")
        @url_array_easy.push(thumbnail_src)
      elsif question.level == "medium"
        @medium_questions.push(question)
        @medium_info.push(question.album.artist.name)
        @medium_info.push("Album")
        @url_array_medium.push(thumbnail_src)
      elsif question.level == "hard"
        @hard_questions.push(question)
        @hard_info.push(question.album.artist.name)
        @hard_info.push("Album")
        @url_array_hard.push(thumbnail_src)
      end
    end 
  end

  def show_question
    @title = "Question"
  end

  def result
    @title = "Quiz results"
  end
end

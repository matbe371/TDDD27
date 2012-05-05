class QuizController < ApplicationController
  
  
  #Action för att berkäfta quiz
  def confirm
    @title = "Confirm"
    user = User.first #TODO ändra till sessionuser.
    
    #Skapar en ny quiz.
    @new_quiz = user.quizzes.create(:score=>0, :genre=>"All")
    
    #Skapar en playlist tillhörnade quizzen, som kommer att visas när quizzet är avklarat. Detta sker mha relationerna i databasen.
    @new_quiz.playlists.create
  end
  
  
  #Action för frågeväljar-vyn.
  def play
    
    #Titel på sidan
    @title = "Pick question" 
    
    #Det aktuella quizzet som spelas fås som parameter.
    quizId = params[:quiz_id]
    @quiz = Quiz.find(quizId)
    
    #En räknare som håller koll på vilken fråga i ordningen vi är på. Fås som parameter.
    @question_no = params[:question_no] #TODO skall fås om parameter.
    
    #TODO här skall det in en if-sats som kollar vilken fråga vi är på om 10 => redirect.
    
    #Array som håller koll på vilka artister som är med i frågeomgången. Det skall inte få förekomma två frågor med samma artist.
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
      
      #Skapar en URL-källa för thumbnail, som hämtas från YouTube, baserat på ID't för klippet i databasen.
      thumbnail_src = "http://img.youtube.com/vi/#{question.artist.songs.find(question.artist.id).youtube_url}/2.jpg"
      
      #Stoppar in frågan med tillhörande information i rätt arrayer, baserat på svårighetsgraden.
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
      
      
      #Här tillkommer ett villkor som kollar om frågearrayerna redan är fullsatta. I så fall slumpas en ny fråga.
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
    
    #**Klart! nu finns all infomration som behövs i play.html.erb**
  end

  #Action för att visa den fråga som man har klickat på.
  def show_question
    
    #Titel för sidan.
    @title = "Question"
    
    #Quiz-id fås som parameter.
    quiz_id = params[:quiz_id]
    
    #Hämtar aktuellt qiuz.
    @quiz = Quiz.find(quiz_id)
    
    #Räkanre för vilken fråga i ordningen vi håller på med.
    @current_question_nr = params[:question_nr]
    
    #ID för aktuell fråga hämtas som GET-parameter.
    current_question_id = params[:question]
    
    #Genre för aktuell fråga hämtas som GET-parameter.
    @genre = params[:category]
    
    #Poäng för frågan hämtas som GET-parameter.
    @points = params[:points]
    
    #Beroende på vilken genre frågan hade hämtas frågans info ur respektive DB-tabell. Instansvariablerna får rätt världen och kan användas i vyn.
    if @genre == "Song"
      
      #Rätt fråga hämtas ur rätt tabell mha ID-nyckeln.
      @db_question = SongQuestion.find(current_question_id) 
      
      #Utnyttjar relationen i databasen för att plocka ut sångens artist.
      @artist = @db_question.song.artist.name 
      
      #URL för youtube sätts av klippets ID-kod, som finns i databasen. 
      #showinfo= gör att klippets rubrik inte visas och autoplay=1 gör att klippet startar på en gång när sidan laddas.
      @youtube_src = "http://www.youtube.com/v/#{@db_question.song.youtube_url}&showinfo=0&autoplay=1" 
      
      #Sätter in rätt svar i quizzets awnser-tabell, som kommer att redovivias på resultatsidan.
      @quiz.answers.create(:answer=>@db_question.answer, :question_number=>Integer(@current_question_nr))
      
      #Skapar ett nytt playlist-item för playlist, innehållande rätt variabler för frågan. Utnyttjar här relationerna i databasen.
      @quiz.playlists.first.playlist_items.create(:item_artist=>@artist, :item_song=>@db_question.song.title, :position=>Integer(@current_question_nr))
    elsif @genre == "Album" 
      @db_question = AlbumQuestion.find(current_question_id)
      @artist = @db_question.album.artist.name
      @youtube_src = "http://www.youtube.com/v/#{@db_question.album.youtube_url}&showinfo=0&autoplay=1"
      @quiz.answers.create(:answer=>@db_question.answer, :question_number=>Integer(@current_question_nr))
   
      #Utnyttjar stränginterpolation för att markera att det är ett album, inte en låt.
      @quiz.playlists.first.playlist_items.create(:item_artist=>@artist, :item_song=>"#{@db_question.album.title} (album)", :position=>Integer(@current_question_nr))
    elsif @genre == "Trivia"
      @db_question = TriviaQuestion.find(current_question_id)
      @artist = @db_question.artist.name
      #TODO slumpa fram en video för trivia istället för att jämt ta den 1:a.
      @youtube_src = "http://www.youtube.com/v/#{@db_question.artist.songs.first.youtube_url}&showinfo=0&autoplay=1"
      @quiz.answers.create(:answer=>@db_question.answer, :question_number=>Integer(@current_question_nr))
      @quiz.playlists.first.playlist_items.create(:item_artist=>@artist, :item_song=>@db_question.artist.songs.first.title, :position=>Integer(@current_question_nr))
    end
  end
  
  
  #Action för frågeresultat. 
  def question_result
    @title = "Question result"
    
    #Quiz-id fås som GET-parameter.
    quiz_id = params[:quiz_id]
    
    #Hämtar aktuellt qiuz.
    @quiz = Quiz.find(quiz_id)
    
    #Räkanre för vilken fråga i ordningen vi håller på med. Får som GET-parameter.
    current_question_nr = params[:question_nr]
    
    #Frågans korrekta svar får som GET-parameter.
    answer = params[:correct_answer]
    
    #Poäng för frågan hämtas som GET-parameter.
    points = params[:points]
    
    #Användarens svar fås som POST-parameter från formuläret.
    user_answer = params[:answer]
    
    #Kollar användaren har svarat rätt på frågan.
    #Squish gör så att blanktecken i början och slutet ignoreras. Dessutom blir multipla blanktecken till ett.
    #Titelize gör så att alla ord jämförs med stor bokstav först. Dvs. Det spelar inten roll om svar/fråga är skrivan med stor bokstav eller ej.
    if answer.squish.titleize  == user_answer.squish.titleize  
      @result = "Correct"
      #Uppdaterar quizzets score. Pointsvariabeln type-castas till en integer för att beräkning skall kunna utföras.
      @quiz.score = @quiz.score + Integer(points) 
    else 
      @result = "Fail"
    end
    
    #Plussar på räknaren för antal frågor.
    @next_question_nr = Integer(current_question_nr) + 1

  end

  #Action för resultatsidan.
  def result
    @title = "Quiz results"
  end
end

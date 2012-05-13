module QuizHelper
  
    #Metod för att returnera ett albums namn uten "(album)" på slutet.
    def get_album_name(album)
      #Albumets längt i antal tecken. 
      total_length = album.length
      #Längd minus de åtta sista tecknen = " (album)". 
      title_lenght = total_length - 8
      #Returnenrar (ruby har implicit returnering) nu bara albumtiteln.
      album.first(title_lenght)
    end
end

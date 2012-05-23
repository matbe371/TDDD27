module SessionHelper
  
  #En helper-metod för att logga in användare.
  def sign_in(user)
    
    #Sätter en kaka som räcker i 20 som standard.
    cookies.permanent[:remember_token] = user.remember_token
    
    #Skapar en session-user, den som har loggat in.
    current_user = user
  end
  
  #Helper-metod som kollar om en användare är inloggad.
  def signed_in?
    !current_user.nil?
  end
  
  #Helper-metod som tilldelar den globala variablen @current_user vid inloggning.
  #Denna kan nås via alla vyer och controller.
  def current_user=(user)
    @current_user = user
  end
  
  #Helper-metod som hittar motsvarande användare via remember_token.
  def current_user
    
    #Om @current_user är nil kommer variabeln att tilldelas.
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  
  #Helper-metod som loggar ut användaren.
  def sign_out
    
    #Nollställer användare och tar bort kakan.
    current_user = nil
    cookies.delete(:remember_token)
  end
end

class UsersController < ApplicationController
  def index
  end
  
  #Action för registrera-sidan.
  def new
  
    #Variabel för ny användare
    @user = User.new
    
    @title = "sign up"
  end
  
  #Action för att skapa en användare, som anropas efter det att registerea-formuläret fyllts i korrekt.
  def create
    
    #User-objektet fås via parametrarna som skickas med via POST från signin-formuläret.
    @user = User.new(params[:user])
    
    #Om allt är korrekt sparas användaren och omlokaliseras till sin nyskapade sida. Annara hamnar han återigen på signin-sidan.
    if @user.save
      #Lopggar in och omdiregerar användaren.
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  #Action för användarens pesonliga sida.
  def show
    
    
    #Hämtar aktuell användare.
    @user = User.find(params[:id])
    
    #Titel på sidan.
    @title = @user.username
    
  end

  def edit
  end
end

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
    
    user_quizzes = @user.quizzes
    @no_of_quizzes = @user.quizzes.count
    
    @statistics = Array.new
    
    @total_score = 0
    @avarage_score = 0
    
    for i in 0..@no_of_quizzes-1
      @total_score += user_quizzes[i].score
      @statistics.push([user_quizzes[i].created_at.to_time.to_i, user_quizzes[i].score])
    end
    
    #@avarage_score = 5000/@no_of_quizzes
    @avarage_score = @total_score/@no_of_quizzes
    
  end

  def edit
  end
end

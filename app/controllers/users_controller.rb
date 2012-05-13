class UsersController < ApplicationController
  def index
  end

  def new
  
    #Variabel för ny användare
    @user = User.new(params[:user])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    
    #Hämtar aktuell användare.
    @user = User.find(params[:id])
    
    #Titel på sidan.
    @title = @user
    
  end

  def edit
  end
end

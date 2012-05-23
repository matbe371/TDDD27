class SessionsController < ApplicationController
  def new
  end

  def create
    #Hämtar den användare i databasen som erhåller mailaddress motsvarande den ifyllda.
    user = User.find_by_mail(params[:session][:mail])
    
    #Om användaren existerar och rätt lösenord är ifyllt skall använadren loggas in.
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to user
    else
      #flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end

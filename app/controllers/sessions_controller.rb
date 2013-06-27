class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    password = params[:session][:password]
    if user && user.authenticate(password)
      sign_in(user)
      redirect_to user
    else
      flash[:errors] = ["Invalid login"]
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = ["You just signed out."]
    redirect_to new_session_path
  end  

end

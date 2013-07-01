class ApplicationController < ActionController::Base
  protect_from_forgery

  include ActionView::Helpers::SessionHelper

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_login
    unless logged_in?
      flash[:errors] = ["You must be logged in to access that section"]
      redirect_to new_login_url # halts request cycle
    end
  end

  def require_user(location = :back)
    unless current_user
      flash[:errors] = ["You can't access another user's pages"]
      redirect_to location # halts request cycle
    end
  end

end

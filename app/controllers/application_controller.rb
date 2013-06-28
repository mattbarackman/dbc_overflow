class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  private

  def require_login
    unless logged_in?
      flash[:errors] = ["You must be logged in to access that section"]
      redirect_to new_login_url # halts request cycle
    end
  end

  def require_user
    unless current_user
      flash[:errors] = ["You can't access another user's pages"]
      redirect_to :back # halts request cycle
    end
  end

  helper_method :current_user

end

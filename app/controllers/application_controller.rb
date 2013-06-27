class ApplicationController < ActionController::Base
  protect_from_forgery

  # move this to a module under lib/
  # reserver the helpers folder to specifically deal with views.
  include SessionsHelper

  private

  def require_login
    unless logged_in?
      flash[:errors] = ["You must be logged in to access that section"]
      redirect_to new_login_url # halts request cycle
    end
  end

  # REVIEW: this is not a very good name.
  # You are also querying the database twice, once here and another in each action ( @user = User.find(params[:id]))
  # so why not combine them?
  # we can rename this method something like load_and_authorize_user and would take care of this ( @user = User.find(params[:id])) assignment as well.
  def require_user
    unless current_user == User.find(params[:id])
      flash[:errors] = ["You can't access another user's pages"]
      redirect_to :back # halts request cycle
    end
  end

end

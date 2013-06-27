# REVIEW: looks good, but move these method to a module under lib, they don't belong in a view helper.
module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
  end

  # REVIEW: everytime you call current_user you query the db, can you think of a solution to that?
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

end

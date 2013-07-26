helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    @user ||= User.find(session[:id]) if session[:id]
  end

  def logged_in?
    !!current_user
  end

end

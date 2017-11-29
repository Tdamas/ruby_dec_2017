class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    #How to get current user from session.
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end

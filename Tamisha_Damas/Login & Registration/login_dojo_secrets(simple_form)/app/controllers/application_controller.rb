class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user # Adding this helper method makes it available in all our views
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Placing current_user method here, makes it available to use in any method.
  def current_user
      User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end

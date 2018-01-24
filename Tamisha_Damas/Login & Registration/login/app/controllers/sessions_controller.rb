class SessionsController < ApplicationController
  def new

  end

  def create
    # here we will find the user by email
    user = User.find_by_email(params[:user][:email])

    if user
      if user.try(:authenticate, params[:user][:password])
        session[:user_id] = user.id
          return redirect_to user_path user.id
      end

      flash[:errors] = ['Password is incorrect, please enter again.']
    else
      flash[:errors] = ['Account does not exist, please register.']
    end

    return redirect_to login_path
  end

  def destroy
    session.delete(:user_id) if session[:user_id]

    return redirect_to new_login_path
  end
end

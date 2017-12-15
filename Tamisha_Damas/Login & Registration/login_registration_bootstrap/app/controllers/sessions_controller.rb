class SessionsController < ApplicationController

  def destroy
       session.delete(:user_id)
       return redirect_to register_path
  end

  def create
      #get user from the database by email
      user = User.find_by(email: params[:email])
      puts 'email', params[:email]
      if user
        if User.find_by_email(params[:email]).try(:authenticate, params[:password])
            session[:user_id] = user.id

            return redirect_to user_path user.id
        end

        flash[:errors] = {password: 'Password is not correct'}
      else
        flash[:errors] = {email: 'Account not found, please register first.'}
      end

      flash[:errors][:form] = 'login'


      return redirect_to :back
      # session[:user_id] = user.id
      # return redirect_to user_path user.id
  end
end

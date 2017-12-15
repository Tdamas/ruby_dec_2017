class UsersController < ApplicationController

  before_action :default_user, only: [:new]

  def new
  end

  def create
    @user = User.create(user_params)

      # Session key named user_id will equal
      session[:user_id] = @user.id
      # return redirect to show page with user profile and pass the user.id if the user is valid
      return redirect_to user_path @user.id if @user.valid?

      flash[:errors] = @user

      return redirect_to new_user_path# this will take you back to where you came from new_user_path
  end
  def show

  end

private
    def user_params
      # require user is what's inside of the html forms
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def default_user
      if flash[:errors]
        @user = User.new(flash[:errors])
        @user.valid?
      else
        @user = User.new
      end
    end
end

class UsersController < ApplicationController

  def new
  end

  def create
      # Create Users
      user = User.create(user_params)

      # If user is valid
      if user.valid?
          # Session key named user_id will equal
          session[:user_id] = user.id
          # return redirect to show page with user profile and pass the user.id
          return redirect_to user_path user.id
      end
      # If invalid flash some errors and return redirect them back to register page.
      flash[:errors] = user.errors.full_messages
      return redirect_to :back

  end

  def show
      # because we grab the user from session in the create method, we need to find the user
      # from session to display their information on the show page.
      @user = User.find(session[:user_id])
  end

  private
      def user_params
        # require user is what's inside of the html forms
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
end

class UsersController < ApplicationController
    def new
    end

    def create
      user = User.create(user_params)

      if user.valid?
        # Session key named user_id will equal
        session[:user_id] = user.id
        # return redirect to show page with user profile and pass the user.id
        return redirect_to user_path user.id
      end

      flash[:errors] = user.errors.full_messages
      return redirect_to new_register_path
    end

    def show
      # find the user where it's user id is equal to the session id and save it to a variable
      @user = User.find(params[:id])
    end

    private
        def user_params
          params.require(:user).permit(:first_name, :last_name, :alias, :email, :age, :password, :password_confirmation)
        end
end

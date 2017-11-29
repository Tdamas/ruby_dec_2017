class SessionsController < ApplicationController
    def new
        # render login page
    end
    def create
        # Log User In
       @user = User.find_by_email(params[:email])
       # if authenticate true
           # save user id to session
           # redirect to users profile page
       if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
         redirect_to "/users/#{@user.id}"
       else
         # if authenticate false
             # add an error message -> flash[:errors] = ["Invalid"]
             # redirect to login page
         flash[:errors] = ["Invalid Combination"]
         redirect_to "/sessions/new"
       end
    end
    def destroy
        # Log User out
        reset_session
        redirect_to "/sessions/new"
        # set session[:user_id] to null
        # redirect to login page
    end
end

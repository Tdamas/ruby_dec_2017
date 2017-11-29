class UsersController < ApplicationController
  def new
    #This will show the registration page, to register the User.

  end

  def create
    #This will save them to the database.

  end

  def show
      @user = User.find(params[:id])
  end

end

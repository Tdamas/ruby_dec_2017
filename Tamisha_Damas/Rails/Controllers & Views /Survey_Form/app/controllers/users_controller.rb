class UsersController < ApplicationController
  def index
    session[:count] ||= 0
    # session.clear
    # index method will only render my index.html template
  end

  def create
    # here the user will enter their info  onto the index.html template and when they click submit will be redirected to the show page, show.html
    # their data saved into session from this create method will be rendered onto the html template.
    # puts params
    session[:survey] = params
    session[:count] += 1

    redirect_to '/result'
  end

  def show
    @survey = session[:survey]
    @count = session[:count]
  end
end

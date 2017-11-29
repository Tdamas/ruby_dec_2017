class DisplaysController < ApplicationController
  def index
    render text: 'What do you want???'
  end

  def hello
    render text: 'Hello CodingDojo!'
  end

  def say
    unless params[:name] #:name params is coming from routes.rb
      render text: 'Saying Hello!'
    else
      if params[:name] == "michael"
        redirect_to "/displays/say/hello/joe"
      else
        render text: "Saying Hello #{params[:name]}!"
      end
    end
  end

  def times
    session[:count] ||= 0
    render text: "You have visited this url #{session[:count] += 1} time(s)"
  end

  def restart
    reset_session
    render text: "Destroy Session"
  end
end

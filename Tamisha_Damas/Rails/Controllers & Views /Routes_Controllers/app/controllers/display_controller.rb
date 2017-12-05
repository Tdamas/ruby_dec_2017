class DisplayController < ApplicationController
  def index
    render text: "Hello CodingDojo!"
  end
  def hello
    render text: "Saying Hello!"
  end
  def joe
    render text: "Saying Hello Joe!"
  end
  def michael
    return redirect_to '/say/hello/joe'
  end
  def say
    render text: "What do you want me to say?"
  end
  def times
    session[:count] ||= 0
    render text: "You have visited this url #{session[:count] += 1} time(s)."
  end
  def restart
    reset_session
    render text: "Destroyed the session!"
  end
end

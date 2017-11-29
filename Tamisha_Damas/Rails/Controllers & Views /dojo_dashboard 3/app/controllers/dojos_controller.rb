class DojosController < ApplicationController

  def index
      @count = Dojo.all.count
      @dojos = Dojo.all
  end

  def new
      @dojo = Dojo.new
  end

  def create
      # you do not need to use instance variables in the create method because post
      # doesn't render  an HTML form.

      dojo = Dojo.new(dojo_params)

      if dojo.save
      puts "Your form was successfully entered."
      return redirect_to root_path
      else
        flash[:errors] = dojo.errors.full_messages
        redirect_to :back
      end
  end

  def show
      @dojo = Dojo.find(params[:id])
  end

  def edit
      @dojo = Dojo.find(params[:id])
  end

  def update
      @dojo = Dojo.find(params[:id])

      if @dojo.update(dojo_params)
         redirect_to root_path, notice: "You have successfully updated a Dojo!"
      else
         flash[:errors] = @dojo.errors.full_messages
         redirect_to :back
      end
  end

  def destroy
    Dojo.find(params[:id]).destroy
    redirect_to :root
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end

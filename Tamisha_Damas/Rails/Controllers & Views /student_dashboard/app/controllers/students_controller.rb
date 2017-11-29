class StudentsController < ApplicationController

  def index
      @dojo = Dojo.find(params[:id])
  end

  def new
      @dojos = Dojo.all
      return render :new
  end

  def create
      @student = Student.create(student_params)
      return redirect_to create_dojo_path params[:dojo_id] if @student.valid?
      flash[:errors] = @student.errors.full_messages
      return redirect_to new_student_path
  end

  def show
      @student = Student.find(params[:id])
      @students = Student.where(dojo_id: @student.dojo.id).where.not(id: @student.id)
  end

  def edit
      @student = Student.find(params[:id])
      @dojos = Dojo.all
  end

  def update
      @student = Student.find(params[:id])
      @student.update(student_params)
      return redirect_to dojo_path params[:dojo_id] if @student.valid?
      flash[:errors] = @student.errors.full_messages
      return redirect_to edit_student_path @student.dojo.id, @student.id

  end

  def destroy
    Student.find(params[:id]).destroy
    redirect_to create_dojo_path params[:dojo_id]
  end
  private
      def student_params
        params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
      end
end

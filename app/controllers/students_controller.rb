class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update, :show, :destroy]
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "Welcome #{@student.firstname}, to the Smart-ID portal"
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:success] = "Your Profile was updated successfully."
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    flash[:danger] = "Student profile was succesfully deleted."
    redirect_to students_path
  end
  private
    def student_params
      params.require(:student).permit(:enrollnumber, :firstname, :lastname, :branch, :batch, :contact)
    end

    def set_student
      @student = Student.find(params[:id])
    end
end

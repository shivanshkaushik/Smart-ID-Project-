class StudentsController < ApplicationController

  before_action :set_student, only: [:edit, :update, :show, :destroy]
  before_action :require_same_student, only: [:edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      # session[:user_id] = @student.id
      UserMailer.registration_confirmation(@student).deliver
      flash[:primary] = "Hi #{@student.firstname}, An email has been sent to your registered email-id. Confirm your email to continue"
      redirect_to root_path
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
    session[:user_id] = nil
    @student.destroy
    flash[:danger] = "Student profile was succesfully deleted."
    redirect_to students_path
  end

  def confirm_email
    student = Student.find_by_confirm_token(params[:id])
    if student
      student.email_activate
      flash[:success] = "Welcome to the Student Portal! Your email has been confirmed.
      Please sign in to continue."
      redirect_to login_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_path
    end
  end

  private

    def student_params
      params.require(:student).permit(:enrollnumber, :firstname, :lastname, :branch, :batch, :contact, :email, :password)
    end

    def set_student
      @student = Student.find(params[:id])
    end

    def require_same_student
      if current_student.enrollnumber != @student.enrollnumber
        flash[:danger] = "You can only edit or update your profile"
        redirect_to root_path
      end
    end

end

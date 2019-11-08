class UsersController < ApplicationController

  before_action :require_user
  before_action :set_student, only: [:show]
  before_action :check_smart_id_registration, only: [:show]
  before_action :require_same_student, only: [:show]


  def new
    @id = Smartid.new
  end

  def create
    @id = Smartid.new(smart_id_params)
    @student = Student.find_by(enrollnumber: params[:smartid][:registration_number].to_i)
    @id.student_id = @student.id
    if @id.save
      flash[:success] = "Welcome #{@student.firstname}, you have succesfully registered for Smart-ID Card. Contact Administration department for details."
      redirect_to user_path(@student)
    else
      render 'new'
    end
  end


  def show
    redirect_to root_path if !logged_in?
    @id = Smartid.find_by(:student_id => Student.find(params[:id]))
  end


  private

  def smart_id_params
    params.require(:smartid).permit(:registration_number, :balance, :last_transaction, :dues)
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

  def check_smart_id_registration
    if Smartid.find_by(:student_id => @student.id)
      flash.now[:success] = "Welcome #{@student.firstname}, to your Smart-ID portal"
    else
      flash[:danger] = "You are not registered for Smart-ID. Please register yourselves to access the portal."
      redirect_to students_path
    end
  end

end

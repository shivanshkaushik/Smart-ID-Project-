class UsersController < ApplicationController

  before_action :require_user
  before_action :set_student, only: [:show]
#  before_action :check_smart_id_registration_new_account, only: [:new]
  before_action :check_smart_id_registration, only: [:show]
  before_action :require_same_student, only: [:show]


  def new
    @id = Smartid.new
  end

  def create
    @id = Smartid.new(smart_id_params)
    @student = Student.find_by(enrollnumber: params[:smartid][:registration_number])
    @student.request_id = nil
    @id.student_id = @student.id
    if @id.save
      @student.save
      flash[:success] = "The Student has been succesfully registered for Smart-ID Card."
      redirect_to students_path
    else
      render 'new'
    end
  end


  def show
    redirect_to root_path if !logged_in?
    @id = Smartid.find_by(:student_id => Student.find(params[:id]))
  end

  def index

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

  def check_smart_id_registration_new_account
    @temp_student = Student.find(session[:student_id])
    if Smartid.find_by(:registration_number => @temp_student.enrollnumber)
      flash[:danger] = "Only Admins can perform that action"
      redirect_to root_path
    end
  end

  def check_smart_id_registration
    @temp_student = Student.find(session[:student_id])
    if Smartid.find_by(:registration_number => @temp_student.enrollnumber)
      flash.now[:success] = "Welcome #{@temp_student.firstname}, to your Smart-ID portal"
    else
      flash[:danger] = "The request hasn't been processed by the admin. Please try after some time."
      redirect_to students_path
    end
  end

end

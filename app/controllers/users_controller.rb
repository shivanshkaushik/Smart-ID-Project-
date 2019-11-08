class UsersController < ApplicationController

  before_action :require_student
  before_action :set_student, only: [:show]
  before_action :check_smart_id_registration, only: [:show]
  before_action :require_same_student, only: [:show]


  def new
    @id = Smartid.new
  end

  def show
    redirect_to root_path if !logged_in?
    @id = Smartid.find_by(:user_id => @student.enrollnumber)
  end


  private

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
    if Smartid.find_by(:user_id => @student.enrollnumber)
      flash.now[:primary] = "Welcome #{@student.firstname}, to your Smart-ID portal"
    else
      flash[:danger] = "You are not registered for Smart-ID. Please register yourselves to access the portal."
      redirect_to students_path
    end
  end

end

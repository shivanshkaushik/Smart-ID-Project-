class UsersController < ApplicationController

  before_action :require_student
  before_action :set_student, only: [:show]
  before_action :require_same_student


  def show
    redirect_to root_path if !logged_in?
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

end

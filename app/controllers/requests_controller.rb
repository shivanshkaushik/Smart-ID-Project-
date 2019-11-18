class RequestsController < ApplicationController
  before_action :require_user
  before_action :require_admin, only:[:index]


  def show
    @student = Student.find(session[:student_id])
    @student.request_id = @student.enrollnumber
    @student.save
  end

  def index
    @students = Student.all
  end

  private

  def require_admin
    if !admin_logged_in?
      flash[:danger] = "Only admins are allowed to perform that action"
      redirect_to root_path
    end
  end
end

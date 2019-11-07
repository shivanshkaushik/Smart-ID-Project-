class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_student, :student_logged_in?, :current_faculty, :faculty_logged_in?, 
  :logged_in?, :current_admin, :admin_logged_in?

 def current_faculty
    @current_faculty ||= Faculty.find(session[:faculty_id]) if session[:faculty_id]
    
  end

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def student_logged_in?
    !!current_student 
  end

  def faculty_logged_in?
    !!current_faculty
  end

  def admin_logged_in?
    !!current_admin
  end

  def logged_in?
    !!current_student or !!current_faculty or !!current_admin
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end

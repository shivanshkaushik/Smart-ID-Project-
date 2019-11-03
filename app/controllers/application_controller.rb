class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_student, :logged_in?

  def current_student
    @current_student ||= Student.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_student
  end

  def require_student
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end

class SessionsController < ApplicationController

  def new

  end

  def create
    student = Student.find_by(email:params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      session[:user_id] = student.id
      flash[:success] = "You have successfully logged in"
      redirect_to student_path(student)
    else
      flash[:danger] = "There was something wrong with your credentials"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end

end

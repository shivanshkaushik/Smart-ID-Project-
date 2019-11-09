class StudentSessionsController < ApplicationController

  def new

  end

  def create
    student = Student.find_by(email:params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      if student.email_confirmed
        session[:student_id] = student.id
        flash[:success] = "You have successfully logged in"
        redirect_to student_path(student)
      else
        flash.now[:warning] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
        render 'new'
      end
    else
      flash[:danger] = "There was something wrong with your credentials"
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end

end

class FacultySessionsController < ApplicationController
  def new
  end

  def create
    faculty = Faculty.find_by(email:params[:session][:email].downcase)
    if faculty && faculty.authenticate(params[:session][:password])
      #if student.email_confirmed
       session[:faculty_id] = faculty.id
        flash[:success] = "You have successfully logged in"
        redirect_to faculty_path(faculty)
      #else
        #flash.now[:error] = 'Please activate your account by following the
        #instructions in the account confirmation email you received to proceed'
        #render 'new'
      #end
    else
      flash[:danger] = "There was something wrong with your credentials"
      render 'new'
    end
  end

  def destroy
    session[:faculty_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end

end

class AdminSessionsController < ApplicationController

  def new
  end

  def create
    admin = Admin.find_by(email:params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      #if student.email_confirmed
       session[:admin_id] = admin.id
        flash[:success] = "Admin logged in."
        redirect_to root_path
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
    session[:admin_id] = nil
    flash[:success] = "Admin logged out successfully."
    redirect_to root_path
  end
end
class WelcomeController < ApplicationController

  def home
    redirect_to students_path if logged_in?
  end


  def about
  end

  def studentportal

  end

  def facultyportal

  end

  def adminportal

  end

end

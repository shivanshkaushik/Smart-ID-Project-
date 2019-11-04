class UsersController < ApplicationController

  def studentportal
    redirect_to root_path if !logged_in?
  end


end

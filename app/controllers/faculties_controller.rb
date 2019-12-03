class FacultiesController < ApplicationController

  before_action :set_faculty, only: [:edit, :update, :show, :destroy]
  before_action :require_user, only: [:edit, :index, :show]
  before_action :require_same_faculty, only: [:edit, :update, :destroy]

  def index
    @faculties = Faculty.paginate(:page => params[:page], per_page: 5)
  end

  def new
    if !logged_in? or admin_logged_in?
    @faculty = Faculty.new
    else
      flash[:danger] = "You cannot register as a new faculty while logged in."
      redirect_to root_path
    end
  end

  def edit
  end
  
  def create
      @faculty = Faculty.new(faculty_params)
      if @faculty.save
        if admin_logged_in?
          flash[:success] = "New faculty been registered to the Smart-ID Database."
          redirect_to root_path
        else
          session[:faculty_id] = @faculty.id
          flash[:success] = "Welcome #{@faculty.firstname + " " + @faculty.lastname} to the portal"
          redirect_to faculty_path(@faculty)
        end
      else
        render 'new'
      end

  end

  def update
    if @faculty.update(faculty_params)
      flash[:success] = "Faculty was updated successfully"
      redirect_to faculty_path(@faculty)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    session[:faculty_id] = nil
    @faculty.destroy
    flash[:notice] = "Faculty was successfully deleted"
    redirect_to faculties_path
  end

  private
  
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    def faculty_params
      params.require(:faculty).permit(:firstname, :lastname, :teaching_field, :contact, :email, :designation, :password)
    end

    def require_same_faculty
      if current_faculty != @faculty and !admin_logged_in?
        flash[:danger] = "You can only edit or update your profile"
        redirect_to root_path
      end
    end
end
class FacultiesController < ApplicationController

  before_action :set_faculty, only: [:edit, :update, :show, :destroy]

  def index
    @faculties = Faculty.all
  end

  def new
    @faculty = Faculty.new
  end

  def edit
  end
  
  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
      flash[:notice] = 'Faculty was created succesfully'
      redirect_to faculty_path(@faculty)
    else
      render 'new'
    end
  end

  def update
    if @faculty.update(faculty_params)
      flash[:notice] = "Faculty was updated successfully"
      redirect_to faculty_path(@faculty)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @faculty.destroy
    flash[:notice] = "Faculty was successfully deleted"
    redirect_to faculties_path
  end
  private
  
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end
    def faculty_params
      params.require(:faculty).permit(:firstname, :lastname, :teaching_field, :contact, :email, :designation)
    end
end
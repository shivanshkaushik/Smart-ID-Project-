class AdminsController < ApplicationController

  before_action :set_admin, only: [:edit, :update, :show, :destroy]
  before_action :require_user, only: [:edit, :index, :show]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def edit
  end
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      session[:admin_id] = @admin.id
      flash[:success] = "Welcome #{@admin.firstname + " " + @admin.lastname}(Admin) to the portal"
      redirect_to admin_path(@admin)
    else
      render 'new'
    end
  end

  def update
    if @admin.update(admin_params)
      flash[:success] = "Admin was updated successfully"
      redirect_to admin_path(@admin)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    session[:admin_id] = nil
    @admin.destroy
    flash[:danger] = "Admin was successfully deleted"
    redirect_to admins_path
  end

  private
  
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:firstname, :middlename, :lastname, :contact, :email, :password)
    end
end
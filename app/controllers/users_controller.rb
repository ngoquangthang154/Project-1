class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
      flash[:success] = t("controllers.users_controller.fail")
      redirect_to root_path
    end
  end

  def create
    @user = User.new user_params  
    if @user.save
      log_in @user
      flash[:success] = t "controllers.users_controller.reg_success"
      redirect_to @user
    else
      flash[:success] = t "controllers.users_controller.reg_failed"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :password,
      :password_confirmation, :email, :username, :phone
  end
end

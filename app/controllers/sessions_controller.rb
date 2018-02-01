class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by username: params[:session][:username].downcase
    if user && user.authenticate(params[:session][:password]) && user.role == 0
      log_in user
       params[:session][:remember_me] == "1" ? (remember user) : (forget user)
      redirect_to admin_products_path
    elsif user.role != 0
       log_in user
       params[:session][:remember_me] == "1" ? (remember user) : (forget user)
       redirect_to root_path
    else
      flash.now[:danger] = t "controllers.sessions_controller.flash"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

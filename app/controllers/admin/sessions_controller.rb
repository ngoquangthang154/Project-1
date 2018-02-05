class Admin::SessionsController < Admin::BaseController
  def new
    @users = User.new
    render layout: false
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_products_path
    else
      flash.now[:danger] = "oh errors";
      render "new"
    end
  end

  def destroy

  end
end

class Admin::UsersController < Admin::BaseController
  def index
    @users = User.search(params[:search]).page(params[:page]).per Settings.per_index
  end
end

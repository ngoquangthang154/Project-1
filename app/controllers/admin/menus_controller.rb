class Admin::MenusController < Admin::BaseController
  def index
    @menus = Menu.search(params[:search]).page(params[:page]).per Settings.per_index
  end
end

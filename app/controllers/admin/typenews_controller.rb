class Admin::TypenewsController < Admin::BaseController
  def index
    @typenews = Typenew.search(params[:search]).page(params[:page]).per Settings.per_index
  end
end

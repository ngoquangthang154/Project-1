class Admin::NewsController < Admin::BaseController
  def index
    @n = New.search(params[:search]).page(params[:page]).per Settings.per_index
  end
end

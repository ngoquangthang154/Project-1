class Admin::NewsController < Admin::BaseController
  def index
    @n = New.search(params[:search]).page(params[:page]).per Settings.per_index
  def show
    @n = New.all
  end

  def new
    @n = New.new
  end
end

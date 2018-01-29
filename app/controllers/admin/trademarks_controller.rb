class Admin::TrademarksController < Admin::BaseController
  def index
    @trs = Trademark.search(params[:search]).page(params[:page]).per Settings.per_index
  def show
    @trs = Trademark.all
  end
  def new
    @trs = Trademark.new
  end
end

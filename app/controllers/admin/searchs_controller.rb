class Admin::SearchsController < Admin::BaseController
  def index
    @searchs = Product.search(params[:search]).page(params[:page]).per(5)
    respond_to do |format|
      format.js
    end
  end
end

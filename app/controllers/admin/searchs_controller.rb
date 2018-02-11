class Admin::SearchsController < Admin::BaseController
  def index
    @searchs = Product.search(params[:search])
    respond_to do |format|
      format.js
    end
  end
end

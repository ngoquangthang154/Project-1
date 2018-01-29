class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find_by_id params[:id]
    if @product.nil?
      flash[:warning] = t "messages.product_not_found"
      redirect_to showp_path
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "messages.success"
      redirect_to @product
    else
      render :new
    end
  end

  private
  def product_params
      params.require(:product).permit :name, :img_detail,
        :trademark_id,:assort_id, :content, :price, :status, :keys
  end

end

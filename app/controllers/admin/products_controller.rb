class Admin::ProductsController < Admin::BaseController
  before_action :get_product, only: [:show, :create, :edit, :update]
  def index
    @product = Product.all.select(:id, :name, :description, :price, :img_detail).page(params[:page]).per(5)
  end

  def show
    return if @product
      flash["success"] = t "messages.notproduct"
      redirect_to showp_path
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "products.new.success"
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @product.update_attributes(product_params)
      flash[:success] = t "products.flash.update"
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  def destroy
    Product.find_by_id(params[:id]).destroy
    flash[:success] = t "products.flash.destroy"
    redirect_to admin_root_path
  end

  private

  def get_product
    @product = Product.find_by_id(params[:id])
  end
  def product_params
    params.require(:product).permit(:name, :img_detail,
      :trademark_id,:assort_id, :content, :description , :price, :status, :keys)
  end
end

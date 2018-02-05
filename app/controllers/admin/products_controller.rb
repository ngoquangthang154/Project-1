class Admin::ProductsController < Admin::BaseController
  before_action :get_product, except: [:index, :new]
  before_action :check_admin_login, only: [:index, :show, :new, :create, :update, :destroy]
  def index
    @product = Product.search(params[:search]).page(params[:page]).per Settings.per_index
  end

  def show
    return if @product
    flash["success"] = t "messages.notproduct"
    redirect_to show_path
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

  def update
    if @product.update_attributes product_params
      flash[:success] = t "products.flash.update"
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:success] = t "products.flash.destroy"
    redirect_to admin_root_path
  end

  private
  def check_admin_login
    if session[:user_id].nil?
      flash[:danger] = t "messages.ss_login"
      redirect_to root_path
    end
  end
  def get_product
    @product = Product.find_by_id(params[:id])
    if @product.nil?
      flash[:danger] = t "products.get_product.check_nil"
      redirect_to admin_root_path
    end
  end

  def product_params
    params.require(:product).permit :name, :img_detail,
      :trademark_id,:assort_id, :content, :description , :price, :status, :keys
  end
end

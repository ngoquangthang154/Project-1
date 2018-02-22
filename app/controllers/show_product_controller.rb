class ShowProductController < ApplicationController

  before_action :total_sum, only: [:cart]

  def show
    @product = Product.filtersearch(params[:search], params[:trademark],
      params[:assort], params[:max], params[:min]).page(params[:page]).per(9).select :id, :name, :price, :img_detail, :keys, :trademark_id
    if session[:cart_p].nil?
      session[:cart_p] = {}
    end
    if @product.nil?
      flash[:danger] = t "controllers.show_product.noproduct"
      redirect_to showp_url
    end
  end

  def detail
    @product =  Product.getdetail params[:id]
    @countcmt = @product.comments.countcmt
    @list = Product.getlist params[:id]
    @to_user = {
      name: "",
      reply: 0
    }
    if !params[:id_cmt].nil?
      @to_user[:name] = "<[To: #{@product.comments.find_by_id(params[:id_cmt]).user.name}]>\n"
      @to_user[:reply] = params[:id_cmt]
      if @product.comments.find_by_id(params[:id_cmt]).reply != 0
        @to_user[:reply] = @product.comments.find_by_id(params[:id_cmt]).reply
      end
    end
    if @product.nil?
      flash[:danger] = t "controllers.show_product.notfoundproduct"
      redirect_to showp_url
    end
  end

  def cart
    @myphone = ""
    if !session[:user_id].nil?
      @myphone = User.find(session[:user_id].to_i).phone
    end
    @id_p = params[:product_id]
    @product_cart = []
    if session[:cart_p].any?
      @product_cart = Product.where(id: session[:cart_p].keys)
    end

    if @id_p.nil?
      @cart = session[:cart_p]
    elsif /\A\d+\z/.match(@id_p)
      @cart = session[:cart_p]
      respond_to do |format|
        if @cart.keys.include? @id_p
          flash[:danger] = t "controllers.show_product.selected"
          format.html { redirect_to listcart_url}
          format.js
        elsif @product = Product.exists?(id: @id_p.to_i)
          @cart[@id_p] = 1
          session[:cart_p] = @cart
          format.html { redirect_to showp_url}
          format.js
        else
          flash[:danger] = t "controllers.show_product.notfoundproduct"
          redirect_to showp_url
        end
      end
    else
      flash[:danger] = t "controllers.show_product.notexist"
      redirect_to showp_url
    end
  end

  def destroy
    @id_p = params[:id]
    respond_to do |format|
      if @id_p.nil? || !/\A\d+\z/.match(@id_p)
        flash[:danger] = t "controllers.show_product.notdestroy"
        format.html { redirect_to }
        format.js
      else
        @temp = session[:cart_p]
        @temp.delete(@id_p)
        session[:cart_p] = @temp
        total_sum
        format.html { redirect_to }
        format.js
      end
    end
  end

  def hisp
    if session[:user_id].nil?
      flash[:danger] = "you need login"
      redirect_to showp_url
    else
      @list_order = Order.getlist session[:user_id].to_i
      if @list_order.nil?
        flash[:danger] = "No order"
        redirect_to showp_url
      end
    end
  end

  def postcomment
    if session[:user_id].nil?
      flash[:danger] = t "controllers.show_product.logintocmt"
      redirect_to request.referrer
    else
      if params[:cmt].nil? || params[:productid].nil? || !/\A\d+\z/.match(params[:productid])
        flash[:danger] = t "controllers.show_product.error"
        redirect_to request.referrer
      else
        comment = Comment.new(
          user_id: session[:user_id],
          product_id: params[:productid],
          comment: params[:cmt],
          time_cmt: Time.now,
          reply: params[:toid]
          )
        if comment.save
          redirect_to request.referrer
        else
          flash[:danger] = t "controllers.show_product.error"
          redirect_to request.referrer
        end
      end
    end
  end

  def checkout
    if session[:user_id].nil?
      flash[:danger] = t "controllers.show_product.logintoorder"
      redirect_to listcart_url
    else
      if params[:content].to_s.strip.empty? || params[:adress].to_s.strip.empty? || params[:phone].to_s.strip.empty? || params[:price] == 0.0
        flash[:danger] = t "controllers.show_product.error"
        redirect_to listcart_url
      else
        order = Order.new(
          user_id: session[:user_id].to_i,
          oder_code: "",
          date_purchase: date_of_next(params[:group_rbt]),
          content: params[:content],
          adress: params[:adress],
          price: params[:price],
          phone: params[:phone],
          )

        if order.save
          order.oder_code = "HDN_#{order.id}"
          order.save

          session[:cart_p].each do |key, val|
            price_detail = Product.select(:price).find_by_id(key.to_i).price

            order_detail = OrderDetail.new(
              order_id: order.id,
              product_id: key,
              quantity: val,
              price_detail: price_detail,
              price_total: price_detail * val
              )
            order_detail.save
          end
          session[:cart_p] = {}
          flash[:success] = t "controllers.show_product.successorder"
          redirect_to listcart_url
        end
      end
    end
  end

  def upcount
    @id_html = "#input_count_#{params[:id]}"
    @total_detail = "#total_detail_#{params[:id]}"
    @check_c = 0
    if session[:cart_p][params[:id]] < Product.find(params[:id]).count
      session[:cart_p][params[:id]] = session[:cart_p][params[:id]] + 1
      @check_c = 0
    else
      @check_c = 1
    end
    @total = Product.find(params[:id]).price * session[:cart_p][params[:id]]
    total_sum
    respond_to do |format|
      format.html { redirect_to }
      format.js
    end
  end

  def dowcount
    @id_html = "#input_count_#{params[:id]}"
    @total_detail = "#total_detail_#{params[:id]}"
    if session[:cart_p][params[:id]] > 1
      session[:cart_p][params[:id]] = session[:cart_p][params[:id]] - 1
    end
    @total = Product.find(params[:id]).price * session[:cart_p][params[:id]]
    total_sum
    respond_to do |format|
      format.html { redirect_to}
      format.js
    end
  end

  def clearall
    session[:cart_p] = {}
    respond_to do |format|
      format.html { redirect_to}
      format.js
    end
  end

  private

  def date_of_next day
    date  = Date.parse(day)
    delta = date > Date.today ? 0 : 7
    date + delta
  end

  def total_sum
    @sum_cart = 0
    session[:cart_p].each do |key, value|
      @sum_cart += Product.find(key.to_i).price * value.to_i
    end
  end

end

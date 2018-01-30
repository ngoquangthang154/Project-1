class ShowProductController < ApplicationController
  def show
    @product = Product.filtersearch(params[:search], params[:trademark],
      params[:assort], params[:max], params[:min]).select :id, :name, :price,
    :img_detail
    if session[:cart_p].nil?
      session[:cart_p] = {}
    end
    if @product.nil?
      flash[:danger] = t "controllers.show_product.noproduct"
      redirect_to showp_url
    end
  end

  def detail
    @product =  Product.getdetail(params[:id])
    if @product.nil?
      flash[:danger] = t "controllers.show_product.notfoundproduct"
      redirect_to showp_url
    end
  end

  def cart
    @total = 0
    @id_p = params[:product_id]
    @product_cart = []
    if session[:cart_p].any?
      @product_cart = Product.where(id: session[:cart_p].keys)
    end

    if @id_p.nil?
      @cart = session[:cart_p]

    elsif /\A\d+\z/.match(@id_p)
      @cart = session[:cart_p]
      if @cart.keys.include? @id_p
        flash[:danger] = t "controllers.show_product.selected"
        redirect_to listcart_url
      else
        if @product = Product.exists?(id: @id_p.to_i)
          @cart[@id_p] = 1
          session[:cart_p] = @cart
          flash[:success] = t "controllers.show_product.successproduct"
          redirect_to listcart_url
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

    if @id_p.nil? || !/\A\d+\z/.match(@id_p)
      flash[:danger] = t "controllers.show_product.notdestroy"
      redirect_to listcart_url
    else
      @temp = session[:cart_p]
      @temp.delete(@id_p)
      session[:cart_p] = @temp
      redirect_to listcart_url
    end
  end

  def postcomment
    comment_user = params[:cmt]
    id_p = params[:productid]
    toid = params[:toid]

    if comment_user.nil? || id_p.nil? || !/\A\d+\z/.match(id_p)
      flash[:danger] = t "controllers.show_product.error"
      redirect_to listcart_url
    else
      comment = Comment.new(
        user_id: 1,
        product_id: id_p,
        comment: comment_user,
        time_cmt: Time.now,
        reply: toid
        )
      if comment.save
        if toid == 0 ? tickcmt = "#coment_id" : tickcmt = "#coment_id_#{toid}"
        end
        redirect_to request.referrer.sub("?#{URI(request.referrer).query}",tickcmt)
      end
    end
  end

  def checkout
    content = params[:content]
    adress = params[:adress]
    phone = params[:phone]
    price = params[:price]
    group_rbt = params[:group_rbt]

    if content.to_s.strip.empty? || adress.to_s.strip.empty? || phone.to_s.strip.empty? || price == 0.0
      flash[:danger] = t "controllers.show_product.error"
      redirect_to listcart_url
    else
      # flash[:danger] = date_of_next(group_rbt)
      # redirect_to listcart_url

      order = Order.new(
        user_id: 1,
        oder_code: "",
        date_purchase: date_of_next(group_rbt),
        content: content,
        adress: adress,
        price: price,
        phone: phone,
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

  private

  def date_of_next(day)
    date  = Date.parse(day)
    delta = date > Date.today ? 0 : 7
    date + delta
  end
end

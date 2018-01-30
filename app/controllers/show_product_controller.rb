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
    idcmt = params[:id_cmt]
    @touser = {
      name: "",
      reply: 0
    }
    if !idcmt.nil?
      @touser[:name] = "<[To: #{@product.comments.find_by_id(idcmt).user.name}]>\n"
      @touser[:reply] = idcmt
      if @product.comments.find_by_id(idcmt).reply != 0
        @touser[:reply] = @product.comments.find_by_id(idcmt).reply
      end
    end
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

end

class ShowNewsController < ApplicationController

  def show
    type = params[:type_id]
    if type.nil?
      @news = New.getall
    else
      @news = New.co.withtpye type
    end
    @allType = Typenew.all
  end

  def detail
    id = params[:id]
    @new = New.find_by_id id
    if @new.nil?
      flash[:danger] = t "controllers.show_news.notnew"
      redirect_to news_url
    else
      @list = New.getlist id
    end
  end
end

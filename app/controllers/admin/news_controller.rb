class Admin::NewsController < Admin::BaseController
  def show
    @n = New.all
  end

  def new
    @n = New.new
  end
end

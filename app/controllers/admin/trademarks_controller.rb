class Admin::TrademarksController < Admin::BaseController
  def show
    @trs = Trademark.all
  end
  def new
    @trs = Trademark.new
  end
end

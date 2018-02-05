class Admin::AssortsController < Admin::BaseController
  def index
    @assorts = Assort.search(params[:search]).page(params[:page]).per Settings.per_index
  end
end

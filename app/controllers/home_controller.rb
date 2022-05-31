class HomeController < ApplicationController
  
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).per(6)
    @url_search = home_index_path
    @productrend = Product.all.order("RANDOM()").page(params[:page]).per(4)
  end

  def about
  end
end

class HomeController < ApplicationController
  
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).per(6)
    @productrend = Product.all.order("RANDOM()").page(params[:page]).per(4)
  end

  def about
  end
end

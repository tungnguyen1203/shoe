class HomeController < ApplicationController
  
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).per(6)
    @produc_trend = Product.all.order("RANDOM()").page(params[:page]).per(4)
    @order_detail = OrderDetail.new
  end

  
  def contact
    @q = Product.ransack(params[:q])
  end
end

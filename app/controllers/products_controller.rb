class ProductsController < ApplicationController

  def show
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page( params[:page]).per(6)
    @products = Product.find(params[:id])
  end

  def index
    @order_detail = OrderDetail.new
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page( params[:page]).per(6)
    
  end
  
end

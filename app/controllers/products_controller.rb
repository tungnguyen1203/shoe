class ProductsController < ApplicationController

  def show
    @q = Product.ransack(params[:q])
    @products = Product.find(params[:id])
  end

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page( params[:page]).per(6)
  end
  
  
  
end

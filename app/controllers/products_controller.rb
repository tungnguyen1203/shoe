class ProductsController < ApplicationController

  def show
    if current_user.present?
      @current_cart = current_user.cart
    else
      @current_cart = Cart.new
    end
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page( params[:page]).per(6)
    @products = Product.find(params[:id])
  end

  def index
    if current_user.present?
      @current_cart = current_user.cart
    else
      @current_cart = Cart.new
    end
    @order_detail = OrderDetail.new
    @categories = Category.all
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page( params[:page]).per(6)
    
  end
  
end

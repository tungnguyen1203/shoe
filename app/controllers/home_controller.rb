class HomeController < ApplicationController
  
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).per(6)
    @produc_trend = Product.all.order("RANDOM()").page(params[:page]).per(4)
    @order_detail = OrderDetail.new
    @categories = Category.all
    if current_user.present?
      @current_cart = current_user.cart
    else
      @current_cart = Cart.new
    end
  end

  def contact
    @q = Product.ransack(params[:q])
  end
  
end

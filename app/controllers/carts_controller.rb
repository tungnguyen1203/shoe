class CartsController < ApplicationController

  # def index
  #   @q = Product.ransack(params[:q])
  #   @order_details = OrderDetail.order("created_at DESC")
  #   @produc_trend = Product.all.order("RANDOM()").page(params[:page]).per(4)
  # end
  
  def show
    @q = Product.ransack(params[:q])
    @produc_trend = Product.all.order("RANDOM()").page(params[:page]).per(4)
    @cart = @current_cart
    
    p 'hihi'
  end

end

class CartsController < ApplicationController

  # def index
  #   @q = Product.ransack(params[:q])
  #   @order_details = OrderDetail.order("created_at DESC")
  #   @produc_trend = Product.all.order("RANDOM()").page(params[:page]).per(4)
  # end
  
  def show
    
    @q = Product.ransack(params[:q])
    @produc_trend = Product.all.order("RANDOM()").page(params[:page]).per(4)
    @current_cart = current_user.cart
    # if @current_cart.order_details.empty?
    #   flash[:noite] = "Chưa có gì trong giỏ!"
    # end
  end

end

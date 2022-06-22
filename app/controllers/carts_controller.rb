class CartsController < ApplicationController

  # def index
  #   @q = Product.ransack(params[:q])
  #   @order_details = OrderDetail.order("created_at DESC")
  #   @produc_trend = Product.all.order("RANDOM()").page(params[:page]).per(4)
  # end
  
  def index
    
    @q = Product.ransack(params[:q])
    @produc_trend = Product.all.order("RANDOM()").page(params[:page]).per(4)
    @current_cart = current_user.cart
    @cart_items = @current_cart.nil? ? nil : @current_cart.order_details.includes(:product)
    # if @current_cart.order_details.empty?
    #   flash[:noite] = "Chưa có gì trong giỏ!"
    # end
  end

  
end

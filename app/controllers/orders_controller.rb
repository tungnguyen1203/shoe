class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  def show

    @orders= Order.find(params[:id])
  end

  def new
    @q = Product.ransack(params[:q])
    @order = Order.new
    @cart = @current_cart
    @user = @current_user
  end
  
  def create
    
    # @order = Order.new(order_params)
    # @current_cart.order_details.each do |item|
    #   @order.order_details << item
    #   item.cart_id = nil
    # end
    
    # # @order.current_user[:id]
    # @order.save
    # Cart.destroy(session[:cart_id])
    # session[:cart_id] = nil
    
    charge = Stripe::Charge.create({
      
      customer: current_user.user_name,
      amount: 2000,
      currency: 'usd',
      source: 'tok_mastercard',
      description: 'My First Test Charge (created for API docs at https://www.stripe.com/docs/api)',
    })
    redirect_to  root_path
  end
  
  private

    def order_params
      
      params.require(:order).permit(:address, :user_id)
    end
end

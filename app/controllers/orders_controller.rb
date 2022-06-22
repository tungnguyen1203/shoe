class OrdersController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    
    @orders = current_user.orders.includes(:order_details ,order_details: :product)
    
    if current_user.present?
      @current_cart = current_user.cart
    else
      @current_cart = Cart.new
    end
  end
  

  def new
    if current_user.present?
      @current_cart = current_user.cart
    else
      @current_cart = Cart.new
    end
    @q = Product.ransack(params[:q])
    
    @order = Order.new
    @cart = @current_cart
    @user = @current_user
  end
  
  def create
    @q = Product.ransack(params[:q])
    if current_user.present?
      @current_cart = current_user.cart
    else
      @current_cart = Cart.new
    end
    @order = Order.new(order_params)
    @current_cart.order_details.each do |item|
      @order.order_details << item
      item.cart_id = nil
    
    end

    charge = Stripe::Charge.create({
      amount: @current_cart.sub_total,
      currency: 'usd',
      source: 'tok_visa', 
      description: 'My First Test Charge (created for API docs at https://www.stripe.com/docs/api)',
    })

    if @order.save
      flash[:notice] = "Thanh Toán Thành Công!"
    #   Cart.destroy(session[:cart_id])
    #  session[:cart_id] = nil
      redirect_to root_path
    else
      flash[:alert] = "Thanh toán không thành công!"
      render :new
     
    end
  end
 
  private

    def order_params
      params.require(:order).permit(:address, :user_id)
    end
end

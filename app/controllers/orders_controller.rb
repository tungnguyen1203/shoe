class OrdersController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @orders = Order.order("updated_at desc")
    if current_user.present?
      @current_cart = current_user.cart
    else
      @current_cart = Cart.new
    end
  end
  def show

    binding.pry
    @order= Order.where(params[:id])
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
  
  # def create
  #   @order.save
    
 
    
  #   redirect_to  root_path
  # end

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
      flash[:success] = "Thanh Toán Thành Công!"
    #   Cart.destroy(session[:cart_id])
    #  session[:cart_id] = nil
      redirect_to root_path
    else
      flash[:error] = "Thanh toán không thành công!"
      render "new"
      # redirect_to root_path
    end
  end
  def change
    # Stripe.api_key = 'sk_test_51L8JPcIekHnUbT8KxiVL2yQxi5MpNbBJUTNoHNV7h'
    # token = params[ :stripeToken]
    
  end
  
  private

    def order_params
      params.require(:order).permit(:address, :user_id)
    end
end

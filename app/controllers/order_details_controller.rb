class OrderDetailsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    
    # binding.pry
    
    # current_cart = @current_cart
    # @order_detail = OrderDetail.new(order_detail_params)
    
    # @order_detail.cart = current_cart
    # # check_id = OrderDetail.find(params[:product_id])
    # # @order_detail = current_cart.order_details.find_or_create_by(product_id: params[:product_id])
    # if 
    # @order_detail.quantity +=1
    product = Product.find(params[:product_id])
    
   
    @current_cart = Cart.find_or_create_by(user_id: current_user.id)
    order_detail=@current_cart.order_details.find_by(product_id: product.id)
    @order_detail =
      if @current_cart.products.include?(product)
        order_detail.update(
          price: product.price,
          quantity: order_detail.quantity+=1
        )
      else
        # OrderDetail.create(cart:current_cart,product: product, price: product.price)
        @current_cart.order_details.create(product: product, price: product.price)
      end
      
  # # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
  # if current_cart.products.include?(product)
  #   # Find the line_item with the chosen_product
  #   @order_detail = current_cart.order_details.find_by(product_id: product)
  #   # Iterate the line_item's quantity by one
  #   @order_detail.price = product.price
  #   @order_detail.quantity += 1
  # else
  #   @order_detail = OrderDetail.new
  #   @order_detail.cart = current_cart
  #   @order_detail.product = product_id
  # end
    
  #   @order_detail.save
 
    redirect_to carts_path
    # respond_to do |format|
    #   format.html { redirect_to root_path}
    #   format.js   { render :layout => false }
    # end
  end

  def add_quantity
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.quantity +=1
    @order_detail.save
    redirect_to carts_path
  end

  def reduce_quantity
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.quantity > 1
      @order_detail.quantity -= 1
    end
    @order_detail.save
    redirect_to carts_path
  end

  def destroy
    
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.destroy

    redirect_to carts_path
  end
  private

    def current_cart
      @current_cart = Cart.find_or_create_by(user_id: current_user.id)
    end
    def order_detail_params
      params.require(:order_detail).permit( :product_id, :price, :quantity, :cart_id)
    end
end

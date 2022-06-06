class OrderDetailsController < ApplicationController
  
  def create
    current_cart = @current_cart
    @order_detail = OrderDetail.new(order_detail_params)
    # @order_detail = current_user.oder_detail.find_or_create_by(product_id: params[:product_id])
    @order_detail.cart = current_cart
    # check_id = OrderDetail.find(params[:product_id])
    
    @order_detail.save
    redirect_to cart_path(current_cart)
    # respond_to do |format|
    #   format.html { redirect_to root_path}
    #   format.js   { render :layout => false }
    # end
  end

  def add_quantity
    @order_detail = OrderDetail.new(params[:id])
    @order_detail.quantity +=1
    @order_detail.save
    redirect_to cart_path(current_cart)
  end

  def destroy
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.destroy
    redirect_to cart_path(@current_cart)
  end
  private
  
    def order_detail_params
      params.require(:order_detail).permit( :product_id, :quantity, :price)
    end
  
end